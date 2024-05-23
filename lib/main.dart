import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_portfolio/config/app_theme.dart';
import 'package:flutter_portfolio/core/routing/route_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: RouteService.pages,
      initialRoute: RouteService.homePage,
      unknownRoute: RouteService.pages[0],
      title: "Nitin Jiwnani",
      theme: ThemeData(
        fontFamily: "Satoshi",
        useMaterial3: true,
        primaryColor: Colors.black,
        primarySwatch: Colors.blue,
        fontFamilyFallback: const ["Sen"],
        tooltipTheme: TooltipThemeData(
          waitDuration: const Duration(milliseconds: 500),
          textStyle: AppTheme.fontSize(14).makeMedium(),
          decoration: BoxDecoration(
            color: AppTheme.background,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppTheme.buttonBorder),
          ),
        ),
      ),
    );
  }
}
