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
 * after web-platform-tests/html/syntax/parsing/Document.getElementsByTagName-foreign-01.html
 * @assertion
 * <link rel="help" href="https://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-document-getelementsbytagname">
 * <link rel="help" href="http://www.whatwg.org/html/#parsing">
 * @description document.getElementsByTagName and foreign parser-inserted elements 
 */
import 'dart:html';
import "../../../Utils/expectWeb.dart";

const String htmlEL = r'''
<div id="test">
<svg>
  <altglyph/>
  <altglyphdef/>
  <altglyphitem/>
  <animatecolor/>
  <animatemotion/>
  <animatetransform/>
  <clippath/>
  <feblend/>
  <fecolormatrix/>
  <fecomponenttransfer/>
  <fecomposite/>
  <feconvolvematrix/>
  <fediffuselighting/>
  <fedisplacementmap/>
  <fedistantlight/>
  <feflood/>
  <fefunca/>
  <fefuncb/>
  <fefuncg/>
  <fefuncr/>
  <fegaussianblur/>
  <feimage/>
  <femerge/>
  <femergenode/>
  <femorphology/>
  <feoffset/>
  <fepointlight/>
  <fespecularlighting/>
  <fespotlight/>
  <fetile/>
  <feturbulence/>
  <foreignobject/>
  <glyphref/>
  <lineargradient/>
  <radialgradient/>
  <textpath/>
  <ALTGLYPH/>
  <ALTGLYPHDEF/>
  <ALTGLYPHITEM/>
  <ANIMATECOLOR/>
  <ANIMATEMOTION/>
  <ANIMATETRANSFORM/>
  <CLIPPATH/>
  <FEBLEND/>
  <FECOLORMATRIX/>
  <FECOMPONENTTRANSFER/>
  <FECOMPOSITE/>
  <FECONVOLVEMATRIX/>
  <FEDIFFUSELIGHTING/>
  <FEDISPLACEMENTMAP/>
  <FEDISTANTLIGHT/>
  <FEFLOOD/>
  <FEFUNCA/>
  <FEFUNCB/>
  <FEFUNCG/>
  <FEFUNCR/>
  <FEGAUSSIANBLUR/>
  <FEIMAGE/>
  <FEMERGE/>
  <FEMERGENODE/>
  <FEMORPHOLOGY/>
  <FEOFFSET/>
  <FEPOINTLIGHT/>
  <FESPECULARLIGHTING/>
  <FESPOTLIGHT/>
  <FETILE/>
  <FETURBULENCE/>
  <FOREIGNOBJECT/>
  <GLYPHREF/>
  <LINEARGRADIENT/>
  <RADIALGRADIENT/>
  <TEXTPATH/>
</svg>
</div>
''';

void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);
  var elements = [
    "altGlyph",
    "altGlyphDef",
    "altGlyphItem",
    "animateColor",
    "animateMotion",
    "animateTransform",
    "clipPath",
    "feBlend",
    "feColorMatrix",
    "feComponentTransfer",
    "feComposite",
    "feConvolveMatrix",
    "feDiffuseLighting",
    "feDisplacementMap",
    "feDistantLight",
    "feFlood",
    "feFuncA",
    "feFuncB",
    "feFuncG",
    "feFuncR",
    "feGaussianBlur",
    "feImage",
    "feMerge",
    "feMergeNode",
    "feMorphology",
    "feOffset",
    "fePointLight",
    "feSpecularLighting",
    "feSpotLight",
    "feTile",
    "feTurbulence",
    "foreignObject",
    "glyphRef",
    "linearGradient",
    "radialGradient",
    "textPath"];

  var SVG = "http://www.w3.org/2000/svg";

  assert_equals(document.getElementsByTagName('svg').length, 1);
  for (var i = 0, il = elements.length; i < il; ++i) {
    var el=elements[i];
    test(() {
      assert_equals(document.getElementsByTagName(el).length, 2);
      assert_equals(document.getElementsByTagName(el.toUpperCase()).length, 0);
      assert_equals(document.getElementsByTagName(el.toLowerCase()).length, 0);
/*
      assert_equals(document.getElementsByTagNameNS(SVG, el).length, 2);
      assert_equals(document.getElementsByTagNameNS(SVG, el.toUpperCase()).length, 0);
      assert_equals(document.getElementsByTagNameNS(SVG, el.toLowerCase()).length, 0);
 */
    }, "Testing $el");
    
  }
  
  checkTestFailures();
}
  
