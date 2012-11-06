/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An identiﬁer expression that denotes a constant variable or a class
 * is a constant expression.
 * @description Checks that an identiﬁer expression that denotes a constant variable
 * can be assigned to a constant variable.
 * @author kaigorodov
 */

const a = 1;
const b = a;

main() {
  print(a);
}
