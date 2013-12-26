/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Created callback should be called if createElement is called
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../testcommon.dart';

var called;

class Foo extends HtmlElement {
  static const tag = 'x-foo';
  factory Foo() => document.createElement(tag);
  factory Foo.ext(t) => document.createElement(t, tag);
  Foo.created() : super.created() {
    called = true;
  }
}

main() {
  called = false;
  var x = new Foo();
  Expect.isFalse(called);
  
  document.register(Foo.tag, Foo);
  x = new Foo();
  Expect.isTrue(called);
  
  called = false;
  x = new Foo.ext(Foo.tag);
  Expect.isTrue(called);
}