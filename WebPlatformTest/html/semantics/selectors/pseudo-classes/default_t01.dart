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
 * after web-platform-tests/html/semantics/selectors/pseudo-classes/default.html
 * @assertion
 * http://www.w3.org/html/wg/drafts/html/master/#pseudo-classes
 * @description Selector: pseudo-classes (:default)
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";
import "utils.dart";

const String htmlEL = r'''
<form>
  <button id=button1 type=button>button1</button>
  <button id=button2 type=submit>button2</button>
</form>
<form>
  <button id=button3 type=reset>button3</button>
  <button id=button4>button4</button>
</form>
<button id=button5 type=submit>button5</button>
<form id=form1>
  <input type=text id=input1>
</form>
<input type=text id=input2 form=form1>
<form>
  <input type=submit id=input3>
  <input type=submit id=input4>
</form>
<form>
  <input type=image id=input5>
  <input type=image id=input6>
</form>
<form>
  <input type=submit id=input7>
</form>
<input type=checkbox id=checkbox1 checked>
<input type=checkbox id=checkbox2>
<input type=checkbox id=checkbox3 default>
<select id=select1>
 <optgroup label="options" id=optgroup1>
  <option value="option1" id=option1 selected>option1
  <option value="option1" id=option1>option1
</select>
<dialog id="dialog">
  <input type=submit id=input8>
</dialog>
<form>
  <button id=button6 type='invalid'>button6</button>
  <button id=button7>button7</button>
</form>
<form>
  <button id=button8>button8</button>
  <button id=button9>button9</button>
</form>
''';

void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);
  testSelector(
      ":default",
      [
        "button2",
        "button4",
        "input3",
        "input5",
        "input7",
        "checkbox1",
        "option1",
        "button6",
        "button8"
      ],
      "':default' matches <button>s that are their form's default button, <input>s of type submit/image that are their form's default button, checked <input>s and selected <option>s");

  ButtonElement button1 = document.getElementById("button1");
  button1.type = "submit"; // change the form's default button
  testSelector(
      ":default",
      [
        "button1",
        "button4",
        "input3",
        "input5",
        "input7",
        "checkbox1",
        "option1",
        "button6",
        "button8"
      ],
      "':default' matches dynamically changed form's default buttons");

  checkTestFailures();
}
