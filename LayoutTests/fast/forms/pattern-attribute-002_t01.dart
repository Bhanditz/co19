/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Pattern attribute set/get test
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <p>There an input element with the pattern attribute not set.</p>
      <input name="victim" />
      ''', treeSanitizer: new NullTreeSanitizer());

  var v = document.getElementsByName("victim");
  v[0].pattern = "something";
  shouldBe(v[0].pattern, "something");
}