/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String readAsStringSync({Encoding encoding: UTF8})
 * Synchronously read the entire file contents as a string using the given
 * Encoding.
 *
 * Throws a FileSystemException if the operation fails.
 * @description Checks that this method synchronously read the entire file
 * contents as a string using the given Encoding. Test not empty file with
 * several lines
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/file_utils.dart";

main() {
  File file = getTempFileSync();
  file.writeAsStringSync("Line 1\nLine 2\rLine3");
  try {
    Expect.equals("Line 1\nLine 2\rLine3", file.readAsStringSync());
  } finally {
    file.delete();
  }
}
