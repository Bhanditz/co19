/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.12: The production CharacterClassEscape :: w evaluates by
 *            returning the set of characters containing the sixty-three
 *            characters: a b c d e f g h i j k l m n o p q r s t u v w x y z A
 *            B C D E F G H I J K L M N O P Q R S T U V W X Y Z 0 1 2 3 4 5 6 7
 *            8 9 _
 * @description Checks that \w indeed matches only the specified characters
 *              (tested vs all characters from the basic plane)
 * @3rdparty sputnik-v1:S15.10.2.12_A3_T1.js-S15.10.2.12_A3_T5.js
 * @author rodionov
 */
 

main() {
  RegExp re = new RegExp("\\w", "g");
  for (int alpha = 0x0000; alpha <= 0xFFFF; alpha++) {
    String ch = new String.fromCharCodes([alpha]);
    switch(true) {
      case alpha >= 0x0030 && alpha <= 0x0039: // the 10 digits
      case alpha >= 0x0041 && alpha <= 0x005A: // the uppercase english
                                                // letters
      case alpha >= 0x0061 && alpha <= 0x007A: // the lowercase english
                                                // letters
      case alpha == 0x005F: // the underscore
        if(null == re.firstMatch(ch)) {
          Expect.fail("\\w !~ '$ch'");
        }
        break;
      default:
        if(null != re.firstMatch(ch)) {
          Expect.fail("\\w ~ '$ch'");
        }
        break;
    }
  }
}
