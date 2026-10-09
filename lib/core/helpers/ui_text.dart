import 'package:flutter/material.dart';

sealed class UiText {
  String asString(BuildContext context) {
    return switch (this) {
      
      DynamicText(:final text) => text,
      StringResource(:final res) => res(context),
    };
  }
}

class DynamicText extends UiText {
  final String text;
  DynamicText(this.text);
}

class StringResource extends UiText {
  final String Function(BuildContext context) res;
  StringResource(this.res);
}
