/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int lengthInBytes
 * Returns the length of this view, in bytes.
 * @description Checks that [lengthInBytes] is final and can't be set.
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(int len) {
  dynamic l = new Float32x4List(len);
  try {
    l.lengthInBytes = 0;
    Expect.fail("[lengthInBytes] should be final");
  } on NoSuchMethodError catch(ok) {}
}

main() {
  check(0);
  check(5);
  check(100);
}
