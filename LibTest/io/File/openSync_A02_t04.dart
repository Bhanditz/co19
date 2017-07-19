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
 * @description Checks that this method open the file for random access
 * operations. Test WRITE_ONLY mode
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/file_utils.dart";
import "../../../Utils/async_utils.dart";

main() {
  File file = getTempFileSync();
  file.writeAsBytesSync([0, 1, 2, 3, 4]);
  RandomAccessFile raFile = file.openSync(mode: FileMode.WRITE_ONLY);
  try {
    Expect.equals(0, raFile.lengthSync());
    raFile.writeByteSync(0);
    raFile.writeByteSync(1);
    raFile.writeByteSync(2);
    raFile.writeByteSync(3);
    raFile.setPositionSync(1);
    raFile.writeByteSync(0);
    raFile.setPositionSync(0);
    Expect.throws(() {raFile.readByteSync();}, (e) => e is FileSystemException);
  } finally {
    raFile.closeSync();
    file.delete();
  }
}
