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
            'Proficiency in Responsive Designs':
                SkillDescription(tooltip: "This page too, is responsive"),
            'Payment Integrations': SkillDescription(
                tooltip: "I have worked with CCAvenue Payment Gateway"),
            'Versatility Across Platforms': SkillDescription(
                tooltip:
                    "Developed applications compatible with both Android and iOS platforms."),
            'Innovation in Desktop App Development':
                SkillDescription(tooltip: "See the projects section below"),
          },
        ),
        SkillEntity(
          name: "Firebase",
          icon: AppIcons.firebase,
          points: {
            'Firebase Authentication': SkillDescription(
                tooltip:
                    "Securely authenticate users with Firebase Authentication and OpenID Connect."),
            'Cloud Firestore': SkillDescription(
                tooltip:
                    "Realtime NoSQL database for storing and syncing data."),
            'Realtime Database': SkillDescription(
                tooltip:
                    "Cloud-hosted database storing JSON data in real-time."),
            'Remote Config': SkillDescription(
                tooltip:
                    "Dynamic configuration of your app's behavior in real-time without requiring an app update."),
            'Cloud Hosting': SkillDescription(
                tooltip:
                    "Host your web apps with Firebase Hosting, serving content fast and reliably."),
            'Cloud Functions': SkillDescription(
                tooltip:
                    "Run backend code in response to events triggered by Firebase features and HTTPS requests."),
          },
        ),
        SkillEntity(
          name: "Android",
          icon: AppIcons.android,
          points: {
            'Experience with Google Play Console': SkillDescription(
                tooltip:
                    "Managed and published multiple apps on the Google Play Store using Google Play Console"),
            'Crafted Android Apps with Flutter': SkillDescription(
                tooltip:
                    "Developed Android applications using Flutter framework with Firebase Integration"),
            'Custom File Picking Method Channels': SkillDescription(
                tooltip:
                    "Implemented custom method channels for Android to enable file picking functionality"),
            'Created various e-commerce apps': SkillDescription(
                tooltip:
                    "Developed multiple e-commerce applications for Android platform, including a personal store app to order groceries and daily needs online"),
          },
        ),
        SkillEntity(
          name: "iOS Development",
          icon: AppIcons.ios,
          points: {
            "Flutter for iOS": SkillDescription(
                tooltip:
                    "Can leverage Flutter for cross-platform iOS development"),
            "Swift Development": SkillDescription(
                tooltip: "Experience building native iOS apps"),
            "Web APIs and Data Persistence": SkillDescription(
                tooltip:
                    "Experience with web APIs, databases (Firebase, Core Data, etc.)"),
          },
        ),
        SkillEntity(
          name: "Web & Database",
          icon: AppIcons.web,
          points: {
            'Adaptive Web Designing': SkillDescription(
                tooltip:
                    "Designed websites that adapt gracefully to various screen sizes and devices"),
            'Web Apps written with Flutter': SkillDescription(
                tooltip: "Developed an entire web app using Flutter"),
            'SQL, JSON, and Firestore Databases': SkillDescription(
                tooltip:
                    "Experience working with Firebase, MySQL, JSON SQLite, etc"),
          },
        ),
        SkillEntity(
          name: "Figma",
          icon: AppIcons.figma,
          points: {
            'Versatile Design Portfolio': SkillDescription(
                tooltip:
                    "Crafted user interfaces for desktop, tablet, and mobile apps"),
            'Personal Design Implementations': SkillDescription(
                tooltip:
                    "Executed personal design concepts across diverse projects"),
            'Modern Design Styles Mastery': SkillDescription(
                tooltip:
                    "Expertise in neomorphism and glassmorphism design techniques"),
            'Precise UI to Code Conversion': SkillDescription(
                tooltip:
                    "Proficient in translating UI designs into code with accuracy"),
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
            'Cloud DNS': SkillDescription(
                tooltip:
                    "Domain Name System service provided by Google Cloud Platform"),
            'Custom Domain Connection': SkillDescription(
                tooltip:
                    "Configured custom domain connections for web applications"),
            'Cloud Functions': SkillDescription(
                tooltip:
                    "Serverless compute service that runs code in response to events"),
            'Cloud Domains': SkillDescription(
                tooltip:
                    "Managed domain registration service offered by Google Cloud"),
            'Load Balancing': SkillDescription(
                tooltip:
                    "Distributed load balancing service for distributing traffic across instances"),
          },
        ),
      ];
}
