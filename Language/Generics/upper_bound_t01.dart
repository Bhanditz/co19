/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static type warning if a type variable is supertype of
 * its upper bound.
 * @description Checks that it is a compile error if a type variable is
 * supertype of its upper bound.
 * @compile-error
 * @author pagolubev
 * @reviewer kaigorodov
 */

class A {}

class B extends A {}

class G<T extends B> {}

main() {
  new G<A>();
}
