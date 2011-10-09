/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An abstract method is a function declaration without a body.
 * An abstract method is a member of a class or an interface.
 * @description Checks that abstract method can be a member of an interface.
 * @author pagolubev
 * @reviewer iefremov
 */

interface A {
  f1();

  f2(int x, int y, ...z);

  int f3(int x, int y, [int v, int w]);
}


void main() {
}
