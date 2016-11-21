/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div id=container>
      <input type="text" id="f" size="5" maxlength="4">
      <input type="text" id="e" size="5" maxlength="4">
      <input type="text" id="d" size="5">
      <input type="text" id="c" size="5">
      <input type="text" id="j" size="5" maxlength="4">
      <input type="text" id="i" size="5" maxlength="4">
      <input type="text" id="h" size="5">
      <input type="text" id="g" size="5">
      <input type="text" id="k-max5" size="5" maxlength="5">
      <input type="text" id="l" size="5" maxlength="0">
      <input type="text" id="m" size="5" maxlength="">
      <input type="text" id="n" size="5" maxlength="invalid">
      <input type="text" id="huge" size="5" maxlength="9999999999">
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  String domValueOf(String id) {
    return (document.getElementById(id) as InputElement).value;
  }

//  visibleValueOf(id) {
//    var el = document.getElementById(id);
//    el.focus();
//    document.execCommand('SelectAll', false, '');
//    return window.getSelection().toString();
//  }

  String fancyX = "x" + new String.fromCharCode(0x305) + new String.fromCharCode(0x332);
  // u10000 is one character consisted of a surrogate pair.
  //var u10000 = "\ud800\udc00"; // valid in js, invalid in dart
//  String u10000 = "\u{10000}";
  

  debug("set value attribute that violates maxlength (with pasted value)");
  document.getElementById("f").focus();
  document.execCommand("InsertHTML", false, "123");
  document.getElementById("f").setAttribute('value', '12345');
  shouldBe(domValueOf('f'), '123');  // setAttribute() doesn't change the value because the value is dirty.
  //shouldBe(visibleValueOf('f'), '123');

  debug("set value property that violates maxlength (with pasted value)");
  document.getElementById("e").focus();
  document.execCommand("InsertHTML", false, "123");
  (document.getElementById("e") as InputElement).value = '12345';
  shouldBe(domValueOf('e'), '12345');  // Unlike setAttribute(), .value property changes the value.
  //shouldBe(visibleValueOf('e'), '12345');

  debug("set maxlength attribute that is smaller than pasted value");
  document.getElementById("d").focus();
  document.execCommand("InsertHTML", false, "12345");
  (document.getElementById("d") as InputElement).setAttribute('maxlength', '4');
  shouldBe(domValueOf('d'), '12345');
  //shouldBe(visibleValueOf('d'), '12345');

  debug("set maxLength property that is smaller than pasted value");
  document.getElementById("c").focus();
  document.execCommand("InsertHTML", false, "12345");
  (document.getElementById("c") as InputElement).maxLength = 4;
  shouldBe(domValueOf('c'), '12345');
  //shouldBe(visibleValueOf('c'), '12345');

  debug("set value attribute that violates maxlength (with pasted value)");
  document.getElementById("j").focus();
  document.execCommand("InsertHTML", false, "123");
  document.getElementById("j").setAttribute('value', '12' + fancyX + '45');
  shouldBe(domValueOf('j'), '123');
  //shouldBe(visibleValueOf('j'), '123');

  debug("set value property that violates maxlength (with pasted value)");
  document.getElementById("i").focus();
  document.execCommand("InsertHTML", false, "123");
  (document.getElementById("i") as InputElement).value = '12' + fancyX + '45';
  shouldBe(domValueOf('i'), '12' + fancyX + '45');
  //shouldBe(visibleValueOf('i'), '12' + fancyX + '45');

  debug("set maxlength attribute that is smaller than pasted value");
  document.getElementById("h").focus();
  document.execCommand("InsertHTML", false, "12x&#x305;&#x332;45");
  document.getElementById("h").setAttribute('maxlength', '4');
  shouldBe(domValueOf('h'), '12' + fancyX + '45');
  //shouldBe(visibleValueOf('h'), '12' + fancyX + '45');

  debug("set maxLength property that is smaller than pasted value");
  document.getElementById("g").focus();
  document.execCommand("InsertHTML", false, "12x&#x305;&#x332;45");
  (document.getElementById("g") as InputElement).maxLength = 4;
  shouldBe(domValueOf('g'), '12' + fancyX + '45');
  //shouldBe(visibleValueOf('g'), '12' + fancyX + '45');

  /*debug("pasting too much text");
  var target = document.getElementById("k-max5");
  target.focus();
  document.execCommand("InsertHTML", false, "12x&#x305;&#x332;45");
  shouldBeEqualToString(domValueOf('k-max5'), "12" + fancyX);
  //shouldBeEqualToString(visibleValueOf('k-max5'), "12" + fancyX);
  target.value = "";
  document.execCommand("InsertHTML", false, "123" + u10000);
  shouldBeEqualToString(domValueOf('k-max5'), "123" + u10000);
  //shouldBeEqualToString(visibleValueOf('k-max5'), "123" + u10000);
  target.value = "";
  document.execCommand("InsertHTML", false, "1234" + u10000);
  shouldBeEqualToString(domValueOf('k-max5'), "1234");
  //shouldBeEqualToString(visibleValueOf('k-max5'), "1234");*/

  debug("pasting too much text with maxlength=0");
  document.getElementById("l").focus();
  document.execCommand("InsertHTML", false, "12x&#x305;&#x332;45");
  shouldBe(domValueOf('l'), '');
  //shouldBe(visibleValueOf('l'), '');

  debug("empty maxlength should be ignored.");
  document.getElementById("m").focus();
  document.execCommand("InsertHTML", false, "12x&#x305;&#x332;45");
  shouldBe(domValueOf('m'), '12' + fancyX + '45');
  //shouldBe(visibleValueOf('m'), '12' + fancyX + '45');

  debug("invalid maxlength should be ignored.");
  document.getElementById("n").focus();
  document.execCommand("InsertHTML", false, "12x&#x305;&#x332;45");
  shouldBe(domValueOf('n'), '12' + fancyX + '45');
  //shouldBe(visibleValueOf('n'), '12' + fancyX + '45');
  document.getElementById("huge").focus();
  document.execCommand("InsertHTML", false, "12x&#x305;&#x332;45");
  shouldBe(domValueOf('huge'), '12' + fancyX + '45');
  //shouldBe(visibleValueOf('huge'), '12' + fancyX + '45');
}
