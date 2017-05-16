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
 * after web-platform-tests/html/semantics/forms/the-input-element/month.html
 * @assertion
    <link rel="help" href="http://www.w3.org/html/wg/drafts/html/CR/infrastructure.html#months">
    <link rel="help" href="http://www.w3.org/html/wg/drafts/html/CR/forms.html#month-state-(type=month)">
 * @description Inputs Month
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
    <h1>Inputs Month</h1>
    <div style="display: none">
      <input id="valid" type="month" value="2011-11" min="2011-01" max="2011-12" />
      <input id="too_small_value" type="month" value="1999-01" min="2011-01" max="2011-12"/>
      <input id="too_large_value" type="month" value="2099-01" min="2011-01" max="2011-12"/>
      <input id="invalid_value" type="month" value="invalid-month" min="2011-01" max="2011-12"/>
      <input id="invalid_min" type="month" value="2011-01" min="invalid_min" max="2011-12"/>
      <input id="invalid_max" type="month" value="2011-01" min="2011-01" max="invalid_max"/>
      <input id="min_larger_than_max" type="month" value="2011-01" min="2099-01" max="2011-12"/>
      <input id="value_can_be_empty_string" type="month" value="2013-06" />
      <input id="invalid_value_with_two_digits_year" type="month" value="13-06" />
      <input id="invalid_value_is_set" type="month" />
      <input id="invalid_value_is_set_to_valid_value" type="month" value="2013-05" />
      <input id="step_attribute_is_invalid_value" type="month" value="2013-06" step="invalid_step_value" />
      <input id="invalid_month_too_high" type="month" value="2013-13" />
      <input id="invalid_month_too_low" type="month" value="2013-00" />
    </div>
''';

InputElement getInputElement(String id) => document.getElementById(id);

void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);
  
  test(() {
     assert_equals(getInputElement("valid").type, "month");
   }, "month type support on input element");

  test(() {
     assert_equals(getInputElement("valid").value, "2011-11");
     assert_equals(getInputElement("too_small_value").value, "2011-01");
     assert_equals(getInputElement("too_large_value").value, "2011-12");
   }, "The value attribute, if specified and not empty, must have a value that is a valid month string");

  test(() {
     assert_equals(getInputElement("valid").min, "2011-01");
     assert_equals(getInputElement("invalid_min").min, "");
   }, "The min attribute, if specified, must have a value that is a valid month string.");

  test(() {
     assert_equals(getInputElement("valid").max, "2011-12");
     assert_equals(getInputElement("min_larger_than_max").max, "2099-01");
     assert_equals(getInputElement("invalid_max").max, "");
   }, "The max attribute, if specified, must have a value that is a valid month string");

  test(() {
     assert_equals(getInputElement("invalid_value").value, "");
   }, "User agents must not allow the user to set the value to a non-empty string that is not a valid month string.");

  test(() {
     getInputElement("value_can_be_empty_string").value = "";
     assert_equals(getInputElement("value_can_be_empty_string").value, "");
   }, "Month value can be empty string.");

  test(() {
     assert_equals(getInputElement("invalid_value_with_two_digits_year").value, "");
   }, "When value attribute has two digits year value, the value,which is invalid, must return empty string.");

  test(() {
     getInputElement("invalid_value_is_set").value = "invalid value";
     assert_equals(getInputElement("invalid_value_is_set").value, "");
   }, "When value is set with invalid value, the value must return empty string.");

  test(() {
     getInputElement("invalid_value_is_set_to_valid_value").value = "invalid value";
     assert_equals(getInputElement("invalid_value_is_set_to_valid_value").value, "2013-05");
   }, "When value is given invalid value to non-empty valid string, the value must be same as before.");

  test(() {
     getInputElement("step_attribute_is_invalid_value").stepUp();
     assert_equals(getInputElement("step_attribute_is_invalid_value").value, "2013-07");
   }, "When step attribute is given invalid value, it must ignore the invalid value and use defaul value instead.");

  test(() {
     assert_equals(getInputElement("invalid_month_too_high").value, "");
   }, "Month should be <= 13: If the value of the element is not a valid month string, then set it to the empty string instead.");

  test(() {
     assert_equals(getInputElement("invalid_month_too_low").value, "");
   }, "Month should be > 0: If the value of the element is not a valid month string, then set it to the empty string instead.>");

  checkTestFailures();
}
