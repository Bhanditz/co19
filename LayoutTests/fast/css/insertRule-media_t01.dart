/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test parsing of @media rule using insertRule().
 * http://bugs.webkit.org/show_bug.cgi?id=15986
 * http://dev.w3.org/csswg/cssom/#serialize-a-list-of-media-queries
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  dynamic style = new Element.html('''
      <style type="text/css"></style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  var rule = "@media all and (min-width: 0px) { \n  #greenid { color: green; }\n}";
  var serializedRule = "@media (min-width: 0px) { \n  #greenid { color: green; }\n}";
  shouldBe(style.sheet.insertRule(rule, 0), 0);
  shouldBe(style.sheet.rules[0].cssText, serializedRule);
}

