/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left Type Variable Bound: T0 is a type variable X0 with bound B0
 *   and B0 <: T1
 * @description Check that if T0 is a type variable X0 with bound B0 and
 * B0 is not a subtype of T1 then T0 is not a subtype of a type T1.
 * @author ngl@unipro.ru
 */

import "../utils/common.dart";
import "../../../Utils/expect.dart";

class T1 {}
class B0 {}
class X0 extends B0 {}

X0 t0Instance = new X0();
T1 t1Instance = new T1();




class ClassMemberSuper1_t02 {
  T1 m;

  ClassMemberSuper1_t02(dynamic value) {
    m = value;
  }

  ClassMemberSuper1_t02.named(dynamic value) {
    m = value;
  }

  ClassMemberSuper1_t02.short(this.m);

  void set superSetter(T1 val) {}
}

class ClassMember1_t02 extends ClassMemberSuper1_t02 {

  ClassMember1_t02() : super(forgetType(t0Instance)) {}

  ClassMember1_t02.named() : super.named(forgetType(t0Instance)) {}

  ClassMember1_t02.short() : super.short(forgetType(t0Instance));

  ClassMember1_t02.valid() : super(null);

  test1() {
    m = forgetType(t0Instance);
  }

  test2() {
    superSetter = forgetType(t0Instance);
  }
}

class ClassMemberSuper2_t02<X> {
  X m;

  ClassMemberSuper2_t02(X value) {
    m = value;
  }

  ClassMemberSuper2_t02.named(X value) {
    m = value;
  }

  ClassMemberSuper2_t02.short(this.m);

  void set superSetter(X val) {}
}

class ClassMember2_t02<X> extends ClassMemberSuper2_t02<X> {

  ClassMember2_t02() : super(forgetType(t0Instance)) {}

  ClassMember2_t02.named() : super.named(forgetType(t0Instance)) {}

  ClassMember2_t02.short() : super.short(forgetType(t0Instance));

  ClassMember2_t02.valid() : super(null);

  test1() {
    m = forgetType(t0Instance);
  }

  test2() {
    superSetter = forgetType(t0Instance);
  }
}

main() {
  Expect.throws(() {new ClassMember1_t02();}, (e) => e is TypeError);
  Expect.throws(() {new ClassMember1_t02.short();}, (e) => e is TypeError);
  Expect.throws(() {new ClassMember1_t02.named();}, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t02.valid().m = forgetType(t0Instance);
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t02.valid().superSetter = forgetType(t0Instance);
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t02.valid().test1();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t02.valid().test2();
  }, (e) => e is TypeError);

  if (!isGenericFunctionType<T1>()) {
    Expect.throws(() {new ClassMember2_t02<T1>();}, (e) => e is TypeError);
    Expect.throws(() {new ClassMember2_t02<T1>.short();}, (e) => e is TypeError);
    Expect.throws(() {new ClassMember2_t02<T1>.named();}, (e) => e is TypeError);
    Expect.throws(() {
      new ClassMember2_t02<T1>.valid().m = forgetType(t0Instance);
    }, (e) => e is TypeError);
    Expect.throws(() {
      new ClassMember2_t02<T1>.valid().superSetter = forgetType(t0Instance);
    }, (e) => e is TypeError);
    Expect.throws(() {
      new ClassMember2_t02<T1>.valid().test1();
    }, (e) => e is TypeError);
    Expect.throws(() {
      new ClassMember2_t02<T1>.valid().test2();
    }, (e) => e is TypeError);
  }
}
