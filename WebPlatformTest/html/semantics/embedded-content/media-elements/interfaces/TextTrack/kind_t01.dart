/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/**
 * after web-platform-tests/html/semantics/embedded-content/media-elements/interfaces/TextTrack/kind.html
 * @assertion 
 * @description TextTrack.kind
 */
import 'dart:html';
import "../../../../../../Utils/expectWeb.dart";

void main() {

test((){
    var video = document.createElement('video') as VideoElement;
    var t1 = video.addTextTrack('subtitles');
    var t2 = video.addTextTrack('captions');
    var t3 = video.addTextTrack('descriptions');
    var t4 = video.addTextTrack('chapters');
    var t5 = video.addTextTrack('metadata');
    assert_equals(t1.kind, 'subtitles');
    assert_equals(t2.kind, 'captions');
    assert_equals(t3.kind, 'descriptions');
    assert_equals(t4.kind, 'chapters');
    assert_equals(t5.kind, 'metadata');
}, document.title+', addTextTrack');

test((){
    var track = document.createElement('track') as TrackElement;
    track.setAttribute('kind', 'CAPTIONS');
    var t = track.track;
    assert_equals(t.kind, 'captions');
}, document.title+', track element');

test((){
    var track = document.createElement('track') as TrackElement;
    track.kind = 'captions\u0000';
    assert_equals(track.track.kind, 'subtitles');
}, document.title+', \\u0000');

   checkTestFailures();
}
