/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test ensures WebGL implementations correctly implement
 * drawingbufferWidth/Height.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test-utils.dart" as wtu;

main() {
  var gl, maxSize;

  document.body.setInnerHtml('''
      <div id="console"></div>
      <script id="vshaderGrid" type="x-shader/x-vertex">
      attribute vec4 a_position;
      void main()
      {
        gl_Position = a_position;
      }
      </script>

      <script id="fshaderGrid" type="x-shader/x-fragment">
      precision mediump float;
      void main()
      {
        float r = mod(gl_FragCoord.x, 2.0) < 1.0 ? 0.0 : 1.0;
        float g = mod(gl_FragCoord.y, 2.0) < 1.0 ? 0.0 : 1.0;
        gl_FragColor = vec4(r, g, 0, 1);
      }
      </script>
      ''', treeSanitizer: new NullTreeSanitizer());

  getMaxViewportDimensions() {
    // create a fresh canvas. This canvas will be discarded
    // after exiting this function.
    var canvas = document.createElement("canvas");
    gl = wtu.create3DContext(canvas, {'antialias': false});
    if (gl == null) {
      testFailed("context does not exist");
      return [0, 0];
    } else {
      testPassed("context exists");

      // For a default size canvas these should be equal.
      // WebGL contexts are not allowed to change the size of the drawingBuffer
      // for things like hi-res displays.
      shouldBe(gl.drawingBufferWidth, gl.canvas.width);
      shouldBe(gl.drawingBufferHeight, gl.canvas.height);
      return gl.getParameter(wgl.MAX_VIEWPORT_DIMS);
    }
  }

  // This uses gl_FragCoord to draw a device pixel relavent pattern.
  // If drawBufferWidth or drawBufferHeight are not in device pixels
  // this test should fail.
  checkGrid(gl) {
    var program = wtu.setupProgram(gl, ["vshaderGrid", "fshaderGrid"], ["a_position"]);
    wtu.setupUnitQuad(gl);
    gl.useProgram(program);
    shouldBe(gl.getError(), wgl.NO_ERROR);

    wtu.drawQuad(gl);

    var pixels = new Uint8List(gl.drawingBufferWidth * gl.drawingBufferHeight * 4);
    gl.readPixels(0, 0, gl.drawingBufferWidth, gl.drawingBufferHeight, wgl.RGBA, wgl.UNSIGNED_BYTE, pixels);

    var colors = [
      [ { 'color': [0,   0, 0, 255], 'name': "black" },  { 'color': [255,   0, 0, 255], 'name': "red"    } ],
      [ { 'color': [0, 255, 0, 255], 'name': "green" },  { 'color': [255, 255, 0, 255], 'name': "yellow" } ],
      ];

    for (var yy = 0; yy < gl.drawingBufferHeight; ++yy) {
      for (var xx = 0; xx < gl.drawingBufferWidth; ++xx) {
        var info = colors[yy % 2][xx % 2];
        dynamic color = info['color'];
        var offset = (yy * gl.drawingBufferWidth + xx) * 4;
        for (var jj = 0; jj < 4; ++jj) {
          if (pixels[offset + jj] != color[jj]) {
            var actual = [pixels[offset], pixels[offset + 1], pixels[offset + 2], pixels[offset + 3]];
            testFailed("at $xx,$yy expected $color(${info['name']}) was $actual");
            return;
          }
        }
      }
    }
    testPassed("grid rendered correctly");
  }

  // This passes device coordinate vertices in to make sure gl.viewport is not being mucked with.
  checkQuad(gl) {
    deviceToClipSpace(value, range) {
      return value / range * 2 - 1;
    }

    // draw a small green square in the top right corner.
    var deviceX1 = gl.drawingBufferWidth - 4;
    var deviceX2 = gl.drawingBufferWidth;
    var deviceY1 = gl.drawingBufferHeight - 4;
    var deviceY2 = gl.drawingBufferHeight;

    var clipX1 = deviceToClipSpace(deviceX1, gl.drawingBufferWidth);
    var clipX2 = deviceToClipSpace(deviceX2, gl.drawingBufferWidth);
    var clipY1 = deviceToClipSpace(deviceY1, gl.drawingBufferHeight);
    var clipY2 = deviceToClipSpace(deviceY2, gl.drawingBufferHeight);

    var vertexObject = gl.createBuffer();
    gl.bindBuffer(wgl.ARRAY_BUFFER, vertexObject);
    gl.bufferData(
        wgl.ARRAY_BUFFER,
        new Float32List.fromList(
          [ clipX2, clipY2,
          clipX1, clipY2,
          clipX1, clipY1,
          clipX2, clipY2,
          clipX1, clipY1,
          clipX2, clipY1]),
        wgl.STATIC_DRAW);
    gl.enableVertexAttribArray(0);
    gl.vertexAttribPointer(0, 2, wgl.FLOAT, false, 0, 0);

    var green = [0, 255, 0, 255];
    var black = [0, 0, 0, 0];
    gl.clearColor(0, 0, 0, 0);
    gl.clear(wgl.COLOR_BUFFER_BIT);
    wtu.drawUByteColorQuad(gl, [0, 255, 0, 255]);

    var squareWidth = deviceX2 - deviceX1;
    var squareHeight = deviceY2 - deviceY1;

    // check the square.
    wtu.checkCanvasRect(gl, deviceX1, deviceY1, squareWidth, squareHeight, green, "should be green");
    // check outside the square.
    wtu.checkCanvasRect(gl, 0, 0, gl.drawingBufferWidth, gl.drawingBufferHeight - squareHeight, black, "should be black");
    wtu.checkCanvasRect(gl, 0, gl.drawingBufferHeight - squareHeight, gl.drawingBufferWidth - squareWidth, squareHeight, black, "should be black");
  }

  test(desiredWidth, desiredHeight) {
    debug("Checking drawingBufferWidth/drawingBufferHeight");

    // Make a fresh canvas.
    dynamic canvas = document.createElement("canvas");
    canvas.width = desiredWidth;
    canvas.height = desiredHeight;

    // This 'gl' must be global for shouldBe to work.
    gl = wtu.create3DContext(canvas, {'antialias': false});
    if (gl == null) {
      testFailed("context does not exist");
    } else {
      testPassed("context exists");

      // Verify these stats didn't change since they come from a different
      // context.
      shouldBe(gl.getParameter(wgl.MAX_VIEWPORT_DIMS)[0], maxSize[0]);
      shouldBe(gl.getParameter(wgl.MAX_VIEWPORT_DIMS)[1], maxSize[1]);

      // check the initial viewport matches the drawingBufferWidth and drawingBufferHeight
      shouldBe(gl.getParameter(wgl.VIEWPORT)[0], 0);
      shouldBe(gl.getParameter(wgl.VIEWPORT)[1], 0);
      shouldBe(gl.getParameter(wgl.VIEWPORT)[2], gl.drawingBufferWidth);
      shouldBe(gl.getParameter(wgl.VIEWPORT)[3], gl.drawingBufferHeight);

      // Draw a pixel grid using a shader that draws in device coordinates
      checkGrid(gl);
      // Draw a quad in the top right corner.
      checkQuad(gl);

      shouldBe(gl.getError(), wgl.NO_ERROR);

      debug("Testing resizing canvas");

      var oldViewport = gl.getParameter(wgl.VIEWPORT);

      // flip width and height
      canvas.width = desiredHeight;
      canvas.height = desiredWidth;

      // Verify the viewport didn't change.
      shouldBe(gl.getParameter(wgl.VIEWPORT)[0], oldViewport[0]);
      shouldBe(gl.getParameter(wgl.VIEWPORT)[1], oldViewport[1]);
      shouldBe(gl.getParameter(wgl.VIEWPORT)[2], oldViewport[2]);
      shouldBe(gl.getParameter(wgl.VIEWPORT)[3], oldViewport[3]);

      // fix the viewport
      gl.viewport(0, 0, gl.drawingBufferWidth, gl.drawingBufferHeight);

      // Draw a pixel grid using a shader that draws in device coordinates
      checkGrid(gl);

      // Draw a quad in the top right corner.
      checkQuad(gl);
      shouldBe(gl.getError(), wgl.NO_ERROR);
    }
  }

  maxSize = getMaxViewportDimensions();

  shouldBeTrue(maxSize[0] > 0);
  shouldBeTrue(maxSize[1] > 0);

  // test a small size to make sure it works at all.
  test(16, 32);

  // Make a canvas slightly larger than the max size WebGL can handle.
  // From section 2.2 of the spec the WebGL implementation should allow this to work.

  // test a size larger than MAX_VIEWPORT_DIMS in both dimensions
  test(maxSize[0] + 32, 8);
}
