import 'package:flutter/cupertino.dart';
import 'package:flutter_portfolio/app/home/presentation/home_state_machine.dart';
import 'package:flutter_portfolio/config/app_artworks.dart';
import 'package:flutter_portfolio/core/machine/controller.dart';

class HomeController extends Controller<HomeState, HomeEvent> {
  HomeController({required super.uiRebuildCallback})
      : super(stateMachine: HomeStateMachine());

  void initialize(BuildContext context) async {
    (AppArtworks.rocket, context);
    await precacheImage(AppArtworks.smiley, context);
    await precacheImage(AppArtworks.robot, context);
    onEvent(HomeInitializedEvent());
  }
}
