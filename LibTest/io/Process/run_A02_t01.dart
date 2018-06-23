/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Future<ProcessResult> run(
 *     String executable,
 *     List<String> arguments, {
 *     String workingDirectory,
 *     Map<String, String> environment,
 *     bool includeParentEnvironment: true,
 *     bool runInShell: false,
 *     Encoding stdoutEncoding: SYSTEM_ENCODING,
 *     Encoding stderrEncoding: SYSTEM_ENCODING
 * })
 * ...
 * The encoding used for decoding stdout and stderr into text is controlled
 * through stdoutEncoding and stderrEncoding. The default encoding is
 * SYSTEM_ENCODING. If null is used no decoding will happen and the
 * ProcessResult will hold binary data.
 *
 * @description Checks that if [stdoutEncoding] is null no decoding is happen
 * and the ProcessResult.stdout holds binary data.
 * @author ngl@unipro.ru
 * @issue 30945
 */
import "dart:convert";
import "dart:io";
import "../../../Utils/expect.dart";

String command;
List<String> args;

void setCommand() {
  if (Platform.isLinux) {
    command = 'echo';
    args = ['abc'];
  }
  if (Platform.isWindows) {
    command = 'dart';
    args = ['--version'];
  }
}

main() {
  setCommand();
  asyncStart();
  Process.run(command, args, stdoutEncoding: null).then((ProcessResult results) {
    Expect.equals(0, results.exitCode);
    Expect.isTrue(results.stdout is List);
    Expect.isTrue(results.stderr is String);
    if (Platform.isWindows) {
      Expect.isTrue(results.stderr.indexOf(Platform.version) > -1);
      Expect.equals(0, results.stdout.length);
    } else {
      Utf8Decoder decoder = new Utf8Decoder();
      String decoded = decoder.convert(results.stdout);
      Expect.isTrue(decoded.substring(0, 3) == "abc");
      Expect.equals("", results.stderr);
    }
    asyncEnd();
  });
}
