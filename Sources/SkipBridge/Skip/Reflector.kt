// Copyright 2024–2026 Skip
// SPDX-License-Identifier: MPL-2.0
package skip.bridge

import kotlin.reflect.*
import kotlin.reflect.full.*
import kotlin.reflect.jvm.jvmErasure

/// Interact with an object through reflection.
class Reflector {
    private val obj: Any?
    private val cls: KClass<*>?

    constructor(reflecting: Any) {
        this.obj = reflecting
        this.cls = null
    }

    constructor(reflectingStaticsOfClassName: String) {
        val javaCls = Class.forName(reflectingStaticsOfClassName)
        this.obj = javaCls.kotlin.companionObjectInstance
        this.cls = javaCls.kotlin
    }

    constructor(reflectingClassName: String, arguments: List<Any?>?) {
        val javaCls = Class.forName(reflectingClassName)
        // Fast path: a public zero-arg constructor needs no kotlin-reflect signature matching,
        // which pays the full reflection-infrastructure init on its first use in the process
        if (arguments.isNullOrEmpty()) {
            val javaConstructor = javaCls.constructors.firstOrNull { it.parameterCount == 0 }
            if (javaConstructor != null) {
                this.obj = javaConstructor.newInstance()!!
                this.cls = null
                return
            }
        }
        val cls = javaCls.kotlin
        val match = matchConstructor(cls, arguments ?: listOf<Any?>())
        if (match == null) {
            throw NoSuchMethodError("${reflectingClassName}.<init>(${argumentsString(arguments)})")
        }
        val (matchConstructor, matchArguments) = match
        this.obj = matchConstructor.callBy(matchArguments)!!
        this.cls = null
    }

    constructor(className: String, arguments: Map<String, Any?>?) {
        val cls = Class.forName(className).kotlin
        val match = matchConstructor(cls, arguments ?: mapOf<String, Any?>())
        if (match == null) {
            throw NoSuchMethodError("${className}.<init>(${argumentsString(arguments)})")
        }
        val (matchConstructor, matchArguments) = match
        this.obj = matchConstructor.callBy(matchArguments)!!
        this.cls = null
    }

    val reflecting: Any
        get() = obj ?: cls!!

    fun booleanProperty(name: String): Boolean? {
        return toBoolean(propertyValue(name))
    }

    fun booleanFunction(name: String, arguments: List<Any?>?): Boolean? {
        return toBoolean(functionValue(name, arguments ?: listOf()))
    }

    fun booleanFunction(name: String, arguments: Map<String, Any?>?): Boolean? {
        return toBoolean(functionValue(name, arguments ?: mapOf()))
    }

    fun byteProperty(name: String): Byte? {
        return toByte(propertyValue(name))
    }

    fun byteFunction(name: String, arguments: List<Any?>?): Byte? {
        return toByte(functionValue(name, arguments ?: listOf()))
    }

    fun byteFunction(name: String, arguments: Map<String, Any?>?): Byte? {
        return toByte(functionValue(name, arguments ?: mapOf()))
    }

    fun charProperty(name: String): Char? {
        return toChar(propertyValue(name))
    }

    fun charFunction(name: String, arguments: List<Any?>?): Char? {
        return toChar(functionValue(name, arguments ?: listOf()))
    }

    fun charFunction(name: String, arguments: Map<String, Any?>?): Char? {
        return toChar(functionValue(name, arguments ?: mapOf()))
    }

    fun doubleProperty(name: String): Double? {
        return toDouble(propertyValue(name))
    }

    fun doubleFunction(name: String, arguments: List<Any?>?): Double? {
        return toDouble(functionValue(name, arguments ?: listOf()))
    }

    fun doubleFunction(name: String, arguments: Map<String, Any?>?): Double? {
        return toDouble(functionValue(name, arguments ?: mapOf()))
    }

    fun floatProperty(name: String): Float? {
        return toFloat(propertyValue(name))
    }

    fun floatFunction(name: String, arguments: List<Any?>?): Float? {
        return toFloat(functionValue(name, arguments ?: listOf()))
    }

    fun floatFunction(name: String, arguments: Map<String, Any?>?): Float? {
        return toFloat(functionValue(name, arguments ?: mapOf()))
    }

    fun intProperty(name: String): Int? {
        return toInt(propertyValue(name))
    }

    fun intFunction(name: String, arguments: List<Any?>?): Int? {
        return toInt(functionValue(name, arguments ?: listOf()))
    }

    fun intFunction(name: String, arguments: Map<String, Any?>?): Int? {
        return toInt(functionValue(name, arguments ?: mapOf()))
    }

