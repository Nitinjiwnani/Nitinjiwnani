import 'package:flutter/material.dart';
import 'package:flutter_portfolio/app/home/presentation/home_controller.dart';
import 'package:flutter_portfolio/app/home/presentation/home_state_machine.dart';
import 'package:flutter_portfolio/app/home/presentation/states/desktop_home_initialized_state_view.dart';
import 'package:flutter_portfolio/app/home/presentation/states/mobile_home_initialized_state_view.dart';
import 'package:flutter_portfolio/app/home/presentation/states/tablet_home_initialized_state_view.dart';
import 'package:flutter_portfolio/constants/pages/loading_page.dart';
import 'package:flutter_portfolio/core/machine/app_page.dart';
import 'package:flutter_portfolio/core/machine/unrecognized_state_handler.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends AppPage<HomeView> {
  late HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = HomeController(
      uiRebuildCallback: rebuild,
    );
  }

  @override
  Widget get desktopView {
    final currentState = controller.getCurrentState();
    switch (currentState.runtimeType) {
      case const (HomeLoadingState):
        controller.initialize(context);
        return const LoadingPage();
      case const (HomeInitializedState):
        return DesktopHomeInitializedStateView(controller: controller);
    }
    return handleState(currentState);
  }

  @override
  Widget get tabletView {
    final currentState = controller.getCurrentState();
    switch (currentState.runtimeType) {
      case const (HomeLoadingState):
        controller.initialize(context);
        return const LoadingPage();
      case const (HomeInitializedState):
        return TabletHomeInitializedStateView(controller: controller);
    }
    return handleState(currentState);
  }

  @override
  Widget get mobileView {
    final currentState = controller.getCurrentState();
    switch (currentState.runtimeType) {
      case const (HomeLoadingState):
        controller.initialize(context);
        return const LoadingPage();
      case const (HomeInitializedState):
        return MobileHomeInitializedStateView(controller: controller);
    }
    return handleState(currentState);
  }
}
