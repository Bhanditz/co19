/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws [Error] if [other] is [:null:].
 * @description Check that Error is really thrown.
 * @author vasya
 * @reviewer iefremov
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

main() {
  try {
    List a = new List.from(null);
    Expect.fail("Error expected when calling List.from()");
  } on Error catch(ok) {}
}
