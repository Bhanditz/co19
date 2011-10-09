/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.8: The production Atom :: . evaluates as follows:
 *            <ol>
 *            <li>Let A be the set of all characters except LineTerminator.
 *            </li>
 *            <li>Call CharacterSetMatcher(A, false) and return its Matcher
 *            result.</li>
 *            </ol>
 * @description Checks that this Atom is handled correctly.
 * @3rdparty sputnik-v1:S15.10.2.8_A4_T1.js-S15.10.2.8_A4_T9.js
 * @author rodionov
 */
 

main() {
  check(@"ab.de", "abcde", "", 0, ["abcde"]);
  check(@".+", "line 1\nline 2", "", 0, ["line 1"]);
  check(@".*a.*", "this is a test", "", 0, ["this is a test"]);
  check(@".+", @"this is a *&^%$# test", "", 0, [@"this is a *&^%$# test"]);
  check(@".+", "....", "", 0, ["...."]);
  check(@".+", "abcdefghijklmnopqrstuvwxyz", "", 0, ["abcdefghijklmnopqrstuvwxyz"]);
  check(@".+", "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "", 0, ["ABCDEFGHIJKLMNOPQRSTUVWXYZ"]);
  check(@".+", @"`1234567890-=~!@#$%^&*()_+", "", 0, [@"`1234567890-=~!@#$%^&*()_+"]);
  check(@".+", @"""|\[{]};:"',<>.?/""", "", 0, [@"""|\[{]};:"',<>.?/"""]);
}

void check(String pattern, String str, String flags = "", int matchPos = -1, Array<String> expectedGroups = null) {
  Logger.println("\nPattern: \"$pattern\"\n" +
      "String: \"$str\"\n" +
      "Flags: \"$flags\"\n" +
      "Exp. groups: \"$expectedGroups\"");
  RegExp re = new RegExp(pattern, flags);
  Match fm = re.firstMatch(str);
  Logger.println("group count: " + fm.groupCount());
  if(null == fm) {
    Expect.fail("\"$pattern\" !~ \"$str\"");
  }
  if(matchPos >= 0) {
    Expect.equals(matchPos, fm.start(0));
  }
  if(null != expectedGroups) {
    Expect.equals(expectedGroups.length, fm.groupCount() + 1);
    
    for(int i = 0; i <= fm.groupCount(); i++) {
      String expGr = expectedGroups[i];
      String actGr = fm.group(i);
      Logger.println("\t$expGr == $actGr ??");
      if(expGr != actGr) {
        Expect.fail("Mismatch at group $i: \"$expGr\" expected instead of \"$actGr\"");
      }
    }
  }
}

void checkNeg(String pattern, String str, String flags = "") {
  RegExp re = new RegExp(pattern, flags);
  if(null != re.firstMatch(str)) {
    Expect.fail("\"$pattern\" ~ \"$str\"");
  }
}
