import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_portfolio/app/home/presentation/home_controller.dart';
import 'package:flutter_portfolio/app/home/presentation/widgets/nav_button.dart';
import 'package:flutter_portfolio/config/app_theme.dart';

class TopPanel extends StatefulWidget {
  const TopPanel({
    super.key,
    required this.controller,
    required this.scrollController,
  });

  final HomeController controller;
  final ScrollController scrollController;

  @override
  State<TopPanel> createState() => _TopPanelState();
}

class _TopPanelState extends State<TopPanel> {
  Map<String, VoidCallback> navs = {};
  bool show = true;
  bool showShadow = false;

  void _scrollTo(double offset) async {
    await Future.delayed(const Duration(milliseconds: 500));
    widget.scrollController.animateTo(
      offset,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInCubic,
    );
  }

  @override
  void initState() {
    super.initState();
    navs = {
      "About": () => _scrollTo(1100),
      "Skills": () => _scrollTo(2050),
      "Technologies": () => _scrollTo(3100),
      "Projects": () => _scrollTo(4000),
      "Experience": () => _scrollTo(5950),
    };
    widget.scrollController.addListener(() {
      final scrollingUp =
          widget.scrollController.position.userScrollDirection ==
              ScrollDirection.forward;
      final atTop = widget.scrollController.offset == 0;
      if (show != scrollingUp) {
        setState(() {
          show = scrollingUp;
        });
      }
      if (showShadow == atTop) {
        setState(() {
          showShadow = !atTop;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      offset: show ? const Offset(0, 0) : const Offset(0, -1),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: MediaQuery.sizeOf(context).width,
        height: 72,
        decoration: BoxDecoration(
          color: AppTheme.background,
          boxShadow: showShadow
              ? [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                  ),
                ]
              : [],
        ),
        child: FittedBox(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: 1280,
            height: 72,
            decoration: BoxDecoration(
              color: AppTheme.background,
            ),
            padding: EdgeInsets.symmetric(horizontal: show ? 10 : 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Nitin Jiwnani",
                      style: AppTheme.fontSize(21).makeBold().useSen(),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Wrap(
                      spacing: 10,
                      children: navs.entries
                          .map(
                              (e) => NavButton(text: e.key, onPressed: e.value))
                          .toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
