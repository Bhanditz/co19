/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool containsKey(Map map, Object key)
 * Returns whether this map contains the given [key].
 * @description Checks that [null] key is allowed
 * @author msyabro
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  Map<String, Object> map = new Map<String, Object>();
  map[null] = "not null";
  Expect.isTrue(Maps.containsKey(map, null));
}
