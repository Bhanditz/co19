/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion RandomAccessFile openSync({FileMode mode: FileMode.READ})
 * Synchronously open the file for random access operations. The result is a
 * RandomAccessFile on which random access operations can be performed. Opened
 * RandomAccessFiles must be closed using the RandomAccessFile.close method.
 *
 * See open for information on the mode argument.
 *
 * Throws a FileSystemException if the operation fails.
 * @description Checks that if file path is wrong then this operation fails
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  File file = getTempFileSync();
  file.writeAsStringSync("Lily was here");
  String path = "/" + file.absolute.path;
  File f = new File(path);
  try {
    Expect.throws(() {
      f.openSync(mode: FileMode.READ);
    }, (e) => e is FileSystemException);
  } finally {
    file.delete();
  }
}
