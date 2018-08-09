/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left FutureOr: T0 is FutureOr<S0>
 *   and Future<S0> <: T1
 *   and S0 <: T1
 * @description Check that if a type T0 is FutureOr<S0> and S0 is a subtype of
 * T1 but Future<S0> is not a subtype of T1 , then a type T0 is not a subtype of
 * a type T1.
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as an argument of type T1. Global function required argument is
 * tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from left_FutureOr_fail_A02.dart and 
 * arguments_binding_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */



import "dart:async";

class T1 {}
class S0 extends T1 {}

FutureOr<S0> t0Instance = Future<S0>.value(new S0()); // Future<S0> is not a subtype of T1
T1 t1Instance = new T1();




namedArgumentsFunc1(T1 t1, {T1 t2}) {}
positionalArgumentsFunc1(T1 t1, [T1 t2]) {}

class ArgumentsBindingClass {
    ArgumentsBindingClass(T1 t1) {}

    ArgumentsBindingClass.named(T1 t1, {T1 t2}) {}
    ArgumentsBindingClass.positional(T1 t1, [T1 t2]) {}

    factory ArgumentsBindingClass.fNamed(T1 t1, {T1 t2}) {
        return new ArgumentsBindingClass.named(t1, t2: t2);
    }
    factory ArgumentsBindingClass.fPositional(T1 t1, [T1 t2]) {
        return new ArgumentsBindingClass.positional(t1, t2);
    }

    static namedArgumentsStaticMethod(T1 t1, {T1 t2}) {}
    static positionalArgumentsStaticMethod(T1 t1, [T1 t2]) {}

    namedArgumentsMethod(T1 t1, {T1 t2}) {}
    positionalArgumentsMethod(T1 t1, [T1 t2]) {}

    set testSetter(T1 val) {}
}

main() {
  namedArgumentsFunc1(t0Instance); //# 01: compile-time error
  namedArgumentsFunc1(t1Instance, t2: t0Instance); //# 02: compile-time error
  positionalArgumentsFunc1(t0Instance); //# 03: compile-time error
  positionalArgumentsFunc1(t1Instance, t0Instance); //# 014: compile-time error
  new ArgumentsBindingClass(t0Instance); //# 05: compile-time error
  new ArgumentsBindingClass(t1Instance).namedArgumentsMethod(t0Instance); //# 06: compile-time error
  new ArgumentsBindingClass(t1Instance).namedArgumentsMethod(t1Instance, t2: t0Instance); //# 07: compile-time error
  new ArgumentsBindingClass(t1Instance).positionalArgumentsMethod(t0Instance); //# 08: compile-time error
  new ArgumentsBindingClass(t1Instance).positionalArgumentsMethod(t1Instance, t0Instance); //# 09: compile-time error
  new ArgumentsBindingClass(t1Instance).testSetter = t0Instance; //# 10: compile-time error
  ArgumentsBindingClass.namedArgumentsStaticMethod(t0Instance); //# 11: compile-time error
  ArgumentsBindingClass.namedArgumentsStaticMethod(t1Instance, t2: t0Instance); //# 12: compile-time error
  ArgumentsBindingClass.positionalArgumentsStaticMethod(t0Instance); //# 13: compile-time error
  ArgumentsBindingClass.positionalArgumentsStaticMethod(t1Instance, t0Instance); //# 14: compile-time error
  new ArgumentsBindingClass.named(t0Instance); //# 15: compile-time error
  new ArgumentsBindingClass.named(t1Instance, t2: t0Instance); //# 16: compile-time error
  new ArgumentsBindingClass.positional(t0Instance); //# 17: compile-time error
  new ArgumentsBindingClass.positional(t1Instance, t0Instance); //# 18: compile-time error
  new ArgumentsBindingClass.fNamed(t0Instance); //# 19: compile-time error
  new ArgumentsBindingClass.fNamed(t1Instance, t2: t0Instance); //# 20: compile-time error
  new ArgumentsBindingClass.fPositional(t0Instance); //# 21: compile-time error
  new ArgumentsBindingClass.fPositional(t1Instance, t0Instance); //# 22: compile-time error
}
