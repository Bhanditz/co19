/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skip(int count)
 * It is an error if [n] is negative.
 * @description Checks that it is an error if [n] is negative.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Float64List.fromList([]);

  Expect.throws(() {
    l.skip(-1);
  });
}
