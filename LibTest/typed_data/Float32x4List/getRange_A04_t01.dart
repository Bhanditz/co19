/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> getRange(int start, int end)
 * It is an error if the start and end are not valid ranges
 * at the time of the call to this method.
 * @description Checks that an error is thrown.
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

pack(v) => new Float32x4.splat(v);

check(List<Float32x4> list) {
  var l = new Float32x4List.fromList(list);
  Expect.throws( () {
    l.getRange(-1, list.length);
  });

  Expect.throws( () {
    l.getRange(0, list.length + 1);
  });

  Expect.throws( () {
    l.getRange(-1, list.length + 1);
  });

  Expect.throws( () {
    l.getRange(0x80000000, 0x7fffffff);
  });
}

main() {
  check([]);
  check([pack(1.0)]);
  check(new Float32x4List(10));
}