    fun longProperty(name: String): Long? {
        return toLong(propertyValue(name))
    }

    fun longFunction(name: String, arguments: List<Any?>?): Long? {
        return toLong(functionValue(name, arguments ?: listOf()))
    }

    fun longFunction(name: String, arguments: Map<String, Any?>?): Long? {
        return toLong(functionValue(name, arguments ?: mapOf()))
    }

    fun shortProperty(name: String): Short? {
        return toShort(propertyValue(name))
    }

    fun shortFunction(name: String, arguments: List<Any?>?): Short? {
        return toShort(functionValue(name, arguments ?: listOf()))
    }

    fun shortFunction(name: String, arguments: Map<String, Any?>?): Short? {
        return toShort(functionValue(name, arguments ?: mapOf()))
    }

    fun stringProperty(name: String): String? {
        return toString(propertyValue(name))
    }

    fun stringFunction(name: String, arguments: List<Any?>?): String? {
        return toString(functionValue(name, arguments ?: listOf()))
    }

    fun stringFunction(name: String, arguments: Map<String, Any?>?): String? {
        return toString(functionValue(name, arguments ?: mapOf()))
    }

    fun objectProperty(name: String): Any? {
        return propertyValue(name)
    }

    fun objectFunction(name: String, arguments: List<Any?>?): Any? {
        return functionValue(name, arguments ?: listOf())
    }

    fun objectFunction(name: String, arguments: Map<String, Any?>?): Any? {
        return functionValue(name, arguments ?: mapOf())
    }

    fun setProperty(name: String, value: Any?) {
        setPropertyValue(name, value)
    }

    fun voidFunction(name: String, arguments: List<Any?>?) {
        functionValue(name, arguments ?: listOf())
    }

    fun voidFunction(name: String, arguments: Map<String, Any?>?) {
        functionValue(name, arguments ?: mapOf())
    }

    private fun propertyValue(name: String): Any? {
        if (obj != null) {
            // Fast path: resolve the property's Java getter directly before scanning
            // kotlin-reflect memberProperties, which pays the full reflection-infrastructure
            // init on its first use in the process. Non-public Kotlin members are excluded
            // by their module-mangled JVM getter names, and Java fields (which kotlin-reflect
            // surfaces as properties) have no getter, so both fall through to the slow path.
            javaGetter(obj.javaClass, name)?.let { return it.invoke(obj) }
            val property = obj::class.memberProperties.firstOrNull { it.name == name }
            if (property != null && property.visibility == KVisibility.PUBLIC) {
                return (property as KProperty1<Any, *>).get(obj)
            }
        }
        if (cls != null) {
            val property = cls.staticProperties.firstOrNull { it.name == name }
            if (property != null && property.visibility == KVisibility.PUBLIC) {
                return property.get()
            }
        }

        val getter = matchFunction(name.getter(), listOf<Any?>())
        if (getter != null) {
            val (getterFunction, getterArguments) = getter
            return getterFunction.callBy(getterArguments)
        }
        val target = if (obj != null) obj::class else cls
        throw NoSuchFieldError("$target.$name")
    }

    private fun setPropertyValue(name: String, value: Any?) {
        if (obj != null) {
            val property = obj::class.memberProperties.firstOrNull { it.name == name }
            if (property is KMutableProperty1 && property.visibility == KVisibility.PUBLIC) {
                (property as KMutableProperty1<Any, Any?>).set(obj, convertArgument(value, property.setter.parameters.last()))
                return
            }
        }
        if (cls != null) {
            val property = cls.staticProperties.firstOrNull { it.name == name }
            if (property is KMutableProperty0 && property.visibility == KVisibility.PUBLIC) {
                (property as KMutableProperty0<Any?>).set(convertArgument(value, property.setter.parameters.last()))
                return
            }
        }

        val setter = matchFunction(name.setter(), listOf(value))
        if (setter != null) {
            val (setterFunction, setterArguments) = setter
            setterFunction.callBy(setterArguments)
            return
        }
        val target = if (obj != null) obj::class else cls
        throw NoSuchFieldError("$target.$name")
    }

    private fun functionValue(name: String, arguments: List<Any?>): Any? {
        val match = matchFunction(name, arguments)
        if (match == null) {
            val target = if (obj != null) obj::class else cls
            throw NoSuchMethodError("$target.$name(${argumentsString(arguments)})")
        }
        val (matchFunction, matchArguments) = match
        return matchFunction.callBy(matchArguments)
    }

