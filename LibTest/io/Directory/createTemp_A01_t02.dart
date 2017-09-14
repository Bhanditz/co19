/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<Directory> createTemp([String prefix])
 * Creates a temporary directory in this directory. Additional random characters
 * are appended to prefix to produce a unique directory name. If prefix is
 * missing or null, the empty string is used for prefix.
 *
 * Returns a Future<Directory> that completes with the newly created temporary
 * directory.
 * @description Checks that this method creates a temporary directory in this
 * directory. Check prefix parameter
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";
import "../../../Utils/async_utils.dart";

main() {
  asyncStart();
  Directory parent = getTempDirectorySync();
  parent.createTemp("co19").then((dir) {
    Expect.equals(parent.absolute.path, dir.parent.absolute.path);
    Expect.isTrue(dir.path
        .startsWith("co19", (dir.parent.path + Platform.pathSeparator).length));
    Expect.isTrue(dir.existsSync());
    asyncEnd();
  }).whenComplete(() {
    parent.delete(recursive: true);
  });
}
