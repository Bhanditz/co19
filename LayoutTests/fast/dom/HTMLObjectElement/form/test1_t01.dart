/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test attempts to access an HTMLObjectElement's form 
 * property. The first test accesses the form property of an object which is 
 * inside of a form.  The second test accesses the form property of an object 
 * which is not inside of a form
 */
import "dart:html";
import "../../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <form id="form">
        <object id="objectInsideForm">
        </object>
    </form>
    
    <object id="objectNotInsideForm">
    </object>
    ''', treeSanitizer: new NullTreeSanitizer());
            
  ObjectElement objectInsideForm = document.getElementById("objectInsideForm");
  ObjectElement objectNotInsideForm =
      document.getElementById("objectNotInsideForm");

  FormElement form = document.getElementById("form");

  shouldBe(objectInsideForm.form, form);
  shouldBeNull(objectNotInsideForm.form);
}
