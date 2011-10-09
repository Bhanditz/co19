/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the value for the given [key] or null if [key] is not in the map.
 * @description Try to pass [key] of different type
 * @static-type-error
 * @author msyabro
 * @reviewer varlax
 * @needsreview: this is rather compiler check 
*/

class A {
  A() {}
  int hashCode() {
    return 1;
  }
}


main() {
  Map<int, Object> map = new Map<int, Object>();
  
  map[new A()];
}
