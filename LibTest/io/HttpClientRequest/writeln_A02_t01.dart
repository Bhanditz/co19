/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void writeln([Object obj = ""])
 * Converts obj to a String by invoking Object.toString and writes the result to
 * this, followed by a newline.
 *
 * This operation is non-blocking. See flush or done for how to get any errors
 * generated by this call.
 * @description Checks that this method converts obj to a String by invoking
 * Object.toString
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

class C {
  String toString() {
    return "This is C";
  }
}

var localhost = InternetAddress.loopbackIPv4.address;

test(String method) async {
  asyncStart();
  C c = new C();
  HttpServer server = await HttpServer.bind(localhost, 0);
  server.listen((HttpRequest request) {
    request.toList().then((List<List<int>> l) {
      Expect.equals(c.toString() + "\n", new String.fromCharCodes(l[0]));
      request.response.close();
      server.close();
      asyncEnd();
    });
  });

  HttpClient client = new HttpClient();
  client.open(method, localhost, server.port, "")
      .then((HttpClientRequest request) {
    request.contentLength = c.toString().length + 1;
    request.writeln(c);
    return request.close();
  });
}

main() {
  test("get");
  test("head");
  test("delete");
  test("put");
  test("post");
  test("patch");
}
