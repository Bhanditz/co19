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
 * after web-platform-tests/html/semantics/selectors/pseudo-classes/disabled.html
 * @assertion
 * http://www.w3.org/html/wg/drafts/html/master/#pseudo-classes
 * @description Selector: pseudo-classes (:disabled)
 * @needsreview  Dart issue #19791
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";
import "utils.dart";

const String htmlEL = r'''
<style>
  #input4 {display:none;}
</style>
<div id="log"></div>
<button id=button1 type=submit>button1</button>
<button id=button2 disabled>button2</button>
<input id=input1>
<input id=input2 disabled>
<input id=input3 readonly>
<input id=input4>
<select id=select1>
 <optgroup label="options" id=optgroup1>
  <option value="option1" id=option1 selected>option1
</select>
<select disabled id=select2>
 <optgroup label="options" disabled id=optgroup2>
  <option value="option2" disabled id=option2>option2
</select>
<textarea id=textarea1>textarea1</textarea>
<textarea disabled id=textarea2>textarea2</textarea>
<fieldset id=fieldset1></fieldset>
<fieldset disabled id=fieldset2>
  <legend><input type=checkbox id=club></legend>
  <p><label>Name on card: <input id=clubname required></label></p>
  <p><label>Card number: <input id=clubnum required pattern="[-0-9]+"></label></p>
</fieldset>
<label disabled></label>
<object disabled></object>
<output disabled id=output1></output>
<img disabled/>
<meter disabled></meter>
<progress disabled></progress>
''';

void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);
  testSelector(
      ":disabled",
      [
        "button2",
        "input2",
        "select2",
        "optgroup2",
        "option2",
        "textarea2",
        "fieldset2",
        "clubname",
        "clubnum"
      ]
      //     '[button2, input2, select2, optgroup2, option2, textarea2, fieldset2, clubname, clubnum, ]'
      ,
      "':disabled' should match only disabled elements");

  document.getElementById("button2").attributes.remove("disabled");
  testSelector(
      ":disabled",
      [
        "input2",
        "select2",
        "optgroup2",
        "option2",
        "textarea2",
        "fieldset2",
        "clubname",
        "clubnum"
      ],
      "':disabled' should not match elements whose disabled attribute has been removed");

  document.getElementById("button1").setAttribute("disabled", "disabled");
  testSelector(
      ":disabled",
      [
        "button1",
        "input2",
        "select2",
        "optgroup2",
        "option2",
        "textarea2",
        "fieldset2",
        "clubname",
        "clubnum"
      ],
      "':disabled' should also match elements whose disabled attribute has been set");

  document
      .getElementById("input2")
      .setAttribute("type", "submit"); // change input type to submit
  testSelector(
      ":disabled",
      [
        "button1",
        "input2",
        "select2",
        "optgroup2",
        "option2",
        "textarea2",
        "fieldset2",
        "clubname",
        "clubnum"
      ],
      "':disabled' should also match disabled elements whose type has changed");

  var input = document.createElement("input");
  input.setAttribute("disabled", "disabled");
  testSelector(
      ":disabled",
      [
        "button1",
        "input2",
        "select2",
        "optgroup2",
        "option2",
        "textarea2",
        "fieldset2",
        "clubname",
        "clubnum"
      ],
      "':disabled' should not match elements not in the document");

  checkTestFailures();
}
