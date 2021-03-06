/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that when a page with an RTL overflow is initially
 * loaded, no scroll event is sent.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.documentElement.style.direction = 'rtl';

  addOnLoadListener((_) {
    asyncEnd();
  });
  
  document.onScroll.listen((_) {
    testFailed('FAIL - scroll event received!');
  });

  asyncStart();

  document.body.setInnerHtml('''
    <div dir=ltr>
    <p>This tests that when a page with an RTL overflow is initially loaded, no scroll event is sent.</p>
    <p>This test has passed if the text "FAIL - scroll event received!" does not appear below.</p>
    </div>
    <div id="div" style="whitespace:nowrap; width: 4000px; height: 1000px; border: 1px solid red;">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</div>
    ''', treeSanitizer: new NullTreeSanitizer());
}
