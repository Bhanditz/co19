/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic firstWhere(bool test(E element), {Object orElse()})
 * By default, when orElse is null, a [StateError] is thrown.
 * @description Checks that a [StateError] is thrown.
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

o() => new Float32x4.zero();

check(List<Float32x4> list) {
  var l = new Float32x4List.fromList(list);
  try {
    l.firstWhere((e) => false);
    Expect.fail("StateError is expected");
  } on StateError catch(ok) {}
}

main() {
  check([]);
  check([o()]);
  check([o(), o(), o(), o(), o(), o(), o(), o(), o(), o(), o(), o(), o(), o()]);
}
