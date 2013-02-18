/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let s1,...,sn be those try statements that are both
 * enclosed in sE and that enclose sc, and that have a finally clause. Lastly, let
 * fj be the finally clause of sj, 1 <= j <= n. Executing sc first executes f1,...,fn
 * in innermost-clause-first order. Then, if sE is a case clause, control is transferred
 * to the case clause. Otherwise, sE is necessarily a loop and execution resumes
 * after the last statement in the loop body.
 * @description Checks that the execution of "continue L;" statement transfers control to
 * the innermost enclosing 'do' statement with the appropriate label and that all 
 * finally clauses between them are executed in the innermost-clause-first order.
 * @author rodionov
 * @reviewer iefremov
 */
import "../../Utils/expect.dart";

main() {
  List order = new List();
  
  L: do {
    try {
      try {
        try {
          if(order.length < 3) {
            continue L;
            Expect.fail("This code shouldn't be executed");
          }
          break L;
        } catch(e) {
          Expect.fail("Unexpected exception: $e");
        } finally {
          order.add(3);
        }
        Expect.fail("This code shouldn't be executed");
      } finally {
        order.add(2);
      }
      Expect.fail("This code shouldn't be executed");
    } finally {
      order.add(1);
    }
    Expect.fail("This code shouldn't be executed");
  } while(false);
  
  Expect.listEquals([3, 2, 1], order);
}
