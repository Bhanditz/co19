/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test parsing of the CSS wrap-flow property.
 */
import "parsing-test-utils.dart";

main() {
  // The test functions and globals used here are defined parsing-test-utils.js.

  applyToEachArglist(
      testExclusionSpecifiedProperty,
      [// [property, value, expectedValue]
      ["-webkit-wrap-flow", "auto", "auto"],
      ["-webkit-wrap-flow", "both", "both"],
      ["-webkit-wrap-flow", "start", "start"],
      ["-webkit-wrap-flow", "end", "end"],
      ["-webkit-wrap-flow", "maximum", "maximum"],
      ["-webkit-wrap-flow", "clear", "clear"],
      ["-webkit-wrap-flow", ";", ""],
      ["-webkit-wrap-flow", "5", ""],
      ["-webkit-wrap-flow", "-1.2", ""],
      ["-webkit-wrap-flow", "\'string\'", ""]]
      );

  applyToEachArglist(
      testExclusionComputedProperty,
      [// [property, value, expectedValue]
      ["-webkit-wrap-flow", "auto", "auto"],
      ["-webkit-wrap-flow", "5", "auto"],
      ["-webkit-wrap-flow", "\'string\'", "auto"]]
      );

  applyToEachArglist(
      testNotInheritedExclusionChildProperty,
      [// [property, parentValue, childValue, expectedChildValue]
      ["-webkit-wrap-flow", "auto", "start", "start"],
      ["-webkit-wrap-flow", "end", "auto", "auto"],
      ["-webkit-wrap-flow", "both", "clear", "clear"]]
      );
}
