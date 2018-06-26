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
 * @description Check that if a type T0 is FutureOr<S0> and Future<S0> is a
 * subtype of T1 and S0 is not a subtype of a type T1, then a type T0 is not a
 * subtype of a type T1.
 * @author ngl@unipro.ru
 */

import "dart:async";
import "../utils/common.dart";
import "../../../Utils/expect.dart";

class S0 {}

FutureOr<S0> t0Instance = new S0();
Future<S0> t1Instance = new Future.value(new S0());




namedArgumentsFunc1(Future<S0> t1, {Future<S0> t2}) {}
positionalArgumentsFunc1(Future<S0> t1, [Future<S0> t2]) {}

namedArgumentsFunc2<X>(X t1, {X t2}) {}
positionalArgumentsFunc2<X>(X t1, [X t2]) {}

class ArgumentsBindingClass {
  ArgumentsBindingClass(Future<S0> t1) {}

  ArgumentsBindingClass.named(Future<S0> t1, {Future<S0> t2}) {}
  ArgumentsBindingClass.positional(Future<S0> t1, [Future<S0> t2]) {}

  factory ArgumentsBindingClass.fNamed(Future<S0> t1, {Future<S0> t2}) {
    return new ArgumentsBindingClass.named(t1, t2: t2);
  }
  factory ArgumentsBindingClass.fPositional(Future<S0> t1, [Future<S0> t2]) {
    return new ArgumentsBindingClass.positional(t1, t2);
  }

  static namedArgumentsStaticMethod(Future<S0> t1, {Future<S0> t2}) {}
  static positionalArgumentsStaticMethod(Future<S0> t1, [Future<S0> t2]) {}

  namedArgumentsMethod(Future<S0> t1, {Future<S0> t2}) {}
  positionalArgumentsMethod(Future<S0> t1, [Future<S0> t2]) {}

  set testSetter(Future<S0> val) {}
}

class ArgumentsBindingClassGen<X> {
  ArgumentsBindingClassGen(X t1) {}

  ArgumentsBindingClassGen.named(X t1, {X t2}) {}
  ArgumentsBindingClassGen.positional(X t1, [X t2]) {}

  factory ArgumentsBindingClassGen.fNamed(X t1, {X t2}) {
    return new ArgumentsBindingClassGen.named(t1, t2: t2);
  }
  factory ArgumentsBindingClassGen.fPositional(X t1, [X t2]) {
    return new ArgumentsBindingClassGen.positional(t1, t2);
  }

  namedArgumentsMethod(X t1, {X t2}) {}
  positionalArgumentsMethod(X t1, [X t2]){}

  set testSetter(X val) {}
}

class ArgumentsBindingClassSuper {
  ArgumentsBindingClassSuper(Future<S0> t1) {}
}

class ArgumentsBindingDesc extends ArgumentsBindingClassSuper {
  ArgumentsBindingDesc(FutureOr<S0> t0) : super (forgetType(t0)) {}
}

main() {
  // Test functions
  Expect.throws(() {
    namedArgumentsFunc1(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    namedArgumentsFunc1(t1Instance, t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    positionalArgumentsFunc1(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    positionalArgumentsFunc1(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError);

  // Test constructors
  Expect.throws(() {
    new ArgumentsBindingClass(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass.named(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass.named(t1Instance, t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass.positional(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass.positional(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass.fNamed(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass.fNamed(t1Instance, t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass.fPositional(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass.fPositional(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError);

  // Test instance methods and setters
  Expect.throws(() {
    new ArgumentsBindingClass(t1Instance).namedArgumentsMethod(
        forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass(t1Instance).namedArgumentsMethod(t1Instance,
        t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass(t1Instance).positionalArgumentsMethod(
        forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass(t1Instance).positionalArgumentsMethod(t1Instance,
        forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass(t1Instance).testSetter = forgetType(t0Instance);
  }, (e) => e is TypeError);

  // Test static methods
  Expect.throws(() {
    ArgumentsBindingClass.namedArgumentsStaticMethod(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    ArgumentsBindingClass.namedArgumentsStaticMethod(t1Instance,
        t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    ArgumentsBindingClass.positionalArgumentsStaticMethod(
        forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    ArgumentsBindingClass.positionalArgumentsStaticMethod(t1Instance,
        forgetType(t0Instance));
  }, (e) => e is TypeError);

  // Test generic functions
  Expect.throws(() {
    namedArgumentsFunc2<Future<S0>>(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    namedArgumentsFunc2<Future<S0>>(t1Instance, t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    positionalArgumentsFunc2<Future<S0>>(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    positionalArgumentsFunc2<Future<S0>>(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError);

  // Generic function types cannot be used as a type parameter, so test
  // generics only if it is not a generic function type and in a separate
  // function to avoid compile-time error
  if (!isGenericFunctionType) {
    testGenerics();
  }

  // Test superclass constructor call
  Expect.throws(() {
    new ArgumentsBindingDesc(t0Instance);
  }, (e) => e is TypeError);
}

void testGenerics() {
  // Test constructors
  Expect.throws(() {
    new ArgumentsBindingClassGen<Future<S0>>(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<Future<S0>>.named(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<Future<S0>>.named(t1Instance, t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<Future<S0>>.positional(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<Future<S0>>.positional(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<Future<S0>>.fNamed(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<Future<S0>>.fNamed(t1Instance, t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<Future<S0>>.fPositional(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<Future<S0>>.fPositional(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError);


  // Test instance methods and setters
  Expect.throws(() {
    new ArgumentsBindingClassGen<Future<S0>>(t1Instance).namedArgumentsMethod(
    forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<Future<S0>>(t1Instance).namedArgumentsMethod(t1Instance,
    t2: forgetType(t0Instance));
    }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<Future<S0>>(t1Instance).positionalArgumentsMethod(
    forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<Future<S0>>(t1Instance).positionalArgumentsMethod(t1Instance,
    forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<Future<S0>>(t1Instance).testSetter = forgetType(t0Instance);
  }, (e) => e is TypeError);
}
