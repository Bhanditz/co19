/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
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
 * @assertion Clearing the stack back to a table body context must be aborted
 * if the current node is template
 */

import '../../testcommon.dart';

doTest([doc, tagToTest, templateInnerHTML, id, tagName, bodiesNum, footerIsNull,
    footerId, headerIsNull, headerId]) {

  doc.body.setInnerHtml('' +
      '<table id="tbl">' +
      '<' + tagToTest + '>' +
      '<template id="tmpl1">' +
      // When parser meets <tr>, </tbody>, </tfoot>, </thead>, <caption>, <col>,
      // <colgroup>, <tbody>, <tfoot>, <thead>, </table>
      // stack must be cleared back to table body context. But <template> tag should
      // abort this
      templateInnerHTML +
      '</template>' +
      '<tr id="tr">' +
      '<td id="td">' +
      '</td>' +
      '</tr>' +
      '</' + tagToTest + '>' +
      '</table>',
      treeSanitizer: new NullTreeSanitizer());

  var table = doc.querySelector('#tbl');
  var tr = doc.querySelector('#tr');
  var td = doc.querySelector('#td');
  var template = doc.querySelector('#tmpl1');

  assert_equals(table.rows.length, 1, 'Wrong number of table rows');
  assert_equals(table.rows[0].cells.length, 1, 'Wrong number of table cells');
  if (id != null) {
    assert_not_equals(template.content.querySelector('#' + id), null,
        'Element should present in the template content');
  }
  if (tagName != null) {
    assert_equals(template.content.querySelector('#' + id).tagName, tagName,
        'Wrong element in the template content');
  }

  assert_equals(table.caption, null, 'Table should have no caption');

  if (bodiesNum) {
    assert_equals(table.tBodies.length, bodiesNum, 'Table should have '
        + bodiesNum + ' body');
  }
  if (footerIsNull) {
    assert_equals(table.tFoot, null, 'Table should have no footer');
  }
  if (footerId) {
    assert_not_equals(table.tFoot.id, footerId,
        'Table should have no footer with id="' + footerId + '"');
  }
  if (headerIsNull) {
    assert_equals(table.tHead, null, 'Table should have no header');
  }
  if (headerId) {
    assert_not_equals(table.tHead.id, headerId,
        'Table should have no header with id="' + headerId + '"');
  }
}