    private fun functionValue(name: String, arguments: Map<String, Any?>): Any? {
        val match = matchFunction(name, arguments)
        if (match == null) {
            val target = if (obj != null) obj::class else cls
            throw NoSuchMethodError("$target.$name(${argumentsString(arguments)})")
        }
        val (matchFunction, matchArguments) = match
        return matchFunction.callBy(matchArguments)
    }

    private fun matchFunction(name: String, arguments: Any): Pair<KFunction<*>, Map<KParameter, Any?>>? {
        val functions: Collection<KFunction<*>>
        if (obj != null && cls != null) {
            val allFunctions = mutableListOf<KFunction<*>>()
            allFunctions.addAll(obj::class.memberFunctions)
            allFunctions.addAll(cls.staticFunctions)
            functions = allFunctions
        } else if (obj != null) {
            functions = obj::class.memberFunctions
        } else if (cls != null) {
            functions = cls.staticFunctions
        } else {
            return null
        }
        val scored = functions.mapNotNull {
            if (it.name != name) return@mapNotNull null
            val scoredArguments: Pair<Double, List<Pair<Any?, KParameter>>>?
            if (arguments is List<*>) {
                scoredArguments = scoreArguments(arguments as List<Any?>, it.parameters, instance = obj)
            } else {
                scoredArguments = scoreArguments(arguments as Map<String, Any?>, it.parameters, instance = obj)
            }
            if (scoredArguments == null) return@mapNotNull null
            val (score, argumentParameterPairs) = scoredArguments
            Triple(it, score, argumentParameterPairs)
        }.sortedByDescending { it.second }
        val best = scored.firstOrNull()
        if (best == null) {
            return null
        }
        return Pair(best.first, mapOf(*best.third.map { Pair(it.second, convertArgument(it.first, parameter = it.second)) }.toTypedArray()))
    }

