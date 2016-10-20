/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Series of tests to ensure correct behaviour of getImageData and
 * putImageData when alpha is involved
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="canvas" width="200" height="200"></canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  dynamic ctx = getContext2d("canvas");
  ctx.fillStyle = 'rgba(255, 0, 0, 0.01)';
  ctx.fillRect(0, 0, 1, 200);
  ctx.fillStyle = 'rgba(0, 255, 0, 0.995)';
  ctx.fillRect(1, 0, 199, 200);
  var imageData = ctx.getImageData(0, 0, 200, 200);
  var imgdata = imageData.data;
  shouldBe(imgdata[4], 0);
  shouldBe(imgdata[5], 255);
  shouldBe(imgdata[6], 0);
  shouldBe(imgdata[7], 254);

  ctx.putImageData(imageData, 0, 0);

  imgdata = ctx.getImageData(0, 0, 200, 200).data;

  shouldBe(imgdata[4], 0);
  shouldBe(imgdata[5], 255);
  shouldBe(imgdata[6], 0);
  shouldBe(imgdata[7], 254);
}
