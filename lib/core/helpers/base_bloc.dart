import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/core/helpers/ui_effect.dart';

abstract class BaseBloc<Event, State> extends Bloc<Event, State> {
  final _effectController = StreamController<UiEffect>.broadcast();
  
  /// The stream of one-off UI effects for the UI to listen to
  Stream<UiEffect> get effects => _effectController.stream;

  BaseBloc(super.initialState);

  /// Call this to send an effect to the UI (like Kotlin's channel.send)
  void emitEffect(UiEffect effect) {
    if (!_effectController.isClosed) {
      _effectController.add(effect);
    }
  }

  @override
  Future<void> close() {
    _effectController.close();
    return super.close();
  }
}

