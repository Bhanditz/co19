/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if every elements of the collection satisify the
 * predicate [f]. Returns false otherwise.
 * @description Try to change the list from [f]
 * @author msyabro
 */


main() {
  DoubleLinkedList list = new DoubleLinkedList();
  
  list.addLast(1);
  list.addLast(1);
  list.every(bool func(var element){ 
    list.clear();
    return true;
  });
  Expect.isTrue(list.isEmpty());
  
  for(int i = 0; i < 100; i++) {
    list.addLast(i);
  }
  
  list.every(bool func(var element) {
    list.removeFirst();
    return true;
  });
  Expect.isTrue(list.isEmpty());
}
