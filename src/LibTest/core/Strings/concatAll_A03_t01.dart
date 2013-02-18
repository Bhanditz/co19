/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws Error if any of the list elements are null
 * @description Checks that passing a list containing null elements results in Error
 * @author rodionov
 * @reviewer pagolubev
 * @needsreview Undocumented
 */
import "../../../Utils/expect.dart";

main() {
  check([ "1", null, "2" ]);
  check([ null ]);
  check([ null, null ]);
  check([ null, "foo" ]);
}

void check(List<String> arr) {
  try {
    Strings.concatAll(arr);
    Expect.fail("Error expected");
  } on Error catch(e) {
  }
}
