/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";
import "../../resources/check-layout.dart";

const String htmlEL1 = r'''
<style>
.container {
    width: 2000000px;
}
.child {
    display:inline-block;
    background-color: orange;
    height: 10px;
}
td {
    padding: 0;
}
table {
    border-spacing: 0;
    display: inline-table;
    outline: 5px solid salmon;
}
</style>
''';

const String htmlEL2 = r'''
<!-- The inner div should fill the container. It doesn't right now because we artificially limit the table's maxPreferredLogicalWidth to 1000000.
    See the related FIXME in TableLayout.h.
 -->
<div class="container">
    <div style="display:inline-block; border: 5px solid salmon;" data-expected-width=2000000>
        <table style="width:100%; background-color:green; table-layout:fixed"><tr><td>Content</td></tr></table>
    </div>
</div>

<div class="container">
    <!-- The 1 px extra is from the align=right td. -->
    <table data-expected-width=20001>
        <td align=right></td>
        <td width="100%">
            <div class="child" style="width: 10000px"></div><div class="child" style="width: 10000px"></div>
        </td>
    </table>
</div>

<div class="container">
    <!-- The 1 px extra is from the align=right td. -->
    <table data-expected-width=1000001>
        <td align=right></td>
        <td width="100%">
            <div class="child" style="width: 500000px"></div><div class="child" style="width: 500000px"></div>
        </td>
    </table>
</div>

<div class="container">
    <!-- The 1 px extra is from the align=right td. -->
    <table data-expected-width=1500001>
        <td align=right></td>
        <td width="100%">
            <div class="child" style="width: 500000px"></div><div class="child" style="width: 500000px"></div><div class="child" style="width: 500000px"></div>
        </td>
    </table>
</div>
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    checkLayout('.container');
}
