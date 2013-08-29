/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int getUint32(int byteOffset, [Endianness endian = Endianness.BIG_ENDIAN])
 * Throws [RangeError] if [byteOffset] is negative, or
 * `byteOffset + 4` is greater than the length of this object.
 * @description Checks that [RangeError] is thrown if
 * [byteOffset] is negative
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";


main() {
  var byteData = new ByteData(0);
  try {
    byteData.getUint32(-1);
    Expect.fail("RangeError is expected");
  } on RangeError catch(ok) {}
}
