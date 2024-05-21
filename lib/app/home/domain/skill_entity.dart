import 'package:flutter/cupertino.dart';
import 'package:flutter_portfolio/config/app_icons.dart';

class SkillDescription {
  final String? tooltip;
  final String? url;

  SkillDescription({this.tooltip, this.url});

  bool get isNotEmpty => tooltip != null || url != null;
}

class SkillEntity {
  final String name;
  final ImageProvider icon;
  final Map<String, SkillDescription> points;

  SkillEntity({
    required this.name,
    required this.icon,
    required this.points,
  });

  static List<SkillEntity> get skillSet => [
        SkillEntity(
          name: "Dart & Flutter",
          icon: AppIcons.flutter,
          points: {
            'Method Channels': SkillDescription(
                tooltip: "Like custom file picking channel for Android"),
            'Responsive Designs':
                SkillDescription(tooltip: "This page too, is responsive"),
            'Payment Integrations': SkillDescription(
                tooltip: "I have worked with CCAvenue Payment Gateway"),
            'Worked with All platforms': SkillDescription(),
            'Crafted Cutting-edge Desktop Apps':
                SkillDescription(tooltip: "See the projects section below"),
          },
        ),
        SkillEntity(
          name: "Firebase",
          icon: AppIcons.firebase,
          points: {
            'Cloud Firestore': SkillDescription(),
            'Realtime Database': SkillDescription(),
            'Authentication plus Open ID Connect': SkillDescription(),
            'Cloud Hosting': SkillDescription(),
            'Remote Config': SkillDescription(),
            'Cloud Functions': SkillDescription(),
          },
        ),
        SkillEntity(
          name: "Android",
          icon: AppIcons.android,
          points: {
            'Crafted Android Apps with Flutter':
                SkillDescription(tooltip: "with Firebase Integration"),
            'Custom File Picking Method Channels': SkillDescription(),
            'Created various e-commerce apps': SkillDescription(
                tooltip:
                    "Personal store app to order groceries and daily needs online"),
            'Experience with Google Play Console': SkillDescription(
                tooltip: "Uploaded multiple apps on Google Play Store"),
          },
        ),
        // SkillEntity(
        //   name: "Artificial Intelligence & Python",
        //   icon: AppIcons.ai,
        //   points: {
        //     'Creator of Linux Voice Control':
        //         SkillDescription(tooltip: "It can do anything"),
        //     'Remote File Transfer Program': SkillDescription(
        //         tooltip:
        //             "A program to copy files between Android's Termux and Desktop"),
        //     'Flutter Hot Reload plugin for Gedit': SkillDescription(
        //         tooltip: "Awesome Flutter support for Gnome's Gedit"),
        //     'Master Mode Voice Control with Python':
        //         SkillDescription(tooltip: "Yeah, this is your personal jarvis"),
        //   },
        // ),
        SkillEntity(name: "iOS Development", icon: AppIcons.ios, points: {
          "Flutter for iOS": SkillDescription(
              tooltip:
                  "Can leverage Flutter for cross-platform iOS development"),
          "Swift Development":
              SkillDescription(tooltip: "Experience building native iOS apps"),
          "Web APIs and Data Persistence": SkillDescription(
              tooltip:
                  "Experience with web APIs, databases (Firebase, Core Data, etc.)"),
        }),
        SkillEntity(
          name: "Web & Database",
          icon: AppIcons.web,
          points: {
            'Web Apps written with Flutter':
                SkillDescription(tooltip: "I wrote an entire web app"),
            'Adaptive Web Designing': SkillDescription(),
            'SQL, JSON, and Firestore Databases': SkillDescription(
                tooltip:
                    "Experience working with Firebase, MySQL, JSON SQLite, etc"),
          },
        ),
        SkillEntity(
          name: "Figma",
          icon: AppIcons.figma,
          points: {
            'Desktop, Tablet & Mobile App Designs': SkillDescription(),
            'My Own Design Implementations': SkillDescription(),
            'Neomorphism & Glass Designs': SkillDescription(),
            'UI to Code, perfect cloning': SkillDescription(
                tooltip: "I can give life to any design with Flutter"),
          },
        ),
        SkillEntity(
            name: "C++ & Object-Oriented Programming (OOP)",
            icon:
                AppIcons.cplus, // Assuming AppIcons is your enum for app icons
            points: {
              "Strong OOP Concepts": SkillDescription(
                  tooltip:
                      "Proficient in applying OOP concepts in C++ (classes, inheritance, polymorphism, etc.)"),
              "C++ Libraries and Frameworks": SkillDescription(
                  tooltip:
                      "Experience with standard libraries (STL, Boost) and potential for using C++ frameworks (Qt, etc.)"),
              "Performance Optimization": SkillDescription(
                  tooltip:
                      "Experience in optimizing C++ code for efficiency and memory management"), // Add your specific experience here
            }),
        SkillEntity(
          name: "Google Cloud Platform",
          icon: AppIcons.gcp,
          points: {
            'Cloud DNS': SkillDescription(),
            'Custom Domain Connection': SkillDescription(),
            'Cloud Functions': SkillDescription(),
            'Cloud Domains': SkillDescription(),
            'Load Balancing': SkillDescription(),
          },
        ),
        // SkillEntity(
        //   name: "Linux Platform",
        //   icon: AppIcons.linux,
        //   points: {
        //     'Shell Scripting': SkillDescription(),
        //     'System Administration': SkillDescription(),
        //     'Written System Daemon Services': SkillDescription(
        //         tooltip: "A full-fledged storage and clipboard manager"),
        //     'Crafted Apps with Native Integrations':
        //         SkillDescription(tooltip: "Yes, Flutter + Python + Bash"),
        //     'Linux is my home platform': SkillDescription(
        //         tooltip:
        //             "⚡ Ubuntu, Arch or Fedora, I have worked with all of them"),
        //   },
        // ),
      ];
}
