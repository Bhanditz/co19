
library testharness;

import '../../Utils/expect.dart';

test(testFunc(), testName) {
  try {
    testFunc();
  } catch (e) {
    throw '$testName: $e';
  }
}

assert_equals(actual, expected, [reason]) =>
  Expect.equals(expected, actual, reason);

assert_not_equals(actual, expected, [reason]) =>
  Expect.notEquals(expected, actual, reason);

assert_true(actual, [reason]) =>
  Expect.isTrue(actual, reason);

assert_false(actual, [reason]) =>
  Expect.isFalse(actual, reason);

assert_idl_attribute(property, [reason]) {}

assert_throws(func(), [reason]) => Expect.throws(func, null, reason);

assert_array_equals(actual, expected, [reason]) =>
  Expect.listEquals(expected, actual, reason);

assert_approx_equals(num actual,
                           num expected,
                           [num tolerance = null,
                            String reason = null])  =>
   Expect.approxEquals(expected, actual, tolerance, reason);                            