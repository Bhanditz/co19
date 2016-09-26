/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final E single
 * Returns the single element in this.
 * @description Checks that [last] is final and can't be set
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  dynamic l = new Int64List.fromList([0]);
  try {
    l.single = 1;
    Expect.fail("[single] should be final");
  } on NoSuchMethodError catch(ok) {}
}
