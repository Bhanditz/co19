/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description
 */
import "dart:html";
import "../../testharness.dart";

const String htmlEL1 = r'''
  <link rel="author" title="Rune Lillesveen" href="mailto:rune@opera.com"/>
  <link rel="help" href="http://www.w3.org/TR/css3-mediaqueries/#color-index"/>
  <style>
    @media (color-index: 0.0) {}
    @media (color-index: -1) {}
    @media (color-index: 2.1) {}
  </style>
''';

const String htmlEL2 = r'''
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    List<CssRule> rules = (document.styleSheets[document.styleSheets.length-1] as CssStyleSheet).cssRules;

    test((){
      assert_equals((rules[0] as CssMediaRule).media.mediaText, "not all");
    }, "(color-index: 0.0) is invalid");

    test((){
      assert_equals((rules[1] as CssMediaRule).media.mediaText, "not all");
    }, "(color-index: -1) is invalid");

    test((){
      assert_equals((rules[2] as CssMediaRule).media.mediaText, "not all");
    }, "(color-index: 2.1) is invalid");

    checkTestFailures();
}
