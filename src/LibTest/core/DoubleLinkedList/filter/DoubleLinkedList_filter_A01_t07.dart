/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns a new collection with the elements of this collection
 * that satisfy the predicate [f].
 * @description Check that filter() returns correct collection
 * @author msyabro
 */


main() {
  DoubleLinkedList<int> list = new DoubleLinkedList<int>();
  
  for(int i = 0; i < 101; i++) {
    list.addLast(i - 50);
  }
  
  DoubleLinkedList<int> a = list.filter(bool f(int element) {
    return element > 0;
  });
  Expect.isTrue(a.length == 50);
  for(int i = 0; i < 50 ; i++) {
    Expect.isTrue(a.removeFirst() == i+1);
  }
  
  a = list.filter(bool f(int element) {
    return element == 0;
  });
  Expect.isTrue(a.length == 1);
  Expect.isTrue(a.first() == 0);
  
  a = list.filter(bool f(int element) {
    return true;
  });
  Expect.isTrue(a.length == 101);
  for(int i = 0; i < 101; i++) {
    Expect.isTrue(a.removeFirst() == i - 50);
  }
  
  a = list.filter(bool f(int element) {
    return false;
  });
  Expect.isTrue(a.isEmpty());
}
