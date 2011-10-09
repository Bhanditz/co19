/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if every elements of the collection satisify the
 * predicate [f]. Returns false otherwise.
 * @description Check that exception thrown in [f] breaks the iteration
 * @author msyabro
 */


main() {
  DoubleLinkedList list = new DoubleLinkedList();
  
  list.addLast(1);
  list.addLast(2);
  
  int count = 0;
  try {
    list.every(bool func(var element) {
      throw "Exception";
    });
  } catch(Object e) {
    Expect.isTrue(count == 0);
  }
}
