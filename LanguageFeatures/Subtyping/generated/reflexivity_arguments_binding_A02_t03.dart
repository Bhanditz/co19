/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Reflexivity: T0 and T1 are the same type.
 * @description Check that if type T1 and T0 are both dynamic then T0 is a
 * subtype of a type T1
 * @author sgrekhov@unipro.ru
 */

import "../utils/common.dart";

dynamic t0Instance = 3.14;
dynamic t1Instance = "";




class ArgumentsBindingMixin1_t03 {
  dynamic m;

  void superTest(dynamic val) {}
  void superTestPositioned(dynamic val, [dynamic val2]) {}
  void superTestNamed(dynamic val, {dynamic val2}) {}
  dynamic get superGetter => m;
  void set superSetter(dynamic val) {}
}

class ArgumentsBinding1_t03 extends Object with ArgumentsBindingMixin1_t03 {

  test(dynamic t1, dynamic t2) {
    superTest(t1);
    superTestPositioned(t1);
    superTestPositioned(t2, t1);
    superTestNamed(t1);
    superTestNamed(t2, val2: t1);
    superSetter = t1;
    m = t1;
    superGetter;
  }
}

class ArgumentsBindingMixin2_t03<X> {
  X m;

  void superTest(X val) {}
  void superTestPositioned(X val, [X val2]) {}
  void superTestNamed(X val, {X val2}) {}
  X get superGetter => m;
  void set superSetter(X val) {}
}

class ArgumentsBinding2_t03<X> extends Object with ArgumentsBindingMixin2_t03<X> {

  test(dynamic t1, dynamic t2) {
    superTest(t1);
    superTestPositioned(t1);
    superTestPositioned(t2, t1);
    superTestNamed(t1);
    superTestNamed(t2, val2: t1);
    superSetter = t1;
    m = t1;
    superGetter;
  }
}

main() {
  ArgumentsBinding1_t03 c1 = new ArgumentsBinding1_t03();

  c1.test(forgetType(t0Instance), t1Instance);
  c1.superTest(forgetType(t0Instance));
  c1.superTestPositioned(forgetType(t0Instance));
  c1.superTestPositioned(t1Instance, forgetType(t0Instance));
  c1.superTestNamed(forgetType(t0Instance));
  c1.superTestNamed(t1Instance, val2: forgetType(t0Instance));
  c1.superSetter = forgetType(t0Instance);
  c1.superGetter;

  if (!isGenericFunctionType<dynamic>()) {
    ArgumentsBinding2_t03<dynamic> c2 = new ArgumentsBinding2_t03<dynamic>();
    c2.test(forgetType(t0Instance), t1Instance);
    c2.superTest(forgetType(t0Instance));
    c2.superTestPositioned(forgetType(t0Instance));
    c2.superTestPositioned(t1Instance, forgetType(t0Instance));
    c2.superTestNamed(forgetType(t0Instance));
    c2.superTestNamed(t1Instance, val2: forgetType(t0Instance));
    c2.superSetter = forgetType(t0Instance);
    c2.superGetter;
  }
}
