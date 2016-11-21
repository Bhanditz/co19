/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test that setting HTMLSelectElement.length is capped to
 * 10,000, but that you can add additional Option elements by calling add.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <select id="theSelect"></select>
      ''', treeSanitizer: new NullTreeSanitizer());

  SelectElement sel = document.getElementById('theSelect') as SelectElement;
  shouldBe(sel.length, 0);
  sel.length = 20000;
  shouldBe(sel.length, 10000);
  sel.add(new OptionElement(), 0);
  shouldBe(sel.length, 10001);
  sel.length = 0;
  shouldBe(sel.length, 0);
}
