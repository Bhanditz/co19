/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Completer.sync()
 * Completes the future synchronously.
 * @description Checks that [Completer] creates an object of type Completer
 * which have all methods of Completer interface.
 * @author msyabro
 * @reviewer kaigorodov
 */

import "dart:async";
import "../../../Utils/expect.dart";

const cv="done";

main() {
  Completer completer = new Completer.sync();
  Future f=completer.future;
  var value;
  f.then((v){value=v;});
  completer.complete(cv);
  Expect.identical(cv, value);
}