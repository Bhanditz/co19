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
 * @assertion Retargeting focus events: The focus, DOMFocusIn, blur, and
 * DOMFocusOut events must be treated in the same way as events with a 
 * relatedTarget, where the corresponding node that is losing focus as a 
 * result of target gaining focus or the node that is gaining focus, and thus
 * causing the blurring of target acts as the related target
 */

import 'dart:html';
import "../../../../Utils/async_utils.dart";
import '../../testcommon.dart';

main() {
  //Retargeting shouldn't occur for DOM tree nodes distributed
  //among insertion point. Check DOMFocusOut

  test(() {
    var d = document;

    var host = d.createElement('div');
    host.setAttribute('id', 'host');
    d.body.append(host);

    var inp1 = d.createElement('input');
    inp1.setAttribute('id', 'inp1');
    inp1.setAttribute('type', 'checkbox');
    inp1.setAttribute('class', 'clazz1');
    host.append(inp1);

    var inp2 = d.createElement('input');
    inp2.setAttribute('id', 'inp2');
    inp2.setAttribute('type', 'checkbox');
    inp2.setAttribute('class', 'clazz2');
    host.append(inp2);

    var inp3 = d.createElement('input');
    inp3.setAttribute('id', 'inp3');
    inp3.setAttribute('type', 'checkbox');
    inp3.setAttribute('class', 'clazz1');
    host.append(inp3);


    //Shadow root to play with
    var s = createSR(host);

    var shadowDiv = document.createElement('div');
    shadowDiv.setInnerHtml('<content select=".clazz1"></content>',
        treeSanitizer: new NullTreeSanitizer());
    s.append(shadowDiv);

    //element outside the shadow tree
    var inp4 = d.createElement('input');
    inp4.setAttribute('id', 'inp4');
    inp4.setAttribute('type', 'checkbox');
    inp4.setAttribute('class', 'clazz1');
    d.body.append(inp4);

    asyncMultiStart(2);

    inp1.focus();

    s.addEventListener('DOMFocusOut', (event) {
      assert_equals(event.target.getAttribute('id'), 'inp1', 'Inside shadow tree: ' +
        'Event for nodes, distributed ' +
        'agains insertion points shouldn\'t be retargeted');
      asyncEnd();
    }, false);


    d.body.addEventListener('DOMFocusOut', (dynamic event) {
      assert_equals(event.target.getAttribute('id'), 'inp1', 'Outside shadow tree: ' +
        'Event for nodes, distributed ' +
        'agains insertion points shouldn\'t be retargeted');
      asyncEnd();
    }, false);

    inp4.focus();

  }, 'A_05_03_01_T05');
}
