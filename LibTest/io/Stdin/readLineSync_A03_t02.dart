/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String readLineSync({
 *   Encoding encoding: SYSTEM_ENCODING,
 *   bool retainNewlines: false
 *   })
 * The argument [encoding] can be used to changed how the input should be
 * decoded.
 * @description Checks that Latin-1 encoding can be used correctly.
 * correctly.
 * @author iarkh@unipro.ru
 */
import "dart:convert";
import "dart:io";
import "test.lib.dart";
import "../file_utils.dart";

List<int> expected = [1, 2, 3, 128, 129, 200, 254, 255];
String str = LATIN1.decode(expected);

void run_process(String filename, Encoding enc) {
  String res = stdin.readLineSync(encoding : enc);
  File fl = new File(filename);
  fl.openWrite();
  fl.writeAsBytes(res.codeUnits);
}

void run(Process process) { process.stdin.writeln(str); }

main(List<String> args) {
  String filename = Directory.systemTemp.path + Platform.pathSeparator +
      getTempFileName();
  args.length > 0 ? run_process(args[0], LATIN1) : run_main(filename, run, str);
}
