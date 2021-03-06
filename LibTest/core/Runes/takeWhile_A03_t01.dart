/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> takeWhile(bool test(E element))
 * Every new [Iterator] of the returned [Iterable]
 * iterates over all elements of [this].
 * @description Checks that every new [Iterator] of the returned [Iterable]
 * iterates over all elements of [this].
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  var count = 0;
  bool test(e) {
    ++count;
    return e < 3;
  }

  var runes = new Runes('\x01\x02\x03\x04\x05');
  var res = runes.takeWhile(test);
  Expect.equals(0, count);
  res.elementAt(0);
  Expect.equals(1, count);

  res.elementAt(0);
  Expect.equals(2, count);

  var it = res.iterator;
  it.moveNext();
  Expect.equals(3, count);

  it.moveNext();
  Expect.equals(4, count);
}
