/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool containsAll(Collection<T> collection)
 * Returns true if this collection contains all the elements of [collection].
 * @description Passes an array containing an element w/o hashCode() function.
 * @author pagolubev
 * @reviewer msyabro
 */

class A {
  A() {}
}


main() {
  var s = new Set();
  s.addAll([1, 2]);
  try {
    s.removeAll([1, 2, new A()]);
    Expect.fail("Expected NoSuchMethodException.");
  } catch (NoSuchMethodException e) {
  }
}
