/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> isFile(String path)
 * Checks if type(path) returns FileSystemEntityType.FILE.
 * @description Checks that this property returns true if type(path) returns
 * FileSystemEntityType.FILE. Test Directory
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";
import "../../../Utils/file_utils.dart";

main() {
  Directory dir = getTempDirectorySync();
  asyncStart();
  FileSystemEntity.isFile(dir.path).then((result) {
    Expect.isFalse(result);
    FileSystemEntity.type(dir.path).then((t) {
      Expect.equals(t, FileSystemEntityType.DIRECTORY);
      asyncEnd();
    }).whenComplete(() {
      dir.delete();
    });
  });
}
