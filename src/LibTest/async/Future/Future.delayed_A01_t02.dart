/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Future.delayed(int milliseconds, T value())
 * Creates a future that completes after a delay.
 * The future will be completed after milliseconds have passed with the result of calling value.
 * If milliseconds is 0, it completes at the earliest in the next event-loop iteration.
 * @description Checks that execution of the supplied value() function happens after delay.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

import "dart:async";

var lastValue=null;

check(delay, value, expectedLastValue) {
  Future future = new Future.delayed(delay, ()=>value);
  future.then((fValue) {
    Expect.equals(lastValue, expectedLastValue);
    lastValue=fValue;
  });
}

main() {
  check(100, 3, 22);
  check(50, 22, 11);
  check(0, 11, null);
}
