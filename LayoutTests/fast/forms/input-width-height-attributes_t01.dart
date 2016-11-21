/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description width and height attributes of HTMLInputElement.
 */
import "dart:html";
import "../../testcommon.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <div id="div1">
          <input type="image" id="image1" src="$root/resources/green.jpg" width="160" height="80px">
      </div>
      <br>

      <div id="div2">
          <input type="image" id="image2" src="$root/resources/green.jpg">
      </div>
      <br>

      <div id="div3">
          <input type="image" id="image3" src="$root/resources/green.jpg">
      </div>
      <br>

      <div id="div4">
          <input type="image" id="image4" src="$root/resources/green.jpg">
      </div>
      <br>

      <div id="div5">
          <input type="text" id="text1">
      </div>
      <br>

      <div id="div6">
          <input type="file" id="file1">
      </div>
      <br>

      <div id="div7">
          <input type="date" id="date1">
      </div>
      <br>

      <div id="div8">
          <input type="button" id="button1">
      </div>
      <br>
      ''', treeSanitizer: new NullTreeSanitizer());

  DivElement div = document.getElementById("div1") as DivElement;
  InputElement image1 = document.getElementById("image1") as InputElement;
  debug('Test case #1 : Image, HTML inline setting as \"160\", \"80\"');
  shouldBe(image1.width, 160);
  shouldBe(image1.height, 80);

  div = document.getElementById("div2") as DivElement;
  InputElement image2 = document.getElementById("image2") as InputElement;
  debug('Test case #2 : Image, Setting by JavaScript API as \"260\", \"130\"');
  image2.width = 260;
  image2.height = 130;
  shouldBe(image2.width, 260);
  shouldBe(image2.height, 130);

  /*div = document.getElementById("div3");
  var image3 = document.getElementById("image3");
  debug('Test case #3 : Image, Setting by JavaScript API as \"120px\", \"60px\"');
  image3.width = "120px";
  image3.height = "60px";
  shouldBe(image3.width, 0);
  shouldBe(image3.height, 0);

  div = document.getElementById("div4");
  var image4 = document.getElementById("image4");
  debug('Test case #4 : Image, Setting by JavaScript API as \"120.99\", \"60.55\"');
  image4.width = 120.99;
  image4.height = 60.99;
  shouldBe(image4.width, 120);
  shouldBe(image4.height, 60);*/

  div = document.getElementById("div5") as DivElement;
  InputElement text1 = document.getElementById("text1") as InputElement;
  debug('Test case #5 : Text, Setting by JavaScript API as \"100\", \"50\"');
  text1.width = 100;
  text1.height = 50;
  shouldBe(text1.width, 0);
  shouldBe(text1.height, 0);

  text1.type = 'image';
  text1.src = "$root/resources/green.jpg";
  shouldBe(text1.width, 100);
  shouldBe(text1.height, 50);
  text1.width = 60;
  text1.height = 40;
  shouldBe(text1.width, 60);
  shouldBe(text1.height, 40);

  div = document.getElementById("div6") as DivElement;
  InputElement file1 = document.getElementById("file1") as InputElement;
  debug('Test case #6 : File, Setting by JavaScript API as \"100\", \"50\"');
  file1.width = 100;
  file1.height = 50;
  shouldBe(file1.width, 0);
  shouldBe(file1.height, 0);

  file1.type = 'image';
  file1.src = "$root/resources/green.jpg";
  shouldBe(file1.width, 100);
  shouldBe(file1.height, 50);
  file1.width = 60;
  file1.height = 40;
  shouldBe(file1.width, 60);
  shouldBe(file1.height, 40);

  div = document.getElementById("div7") as DivElement;
  InputElement date1 = document.getElementById("date1") as InputElement;
  debug('Test case #7 : Date, Setting by JavaScript API as \"100\", \"50\"');
  date1.width = 100;
  date1.height = 50;
  shouldBe(date1.width, 0);
  shouldBe(date1.height, 0);

  date1.type = 'image';
  date1.src = "$root/resources/green.jpg";
  shouldBe(date1.width, 100);
  shouldBe(date1.height, 50);
  date1.width = 60;
  date1.height = 40;
  shouldBe(date1.width, 60);
  shouldBe(date1.height, 40);

  div = document.getElementById("div8") as DivElement;
  InputElement button1 = document.getElementById("button1") as InputElement;
  debug('Test case #8 : Button, Setting by JavaScript API as \"100\", \"50\"');
  button1.width = 100;
  button1.height = 50;
  shouldBe(button1.width, 0);
  shouldBe(button1.height, 0);

  button1.type = 'image';
  button1.src = "$root/resources/green.jpg";
  shouldBe(button1.width, 100);
  shouldBe(button1.height, 50);
  button1.width = 60;
  button1.height = 40;
  shouldBe(button1.width, 60);
  shouldBe(button1.height, 40);
}
