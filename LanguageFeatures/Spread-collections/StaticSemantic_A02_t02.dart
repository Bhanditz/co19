/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion This is true even if the object being spread is a user-defined
 * class that implements [Iterable] but isn't even a subtype of List.
 * @description Checks that [Iterable] object can be spread into the spreadable
 * set.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=constant-update-2018

import "dart:collection";
import "../../Utils/expect.dart";

class MyIterable extends IterableBase {

  MyIterable();

  Iterator get iterator => MyIterator();
}

class MyIterator extends Iterator {
  int i = -1;

  MyIterator() {}

  @override
  bool moveNext() {
    return ++i < 10;
  }

  @override
  dynamic get current { return i; }
}

main() {
  Iterable iterable = new MyIterable();
  Expect.setEquals(iterable.toList().toSet(), {...iterable});
  Expect.setEquals(iterable.toList().toSet(), {...?iterable});
}
