/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests to make sure we can assign to non-ctm effected properties
 * with a non-invertible ctm set
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  dynamic canvas = document.createElement("canvas");
  canvas.width = 100;
  canvas.height = 100;
  var ctx = canvas.getContext('2d');
  document.body.append(canvas);

  testPixel(x,y, r, g, b) {
    var imageData = ctx.getImageData(x, y, 1, 1);
    shouldBe(imageData.data[0], r);
    shouldBe(imageData.data[1], g);
    shouldBe(imageData.data[2], b);
  }

  // Test our ability to set fillStyle
  ctx.save();
  ctx.scale(0, 0);
  ctx.fillStyle = "green";
  shouldBe(ctx.fillStyle, "#008000");
  ctx.setTransform(1, 0, 0, 1, 0, 0);
  ctx.fillRect(0,0,100,100);
  testPixel(50, 50, 0, 128, 0);
  ctx.restore();

  // Test our ability to set strokeStyle
  ctx.save();
  ctx.fillStyle = "red";
  ctx.fillRect(0,0,100,100);
  ctx.scale(0, 0);
  ctx.strokeStyle = "green";
  shouldBe(ctx.strokeStyle, "#008000");
  ctx.lineWidth = 100;
  ctx.setTransform(1, 0, 0, 1, 0, 0);
  ctx.strokeRect(0,0,100,100);
  testPixel(50, 50, 0, 128, 0);
  ctx.restore();


  // test closePath
  ctx.save();
  ctx.fillStyle = "red";
  ctx.fillRect(0,0,100,100);

  ctx.beginPath();
  ctx.strokeStyle = "green";
  ctx.lineWidth = 100;
  ctx.moveTo(-100,   50);
  ctx.lineTo(-100, -100);
  ctx.lineTo( 200, -100);
  ctx.lineTo( 200,   50);
  ctx.scale(0, 0);
  ctx.closePath();
  ctx.setTransform(1, 0, 0, 1, 0, 0);
  ctx.stroke();
  ctx.restore();
  testPixel(50, 50, 0, 128, 0);

  // Test beginPath behaviour
  ctx.fillStyle = "green";
  ctx.fillRect(0,0,100,100);
  ctx.fillStyle = "red";
  ctx.rect(0,0,100,100);
  ctx.scale(0,0);
  ctx.beginPath();
  ctx.setTransform(1, 0, 0, 1, 0, 0);
  ctx.fill();

  testPixel(50, 50, 0, 128, 0);
}
