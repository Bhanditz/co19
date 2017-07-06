/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E last
 * Returns the last element.
 * @description Checks that [last] is read-only and can't be set.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

void check(List<Float32x4> array) {
  dynamic l = new Float32x4List.fromList(array);
  try {
    l.last = pack(.0);
    Expect.fail("[last] should be read-only");
  } on NoSuchMethodError {}
}
void checkClear(int length) {
  dynamic l = new Float32x4List(length);
  try {
    l.last = pack(.0);
    Expect.fail("[last] should be read-only");
  } on NoSuchMethodError {}
}

main() {
  check([pack(1.0)]);
  check([pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0)]);
  check([
    pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0),
    pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0),
    pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0),
    pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0),
    pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0),
    pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0),
    pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0),
    pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0),
    pack(0.0), pack(1.0)
  ]);

  checkClear(1);
  checkClear(100);
}
