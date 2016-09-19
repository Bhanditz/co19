/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Iterable<E> reversed
 * Returns an [Iterable] of the elements of this [List] in reverse order.
 * @description Checks that [reversed] is final and can't be set.
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<double> list) {
  dynamic l = new Float32List.fromList(list);
  try {
    l.reversed = list;
    Expect.fail("[reversed] should be final");
  } on NoSuchMethodError catch(ok) {}
}

main() {
  check([]);
  var list = new List<double>(255);
  for(int i = 0; i < 255; ++i) {
    list[i] = i*1.0;
  }
  check(list);
}
