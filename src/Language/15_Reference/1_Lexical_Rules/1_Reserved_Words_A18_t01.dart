/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion "new" is a reserved word.
 * @description Checks that it is a compile-time error when a reserved word "new"
 * is used as a class name.
 * @compile-error
 * @author vasya
 * @reviewer rodionov
 */

class new { } // error

main() {
  try {
    null is new;
  } catch (anything) {
  }
}