/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int send(List<int> buffer, InternetAddress address, int port)
 * Send a datagram.
 *
 * Returns the number of bytes written. This will always be either the size of
 * buffer or 0.
 *
 * @description Checks that method send returns 0 if buffer length is greater
 * then a maximum length of a received datagram.
 * @author ngl@unipro.ru
 * @issue 31873
 */

import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

main() async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSent = [getList(100000)];
  List<int> bytesWritten = await sendDatagramOnce(producer, toSent, localhost,
      receiver.port);
  if (wasSent(bytesWritten)) {
    Expect.equals(100000, bytesWritten[0]);
  }
}
