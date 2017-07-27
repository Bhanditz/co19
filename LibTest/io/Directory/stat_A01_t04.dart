/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<FileStat> stat()
 * Calls the operating system's stat() function on the path of this
 * FileSystemEntity. Identical to FileStat.stat(this.path).
 *
 * Returns a Future<FileStat> object containing the data returned by stat().
 *
 * If the call fails, completes the future with a FileStat object with .type set
 * to FileSystemEntityType.NOT_FOUND and the other fields invalid.
 * @description Checks that this method calls the operating system's stat()
 * function. Test file
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";
import "../../../Utils/file_utils.dart";

main() {
  File file = getTempFileSync();
  Directory dir = new Directory(file.path);
  asyncStart();
  dir.stat().then((FileStat fs) {
    Expect.equals(FileSystemEntityType.FILE, fs.type);
    asyncEnd();
  }).whenComplete(() {
    file.delete(recursive: true);
  });
}
