/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws NullPointerException if argument is null.
 * @description Check that NullPointerException is thrown
 * @author msyabro
 * @needsreview undocumented
 */


main() {
  try {
    String str = Strings.concatAll(null);
    Expect.fail("NullPointerException is expected");
  } catch(NullPointerException e) {}
}
