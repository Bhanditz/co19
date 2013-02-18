/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Sets up a callback function for receiving
 * pending or future messages on this receive port.
 * @description Tries to pass non-function object as [callback].
 * @author msyabro
 * @reviewer kaigorodov
 * @needsreview Undocumented Issue 1313
 */
import "../../../Utils/expect.dart";

import "dart:isolate";

void main() {
    ReceivePort rPort = new ReceivePort();
    SendPort sPort = rPort.toSendPort();
    bool err = false;
    try {
      rPort.receive(null);
      sPort.send(2, sPort);
    } catch(e) {
      err = true;
    } finally {
      rPort.close();
    }
    Expect.isTrue(err, "Some error expected");
}
