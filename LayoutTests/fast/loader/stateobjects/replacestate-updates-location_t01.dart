/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description 
 * @needsreview dart issue #21370
 */
import "dart:html";
import "../../../testcommon.dart" as tc;
import "../../../testharness.dart";

void onload (e) {
  window.history.replaceState(null, null, "?foo");
  Expect.equals("?foo", window.location.search);
}

void main() {
  tc.addOnLoadListener(onload);
}
