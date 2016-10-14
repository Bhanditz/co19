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
/**
 * after web-platform-tests/html/semantics/tabular-data/attributes-common-to-td-and-th-elements/cellIndex.html * @assertion
 * @assertion
 * 
 * @description HTMLTableCellElement.cellIndex
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

void main() {
  
  test(() {
    var th = document.createElement("th") as TableCellElement;
    assert_equals(th.cellIndex, -1);
    var td = document.createElement("td") as TableCellElement;
    assert_equals(td.cellIndex, -1);
  }, "For cells without a parent, cellIndex should be -1.");
  
  test(() {
    var table = document.createElement("table") as TableElement;
    var th = table.append(document.createElement("th")) as TableCellElement;
    assert_equals(th.cellIndex, -1);
    var td = table.append(document.createElement("td")) as TableCellElement;
    assert_equals(td.cellIndex, -1);
  }, "For cells whose parent is not a tr, cellIndex should be -1.");
  
  test(() {
    var tr = document.createElementNS("", "tr") as TableRowElement;
    var th = tr.append(document.createElement("th")) as TableCellElement;
    assert_equals(th.cellIndex, -1);
    var td = tr.append(document.createElement("td")) as TableCellElement;
    assert_equals(td.cellIndex, -1);
  }, "For cells whose parent is not a HTML tr, cellIndex should be -1.");
  
  test(() {
    var tr = document.createElement("tr") as TableRowElement;
    var th = tr.append(document.createElement("th")) as TableCellElement;
    assert_equals(th.cellIndex, 0);
    var td = tr.append(document.createElement("td")) as TableCellElement;
    assert_equals(td.cellIndex, 1);
  }, "For cells whose parent is a tr, cellIndex should be the index.");
  
  checkTestFailures();
}
