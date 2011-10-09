/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Writes specified string [str] to the output stream.
 * @description Try to pass not String object as [str]
 * @author msyabro
 * @needsreview 
 */


main() {
  StringBuffer sb = new StringBuffer();
  try {
    sb.writeString(1);
    Expect.fail("NoSuchMethodException is expected");
  } catch(NoSuchMethodException e) {} //method isEmpty() is needed
}
