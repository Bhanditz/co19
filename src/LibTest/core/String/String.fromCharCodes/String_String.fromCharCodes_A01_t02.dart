/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Allocates a new String for the specified [charCodes].
 * @description Try to pass array with null values
 * @author msyabro
 * @needsreview undocumented
 */


void check(Array array) {
  try {
    String str = new String.fromCharCodes(array);
    Expect.fail("IllegalArgumentException is expected");
  } catch(IllegalArgumentException e) {}
}

main() {
  check([null]);
  check([0, 1, 2, 3, null]);
  check([null, null]);
}
