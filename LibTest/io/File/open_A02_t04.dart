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
 * @description Checks that this method returns a Future<RandomAccessFile> that
 * completes with the opened random access file. Test WRITE_ONLY mode
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";
import "../../../Utils/async_utils.dart";

main() {
  File file = getTempFileSync();
  file.writeAsBytesSync([0, 1, 2, 3, 4]);
  asyncStart();
  file.open(mode: FileMode.WRITE_ONLY).then((RandomAccessFile raFile) {
    try {
      Expect.equals(0, raFile.lengthSync());
      raFile.writeByteSync(0);
      raFile.writeByteSync(1);
      raFile.writeByteSync(2);
      raFile.writeByteSync(3);
      raFile.setPositionSync(1);
      raFile.writeByteSync(0);
      raFile.setPositionSync(0);
      Expect.throws(() {raFile.readByteSync();},
          (e) => e is FileSystemException);
      asyncEnd();
    } finally {
      raFile.closeSync();
    }
  }).whenComplete(() {
    file.delete();
  });
}
