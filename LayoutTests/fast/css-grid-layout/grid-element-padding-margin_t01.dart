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
import "../../resources/check-layout.dart";
import "pwd.dart";

main() {
  var f = new DocumentFragment.html('''
      <link href="$root/resources/grid.css" rel="stylesheet">
      <style>
      .grid {
          grid-template-columns: 100px;
          grid-template-rows: 50px;
          /* Force the grid element to be shrink-to-fit. */
          position: absolute;
      }

      .padding {
          padding: 20px 10px 30px 50px;
      }

      .border {
          border-style: solid;
          border-color: green;
          border-width: 10px 20px 30px 40px;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>Test that paddings and borders are added to a grid element's size.</p>

      <div class="grid padding" data-expected-height="100" data-expected-width="160"></div>
      <div class="grid padding verticalRL" data-expected-height="150" data-expected-width="110"></div>
      <div class="grid border" data-expected-height="90" data-expected-width="160"></div>
      <div class="grid border verticalRL" data-expected-height="140" data-expected-width="110"></div>
      <div class="grid border padding" data-expected-height="140" data-expected-width="220"></div>
      <div class="grid border padding verticalRL" data-expected-height="190" data-expected-width="170"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  addOnLoadListener((_) {
    checkLayout('.grid');
    asyncEnd();
  });
}
