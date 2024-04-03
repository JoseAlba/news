// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints_freezed/adaptive/adaptive.dart';
import 'package:flutter/material.dart';

/// Returns a boolean value whether the window is considered medium or large size.
///
/// Used to build adaptive and responsive layouts.
bool isDisplayDesktop(BuildContext context) =>
    getWindowType(context) >= AdaptiveWindowType.m();

/// Returns boolean value whether the window is considered medium size.
///
/// Used to build adaptive and responsive layouts.
bool isDisplaySmallDesktop(BuildContext context) {
  return getWindowType(context) == AdaptiveWindowType.m();
}

int adaptiveCrossAxisCount(context) {
  AdaptiveWindowType windowType = getWindowType(context);
  if (windowType == AdaptiveWindowType.xs()) {
    return 1;
  }
  if (windowType == AdaptiveWindowType.s()) {
    return 2;
  }
  if (windowType == AdaptiveWindowType.m()) {
    return 3;
  }
  if (windowType == AdaptiveWindowType.l()) {
    return 4;
  }
  if (windowType == AdaptiveWindowType.xl()) {
    return 5;
  }
  return 3;
}
