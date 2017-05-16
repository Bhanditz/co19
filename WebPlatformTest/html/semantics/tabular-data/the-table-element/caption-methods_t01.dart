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
 * after web-platform-tests/html/semantics/tabular-data/the-table-element/caption-methods.html
 * @assertion
 *  <link rel="help" href="http://www.w3.org/TR/html5/tabular-data.html#the-table-element" />
 *  <link rel="help" href="http://www.w3.org/TR/html5/tabular-data.html#dom-table-createcaption" />
 *  <link rel="help" href="http://www.w3.org/TR/html5/tabular-data.html#dom-table-deletecaption" />
 * @description Creating and deleting captions
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL = r'''
    <table id="table1" style="display:none">
        <caption id="caption1">caption</caption>
        <tr>
            <td>cell</td>
            <td>cell</td>
        </tr>
    </table>
    <table id="table2" style="display:none">
        <tr>
            <td>cell</td>
            <td>cell</td>
        </tr>
    </table>
    <table id="table3" style="display:none">
        <caption id="caption3">caption 3</caption>
        <tr>
            <td>cell</td>
            <td>cell</td>
        </tr>
    </table>
''';

void main() {
    document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);
    
	test( () {
    TableElement table1 = document.getElementById('table1') as TableElement;
    TableCaptionElement testCaption = table1.createCaption();
    TableCaptionElement table1FirstCaption = table1.caption;
		assert_equals(testCaption, table1FirstCaption);
	}, "createCaption method returns the first caption element child of the table");
	
	test( () {
    TableElement table2 = document.getElementById('table2') as TableElement;
    dynamic test2Caption = table2.createCaption();
		Node table2FirstNode = table2.firstChild;
		assert_true(test2Caption is TableCaptionElement);
		assert_equals(table2FirstNode, test2Caption);
	}, "createCaption method creates a new caption and inserts it as the first node of the table element");
	
	test( () {
    TableElement table3 = document.getElementById('table3') as TableElement;
		assert_equals(table3.caption.text, "caption 3");
    table3.deleteCaption();
		assert_equals(table3.caption, null);
	}, "deleteCaption method removes the first caption element child of the table element");
  
    checkTestFailures();
}
