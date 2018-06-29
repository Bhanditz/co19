/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right FutureOr: T1 is FutureOr<S1> and
 *   either T0 <: Future<S1>
 *   or T0 <: S1
 *   or T0 is X0 and X0 has bound S0 and S0 <: T1
 *   or T0 is X0 & S0 and S0 <: T1
 * @description Check that if a type T1 is Future<S1> and a type T0 is X0 and
 * X0 has bound S0 and S0 is not a subtype of Future<S1> or S1, then a type T0
 * is not a subtype of a type T1.
 * @author ngl@unipro.ru
 */
import '../../utils/common.dart';
import '../../../../Utils/expect.dart';

import "dart:async";

class S1 {}
class S0 {}
class X0 extends S0 {
}

X0 t0Instance = new X0();
FutureOr<S1> t1Instance = new Future.value(new S1());




namedArgumentsFunc1(FutureOr<S1> t1, {FutureOr<S1> t2}) {}
positionalArgumentsFunc1(FutureOr<S1> t1, [FutureOr<S1> t2]) {}

namedArgumentsFunc2<X>(X t1, {X t2}) {}
positionalArgumentsFunc2<X>(X t1, [X t2]) {}

class ArgumentsBindingClass {
  ArgumentsBindingClass(FutureOr<S1> t1) {}

  ArgumentsBindingClass.named(FutureOr<S1> t1, {FutureOr<S1> t2}) {}
  ArgumentsBindingClass.positional(FutureOr<S1> t1, [FutureOr<S1> t2]) {}

  factory ArgumentsBindingClass.fNamed(FutureOr<S1> t1, {FutureOr<S1> t2}) {
    return new ArgumentsBindingClass.named(t1, t2: t2);
  }
  factory ArgumentsBindingClass.fPositional(FutureOr<S1> t1, [FutureOr<S1> t2]) {
    return new ArgumentsBindingClass.positional(t1, t2);
  }

  static namedArgumentsStaticMethod(FutureOr<S1> t1, {FutureOr<S1> t2}) {}
  static positionalArgumentsStaticMethod(FutureOr<S1> t1, [FutureOr<S1> t2]) {}

  namedArgumentsMethod(FutureOr<S1> t1, {FutureOr<S1> t2}) {}
  positionalArgumentsMethod(FutureOr<S1> t1, [FutureOr<S1> t2]) {}

  set testSetter(FutureOr<S1> val) {}
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
  ArgumentsBindingClassSuper(FutureOr<S1> t1) {}
}

class ArgumentsBindingDesc extends ArgumentsBindingClassSuper {
  ArgumentsBindingDesc(X0 t0) : super (forgetType(t0)) {}
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

  // Test type parameters

    // Test generic functions
  Expect.throws(() {
    namedArgumentsFunc2<FutureOr<S1>>(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    namedArgumentsFunc2<FutureOr<S1>>(t1Instance, t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    positionalArgumentsFunc2<FutureOr<S1>>(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    positionalArgumentsFunc2<FutureOr<S1>>(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError);

  // Test constructors
  Expect.throws(() {
    new ArgumentsBindingClassGen<FutureOr<S1>>(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<FutureOr<S1>>.named(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<FutureOr<S1>>.named(t1Instance, t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<FutureOr<S1>>.positional(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<FutureOr<S1>>.positional(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<FutureOr<S1>>.fNamed(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<FutureOr<S1>>.fNamed(t1Instance, t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<FutureOr<S1>>.fPositional(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<FutureOr<S1>>.fPositional(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError);


  // Test instance methods and setters
  Expect.throws(() {
    new ArgumentsBindingClassGen<FutureOr<S1>>(t1Instance).namedArgumentsMethod(
    forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<FutureOr<S1>>(t1Instance).namedArgumentsMethod(t1Instance,
    t2: forgetType(t0Instance));
    }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<FutureOr<S1>>(t1Instance).positionalArgumentsMethod(
    forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<FutureOr<S1>>(t1Instance).positionalArgumentsMethod(t1Instance,
    forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<FutureOr<S1>>(t1Instance).testSetter = forgetType(t0Instance);
  }, (e) => e is TypeError);
  
  // Test superclass constructor call
  Expect.throws(() {
    new ArgumentsBindingDesc(t0Instance);
  }, (e) => e is TypeError);
}
