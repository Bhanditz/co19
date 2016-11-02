/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description CSSMediaRule insertRule test
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var style = new Element.html('''
    <style id="style1">
        @media all {
            p { color: red; }
        }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
    <p id="test">This line should be green.</p>
    ''', treeSanitizer: new NullTreeSanitizer());

  CssStyleSheet styleSheet = (document.getElementById('style1') as StyleElement).sheet;
  CssMediaRule mediaRule = styleSheet.cssRules[0];

  mediaRule.insertRule("#test { color: green; }", mediaRule.cssRules.length);

  asyncStart();
  window.onLoad.first.then((_) {
    shouldBe(document.getElementById('test').getComputedStyle().color,
      'rgb(0, 128, 0)');
    asyncEnd();
  });
}
