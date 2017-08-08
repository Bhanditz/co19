/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> where(bool test(T event))
 * Creates a new stream from this stream that discards some data events.
 * The new stream sends the same error and done events as this stream, but it
 * only sends the data events that satisfy the test.
 * @description Checks that the new stream sends the same error and done events
 * as this stream.
 * @author kaigorodov
 */
library where_A01_t02;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(Stream<T> s, bool test(T event),
           List<T> expectedData, List expectedErrors) {
  List actualData = [];
  List actualErrors = [];

  asyncStart();
  s.where(test).listen(
      (value){
        actualData.add(value);
      },
      onError: (error) {
        actualErrors.add(error);
      },
      onDone:() {
        Expect.listEquals(expectedData, actualData);
        Expect.listEquals(expectedErrors, actualErrors);
        asyncEnd();
      }
  );
}

void test(Stream<T> create(Iterable<T> data, {bool isError(T x)})) {
  check(create([1,2,3,4,5], isError: (x) => true), (e) => true, [], [1,2,3,4,5]);
  check(create([1,2,3,4,5], isError: (x) => x.isEven), (e) => true, [1,3,5], [2,4]);
  check(create([1,2,3,4,5], isError: (x) => x.isEven), (e) => e > 1, [3,5], [2,4]);
  check(create([1,2,3,4,5], isError: (x) => x.isEven), (e) => false, [], [2,4]);
  check(create([1,2,3,4,5], isError: (x) => x.isEven), (e) => throw e, [], [1,2,3,4,5]);
}