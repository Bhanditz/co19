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
 * after web-platform-tests/html/semantics/forms/the-input-element/range.html
 * @assertion
 * http://www.w3.org/TR/html5/the-input-element.html#the-input-element
 * @description Input Range
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
    <h1>Input Range</h1>
    <div style="display:none">
      <input type="range" id="range_basic" min=0 max=5 />
      <input type="range" id="value_smaller_than_min" min=0 max=5 value=-10 />
      <input type="range" id="value_larger_than_max" min=0 max=5 value=7 />
      <input type="range" id="empty_attributes" />
      <input type="range" id="value_not_specified" min=2 max=6 />
      <input type="range" id="control_step_mismatch" min=0 max=7 step=2 />
      <input type="range" id="max_smaller_than_min" min=2 max=-3 />
      <input type="range" id="default_step_scale_factor_1" min=5 max=12.6 value=6.7 />
      <input type="range" id="default_step_scale_factor_2" min=5.3 max=12 value=6.7 />
      <input type="range" id="default_step_scale_factor_3"min=5 max=12.6 step=0.5 value=6.7 />
      <input type="range" id="float_step_scale_factor" min=5.3 max=12 step=0.5 value=6.7 />
      <input type="range" id="stepup" min=3 max=14 value=6 step=3 />
      <input type="range" id="stepdown" min=3 max=11 value=9 step=3 />
      <input type="range" id="stepup_beyond_max" min=3 max=14 value=9 step=3 />
      <input type="range" id="stepdown_beyond_min" min=3 max=11 value=6 step=3 />
      <input type="range" id="illegal_min_and_max" min="ab" max="f" />
      <input type="range" id="illegal_value_and_step" min=0 max=5 value="ppp" step="xyz" />
    </div>
