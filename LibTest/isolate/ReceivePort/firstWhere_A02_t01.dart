/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<dynamic> firstWhere(bool test(T element), {Object defaultValue()})
 * If no such element is found before this stream is done, and a defaultValue function is provided,
 * the result of calling defaultValue becomes the value of the future.
 * @description Checks that if this stream ends without finding a match and a defaultValue
 * function is provided, the result of calling defaultValue becomes the value of the future.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

check(Iterable data, bool test(var element), int expected) {
  Stream s = IsolateStream.fromIterable(data);
  asyncStart();
  Future<int> f = s.firstWhere(test, defaultValue: ()=>expected);
  f.then((int actual){
    Expect.equals(expected, actual);
    asyncEnd();
  });
}

main() {
  check([], (var element) => true, 1);
  check([1,2,3], (var element) => element == null, null);
  check(new Iterable.generate(0, (int index) => index), (var element) => false, 0);
  check(new Iterable.generate(0, (int index) => index), (var element) => true, 0);
  check(new Iterable.generate(10, (int index) => index), (var element) => false, 22);
  check(new Iterable.generate(10, (int index) => index * 5), (var element) => element < 0, 33);
}
