/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Ensure correct behavior of canvas with path fill + shadow after
 * scaling. A blue and red checkered pattern should be displayed.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  shouldBeAround(a, b) => shouldBeApprox(a, b, 20);

  dynamic canvas = document.createElement('canvas');
  document.body.append(canvas);
  canvas.setAttribute('width', '1000');
  canvas.setAttribute('height', '1000');
  var ctx = canvas.getContext('2d');

  ctx.scale(2, 2);
  ctx.shadowOffsetX = 100;
  ctx.shadowOffsetY = 100;
  ctx.fillStyle = 'rgba(0, 0, 255, 1)';

  ctx.shadowColor = 'rgba(255, 0, 0, 1.0)';
  ctx.beginPath();
  ctx.moveTo(50, 50);
  ctx.lineTo(100, 50);
  ctx.lineTo(100, 100);
  ctx.lineTo(50, 100);
  ctx.fill();

  ctx.shadowColor = 'rgba(255, 0, 0, 0.3)';
  ctx.beginPath();
  ctx.moveTo(50, 150);
  ctx.lineTo(100, 150);
  ctx.lineTo(100, 200);
  ctx.lineTo(50, 200);
  ctx.fill();

  ctx.shadowColor = 'rgba(255, 0, 0, 1.0)';
  ctx.shadowBlur = 10;
  ctx.beginPath();
  ctx.moveTo(150, 50);
  ctx.lineTo(200, 50);
  ctx.lineTo(200, 100);
  ctx.lineTo(150, 100);
  ctx.fill();

  ctx.shadowColor = 'rgba(255, 0, 0, 0.3)';
  ctx.beginPath();
  ctx.moveTo(150, 150);
  ctx.lineTo(200, 150);
  ctx.lineTo(200, 200);
  ctx.lineTo(150, 200);
  ctx.fill();

  var d; // imageData.data

  // Verify solid shadow.
  d = ctx.getImageData(201, 205, 1, 1).data;
  shouldBe(d[0], 255);
  shouldBe(d[1], 0);
  shouldBe(d[2], 0);
  shouldBe(d[3], 255);

  d = ctx.getImageData(298, 295, 1, 1).data;
  shouldBe(d[0], 255);
  shouldBe(d[1], 0);
  shouldBe(d[2], 0);
  shouldBe(d[3], 255);

  d = ctx.getImageData(201, 298, 1, 1).data;
  shouldBe(d[0], 255);
  shouldBe(d[1], 0);
  shouldBe(d[2], 0);
  shouldBe(d[3], 255);

  // Verify solid alpha shadow.
  d = ctx.getImageData(201, 405, 1, 1).data;
  shouldBe(d[0], 255);
  shouldBe(d[1], 0);
  shouldBe(d[2], 0);
  shouldBeAround(d[3], 76);

  d = ctx.getImageData(298, 405, 1, 1).data;
  shouldBe(d[0], 255);
  shouldBe(d[1], 0);
  shouldBe(d[2], 0);
  shouldBeAround(d[3], 76);

  d = ctx.getImageData(205, 498, 1, 1).data;
  shouldBe(d[0], 255);
  shouldBe(d[1], 0);
  shouldBe(d[2], 0);
  shouldBeAround(d[3], 76);

  // Verify blurry shadow.
  d = ctx.getImageData(398, 205, 1, 1).data;
  shouldBe(d[0], 255);
  shouldBe(d[1], 0);
  shouldBe(d[2], 0);
  shouldBeAround(d[3], 83);

  d = ctx.getImageData(501, 205, 1, 1).data;
  shouldBe(d[0], 255);
  shouldBe(d[1], 0);
  shouldBe(d[2], 0);
  shouldBeAround(d[3], 83);

  d = ctx.getImageData(500, 300, 1, 1).data;
  shouldBe(d[0], 255);
  shouldBe(d[1], 0);
  shouldBe(d[2], 0);
  shouldBeAround(d[3], 53);

  // Verify blurry alpha shadow.
  d = ctx.getImageData(398, 405, 1, 1).data;
  shouldBe(d[0], 255);
  shouldBe(d[1], 0);
  shouldBe(d[2], 0);
  shouldBeAround(d[3], 24);

  d = ctx.getImageData(405, 501, 1, 1).data;
  shouldBe(d[0], 255);
  shouldBe(d[1], 0);
  shouldBe(d[2], 0);
  shouldBeAround(d[3], 24);

  d = ctx.getImageData(405, 501, 1, 1).data;
  shouldBe(d[0], 255);
  shouldBe(d[1], 0);
  shouldBe(d[2], 0);
  shouldBeAround(d[3], 24);
}
