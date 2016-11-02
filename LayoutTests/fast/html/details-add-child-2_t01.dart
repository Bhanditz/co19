/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

Element createNewElement(String tag, String id, String text) {
    var result = document.createElement(tag);
    result.setAttribute('id', id);
    result.setInnerHtml(text, treeSanitizer: new NullTreeSanitizer());
    return result;
}
  
String getWeight(Element x) {
  return x.getComputedStyle().getPropertyValue('font-weight');
}

main() {
  BodyElement body = document.body;

  body.setInnerHtml('''
    <details id="detail" open>
        <summary id="summary">summary </summary>
    </details>
    ''', treeSanitizer: new NullTreeSanitizer());

    var details = document.getElementById("detail");
    details.insertBefore(
        createNewElement("b", "toadd", "should have bold test"),
        details.firstChild);

    Expect.equals('bold', getWeight(document.getElementById("toadd")));
}

