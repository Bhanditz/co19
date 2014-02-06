/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final SecurityPolicy securityPolicy
 * @description Checks that this property is present.
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

main() {
  SecurityPolicy securityPolicy=document.securityPolicy;
  Expect.isTrue(securityPolicy is SecurityPolicy);
}
