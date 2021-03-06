/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <link href="$root/resources/grid.css" rel="stylesheet">
      <p>This test checks that inserting a non-RenderBox grid item doesn't make us crash.</p>
      <p>This test has PASS if it didn't crash and you see PASS below.</p>
      <div class="grid">
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  addOnLoadListener((_) {
    dynamic grid = document.getElementsByClassName("grid")[0];
    grid.offsetTop;
    grid.innerHtml = "PASS";
    asyncEnd();
  });
}
