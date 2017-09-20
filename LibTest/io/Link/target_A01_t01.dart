/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<String> target()
 * Gets the target of the link. Returns a future that completes with the path to
 * the target.
 *
 * If the returned target is a relative path, it is relative to the directory
 * containing the link.
 *
 * If the link does not exist, or is not a link, the future completes with a
 * FileSystemException.
 * @description Check that this method returns the target of the link
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";
import "../file_utils.dart";

main() {
  Directory target = getTempDirectorySync();
  Link link = new Link(getTempFilePath());
  link.createSync(target.path);

  asyncStart();
  link.target().then((String path) {
    Expect.equals(target.path, path);
    asyncEnd();
  }).whenComplete(() {
    deleteLinkWithTarget(link);
  });
}
