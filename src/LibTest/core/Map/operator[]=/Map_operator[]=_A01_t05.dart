/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Associates the [key] with the given [value].
 * @description Try to call operator without [key]
 * @static-type-error
 * @author msyabro
 * @reviewer varlax
 * @needsreview: this is rather compiler check 
 */

class A {
  A() {}
}


main() {
  Map<int, Object> map = new Map<int, Object>();
  map[] = 1;
}
