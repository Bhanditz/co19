/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<RandomAccessFile> open({FileMode mode: FileMode.READ})
 * Open the file for random access operations. Returns a
 * Future<RandomAccessFile> that completes with the opened random access file.
 * RandomAccessFiles must be closed using the RandomAccessFile.close method.
 *
 * Files can be opened in three modes:
 * FileMode.READ: open the file for reading.
 * FileMode.WRITE: open the file for both reading and writing and truncate the
 * file to length zero. If the file does not exist the file is created.
 *
 * FileMode.APPEND: same as FileMode.WRITE except that the file is not
 * truncated.
 * @description Checks that if file path is wrong then this operation fails
 * @author sgrekhov@unipro.ru
 */

import "dart:io";
import "../file_utils.dart";
import "../../../Utils/expect.dart";

main() {
  File f = getTempFileSync();
  String path = "/" + f.absolute.path; // wrong file path
  File file = new File(path);

  file.open(mode: FileMode.READ).then((RandomAccessFile raf) {
    raf.closeSync();
    f.delete();
    Expect.fail("Error expected");
  }, onError: (_) {
    f.delete();
  });
}
