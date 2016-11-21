/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This page ensures that <input from="X"> and <label from="X">
 * don't associate with any form elements when there is no <form id="X">.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <p id="description"></p>
      <form id="form">
          <input type="hidden" id="input1" value="value1">
          <input type="hidden" id="input2" value="value2" form="X">
          <label id="label1">label1</label>
          <label id="label2" form="X">label2</label>
      </form>
      ''', treeSanitizer: new NullTreeSanitizer());

  FormElement form = document.getElementById('form') as FormElement;
  InputElement inputShouldHaveForm = document.getElementById('input1') as InputElement;
  InputElement inputShouldNotHaveForm = document.getElementById('input2') as InputElement;
  LabelElement labelShouldHaveForm = document.getElementById('label1') as LabelElement;
  LabelElement labelShouldNotHaveForm = document.getElementById('label2') as LabelElement;

  shouldBe(inputShouldHaveForm.form, form);
  shouldBeNull(inputShouldNotHaveForm.form);
  shouldBe(labelShouldHaveForm.form, form);
  shouldBeNull(labelShouldNotHaveForm.form);
}
