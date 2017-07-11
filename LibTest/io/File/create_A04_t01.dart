/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<File> create({bool recursive: false})
 * Create the file. Returns a Future<File> that completes with the file when it
 * has been created.
 *
 * If recursive is false, the default, the file is created only if all
 * directories in the path exist. If recursive is true, all non-existing path
 * components are created.
 *
 * Existing files are left untouched by create. Calling create on an existing
 * file might fail if there are restrictive permissions on the file.
 *
 * Completes the future with a FileSystemException if the operation fails.
 * @description Checks that future is completed with a FileSystemException if
 * the operation fails
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/file_utils.dart";
import "../../../Utils/async_utils.dart";

main() {
  Directory dir = getTempDirectorySync();
  File file = new File(dir.path);
  asyncStart();
  file.create(recursive: false).then((File created) {
    Expect.fail("FileSystemException is expected");
  }, onError: (e) {
    try {
      Expect.isTrue(e is FileSystemException);
      asyncEnd();
    } finally {
      dir.delete();
    }
  });
}
