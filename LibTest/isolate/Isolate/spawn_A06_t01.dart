/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the errorAreFatal, onExit and/or onError parameters are
 * provided, the isolate will act as if, respectively, setErrorsFatal,
 * addOnExitListener and addErrorListener were called with the corresponding
 * parameter and was processed before the isolate starts running.
 *
 * @description Check that if onError parameter is supplied, the isolate
 * captures and sends error via given send port.
 * @static-warning
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

void entryPoint(message) {
  // intentional error
  var x = "a" + 1; /// static type warning
}

main() {
  asyncStart();
  ReceivePort errorPort = new ReceivePort();
  errorPort.listen(
     (error) {
        print(error);
        errorPort.close();
        Expect.isTrue(error is List);
        Expect.equals(2, error.length);
        Expect.isTrue(error[0] is String);
        Expect.isTrue(error[1] is String);
        asyncEnd();
     }
  );

  Isolate.spawn(entryPoint, "hello", onError:errorPort.sendPort);
}
