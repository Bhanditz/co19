/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/*
 * after web-platform-tests/dom/nodes/Document-createElementNS.html
 * <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-document-createelementns">
 *
 * @assertion Document.createElementNS()
 *
 * @description
 * This tests the namespace of elements created by the Document interface's
 * createElement() method.  See bug:
 * https://www.w3.org/Bugs/Public/show_bug.cgi?id=19431
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

var invalidNames = [
    "",
    "1foo",
    "\u0300foo",
    "}foo",
    "f}oo",
    "foo}",
    "\ufffffoo",
    "f\uffffoo",
    "foo\uffff",
    "<foo",
    "foo>",
    "<foo>",
    "f<oo"
  ];

var  invalidNSQNameCombinations = [
    ["", ":foo"],
    ["", "foo:"],
    ["", "foo:foo"],
    ["http://oops/", "xml:foo"],
//    ["http://oops/", "xmlns"], -- extracted into separate test Document-createElementNS_t02.dart
    ["http://oops/", "xmlns:foo"],
    ["http://www.w3.org/2000/xmlns/", "xml:foo"],
    ["http://www.w3.org/2000/xmlns/", "foo:xmlns"]
  ];

void main() {

  invalidNames.forEach((name) {
    test(() {
      assert_throws("InvalidCharacterError", () { document.createElementNS("", name); });
    }, "Invalid Name: " + name);
  });

  invalidNSQNameCombinations.forEach((a) {
    test(() {
      assert_throws("NamespaceError", () { document.createElementNS(a[0], a[1]); });
    }, "Invalid namespace " + a[0] + " and QName " + a[1]);
  });

  checkTestFailures();
}
