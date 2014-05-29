/**
 * after web-platform-tests/html/semantics/embedded-content/media-elements/interfaces/HTMLElement/HTMLMediaElement/label.html
 * @assertion 
 * @description HTMLMediaElement.label
 */
import 'dart:html';
import "../../../../../../../Utils/expectWeb.dart";

void main() {

test((){
    var track = document.createElement('track');
    assert_equals(track.label, '');
    assert_equals(track.getAttribute('label'), null);
}, document.title + ' missing value');

test((){
    var track = document.createElement('track');
    track.setAttribute('label', '');
    assert_equals(track.label, '');
    assert_equals(track.getAttribute('label'), '');
}, document.title + ' empty string content attribute');

test((){
    var track = document.createElement('track');
    track.label = '';
    assert_equals(track.label, '');
    assert_equals(track.getAttribute('label'), '');
}, document.title + ' empty string IDL attribute');

test((){
    var track = document.createElement('track');
    track.setAttribute('label', 'foo');
    assert_equals(track.label, 'foo');
    assert_equals(track.getAttribute('label'), 'foo');
}, document.title + ' lowercase content attribute');

test((){
    var track = document.createElement('track');
    track.setAttribute('label', 'FOO');
    assert_equals(track.label, 'FOO');
    assert_equals(track.getAttribute('label'), 'FOO');
}, document.title + ' uppercase content attribute');

test((){
    var track = document.createElement('track');
    track.setAttribute('label', '\u0000');
    assert_equals(track.label, '\u0000');
    assert_equals(track.getAttribute('label'), '\u0000');
}, document.title + '\\u0000 in content attribute');

test((){
    var track = document.createElement('track');
    track.label = 'foo';
    assert_equals(track.label, 'foo');
    assert_equals(track.getAttribute('label'), 'foo');
}, document.title + ' lowercase IDL attribute');

test((){
    var track = document.createElement('track');
    track.label = 'FOO';
    assert_equals(track.label, 'FOO');
    assert_equals(track.getAttribute('label'), 'FOO');
}, document.title + ' uppercase IDL attribute');

test((){
    var track = document.createElement('track');
    track.setAttribute('label', ' foo \n');
    assert_equals(track.label, ' foo \n');
    assert_equals(track.getAttribute('label'), ' foo \n');
}, document.title + ' whitespace in content attribute');

test((){
    var track = document.createElement('track');
    track.label = ' foo \n';
    assert_equals(track.label, ' foo \n');
    assert_equals(track.getAttribute('label'), ' foo \n');
}, document.title + ' whitespace in IDL attribute');

test((){
    var track = document.createElement('track');
    track.label = '\u0000';
    assert_equals(track.label, '\u0000');
    assert_equals(track.getAttribute('label'), '\u0000');
}, document.title + ' \\u0000 in IDL attribute');

   checkTestFailures();
}
