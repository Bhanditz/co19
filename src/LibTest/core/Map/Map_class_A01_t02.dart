/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A [Map] is an associative container, mapping a key to a value.
 * Null values are supported.
 * @description Checks that multiple values for a key are not supported.
 * @author msyabro
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";


main() {
  Map<String, Object> map = new Map<String, Object>();
  map["1"] = 1;
  map["1"] = 2;
  
  Expect.isTrue(map.length == 1);
  Expect.isTrue(map["1"] == 2);
}
