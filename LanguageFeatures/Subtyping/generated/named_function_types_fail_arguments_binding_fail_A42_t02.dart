/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T0 is a subtype of a type T1 (written T0 <: T1) when:
 * Named Function Types: T0 is U0 Function<X0 extends B00, ..., Xk extends B0k>
 *   (T0 x0, ..., Tn xn, {Tn+1 xn+1, ..., Tm xm})
 *
 * and T1 is U1 Function<Y0 extends B10, ..., Yk extends B1k>(S0 y0, ..., Sn yn,
 * {Sn+1 yn+1, ..., Sq yq})
 * and {yn+1, ... , yq} subsetof {xn+1, ... , xm}
 * and Si[Z0/Y0, ..., Zk/Yk] <: Vi[Z0/X0, ..., Zk/Xk] for i in 0...n
 * and Si[Z0/Y0, ..., Zk/Yk] <: Tj[Z0/X0, ..., Zk/Xk] for i in n+1...q, yj = xi
 * and U0[Z0/X0, ..., Zk/Xk] <: U1[Z0/Y0, ..., Zk/Yk]
 * and B0i[Z0/X0, ..., Zk/Xk] === B1i[Z0/Y0, ..., Zk/Yk] for i in 0...k
 * where the Zi are fresh type variables with bounds B0i[Z0/X0, ..., Zk/Xk]
 * @description Check that if U0[Z0/X0, ..., Zk/Xk] is not a subtype of
 * U1[Z0/Y0, ..., Zk/Yk], then T0 is not a subtype of T1. Test generic types
 * @author sgrekhov@unipro.ru
 */
import "../utils/common.dart";
import "../../../Utils/expect.dart";

class A {}

class C extends A {}

class U<X, Y, Z>{}

class B0<X, Y, Z> {}

class B1<X, Y, Z> {}

class V0<X, Y, Z> {}

class V1<X, Y, Z> {}

class V2<X, Y, Z> {}

class V3<X, Y, Z> {}

class V4<X, Y, Z> {}

class S0<X, Y, Z> extends V0<X, Y, Z> {}

class S1<X, Y, Z> extends V1<X, Y, Z> {}

class S2<X, Y, Z> extends V2<X, Y, Z> {}

class S3<X, Y, Z> extends V3<X, Y, Z> {}

class X0<X, Y, Z> extends B0<X, Y, Z> {}

class X1<X, Y, Z> extends B1<X, Y, Z> {}

class Y0<X, Y, Z> extends B0<X, Y, Z> {}

class Y1<X, Y, Z> extends B1<X, Y, Z> {}

typedef U<C, List<String>, int> T0<X extends B0, Y extends B1>( // U<C, List<String>, int> is not subtype of U<A, List, double>
    V0<A, List, num> x0, V1<A, List, num> x1,
    {V2<A, List, num> x2, V3<A, List, num> x3, V4<A, List, num> x4});
typedef U<A, List, double> T1<X extends B0, Y extends B1>(
    S0<C, List<String>, int> y0, S1<C, List<String>, int> y1,
    {S2<C, List<String>, int> x2, S3<C, List<String>, int> x3});

U<C, List<String>, int> t0Instance<X, Y>(
        V0<A, List, num> x0, V1<A, List, num> x1,
        {V2<A, List, num> x2, V3<A, List, num> x3, V4<A, List, num> x4}) =>
    null;
U<A, List, double> t1Instance<X, Y>(
        S0<C, List<String>, int> y0, S1<C, List<String>, int> y1,
        {S2<C, List<String>, int> x2, S3<C, List<String>, int> x3}) =>
    null;




class ArgumentsBindingSuper1_t02 {
  T1<X0<A, List, num>, X1<A, List, num>> m;

  ArgumentsBindingSuper1_t02(T1<X0<A, List, num>, X1<A, List, num>> value) {}
  ArgumentsBindingSuper1_t02.named(T1<X0<A, List, num>, X1<A, List, num>> value, {T1<X0<A, List, num>, X1<A, List, num>> val2}) {}
  ArgumentsBindingSuper1_t02.positional(T1<X0<A, List, num>, X1<A, List, num>> value, [T1<X0<A, List, num>, X1<A, List, num>> val2]) {}
  ArgumentsBindingSuper1_t02.short(this.m);

  void superTest(T1<X0<A, List, num>, X1<A, List, num>> val) {}
  void superTestPositioned(T1<X0<A, List, num>, X1<A, List, num>> val, [T1<X0<A, List, num>, X1<A, List, num>> val2]) {}
  void superTestNamed(T1<X0<A, List, num>, X1<A, List, num>> val, {T1<X0<A, List, num>, X1<A, List, num>> val2}) {}
  T1<X0<A, List, num>, X1<A, List, num>> get superGetter => forgetType(t0Instance);
  void set superSetter(T1<X0<A, List, num>, X1<A, List, num>> val) {}
}

class ArgumentsBinding1_t02 extends ArgumentsBindingSuper1_t02 {
  ArgumentsBinding1_t02(dynamic t1) : super(t1) {}
  ArgumentsBinding1_t02.c1(dynamic t1) : super.named(t1) {}
  ArgumentsBinding1_t02.c2(dynamic t1, dynamic t2) : super.named(t1, val2: t2) {}
  ArgumentsBinding1_t02.c3(dynamic t1) : super.positional(t1) {}
  ArgumentsBinding1_t02.c4(dynamic t1, dynamic t2) : super.positional(t1, t2) {}
  ArgumentsBinding1_t02.c5(dynamic t1) : super.short(t1) {}

  ArgumentsBinding1_t02.valid() : super(null) {}

