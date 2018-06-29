/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Reflexivity: T0 and T1 are the same type.
 * @description Check that if type T1 and T0 are both Object then T0 is a
 * subtype of a type T1
 * @author sgrekhov@unipro.ru
 */
import '../../utils/common.dart';

Object t0Instance = new Object();
Object t1Instance = new Object();




Object returnValueFunc() => forgetType(t0Instance);

class ReturnValueTest {
  static Object staticTestMethod() => forgetType(t0Instance);

  Object testMethod() => forgetType(t0Instance);

  Object get testGetter => forgetType(t0Instance);
}

class ReturnValueGen<X> {
  X testMethod() => forgetType(t0Instance);
  X get testGetter => forgetType(t0Instance);
}


main() {
  Object returnValueLocalFunc() => forgetType(t0Instance);

  returnValueFunc();
  returnValueLocalFunc();

  ReturnValueTest.staticTestMethod();

  new ReturnValueTest().testMethod();
  new ReturnValueTest().testGetter;

  // Test type parameters

    new ReturnValueGen<Object>().testMethod();
  new ReturnValueGen<Object>().testGetter;
  }
