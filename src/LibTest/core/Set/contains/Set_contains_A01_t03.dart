/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool contains(T value)
 * Returns true if [value] is in the set.
 * @description Passes element of type with no hashCode() method.
 * @author pagolubev
 * @reviewer msyabro
 */

class A {
  A() {}
}


main() {
  var s = new Set();
  try {
    s.contains(new A());
    Expect.fail("Expected NoSuchMethodException.");
  } catch (NoSuchMethodException e) {}
}