  test() {
    Expect.throws(() {
      superTest(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superTest(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superTest(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      superTestPositioned(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superTestPositioned(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superTestPositioned(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      superTestPositioned(forgetType(t1Instance), forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superTestPositioned(forgetType(t1Instance), forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superTestPositioned(forgetType(t1Instance), forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      superTestNamed(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superTestNamed(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superTestNamed(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      superTestNamed(forgetType(t1Instance), val2: forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superTestNamed(forgetType(t1Instance), val2: forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superTestNamed(forgetType(t1Instance), val2: forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      superSetter = forgetType(t0Instance);
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superSetter = forgetType(t0Instance);
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superSetter = forgetType(t0Instance);
    }, (e) => e is TypeError);

    Expect.throws(() {
      superGetter;
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superGetter;
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superGetter;
    }, (e) => e is TypeError);
  }
}

class ArgumentsBindingSuper2_t02<X> {
  X m;

  ArgumentsBindingSuper2_t02(X value) {}
  ArgumentsBindingSuper2_t02.named(X value, {X val2}) {}
  ArgumentsBindingSuper2_t02.positional(X value, [X val2]) {}
  ArgumentsBindingSuper2_t02.short(this.m);

  void superTest(X val) {}
  void superTestPositioned(X val, [X val2]) {}
  void superTestNamed(X val, {X val2}) {}
  X get superGetter => forgetType(t0Instance);
  void set superSetter(X val) {}
}

class ArgumentsBinding2_t02<X> extends ArgumentsBindingSuper2_t02<X> {
  ArgumentsBinding2_t02(dynamic t1) : super(t1) {}
  ArgumentsBinding2_t02.c1(dynamic t1) : super.named(t1) {}
  ArgumentsBinding2_t02.c2(dynamic t1, dynamic t2) : super.named(t1, val2: t2) {}
  ArgumentsBinding2_t02.c3(dynamic t1) : super.positional(t1) {}
  ArgumentsBinding2_t02.c4(dynamic t1, dynamic t2) : super.positional(t1, t2) {}
  ArgumentsBinding2_t02.c5(dynamic t1) : super.short(t1) {}

  ArgumentsBinding2_t02.valid() : super(null) {}

  test() {
    Expect.throws(() {
      superTest(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superTest(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superTest(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      superTestPositioned(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superTestPositioned(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superTestPositioned(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      superTestPositioned(forgetType(t1Instance), forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superTestPositioned(forgetType(t1Instance), forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superTestPositioned(forgetType(t1Instance), forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      superTestNamed(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superTestNamed(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superTestNamed(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      superTestNamed(forgetType(t1Instance), val2: forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superTestNamed(forgetType(t1Instance), val2: forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superTestNamed(forgetType(t1Instance), val2: forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      superSetter = forgetType(t0Instance);
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superSetter = forgetType(t0Instance);
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superSetter = forgetType(t0Instance);
    }, (e) => e is TypeError);

    Expect.throws(() {
      superGetter;
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superGetter;
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superGetter;
    }, (e) => e is TypeError);
  }
}

main() {
  // test constructors
  Expect.throws(() {
    new ArgumentsBinding1_t02(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding1_t02.c1(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding1_t02.c2(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding1_t02.c3(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding1_t02.c4(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding1_t02.c5(forgetType(t0Instance));
  }, (e) => e is TypeError);

  // test class members
  Expect.throws(() {
    new ArgumentsBinding1_t02.valid().superTest(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding1_t02.valid().superTestPositioned(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding1_t02.valid().superTestPositioned(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding1_t02.valid().superTestNamed(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding1_t02.valid().superTestNamed(t1Instance, val2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding1_t02.valid().superSetter = forgetType(t0Instance);
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding1_t02.valid().superGetter;
  }, (e) => e is TypeError);

  new ArgumentsBinding1_t02.valid().test();

  // test generic class constructors
  Expect.throws(() {
    new ArgumentsBinding2_t02<T1<X0<A, List, num>, X1<A, List, num>>>(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding2_t02<T1<X0<A, List, num>, X1<A, List, num>>>.c1(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding2_t02<T1<X0<A, List, num>, X1<A, List, num>>>.c2(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding2_t02<T1<X0<A, List, num>, X1<A, List, num>>>.c3(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding2_t02<T1<X0<A, List, num>, X1<A, List, num>>>.c4(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding2_t02<T1<X0<A, List, num>, X1<A, List, num>>>.c5(forgetType(t0Instance));
  }, (e) => e is TypeError);

  // test generic class members
  Expect.throws(() {
    new ArgumentsBinding2_t02<T1<X0<A, List, num>, X1<A, List, num>>>.valid().superTest(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding2_t02<T1<X0<A, List, num>, X1<A, List, num>>>.valid().superTest(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding2_t02<T1<X0<A, List, num>, X1<A, List, num>>>.valid().superTestPositioned(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding2_t02<T1<X0<A, List, num>, X1<A, List, num>>>.valid().superTestPositioned(forgetType(t1Instance), forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding2_t02<T1<X0<A, List, num>, X1<A, List, num>>>.valid().superTestNamed(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding2_t02<T1<X0<A, List, num>, X1<A, List, num>>>.valid().superTestNamed(forgetType(t1Instance), val2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding2_t02<T1<X0<A, List, num>, X1<A, List, num>>>.valid().superSetter = forgetType(t0Instance);
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding2_t02<T1<X0<A, List, num>, X1<A, List, num>>>.valid().superGetter;
  }, (e) => e is TypeError);

  new ArgumentsBinding2_t02<T1<X0<A, List, num>, X1<A, List, num>>>.valid().test();
}
