import 'package:flutter/cupertino.dart';
import 'package:flutter_portfolio/app/home/presentation/home_state_machine.dart';
import 'package:flutter_portfolio/config/app_artworks.dart';
import 'package:flutter_portfolio/core/machine/controller.dart';

class HomeController extends Controller<HomeState, HomeEvent> {
  HomeController({required super.uiRebuildCallback})
      : super(stateMachine: HomeStateMachine());

  bool _initialized = false;

  void initialize(BuildContext context) async {
    // Guard: prevents initialize() from running more than once if the widget
    // rebuilds before the async work finishes.
    if (_initialized) return;
    _initialized = true;

    // AppArtworks.rocket is a Lottie JSON *String* path, not an ImageProvider,
    // so precacheImage() cannot be used on it — Lottie handles its own loading.
    // Only the two PNG assets need precaching.
    await precacheImage(AppArtworks.smiley, context);
    await precacheImage(AppArtworks.robot, context);

    onEvent(HomeInitializedEvent());
  }
}