/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void reset()
 * ...
 * This method does not stop or start the Stopwatch.
 * @description Checks that this method does not start the Stopwatch.
 * @author sgrekhov@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Stopwatch sw = new Stopwatch();
  sw.reset();
  Expect.isFalse(sw.isRunning);
  sw.start();
  Expect.isTrue(sw.isRunning);
  sw.stop();
  sw.reset();
  Expect.isFalse(sw.isRunning);
}
