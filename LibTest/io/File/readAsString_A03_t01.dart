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
 * @description Checks that future completes with a FileSystemException if the
 * operation fails
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/file_utils.dart";
import "../../../Utils/async_utils.dart";

main() {
  File file = getTempFileSync();
  file.deleteSync();
  asyncStart();
  file.readAsString().then((data) {
    Expect.fail("FileSystemException expected");
  }, onError: (e) {
    Expect.isTrue(e is FileSystemException);
    asyncEnd();
  });
}
