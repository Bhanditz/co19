/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluating a hexadecimal integer literal with numeric value i is a
 * compile-time error unless -2^63 <= i <= 2^64
 * @description Checks that it no error if a hexadecimal integer literal with
 * numeric value -2^63 <= i < 2^63
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=constant-update-2018

import "dart:math";
import '../../../Utils/expect.dart';

main() {
  int i1 = 0x8000000000000000;
  Expect.equals(1 << 63, i1);

  int i2 = 0x7FFFFFFFFFFFFFFF;
  Expect.equals(pow(2, 63) - 1, i2);
}
