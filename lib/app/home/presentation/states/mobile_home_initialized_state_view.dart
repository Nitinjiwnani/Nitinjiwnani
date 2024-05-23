import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_portfolio/app/home/domain/about_me.dart';
import 'package:flutter_portfolio/app/home/domain/project_description.dart';
import 'package:flutter_portfolio/app/home/domain/projects.dart';
import 'package:flutter_portfolio/app/home/domain/skill_entity.dart';
import 'package:flutter_portfolio/app/home/domain/technologies.dart';
import 'package:flutter_portfolio/app/home/presentation/home_controller.dart';
import 'package:flutter_portfolio/app/home/presentation/panels/side_panel.dart';
import 'package:flutter_portfolio/app/home/presentation/widgets/favourite_music_player.dart';
import 'package:flutter_portfolio/app/home/presentation/widgets/link_button.dart';
import 'package:flutter_portfolio/app/home/presentation/widgets/project_card.dart';
import 'package:flutter_portfolio/app/home/presentation/widgets/project_mini_card.dart';
import 'package:flutter_portfolio/app/home/presentation/widgets/skill_card.dart';
import 'package:flutter_portfolio/config/app_artworks.dart';
import 'package:flutter_portfolio/config/app_icons.dart';
import 'package:flutter_portfolio/config/app_images.dart';
import 'package:flutter_portfolio/config/app_theme.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MobileHomeInitializedStateView extends StatefulWidget {
  const MobileHomeInitializedStateView({super.key, required this.controller});

  final HomeController controller;

  @override
  State<MobileHomeInitializedStateView> createState() =>
      _MobileHomeInitializedStateViewState();
}

