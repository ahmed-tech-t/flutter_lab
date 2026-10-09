import 'package:flutter_application_1/core/helpers/ui_text.dart';

sealed class UiEffect {}

// Common effects shared by almost every screen:
final class ShowSnackBarEffect extends UiEffect {
  final UiText message;
  final bool isError;
  ShowSnackBarEffect(this.message, {this.isError = false});
}

final class NavigateEffect extends UiEffect {
  final String route;
  NavigateEffect(this.route);
}

final class ShowToastEffect extends UiEffect {
  final UiText message;
  ShowToastEffect(this.message);
}

// 1. Like Kotlin: data object HideKeyboard : UiEvent()
final class HideKeyboardEffect extends UiEffect {}

// 2. Like Kotlin: data object NavigationUp : UiEvent()
final class NavigationUpEffect extends UiEffect {}

// 3. Like Kotlin: data class OpenUrl(val url: String) : UiEvent()
final class OpenUrlEffect extends UiEffect {
  final String url;
  OpenUrlEffect(this.url);
}