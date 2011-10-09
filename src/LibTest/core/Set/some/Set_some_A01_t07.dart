/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool some(bool f(T element))
 * Returns true if one element of the collection satisfies the predicate [f].
 * Returns false otherwise.
 * @description Check that some() doesn't change the set
 * @author msyabro
 */


main() {
  bool foo(int x) { return x > 0; }
  Set<int> s = new Set<int>();
  s.addAll([-1, -3, -11]);
  Expect.isTrue(!s.some(foo));

  Expect.isTrue(s.length == 3);
  Expect.isTrue(s.containsAll([-1, -3, -11]));
}
