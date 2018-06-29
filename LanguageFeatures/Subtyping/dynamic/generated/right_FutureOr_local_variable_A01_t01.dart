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
 * @description Check that if a type T1 is FutureOr<S1> and a type T0 is a
 * subtype of a type Future<S1>, then a type T0 is a subtype of a type T1.
 * @author ngl@unipro.ru
 */
import '../../utils/common.dart';

import "dart:async";

class S1 {}
class T0 implements Future<S1> {
  asStream() => null;
  catchError(Function onError, {bool test(Object error)}) => null;
  then<T0>(FutureOr<T0> onValue(S1 value), {Function onError}) => null;
  timeout(Duration timeLimit, {FutureOr<S1> onTimeout()}) => null;
  whenComplete(FutureOr action()) => null;
}

T0 t0Instance = new T0();
FutureOr<S1> t1Instance = new Future.value(new S1());




class LocalVariableTest {

  LocalVariableTest() {
    FutureOr<S1> t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }

  static staticTest() {
    FutureOr<S1> t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }

  test() {
    FutureOr<S1> t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }
}

main() {
  foo() {
    FutureOr<S1> t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }

  FutureOr<S1> t1 = forgetType(t0Instance);
  t1 = forgetType(t0Instance);
  foo();
  LocalVariableTest x = new LocalVariableTest();
  x.test();
  LocalVariableTest.staticTest();
}
