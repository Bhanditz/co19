/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const mouseDownEvent
 * Static factory designed to expose mousedown events to event handlers
 * that are not necessarily instances of Element.
 * @description Checks that correct events are delivered via the stream
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var type = 'mousedown';
  var x = document.body;

  asyncStart();
  Element.mouseDownEvent.forElement(x).listen((e) {
    Expect.equals(type, e.type);
    asyncEnd();
  });

  var event = new MouseEvent(type);
  x.dispatchEvent(event);
}
