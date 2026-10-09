import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/core/helpers/base_bloc.dart';
import 'package:flutter_application_1/core/helpers/ui_effect.dart';

/// A reusable widget that automatically handles ALL standard [UiEffect]s
/// (SnackBars, Navigation, Keyboard dismissing, etc.) for any screen.
class UiEffectListener<B extends BaseBloc<dynamic, dynamic>> extends StatefulWidget {
  final B bloc;
  final Widget child;

  /// Optional callback if this specific screen has custom effects to handle
  final void Function(BuildContext context, UiEffect effect)? onCustomEffect;

  const UiEffectListener({
    super.key,
    required this.bloc,
    required this.child,
    this.onCustomEffect,
  });

  @override
  State<UiEffectListener<B>> createState() => _UiEffectListenerState<B>();
}

class _UiEffectListenerState<B extends BaseBloc<dynamic, dynamic>>
    extends State<UiEffectListener<B>> {
  StreamSubscription<UiEffect>? _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = widget.bloc.effects.listen(_handleEffect);
  }

  void _handleEffect(UiEffect effect) {
    // 1. Let custom screen handler run first if provided
    widget.onCustomEffect?.call(context, effect);

    // 2. Automatically handle all common built-in effects
    switch (effect) {
      case ShowSnackBarEffect(:final message, :final isError):
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message.asString(context)),
            backgroundColor: isError ? Colors.red : Colors.green,
            behavior: SnackBarBehavior.floating,
          ),
        );

      case NavigateEffect(:final route):
        Get.toNamed(route);

      case NavigationUpEffect():
        Get.back();

      case HideKeyboardEffect():
        FocusScope.of(context).unfocus();

      case OpenUrlEffect(:final url):
        // You can use url_launcher here if installed:
        // launchUrl(Uri.parse(url));
        break;

      case ShowToastEffect(:final message):
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message.asString(context)),
            duration: const Duration(seconds: 1),
          ),
        );
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

