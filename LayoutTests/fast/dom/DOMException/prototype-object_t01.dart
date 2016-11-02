/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../../Utils/expect.dart";

main() {
  Expect.throws(() {
    // raises a HIERARCHY_REQUEST_ERR
    document.append(document);
  }, (e) => e is DomException && e.name == DomException.HIERARCHY_REQUEST);
}