    companion object {
        private fun javaGetter(cls: Class<*>, name: String): java.lang.reflect.Method? {
            val isBooleanStyle = name.length > 2 && name.startsWith("is") && name[2].isUpperCase()
            val getterName = if (isBooleanStyle) name else "get" + name.replaceFirstChar { it.uppercaseChar() }
            return try {
                cls.getMethod(getterName).takeIf { it.parameterCount == 0 }
            } catch (e: NoSuchMethodException) {
                null
            }
        }

        private fun matchConstructor(cls: KClass<*>, arguments: Any): Pair<KFunction<*>, Map<KParameter, Any?>>? {
            val scored = cls.constructors.mapNotNull {
                val scoredArguments: Pair<Double, List<Pair<Any?, KParameter>>>?
                if (arguments is List<*>) {
                    scoredArguments = scoreArguments(arguments as List<Any?>, it.parameters)
                } else {
                    scoredArguments = scoreArguments(arguments as Map<String, Any?>, it.parameters)
                }
                if (scoredArguments == null) return@mapNotNull null
                val (argumentsScore, argumentParameterPairs) = scoredArguments
                Triple(it, argumentsScore, argumentParameterPairs)
            }.sortedByDescending { it.second }
            val best = scored.firstOrNull()
            if (best == null) return null
            return Pair(best.first, mapOf(*best.third.map { Pair(it.second, convertArgument(it.first, parameter = it.second)) }.toTypedArray()))
        }

        private fun scoreArguments(arguments: List<Any?>, parameters: List<KParameter>, instance: Any? = null): Pair<Double, List<Pair<Any?, KParameter>>>? {
            var argumentParameterPairs: MutableList<Pair<Any?, KParameter>>? = null
            var parameterIndex = 0
            if (parameterIndex < parameters.count() && parameters[parameterIndex].kind == KParameter.Kind.EXTENSION_RECEIVER) {
                if (argumentParameterPairs == null) argumentParameterPairs = mutableListOf()
                argumentParameterPairs.add(Pair(instance, parameters[parameterIndex]))
                ++parameterIndex
            }
            if (parameterIndex < parameters.count() && parameters[parameterIndex].kind == KParameter.Kind.INSTANCE) {
                if (instance == null) return null
                if (argumentParameterPairs == null) argumentParameterPairs = mutableListOf()
                argumentParameterPairs.add(Pair(instance, parameters[parameterIndex]))
                ++parameterIndex
            }

            val hasVariadicParameters = parameters.any { it.isVararg }
            // Can't be more arguments than parameters
            if (!hasVariadicParameters && arguments.count() > parameters.count() - parameterIndex) {
                return null
            }

            var totalScore = 0.0
            var argumentIndex = 0
            while (argumentIndex < arguments.count()) {
                if (parameterIndex >= parameters.count()) {
                    return null
                }

                val scoredArgument = scoreArgument(argumentIndex, arguments, false, parameters, parameterIndex)
                if (scoredArgument == null) return null
                val (score, scoredParameterIndex) = scoredArgument

                if (argumentParameterPairs == null) argumentParameterPairs = mutableListOf()
                // Greedily consume any variadic arguments
                if (parameters[scoredParameterIndex].isVararg) {
                    val argumentList = mutableListOf(arguments[argumentIndex++])
                    while (argumentIndex < arguments.count()) {
                        if (scoreArgument(argumentIndex, arguments, true, parameters, scoredParameterIndex) != null) {
                            argumentList.add(arguments[argumentIndex++])
                        } else {
                            break
                        }
                    }
                    argumentParameterPairs.add(Pair(argumentList, parameters[scoredParameterIndex]))
                } else {
                    argumentParameterPairs.add(Pair(arguments[argumentIndex], parameters[scoredParameterIndex]))
                    ++argumentIndex
                }
                totalScore += score
                parameterIndex = scoredParameterIndex + 1
            }
            // There can't be any required parameters left
            for (remainingIndex in parameterIndex..<parameters.count()) {
                if (!parameters[remainingIndex].isOptional) {
                    return null
                }
            }
            return Pair(totalScore, argumentParameterPairs ?: listOf())
        }

        private fun scoreArguments(arguments: Map<String, Any?>, parameters: List<KParameter>, instance: Any? = null): Pair<Double, List<Pair<Any?, KParameter>>>? {
            var argumentParameterPairs: MutableList<Pair<Any?, KParameter>>? = null
            var parameterIndex = 0
            if (parameterIndex < parameters.count() && parameters[parameterIndex].kind == KParameter.Kind.EXTENSION_RECEIVER) {
                if (argumentParameterPairs == null) argumentParameterPairs = mutableListOf()
                argumentParameterPairs.add(Pair(instance, parameters[parameterIndex]))
                ++parameterIndex
            }
            if (parameterIndex < parameters.count() && parameters[parameterIndex].kind == KParameter.Kind.INSTANCE) {
                if (instance == null) return null
                if (argumentParameterPairs == null) argumentParameterPairs = mutableListOf()
                argumentParameterPairs.add(Pair(instance, parameters[parameterIndex]))
                ++parameterIndex
            }

            // Can't be more arguments than parameters
            if (arguments.count() > parameters.count() - parameterIndex) {
                return null
            }

            var totalScore = 0.0
            while (parameterIndex < parameters.count()) {
                val parameter = parameters[parameterIndex++]
                val name = parameter.name
                if (name == null) {
                    return null
                }
                val argument = arguments[name]
                if (argument == null && !arguments.containsKey(name)) {
                    if (parameter.isOptional) {
                        continue
                    } else {
                        return null
                    }
                }
                val score = compatibilityScore(argument, parameter.type)
                if (score == null) {
                    return null
                }
                if (argumentParameterPairs == null) argumentParameterPairs = mutableListOf()
                argumentParameterPairs.add(Pair(argument, parameter))
                totalScore += score
            }
            return Pair(totalScore, argumentParameterPairs ?: listOf())
        }

        private fun scoreArgument(argumentIndex: Int, arguments: List<Any?>, isVariadicContinuation: Boolean, parameters: List<KParameter>, parameterIndex: Int): Pair<Double, Int>? {
            val argument = arguments[argumentIndex]
            for (parameterIndex in parameterIndex..<parameters.count()) {
                val score = compatibilityScore(argument, parameters[parameterIndex].type)
                if (score == null) {
                    if (isVariadicContinuation || !parameters[parameterIndex].isOptional) {
                        return null
                    }
                } else {
                    return Pair(score, parameterIndex)
                }
            }
            return null
        }

        @OptIn(ExperimentalStdlibApi::class)
        private fun compatibilityScore(value: Any?, type: KType): Double? {
            if (value == null) {
                if (type.isMarkedNullable) return 1.5
                return if (PRIMITIVE_NAMES.contains(type.javaType.typeName)) null else 1.0
            }
            val jvmType = type.withNullability(false).jvmErasure
            when (jvmType) {
                Boolean::class ->
                    return if (value is Boolean) 2.0 else null
                Byte::class -> {
                    if (value is Byte) return 2.0
                    return if (value is Number) 1.0 else null
                }
                Char::class -> {
                    if (value is Char) return 2.0
                    return if (value is String) 1.75 else null
                }
                Double::class -> {
                    if (value is Double) return 2.0
                    if (value is Float) return 1.75
                    return if (value is Number) 1.0 else null
                }
                Float::class -> {
                    if (value is Float) return 2.0
                    if (value is Double) return 1.75
                    return if (value is Number) 1.0 else null
                }
                Int::class -> {
                    if (value is Int) return 2.0
                    if (value is Long) return 1.75
                    if (value is Double || value is Float) return null
                    return if (value is Number) 1.0 else null
                }
                Long::class -> {
                    if (value is Long) return 2.0
                    if (value is Int) return 1.75
                    if (value is Double || value is Float) return null
                    return if (value is Number) 1.0 else null
                }
                Short::class -> {
                    if (value is Short) return 2.0
                    return if (value is Number) 1.0 else null
                }
                String::class -> {
                    if (value is String) return 2.0
                    return if (value is Char) 1.75 else null
                }
                else -> {
                    val valueClass = value::class.java
                    val typeClass = jvmType.java
                    if (valueClass == typeClass) return 2.0
                    if (typeClass.isAssignableFrom(valueClass)) return 1.0
                    return null
                }
            }
        }

        private fun convertArgument(value: Any?, parameter: KParameter, ignoreVariadic: Boolean = false): Any? {
            if (value == null) return null
            if (!ignoreVariadic && parameter.isVararg) {
                val list = value as List<*>
                return list.map { convertArgument(it, parameter, ignoreVariadic = true) }.toTypedArray()
            }
            return when (parameter.kind) {
                KParameter.Kind.EXTENSION_RECEIVER -> value
                KParameter.Kind.INSTANCE -> value
                KParameter.Kind.VALUE -> {
                    when (parameter.type.withNullability(false).jvmErasure) {
                        Boolean::class -> toBoolean(value)
                        Byte::class -> toByte(value)
                        Char::class -> toChar(value)
                        Double::class -> toDouble(value)
                        Float::class -> toFloat(value)
                        Int::class -> toInt(value)
                        Long::class -> toLong(value)
                        Short::class -> toShort(value)
                        String::class -> toString(value)
                        else -> value
                    }
                }
                else -> value // e.g., CONTEXT
            }
        }
    }
}

