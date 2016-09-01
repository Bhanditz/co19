/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";

main() {
  var style = new Element.html('''
      <style type="text/css">
          .myQuotes { quotes: "WW" "WWWW" "WWW" "WWWWW"; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p id="onlyInBrowser">The texts between the markers should be identical.</p>
      <p>========Marker1========</p>
      <table>
          <tr>
              <td id="testContainer"><q>a<q>b</q>c</q></td>
              <td>1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1</td>
          </tr>
      </table>
      <p>========Marker2========</p>
      <table>
          <tr>
              <td id="reference">WWaWWWbWWWWWcWWWW</td>
              <td>1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1</td>
          </tr>
      </table>
      <p>========Marker3========</p>
      <pre id="console"/>
      ''', treeSanitizer: new NullTreeSanitizer());

  run() {
    document.getElementById("onlyInBrowser").setAttribute("style", "display: none;");
    document.body.setAttribute("class", "myQuotes");
    var testWidth = getComputedStyle(document.getElementById("testContainer"), null).getPropertyValue("width");
    var referenceWidth = getComputedStyle(document.getElementById("reference"), null).getPropertyValue("width");
    // allow 1px error
    testWidth = testWidth.replaceAll("px", "");
    referenceWidth = referenceWidth.replaceAll("px", "");
    int test = double.parse(testWidth).round();
    int reference = double.parse(referenceWidth).round();
    shouldBeApprox(test, reference, 1);
    asyncEnd();
  }

  asyncStart();
  setTimeout(run, 0);
}
