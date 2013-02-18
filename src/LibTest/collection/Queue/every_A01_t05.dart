/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if every elements of the collection satisfy the
 * predicate [f]. Returns false otherwise.
 * @description Checks that exception thrown in [f] breaks the iteration
 * @author msyabro
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  Queue list = new Queue();
  
  list.addLast(1);
  list.addLast(2);
  
  int count = 0;
  try {
    list.every((var element) {
      count++;
      throw "Exception";
    });
  } on Object catch(e) {
    Expect.equals(1, count);
  }
}
