/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
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
 * @assertion Matching Insertion Points:
 * A valid selector fragment may contain an ID selector
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  equals(actual,expected,reason) => Expect.equals(expected,actual,reason);

  var d = document;
  d.body.setInnerHtml(bobs_page,
      treeSanitizer: new NullTreeSanitizer());

  var ul = d.querySelector('ul.stories');
  var s = createSR(ul);

  //make shadow subtree
  var subdiv1 = document.createElement('div');
  subdiv1.setInnerHtml('<ul><content select="#li4"></content></ul>',
      treeSanitizer: new NullTreeSanitizer());
  s.append(subdiv1);

  //The order of DOM elements should be the following:
  //li4. Other elements invisible
  Expect.isTrue(d.querySelector('#li4').offsetTop > 0,
      'Class name should be a valid insertion point matching criteria, element should be visible');

  equals(d.querySelector('#li1').offsetTop, 0,
      'Point 1: Elements that don\'t mach insertion point criteria participate in distribution');
  equals(d.querySelector('#li2').offsetTop, 0,
      'Point 2: Elements that don\'t mach insertion point criteria participate in distribution');
  equals(d.querySelector('#li3').offsetTop, 0,
      'Point 3: Elements that don\'t mach insertion point criteria participate in distribution');
  equals(d.querySelector('#li5').offsetTop, 0,
      'Point 4: Elements that don\'t mach insertion point criteria participate in distribution');
  equals(d.querySelector('#li6').offsetTop, 0,
      'Point 5: Elements that don\'t mach insertion point criteria participate in distribution');
}
