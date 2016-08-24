/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if a class C declares an instance method
 * named n and an accessible static member named n is declared in a superclass 
 * of C.
 * @description Checks that a compile error is produced when a class declares
 * an instance method with the same name as a static variable in its superclass.
 * @compile-error
 * @author vasya
 */

class A {
  static var f;
}

class C extends A {
  f() {
  }
}

main() {
  new C().f();
}
