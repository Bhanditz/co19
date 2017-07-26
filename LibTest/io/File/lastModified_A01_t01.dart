/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<DateTime> lastModified()
 * Get the last-modified time of the file.
 *
 * Returns the date and time when the file was last modified, if the information
 * is available.
 *
 * Throws a FileSystemException if the operation fails.
 * @description Checks that this method returns the last-modified time of the
 * file.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/file_utils.dart";
import "../../../Utils/async_utils.dart";

main() {
  File file = getTempFileSync();
  asyncStart();
  file.lastModified().then((DateTime date) {
    Expect.isNotNull(date);
    Expect.isTrue(date.difference(new DateTime.now()).inSeconds <
        ALLOWED_DIFF_IN_SECONDS);
    asyncEnd();
  }).whenComplete(() {
    file.delete();
  });
}