private fun argumentsString(arguments: List<Any?>?): String {
    if (arguments == null) return ""
    return arguments.joinToString(", ") { it.toString() }
}

private fun argumentsString(arguments: Map<String, Any?>?): String {
    if (arguments == null) return ""
    return arguments.map { "${it.key}: ${it.value}" }.joinToString(", ")
}

private fun String.getter() = "get" + replaceFirstChar(Character::toUpperCase)
private fun String.setter() = "set" + replaceFirstChar(Character::toUpperCase)

private val PRIMITIVE_NAMES = setOf("boolean", "byte", "char", "double", "int", "float", "long", "short")

private fun toBoolean(value: Any?): Boolean? {
    if (value == null) return null
    if (value is Boolean) return value
    throw NoSuchMethodError("Unable to convert $value to Boolean")
}

private fun toByte(value: Any?): Byte? {
    if (value == null) return null
    if (value is Number) return value.toByte()
    throw NoSuchMethodError("Unable to convert $value to Byte")
}

private fun toChar(value: Any?): Char? {
    if (value == null) return null
    if (value is Char) return value
    if (value is String) return value.firstOrNull()
    throw NoSuchMethodError("Unable to convert $value to Char")
}

private fun toDouble(value: Any?): Double? {
    if (value == null) return null
    if (value is Number) return value.toDouble()
    throw NoSuchMethodError("Unable to convert $value to Double")
}

private fun toFloat(value: Any?): Float? {
    if (value == null) return null
    if (value is Number) return value.toFloat()
    throw NoSuchMethodError("Unable to convert $value to Float")
}

private fun toInt(value: Any?): Int? {
    if (value == null) return null
    if (value is Number) return value.toInt()
    throw NoSuchMethodError("Unable to convert $value to Int")
}

private fun toLong(value: Any?): Long? {
    if (value == null) return null
    if (value is Number) return value.toLong()
    throw NoSuchMethodError("Unable to convert $value to Long")
}

private fun toShort(value: Any?): Short? {
    if (value == null) return null
    if (value is Number) return value.toShort()
    throw NoSuchMethodError("Unable to convert $value to Short")
}

private fun toString(value: Any?): String? {
    if (value == null) return null
    if (value is String) return value
    if (value is Char) return value.toString()
    throw NoSuchMethodError("Unable to convert $value to String")
}
