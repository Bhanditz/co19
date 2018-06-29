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
 * @description Check that if a type T1 is S1 and a type T0 is X0 and X0 has
 * bound S0 and S0 <: S1, then a type T0 is a subtype of a type T1.
 * @author ngl@unipro.ru
 */
import '../../utils/common.dart';
import "dart:async";

class S1 {}
class S0 extends S1 {
}
class X0 extends S0 {
}

X0 t0Instance = new X0();
FutureOr<S1> t1Instance = new S1();




class ClassMemberMixin1_t03 {
  FutureOr<S1> m;

  void set superSetter(dynamic val) {}
}

class ClassMember1_t03 extends Object with ClassMemberMixin1_t03 {
  test() {
    m = forgetType(t0Instance);
    superSetter = forgetType(t0Instance);
  }
}

class ClassMemberMixin2_t03<X> {
  X m;
  void set superSetter(dynamic val) {}
}

class ClassMember2_t03<X> extends Object with ClassMemberMixin2_t03<X> {
  test() {
    m = forgetType(t0Instance);
    superSetter = forgetType(t0Instance);
  }
}

main() {
  ClassMember1_t03 c1 = new ClassMember1_t03();
  c1.m = forgetType(t0Instance);
  c1.test();
  c1.superSetter = forgetType(t0Instance);

  // Test type parameters

    ClassMember2_t03<FutureOr<S1>> c2 = new ClassMember2_t03<FutureOr<S1>>();
  c2.m = forgetType(t0Instance);
  c2.test();
  c2.superSetter = forgetType(t0Instance);
  }