main() {
  var doc = newHTMLDocument();

  var parameters = [
    ['Clearing stack back to a table body context. Test <tr> in <tbody>',
    doc, 'tbody', '<tr id="tr1"><td>Cell content</td></tr>', 'tr1', 'TR'],

    ['Clearing stack back to a table body context. Test <tr> in <thead>',
    doc, 'thead', '<tr id="tr2"><td>Cell content</td></tr>', 'tr2', 'TR'],

    ['Clearing stack back to a table body context. Test <tr> in <tfoot>',
    doc, 'tfoot', '<tr id="tr3"><td>Cell content</td></tr>', 'tr3', 'TR'],

    ['Clearing stack back to a table body context. Test </tbody>',
    doc, 'tbody', '</tbody>', null, null],

    ['Clearing stack back to a table body context. Test </thead>',
    doc, 'thead', '</thead>', null, null],

    ['Clearing stack back to a table body context. Test </tfoot>',
    doc, 'tfoot', '</tfoot>', null, null],

    ['Clearing stack back to a table body context. Test <caption> in <tbody>',
    doc, 'tbody', '<caption id="caption1">Table Caption</caption>', 'caption1', 'CAPTION'],

    ['Clearing stack back to a table body context. Test <caption> in <tfoot>',
    doc, 'tfoot', '<caption id="caption2">Table Caption</caption>', 'caption2', 'CAPTION'],

    ['Clearing stack back to a table body context. Test <caption> in <thead>',
    doc, 'thead', '<caption id="caption3">Table Caption</caption>', 'caption3', 'CAPTION'],

    ['Clearing stack back to a table body context. Test <col> in <tbody>',
    doc, 'tbody', '<col id="col1" width="150"/>', 'col1', 'COL'],

    ['Clearing stack back to a table body context. Test <col> in <tfoot>',
    doc, 'tfoot', '<col id="col2" width="150"/>', 'col2', 'COL'],

    ['Clearing stack back to a table body context. Test <col> in <thead>',
    doc, 'thead', '<col id="col3" width="150"/>', 'col3', 'COL'],

    ['Clearing stack back to a table body context. Test <colgroup> in <tbody>',
    doc, 'tbody', '<colgroup id="colgroup1" width="150"/>', 'colgroup1', 'COLGROUP'],

    ['Clearing stack back to a table body context. Test <colgroup> in <tfoot>',
    doc, 'tfoot', '<colgroup id="colgroup2" width="150"/>', 'colgroup2', 'COLGROUP'],

    ['Clearing stack back to a table body context. Test <colgroup> in <thead>',
    doc, 'thead', '<colgroup id="colgroup3" width="150"/>', 'colgroup3', 'COLGROUP'],

    ['Clearing stack back to a table body context. Test <tbody> in <tbody>',
    doc, 'tbody', '<tbody id="tbody1"></tbody>', 'tbody1', 'TBODY', 1],

    ['Clearing stack back to a table body context. Test <tbody> in <tfoot>',
    doc, 'tfoot', '<tbody id="tbody2"></tbody>', 'tbody2', 'TBODY', 0],

    ['Clearing stack back to a table body context. Test <tbody> in <thead>',
    doc, 'thead', '<tbody id="tbody3"></tbody>', 'tbody3', 'TBODY', 0],

    ['Clearing stack back to a table body context. Test <tfoot> in <tbody>',
    doc, 'tbody', '<tfoot id="tfoot1"></tfoot>', 'tfoot1', 'TFOOT', null, true],

    ['Clearing stack back to a table body context. Test <tfoot> in <tfoot>',
    doc, 'tfoot', '<tfoot id="tfoot2"></tfoot>', 'tfoot2', 'TFOOT', null, false, 'tfoot2'],

    ['Clearing stack back to a table body context. Test <tfoot> in <thead>',
    doc, 'thead', '<tfoot id="tfoot3"></tfoot>', 'tfoot3', 'TFOOT', null, true],

    ['Clearing stack back to a table body context. Test <thead> in <tbody>',
    doc, 'tbody', '<thead id="thead1"></thead>', 'thead1', 'THEAD', null, false, null, true],

    ['Clearing stack back to a table body context. Test <thead> in <tfoot>',
    doc, 'tfoot', '<thead id="thead2"></thead>', 'thead2', 'THEAD', null, false, null, true],

    ['Clearing stack back to a table body context. Test <thead> in <thead>',
    doc, 'thead', '<thead id="thead3"></thead>', 'thead3', 'THEAD', null, false, null, false, 'thead3'],

    ['Clearing stack back to a table body context. Test </table> in <tbody>',
    doc, 'tbody', '</table>', null, null, null, false, null, true],

    ['Clearing stack back to a table body context. Test </table> in <tfoot>',
    doc, 'tfoot', '</table>', null, null, null, false, null, true],

    ['Clearing stack back to a table body context. Test </table> in <thead>',
    doc, 'thead', '</table>', null, null],

    ['Clearing stack back to a table body context. Test </tbody> in <thead>',
    doc, 'thead', '</tbody>', null, null],

    ['Clearing stack back to a table body context. Test </tbody> in <tfoot>',
    doc, 'tfoot', '</tbody>', null, null],

    ['Clearing stack back to a table body context. Test </thead> in <tbody>',
    doc, 'tbody', '</thead>', null, null],

    ['Clearing stack back to a table body context. Test </thead> in <tfoot>',
    doc, 'tfoot', '</thead>', null, null],

    ['Clearing stack back to a table body context. Test </tfoot> in <thead>',
    doc, 'thead', '</tfoot>', null, null],

    ['Clearing stack back to a table body context. Test </tfoot> in <tbody>',
    doc, 'tbody', '</tfoot>', null, null]
  ];

  generate_tests(doTest, parameters, 'Clearing stack back to a table body context.');
}
