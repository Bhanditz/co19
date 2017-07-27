/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<String> readAsString({Encoding encoding: UTF8})
 * Read the entire file contents as a string using the given Encoding.
 *
 * Returns a Future<String> that completes with the string once the file
 * contents has been read.
 * @description Checks that this method reads the entire file contents as a
 * string using the given Encoding. Test not empty file with several lines
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/file_utils.dart";
import "../../../Utils/async_utils.dart";

main() {
  File file = getTempFileSync();
  file.writeAsStringSync("Line 1\nLine 2\rLine3");
  asyncStart();
  file.readAsString().then((data) {
    Expect.equals("Line 1\nLine 2\rLine3", data);
    asyncEnd();
  }).whenComplete(() {
    file.delete();
  });
}
