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
 * @assertion Retargeting focus events: The blur event must be treated in the
 * same way as events with a relatedTarget, where the node that is gaining
 * focus causing the blurring of target acts as the related target
 */

import 'dart:html';
import 'package:unittest/unittest.dart' as unittest;
import 'package:unittest/html_individual_config.dart';
import '../../testcommon.dart';

main() {

  useHtmlIndividualConfiguration();
  unittest.test("focus retargeting", () {
    var d = document;

    var invoked = false;

    var roots = createTestMediaPlayer(d);

    roots.playerShadowRoot.querySelector('.volume-slider').focus();

    //expected result of what relative target should be see
    //see at http://www.w3.org/TR/shadow-dom/#event-retargeting-example

    //For #volume-slider relative target is #volume-slider
    roots.playerShadowRoot.querySelector('.volume-slider')
      .addEventListener('blur', unittest.expectAsync((event) {
        invoked = true;
        unittest.expect(event.target.getAttribute('id'), 'volume-slider',
            reason: 'Wrong target');
      }));

    // move focus out of shadow tree. blur should be fired
    d.querySelector('#outside-control').focus();
  });
}
