/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if:
 * A spread element in a map literal has a static type that is not [dynamic] and
 * not a subtype of [Map<Object, Object>].
 * @description Checks that compile error is thrown if spread element in the
 * map is not dynamic and is not assignable to [Map]
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=constant-update-2018
import "dart:async";

main() {
  Object x1;
  List x2;
  Set x3;
  int x4;
  Iterable x5;
  Null x6;
  void x7;
  Future x8;
  FutureOr x9;

  Map m1 = {...x1}; //# 01: compile-time error
  Map m2 = {...x2}; //# 02: compile-time error
  Map m3 = {...x3}; //# 03: compile-time error
  Map m4 = {...x4}; //# 04: compile-time error
  Map m5 = {...x5}; //# 05: compile-time error
  Map m6 = {...x6}; //# 06: compile-time error
  Map m7 = {...x7}; //# 07: compile-time error
  Map m8 = {...x8}; //# 08: compile-time error
  Map m9 = {...x9}; //# 09: compile-time error
}
