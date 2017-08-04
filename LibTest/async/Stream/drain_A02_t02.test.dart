/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future drain([futureValue])
 * In case of a done event the future completes with the given futureValue.
 * @description Checks that the future completes with null if futureValue is
 * omitted.
 * @author kaigorodov
 */
library drain_A02_t02;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(Stream s) {
  Future f = s.drain();
  asyncStart();
  f.then(
    (value) {
      Expect.equals(null, value);
      asyncEnd();
    }
  );
}

void test(Stream<T> create(Iterable<T> data)) {
  check(create([]));
  check(create(new Iterable.generate(10, (int index) => index)));
}
