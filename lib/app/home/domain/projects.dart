import 'package:flutter_portfolio/app/home/domain/project_description.dart';
import 'package:flutter_portfolio/config/app_icons.dart';

class Projects {
  Projects._();

  static List<ProjectShortDescription> get others => [
        ProjectShortDescription(
          icon: AppIcons.lotrconvertor,
          name: "LOTR Convertor App",
          technologies: {
            AppIcons.flutter: "Implemented in SwiftUI",
            AppIcons.server: "Server Code written in Swift",
          },
          info: "Turn currencies into precious treasures with our Lord of the Rings-inspired converter app!",
          url: 'https://github.com/Nitinjiwnani/LOTR-Converter-App',
        ),
        ProjectShortDescription(
          icon: AppIcons.covid19,
          name: "Covid-19 Tracker App",
          technologies: {
            AppIcons.flutter: "Flutter",
            AppIcons.server: "Server Code written in Dart",
          },
          info:
              "App to explore COVID-19 cases worldwide & track by country with interactive pie charts.",
          url: 'https://github.com/Nitinjiwnani/Flutter_Covid-19_Tracker_App',
        ),
        ProjectShortDescription(
          icon: AppIcons.calculator,
          name: "Calculator App",
          technologies: {
            AppIcons.flutter: "Flutter",
            AppIcons.server: "Server Code written in Dart",
            AppIcons.dart: "Dart",
          },
          info:
              "Developed a simple calculator app using the Flutter and the math expressions package.",
          url: 'https://github.com/Nitinjiwnani/calculator_app',
        ),
        ProjectShortDescription(
          icon: AppIcons.whatsappapp,
          name: "Whatsapp UI",
          technologies: {
            AppIcons.flutter: "Flutter",
            AppIcons.server: "Server Code written in Dart",
            AppIcons.dart: "Dart",
          },
          info:
              "Created a clone of the WhatsApp UI using flutter with multiple screens.",
          url: 'https://github.com/Nitinjiwnani/whatsapp_ui',
        ),
      ];
}
