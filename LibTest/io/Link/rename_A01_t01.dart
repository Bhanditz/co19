/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<Link> rename(String newPath)
 * Renames this link. Returns a Future<Link> that completes with a Link instance
 * for the renamed link.
 *
 * If newPath identifies an existing link, that link is replaced. If newPath
 * identifies an existing file or directory, the operation fails and the future
 * completes with an exception.
 * @description Checks that this method returns a Future<Link> that completes
 * with a Link instance for the renamed link.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";
import "../../../Utils/file_utils.dart";

main() {
  Link link = getTempLinkSync();
  Link ren = null;
  String target = link.targetSync();
  String newName = getTempFilePath();

  asyncStart();
  link.rename(newName).then((renamed) {
    ren = renamed;
    Expect.equals(newName, renamed.path);
    Expect.equals(target, renamed.targetSync());
    Expect.isTrue(renamed.existsSync());
    Expect.isFalse(link.existsSync());
    asyncEnd();
  }).whenComplete(() {
    if (ren != null) {
      ren.delete();
    }
    if (link.existsSync()) {
      deleteLinkWithTarget(link);
    }
  });
}
