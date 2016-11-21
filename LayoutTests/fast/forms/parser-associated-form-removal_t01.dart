/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Form controls associated with a form by the parser should be
 * reset when that form leaves their tree.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <style>
      table { display: none; }
      </style>
      <table id="table1">
        <form>
          <td><input></td>
        </form>
      </table>
      <table id="table2">
        <form>
          <td><input></td>
        </form>
      </table>
      ''', treeSanitizer: new NullTreeSanitizer());

  debug('Removing a form from the document while leaving its associated element in...');
  InputElement input = document.body.querySelector("input") as InputElement;
  document.body.querySelectorAll('form')[0].remove();
  shouldBeNull(input.form);

  debug('');
  debug('Removing a form and its associated element...');
  TableElement table2 = document.getElementById('table2') as TableElement;
  table2.remove();
  shouldBeNonNull((table2.querySelector("input") as InputElement).form);

  debug('...and then removing the form.');
  table2.querySelector('form').remove();
  shouldBeNull((table2.querySelector("input") as InputElement).form);
}
