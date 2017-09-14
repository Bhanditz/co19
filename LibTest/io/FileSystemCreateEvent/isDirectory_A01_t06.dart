/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isDirectory
 * final
 * Is true if the event target was a directory.
 * @description Checks that this property returns true if the event target was a
 * directory. Test create directory synchronously
 * @issue 30359
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";
import "../file_utils.dart";

main() {
  Directory dir = getTempDirectorySync();
  Directory target = getTempDirectorySync();
  asyncStart();
  StreamSubscription s = dir.watch().listen((FileSystemEvent event) {
    if (event is FileSystemCreateEvent) {
      Expect.isTrue(event.isDirectory);
      asyncEnd();
    }
  });
  getTempLinkSync(dir, target.path);
  new Future.delayed(new Duration(seconds: 1), () {
    s.cancel().then((_) {
      dir.delete(recursive: true);
      target.delete();
    });
  });
}
