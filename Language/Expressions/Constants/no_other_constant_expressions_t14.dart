/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion There are no other constant expressions.
 * @description Checks that an assignment expression cannot be used to
 * initialize a constant variable.
 * @compile-error
 * @author iefremov
 * @reviewer rodionov
 */
// SharedOptions=--enable-experiment=constant-update-2018

class A {
  const A();
  final z = null;
}

const m = ((const A()).z = 1);

main() {
  try {
    print(m);
  } catch (x) {}
}
