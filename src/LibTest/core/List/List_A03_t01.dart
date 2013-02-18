/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws [ArgumentError] if the [length] is not a non-negative integer.
 * @description Checks that ArgumentError is thrown as expected.
 * @author vasya
 * @reviewer iefremov
 * @reviewer msyabro
 * @reviewer varlax
 * @needsreview undocumented
 */
import "../../../Utils/expect.dart";

main() {
  try {
    List a = new List(-1);
    Expect.fail("ArgumentError is expected");
  } on ArgumentError catch(e) {}

  try {
    List a = new List(null);
    Expect.fail("ArgumentError is expected");
  } on ArgumentError catch(e) {}
}
