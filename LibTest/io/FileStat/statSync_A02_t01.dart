/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion FileStat statSync(String path)
 * Calls the operating system's stat() function on path. Returns a FileStat
 * object containing the data returned by stat(). If the call fails, returns a
 * FileStat object with .type set to FileSystemEntityType.NOT_FOUND and the
 * other fields invalid.
 * @description Checks that if the call fails, returns a FileStat object with
 * .type set to FileSystemEntityType.NOT_FOUND and the other fields invalid.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/file_utils.dart";

main() {
  File file = new File(getTempFilePath());
  FileStat fs = FileStat.statSync(file.path);
  Expect.equals(FileSystemEntityType.NOT_FOUND, fs.type);
  Expect.equals(-1, fs.size);
  Expect.equals(0, fs.mode);
  Expect.isNull(fs.accessed);
  Expect.isNull(fs.changed);
  Expect.isNull(fs.modified);
}