class _MobileHomeInitializedStateViewState
    extends State<MobileHomeInitializedStateView>
    with SingleTickerProviderStateMixin<MobileHomeInitializedStateView> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  const Gap(30),
                  Text(
                    "Hi! I'm Nitin",
                    style: AppTheme.fontSize(36).makeBold(),
                  ),
                  Text(
                    "Application Developer",
                    style: AppTheme.fontSize(20)
                        .makeMedium()
                        .withColor(AppTheme.foregroundLighter),
                  ),
                  const Gap(10),
                  Text(
                    "I focus on delivering forward-thinking software and design creations.",
                    style: AppTheme.fontSize(12).makeMedium(),
                    textAlign: TextAlign.center,
                  ),
                  Lottie.asset(
                    AppArtworks.rocket,
                    repeat: true,
                    width: 1280,
                    height: 550,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 160,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: AppTheme.aboutBackground,
                    ),
                    child: Center(
                      child: Text(
                        "A determined and self-taught developer, valued for consistently delivering reliable technological solutions and advancements.",
                        textAlign: TextAlign.center,
                        style: AppTheme.fontSize(16).makeBold(),
                      ),
                    ),
                  ),
                  const Gap(50),
                  Container(
                    width: 1280,
                    decoration: BoxDecoration(
                      color: AppTheme.background,
                    ),
                    child: Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Image(
                              image: AppArtworks.smiley,
                              width: 402 / 2,
                            ),
                            const Gap(20),
                            Text(
                              "I love music, and I love coding. And when I'm coding, I'm listening to music. 🎧",
                              style: AppTheme.fontSize(14).makeMedium(),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "This one's my favourite",
                              style: AppTheme.fontSize(14).makeMedium(),
                            ),
                            const Gap(20),
                            const FavouriteMusicPlayer(),
                            const Gap(20),
                            const LinkButton(
                              text: "Instagram",
                              image: AppIcons.instagram,
                              hoverColor: Colors.pink,
                              url: AboutMe.instagramUrl,
                            ),
                          ],
                        ),
                        const Gap(50),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 600,
                            child: Wrap(
                              runSpacing: 25,
                              children: AboutMe.paragraphs.map(
                                (e) {
                                  return Text(
                                    e,
                                    textAlign: TextAlign.center,
                                    style: AppTheme.fontSize(12).makeMedium(),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(50),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    color: AppTheme.background,
                    child: Column(
                      children: [
                        Text(
                          "Skill Showcase",
                          style: AppTheme.fontSize(36).makeBold(),
                        ),
                        Text(
                          "“Where Craft Meets Capability”",
                          style:
                              AppTheme.fontSize(16).makeMedium().makeItalic(),
                        ),
                        const Gap(50),
                        SizedBox(
                          width: 1280,
                          child: Center(
                            child: Wrap(
                              spacing: 25,
                              runSpacing: 25,
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: SkillEntity.skillSet
                                  .map((e) => SkillCard(skill: e))
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(100),
                  SizedBox(
                    width: 1280,
                    child: Column(
                      children: [
                        Text(
                          "Technologies",
                          style: AppTheme.fontSize(36).makeBold(),
                        ),
                        Text(
                          "“A forward-thinking array”",
                          style:
                              AppTheme.fontSize(16).makeMedium().makeItalic(),
                        ),
                        const Image(
                          image: AppArtworks.robot,
                          width: 960,
                        ),
                        const Gap(20),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 750,
                            child: Text(
                              Technologies.short,
                              textAlign: TextAlign.center,
                              style: AppTheme.fontSize(12).makeMedium(),
                            ),
                          ),
                        ),
                        const Gap(15),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Let's connect and collaborate on impactful projects! 😉",
                            textAlign: TextAlign.center,
                            style:
                                AppTheme.fontSize(13).makeMedium().makeBold(),
                          ),
                        ),
                        const Gap(20),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const LinkButton(
                              text: "Whatsapp",
                              url: AboutMe.whatsappUrl,
                              image: AppIcons.whatsapp,
                              hoverColor: Colors.green,
                            ),
                            const Gap(15),
                            LinkButton(
                              text: "Gmail",
                              url: AboutMe.androidgmailurl,
                              image: AppIcons.gmail,
                              hoverColor: Colors.blue.shade200,
                              hoverTextColor: AppTheme.foreground,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Gap(50),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    color: AppTheme.background,
                    child: Center(
                      child: SizedBox(
                        width: 1280,
                        child: Column(
                          children: [
                            const Gap(50),
                            Text(
                              "Portfolio Showcase",
                              style: AppTheme.fontSize(36).makeBold(),
                            ),
                            Text(
                              "“Explore a mix of my professional endeavors and personal projects below”",
                              style: AppTheme.fontSize(16)
                                  .makeMedium()
                                  .makeItalic(),
                              textAlign: TextAlign.center,
                            ),
                            const Gap(50),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Wrap(
                                spacing: 50,
                                runSpacing: 50,
                                runAlignment: WrapAlignment.center,
                                alignment: WrapAlignment.center,
                                children: [
                                  ProjectCard(
                                    mobileMode: true,
                                    gradientColors: const [
                                      Color(0xFF001F3F),
                                      Color(0xFF00285E),
                                    ],
                                    image: AppImages.kiranafast,
                                    height: 350,
                                    imageWidth: 468.75 * .9,
                                    playbackVideoUrl:
                                        "https://firebasestorage.googleapis.com/v0/b/flutter-web-app-39833.appspot.com/o/1716298313600540.mp4?alt=media&token=4080cb15-9dae-4ce4-a9c7-19967643bb10",
                                    description: ProjectDescription(
                                      name: "Kirana Fast",
                                      technologies: [
                                        "Flutter",
                                        "Firebase",
                                        "Google Cloud Platform",
                                        "SQLite",
                                      ],
                                      info:
                                          "Manage inventory and create bills easily with Kirana Fast,\nthe easiest all-in-one inventory management and billing app.",
                                      url: 'https://www.kiranafast.com/',
                                    ),
                                    onVideoPlaying: () {},
                                  ),
                                  ProjectCard(
                                    mobileMode: true,
                                    gradientColors: const [
                                      Color(0xFF003F1F),
                                      Color(0xFF004F2E),
                                    ],
                                    image: AppImages.scoodel,
                                    height: 350,
                                    imageWidth: 468.75 * .9,
                                    playbackVideoUrl:
                                        "https://firebasestorage.googleapis.com/v0/b/flutter-web-app-39833.appspot.com/o/scoodel.mp4?alt=media&token=a19f2ab2-c945-4c9b-b4a1-626862f3bc06",
                                    description: ProjectDescription(
                                      name: "Scoodel",
                                      technologies: [
                                        "Flutter",
                                        "Firebase",
                                        "Rest API",
                                        "Web Socket",
                                        "Django",
                                        "Python",
                                      ],
                                      info:
                                          "ScooDel is an application, developed to avail exclusive hyper local deliveries as well as bike taxi services to all the customers in multiple cities.",
                                      url: 'https://www.goscoodel.com/',
                                    ),
                                    onVideoPlaying: () {},
                                  ),
                                  ProjectCard(
                                    mobileMode: true,
                                    gradientColors: const [
                                      Color(0xFF1F003F),
                                      Color(0xFF2E004F),
                                    ],
                                    image: AppImages.relaxapp,
                                    height: 350,
                                    imageWidth: 528.5 * 0.7,
                                    playbackVideoUrl:
                                        "https://firebasestorage.googleapis.com/v0/b/flutter-web-app-39833.appspot.com/o/dreemz.mp4?alt=media&token=66d55e98-d998-47f1-bd84-157160a14855",
                                    description: ProjectDescription(
                                      name: "Relax - Sleep Wellness App",
                                      technologies: [
                                        "Flutter",
                                        "Firebase",
                                        "Node js.",
                                      ],
                                      info:
                                          "Welcome to Relax, your ultimate sleep companion. Unwind, de-stress, and discover the sleep you deserve with our complete sleep wellness app. Designed to provide a tranquil experience, Relax offers curated content to help you unwind, fall asleep faster, and wake up refreshed.",
                                      url:
                                          'https://apps.apple.com/in/app/relax-sleep-wellness-app/id6449683947',
                                    ),
                                    onVideoPlaying: () {},
                                  ),
                                  ProjectCard(
                                    mobileMode: true,
                                    gradientColors: const [
                                      Color(0xFF3F1F00),
                                      Color(0xFF4F2E00),
                                    ],
                                    image: AppImages.goaviralnews,
                                    height: 350,
                                    imageWidth: 528.5 * 0.7,
                                    playbackVideoUrl:
                                        "https://firebasestorage.googleapis.com/v0/b/flutter-web-app-39833.appspot.com/o/goa_viral_news.mp4?alt=media&token=55f1fbd3-b1ce-4350-a372-e7da3254c4e7",
                                    description: ProjectDescription(
                                      name: "Goa Viral News",
                                      technologies: [
                                        "Flutter",
                                        "Firestore Database",
                                        "Firebase",
                                      ],
                                      info:
                                          "Introducing Goa Viral News - Your Ultimate Travel Companion! Get ready for an unforgettable Goan adventure with personalized travel plans, vibrant nightlife, pristine beaches, hidden waterfalls, thrilling sports, and updates.",
                                      url:
                                          'https://play.google.com/store/apps/details?id=com.goaviralnews.goaviralnews&hl=en&gl=US',
                                    ),
                                    onVideoPlaying: () {},
                                  ),
                                ],
                              ),
                            ),
                            const Gap(50),
                            Wrap(
                              spacing: 25,
                              runSpacing: 25,
                              runAlignment: WrapAlignment.center,
                              alignment: WrapAlignment.center,
                              children: Projects.others
                                  .map((e) => ProjectMiniCard(description: e))
                                  .toList(),
                            ),
                            const Gap(25),
                            const LinkButton(
                              text: "Visit My Github Profile",
                              url: 'https://github.com/Nitinjiwnani',
                              image: AppIcons.github,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Gap(40),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    color: AppTheme.background,
                    child: Column(
                      children: [
                        const Gap(50),
                        Text(
                          "Experience",
                          style: AppTheme.fontSize(36).makeBold(),
                        ),
                        Text(
                          "“Skillset beyond expectations”",
                          style:
                              AppTheme.fontSize(16).makeMedium().makeItalic(),
                        ),
                        const Gap(25),
                        const LinkButton(
                          text: "Grab My Resume",
                          image: AppIcons.resume,
                          url: AboutMe.resumeUrl,
                        ),
                        const Gap(25),
                        Text(
                          "Products I've contributed to during my tenure with various companies",
                          style: AppTheme.fontSize(22).makeMedium(),
                          textAlign: TextAlign.center,
                        ),
                        const Gap(35),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                launchUrlString('https://www.goscoodel.com/');
                              },
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.25),
                                        blurRadius: 16,
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: const Image(
                                      image: AppIcons.scoodellogo,
                                      width: 65,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Gap(20),
                            GestureDetector(
                              onTap: () {
                                launchUrlString(
                                    'https://apps.apple.com/in/app/relax-sleep-wellness-app/id6449683947');
                              },
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.25),
                                        blurRadius: 16,
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: const Image(
                                      image: AppIcons.relaxalogo,
                                      width: 65,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Gap(20),
                            GestureDetector(
                              onTap: () {
                                launchUrlString('https://kiranafast.com');
                              },
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.25),
                                        blurRadius: 16,
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: const Image(
                                      image: AppIcons.kiranafast,
                                      width: 65,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Gap(20),
                            GestureDetector(
                              onTap: () {
                                launchUrlString('https://www.billingfast.com/');
                              },
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.25),
                                        blurRadius: 16,
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: const Image(
                                      image: AppIcons.billingfast,
                                      width: 65,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Gap(80),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      color: AppTheme.background,
                      child: Center(
                        child: SizedBox(
                          width: 700,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Nitin Jiwnani",
                                    style: AppTheme.fontSize(16)
                                        .makeBold()
                                        .useSen(),
                                  ),
                                ],
                              ),
                              const Gap(15),
                              GestureDetector(
                                onTap: () {
                                  launchUrlString(AboutMe.androidgmailurl);
                                },
                                child: Text(
                                  "jiwnani01@gmail.com",
                                  style: AppTheme.fontSize(14)
                                      .makeMedium()
                                      .useSen(),
                                ),
                              ),
                              const Gap(10),
                              Row(
                                children: [
                                  Text(
                                    "Udaipur, Rajasthan, India",
                                    style: AppTheme.fontSize(14)
                                        .makeMedium()
                                        .useSen()
                                        .withColor(AppTheme.foregroundLighter),
                                  ),
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: AppTheme.foreground,
                                  ),
                                ],
                              ),
                              const Gap(50),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width,
                                child: const Center(
                                  child: Wrap(
                                    spacing: 10,
                                    runSpacing: 10,
                                    runAlignment: WrapAlignment.center,
                                    alignment: WrapAlignment.center,
                                    children: <Widget>[
                                      LinkButton(
                                        text: "Youtube",
                                        image: AppIcons.youtube,
                                        url: AboutMe.youtubeUrl,
                                      ),
                                      LinkButton(
                                        text: "Linkedin",
                                        image: AppIcons.linkedin,
                                        url: AboutMe.linkedinUrl,
                                      ),
                                      LinkButton(
                                        text: "Dev.to",
                                        image: AppIcons.devTo,
                                        url: AboutMe.devToUrl,
                                      ),
                                      LinkButton(
                                        text: "Reddit",
                                        image: AppIcons.reddit,
                                        url: AboutMe.redditUrl,
                                      ),
                                      LinkButton(
                                        text: "Github",
                                        image: AppIcons.github,
                                        url: AboutMe.githubUrl,
                                      ),
                                      LinkButton(
                                        text: "Instagram",
                                        image: AppIcons.instagram,
                                        url: AboutMe.instagramUrl,
                                        hoverColor: Colors.pink,
                                      ),
                                      LinkButton(
                                        text: "Whatsapp",
                                        image: AppIcons.whatsapp,
                                        url: AboutMe.whatsappUrl,
                                        hoverColor: Colors.green,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(50),
                  Text(
                    "2024 © Nitin Jiwnani. All rights reserved.",
                    style: AppTheme.fontSize(14).makeMedium(),
                  ),
                  const Gap(10),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SidePanel(
              scrollController: scrollController,
            ),
          ),
        ],
      ),
    );
  }
}
