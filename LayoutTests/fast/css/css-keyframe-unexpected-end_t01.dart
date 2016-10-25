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

main() {
  var index = document.getElementsByTagName("style").length; // skip test framework's ones

  var style = new Element.html('''
      <style>
      @-webkit-keyframes anim {
        from { color: green; }
        to { color: red; }
      /* Missing closing brace */
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  CssStyleSheet ss = document.styleSheets[index];
  var rule = ss.cssRules;
  shouldBe(rule.length, 2);
}
