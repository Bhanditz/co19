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
 * after web-platform-tests/html/syntax/parsing/math-parse01.html
 * @assertion
 * 
 * @description  math in html: parsing
 */
import 'dart:html';
import "../../../Utils/expectWeb.dart";

const String htmlEL = r'''
<div id="log" style="display:block"></div>

<div style="display:none">
<div><math id="m1"><mtext/></math></div>
<div id="d1"><math><mrow/><mi/></math></div>
<div id="d2"><math><mrow><mrow><mn>1</mn></mrow><mi>a</mi></mrow></math></div>
<div id="d3">&lang;&rang;</div>
<div id="d4">&Kopf;</div>
<div id="d5"><math><semantics><mi>a</mi><annotation-xml><foo/><bar/></annotation-xml></semantics></math></div>
<div id="d6"><math><semantics><mi>a</mi><annotation-xml encoding="text/html"><div></div></annotation-xml></semantics><mn/></math>
</div>
''';

void main() {
    document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);
  
    test(() {
      assert_equals(document.getElementById("m1"),document.getElementsByTagName("math")[0]);
    },"The id attribute should be recognised on math elements");
    
    test(() {;
      assert_equals(document.getElementById("d1").firstChild.nodeName,"math");
    },"The node name should be math");
    
    test(() {
      Element firstChild=document.getElementById("d1").firstChild;
      assert_equals(firstChild.namespaceUri ,"http://www.w3.org/1998/Math/MathML");
    },"math should be in MathML Namespace");
    
    test(() {
      assert_equals(document.getElementById("d1").firstChild.childNodes.length ,2);
    },"Math has 2 children (empty tag syntax)");
    
    test(() {
      assert_equals(document.getElementById("d2").firstChild.childNodes.length ,1);
    },"Nested mrow elements should be parsed correctly");
    
    test(() {
      assert_equals(document.getElementById("d3").firstChild.nodeValue ,"\u27E8\u27E9");
    },"Testing rang and lang entity code points");

    /*  
    test(() {
      assert_equals(document.getElementById("d4").firstChild.nodeValue ,r"\uD835\uDD42");
 //                                                                               ^ invalid code point
    },"Testing Kopf (Plane 1) entity code point");
    */
    
    test(() {
      assert_equals(document.getElementById("d5").firstChild.firstChild.childNodes[1].childNodes.length ,2);
    },"Empty element tags in annotation-xml parsed as per XML.");
    
    test(() {
      assert_equals(document.getElementById("d6").firstChild.childNodes.length ,2);
    },"html tags allowed in annotation-xml/@encoding='text/html'.");
    
    checkTestFailures();
}
