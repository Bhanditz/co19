/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.7: The production QuantifierPrefix :: ? evaluates by
 *            returning the two results 0 and 1.
 * @description Checks that this quantifier is applied correctly in various
 *              scenarios.
 * @3rdparty sputnik-v1:S15.10.2.7_A5_T1.js-S15.10.2.7_A5_T12.js
 * @author rodionov
 */
 

main() {
  check("java(script)?", "state: javascript is an extension of ecma script", "", 7, ["javascript", "script"]);
  check("java(script)?", "state: java and javascript are vastly different", "", 7, ["java", ""]);
  checkNeg("java(script)?", "state: both Java and JavaScript used in web development");
  check("cd?e", "abcdef", "", 2, ["cde"]);
  check("cdx?e", "abcdef", "", 2, ["cde"]);
  check("o?pqrst", "pqrstuvw", "", 0, ["pqrst"]);
  check("x?y?z?", "abcdef", "", 0, [""]);
  check("x?ay?bz?c", "abcdef", "", 0, ["abc"]);
  check("b?b?b?b", "abbbbc", "", 1, ["bbbb"]);
  check("ab?c?d?x?y?z", "123az789", "", 3, ["az"]);
  check(@"\??\??\??\??\??", "?????", "", 0, ["?????"]);
  check(".?.?.?.?.?.?.?", "test", "", 0, ["test"]);
}

void check(String pattern, String str, String flags = "", int matchPos = -1, Array<String> expectedGroups = null) {
  RegExp re = new RegExp(pattern, flags);
  Match fm = re.firstMatch(str);
  Logger.println("\nPattern: \"$pattern\"\n" +
      "String: \"$str\"\n" + 
      "Flags: \"$flags\"\n" + 
      "Exp. groups: \"$expectedGroups\"");
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
      Logger.println("\tgroup $i: $expGr == $actGr ??");
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
