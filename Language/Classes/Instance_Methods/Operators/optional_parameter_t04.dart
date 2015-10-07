/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error to declare an optional parameter in an 
 * operator.
 * @description Checks that a compile-time error is produced if a user-defined
 * operator []= specifies one optional positional parameter in addition to the 
 * two required ones.
 * @compile-error
 * @author rodionov
 * @reviewer iefremov
 */

class C {
  operator []=(var x, var y, [var o]) {}
}

main() {
  try {
    C c = new C();
    c[0] = null;
  } catch (e) {}
}
