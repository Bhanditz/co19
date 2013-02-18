/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Future<T> whenComplete(action())
 * If the call to action returns a Future, f2, then completion of f is delayed until
 * f2 completes. If f2 completes with an error, that will be the result of f too.
 * @description Checks that if the call to action returns a Future, f2, then completion
 * of f is delayed until f2 completes. Checks that if f2 completes with an error,
 * that will be the result of f too.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

import "dart:async";

main() {
  int value = 20;
  var value2 = null;
  
  Completer completer = new Completer();
  Future f0 = completer.future;
  Completer completer2 = new Completer();
  Future f2 = completer2.future;
  Future f=f0.whenComplete((){return f2;});

  f.then((var v) {print("v=$v");},
    onError: (AsyncError e){print("e=$e"); value2=e.error;});
 
  completer.complete(1);

  new Future.delayed(0, (){
    Expect.isNull(value2);
  });
 
  completer2.completeError(value);

  new Future.delayed(0, (){
    Expect.equals(value, value2);
  });
}