''';

InputElement getInputElement(String id) => document.getElementById(id);

void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);
      
      test(
        () {
          assert_equals(getInputElement('range_basic').type, "range");
        },
        "range type support on input element",
        {
          "help" : "http://www.w3.org/TR/html5/the-input-element.html#dom-input-type"
        }
      );

      test(
        () {
          assert_equals(getInputElement('range_basic').min, "0");
        },
        "min attribute support on input element",
        {
          "help" : "http://www.w3.org/TR/html5/the-input-element.html#dom-input-min"
        }
      );

      test(
        () {
          assert_equals(getInputElement('range_basic').max, "5");
        },
        "max attribute support on input element", 
        {
          "help" : "http://www.w3.org/TR/html5/the-input-element.html#dom-input-max"
        }
      );

      // HTML5 spec says the default vaules of min and max attributes are 0 and 100 respectively,
      // however, Chrome, Opera and Firefox would not give any default value at all...
      test(
        () {
          assert_equals(getInputElement('illegal_min_and_max').min, "0");
        },
        "Illegal value of min attribute",
        {
          "help" : "http://www.w3.org/TR/html5/forms.html#range-state-(type=range)"
        }
      );

      test(
        () {
          assert_equals(getInputElement('illegal_min_and_max').max, "100");
        },
        "Illegal value of max attribute", 
        { "help" : "http://www.w3.org/TR/html5/forms.html#range-state-(type=range)" }
      );

      test(
        () {
          assert_equals(getInputElement('illegal_value_and_step').value, "3");
        },
        "Converting an illegal string to the default value",
        {
          "help" : "http://www.w3.org/TR/html5/forms.html#range-state-(type=range)"
        }
      );

      test(
        () {
          assert_equals(getInputElement('illegal_value_and_step').step, "1");
        },
        "Converting an illegal string to the default step",
        { "help" : "http://www.w3.org/TR/html5/forms.html#range-state-(type=range)" }
      );

      test(
        () {
          assert_equals(getInputElement('value_smaller_than_min').value, "0");
        }, 
        "the value is set to min when a smaller value than min attribute is given", 
        {
          "help" : "http://www.w3.org/TR/html5/forms.html#range-state-(type=range)"
        }
      );

      test(
        () {
          assert_equals(getInputElement('value_larger_than_max').value, "5");
        },
        "the value is set to max when a larger value than max attribute is given",
        {
          "help" : "http://www.w3.org/TR/html5/forms.html#range-state-(type=range)"
        }
      );

      test(
        () {
          assert_equals(getInputElement('empty_attributes').min, "0");
        },
        "default value of min attribute in input type=range",
        { "help" : "http://www.w3.org/TR/html5/the-input-element.html#dom-input-min" }
      );

      test(
        () {
          assert_equals(getInputElement('empty_attributes').max, "100");
        },
        "default value of max attribute in input type=range", 
        {
          "help" : "http://www.w3.org/TR/html5/the-input-element.html#dom-input-max"
        }
      );

      test(
        () {
          assert_equals(getInputElement('value_not_specified').value, "4");
        },
        "default value when min and max attributes are given (= min plus half the difference between min and max)",
        {
          "help" : "http://www.w3.org/TR/html5/forms.html#range-state-(type=range)"
        }
      );

      test(
        () {
          assert_equals(getInputElement('control_step_mismatch').value, "4");
        },
        "default value with step control when both min and max attributes are given",
        {
          "help" : "http://www.w3.org/TR/html5/forms.html#range-state-(type=range)"
        }
      );

      // Chrome would result in different value out of the range between min and max. Why?
      test(
        () {
          assert_equals(getInputElement('max_smaller_than_min').value, "2");
        },
        "default value when both min and max attributes are given, while min > max",
        {
          "help" : "http://www.w3.org/TR/html5/forms.html#range-state-(type=range)" 
        }
      );

      test(
        () {
          assert_equals(getInputElement('default_step_scale_factor_1').value, "7");
        },
        "The default step scale factor is 1, unless min attribute has non-integer value",
        {
          "help" : "http://www.w3.org/TR/html5/forms.html#range-state-(type=range)"
        }
      );

      test(
        () {
          assert_equals(getInputElement('default_step_scale_factor_2').value, "6.3");
        },
        "Step scale factor behavior when min attribute has integer value but max attribute is non-integer ",
        {
          "help" : "http://www.w3.org/TR/html5/forms.html#range-state-(type=range)" }
      );

      test(
        () {
          assert_equals(getInputElement('default_step_scale_factor_3').step, "1");
        },
        "The default scale factor is 1 even if step attribute is explicitly set to non-integer value, unless min attribute has non-integer value",
        {
          "help" : "http://www.w3.org/TR/html5/forms.html#range-state-(type=range)" 
        }
      );

      test(
        () {
          assert_equals(getInputElement('float_step_scale_factor').value, "6.8");
        },
        "Solving the step mismatch",
        {
          "help" : "http://www.w3.org/TR/html5/forms.html#range-state-(type=range)"
        }
      );

      // Firefox Nightly (24.0a1) would result in the possible maximum value in this range... (i.e. 12)
      test(
        () {
          var e = getInputElement('stepup');
          e.stepUp();
          assert_equals(e.value, "9");
        },
        "Performing stepUp()",
        {
          "help" : "http://www.w3.org/html/wg/drafts/html/master/forms.html#dom-input-stepup"
        }
      );

      // Firefox Nightly (24.0a1) would result in the possible minimum value in this range... (i.e. 3)
      test(
        () {
          var e = getInputElement('stepdown');
          e.stepDown();
          assert_equals(e.value, "6");
        },
        "Performing stepDown()",
        {
          "help" : "http://www.w3.org/html/wg/drafts/html/master/forms.html#dom-input-stepdown"
        }
      );

      // Chrome and Opera would throw DOM Exception 11 (InvalidStateError)
      // Firefox Nightly gives the correct result
      test(
        () {
          var e = getInputElement('stepup_beyond_max');
          e.stepUp(2);
          assert_equals(e.value, "12");
        },
        "Performing stepUp() beyond the value of the max attribute",
        {
          "help" : "http://www.w3.org/html/wg/drafts/html/master/forms.html#dom-input-stepup"
        }
      );

      // Chrome and Opera would throw DOM Exception 11 (InvalidStateError)
      // Firefox Nightly gives the correct result
      test(
        () {
          var e = getInputElement('stepdown_beyond_min');
          e.stepDown(2);
          assert_equals(e.value, "3");
        }, "Performing stepDown() beyond the value of the min attribute", {
          "help" : "http://www.w3.org/html/wg/drafts/html/master/forms.html#dom-input-stepdown"
        }
      );

  checkTestFailures();
}
