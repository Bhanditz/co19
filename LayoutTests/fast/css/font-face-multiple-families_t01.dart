/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test for rdar://problem/6008098 REGRESSION: Crash at
 * FontFallbackList::fontDataAt().
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
          @font-face {
              font-family: family1, family2;
              src: url(../../resources/Ahem.ttf);
          }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);
  
  document.body.setInnerHtml('''
      <span style="font-family: family1">1</span><span style="font-family: family2">1</span>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.body.offsetTop;
}
