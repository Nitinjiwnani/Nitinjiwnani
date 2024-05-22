import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter_portfolio/app/home/domain/about_me.dart';
import 'package:flutter_portfolio/app/home/domain/project_description.dart';
import 'package:flutter_portfolio/app/home/domain/projects.dart';
import 'package:flutter_portfolio/app/home/domain/skill_entity.dart';
import 'package:flutter_portfolio/app/home/domain/technologies.dart';
import 'package:flutter_portfolio/app/home/presentation/home_controller.dart';
import 'package:flutter_portfolio/app/home/presentation/panels/top_panel.dart';
import 'package:flutter_portfolio/app/home/presentation/widgets/favourite_music_player.dart';
import 'package:flutter_portfolio/app/home/presentation/widgets/link_button.dart';
import 'package:flutter_portfolio/app/home/presentation/widgets/project_card.dart';
import 'package:flutter_portfolio/app/home/presentation/widgets/project_mini_card.dart';
import 'package:flutter_portfolio/app/home/presentation/widgets/skill_card.dart';
import 'package:flutter_portfolio/config/app_artworks.dart';
import 'package:flutter_portfolio/config/app_icons.dart';
import 'package:flutter_portfolio/config/app_images.dart';
import 'package:flutter_portfolio/config/app_theme.dart';
import 'package:flutter_portfolio/core/service/github_service.dart';
import 'package:flutter_portfolio/core/utils/utils.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DesktopHomeInitializedStateView extends StatefulWidget {
  const DesktopHomeInitializedStateView({super.key, required this.controller});

  final HomeController controller;

  @override
  State<DesktopHomeInitializedStateView> createState() =>
      _DesktopHomeInitializedStateViewState();
}

class _DesktopHomeInitializedStateViewState
    extends State<DesktopHomeInitializedStateView>
    with SingleTickerProviderStateMixin<DesktopHomeInitializedStateView> {
  final scrollController = ScrollController();
  final _service = Get.find<GithubService>();

  @override
  void initState() {
    super.initState();
    _service.onFetchComplete(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  void _scrollTo(double offset) async {
    await Future.delayed(const Duration(milliseconds: 500));
    scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

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
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: 160,
                  ),
                  Text(
                    "Hi! I'm Nitin",
                    style: AppTheme.fontSize(56).makeBold(),
                  ),
                  Text(
                    "Designer. Developer. Creator.",
                    style: AppTheme.fontSize(36)
                        .makeMedium()
                        .withColor(AppTheme.foregroundLighter),
                  ),
                  const Gap(10),
                  Text(
                    "I thrive in crafting cutting-edge software and designs.",
                    style: AppTheme.fontSize(16).makeMedium(),
                  ),
                  const Image(
                    image: AppArtworks.hero,
                    width: 1280,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      color: AppTheme.aboutBackground,
                    ),
                    child: Center(
                      child: SizedBox(
                        width: 1000,
                        height: 300,
                        child: Center(
                          child: Text(
                            "A passionate and self-made developer, known for unleashing the full potential of technology in its most exceptional form.",
                            textAlign: TextAlign.center,
                            style: AppTheme.fontSize(32).makeBold(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 1280,
                    height: 600,
                    decoration: BoxDecoration(
                      color: AppTheme.background,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Image(
                              image: AppArtworks.hey,
                              width: 402,
                            ),
                            const Gap(20),
                            Text(
                              "I love music, and I love coding. And when I'm coding, I'm listening to music. 🎧",
                              style: AppTheme.fontSize(14).makeMedium(),
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
                        SizedBox(
                          width: 600,
                          child: Wrap(
                            runSpacing: 25,
                            children: AboutMe.paragraphs.map(
                              (e) {
                                return Text(
                                  e,
                                  style: AppTheme.fontSize(14).makeMedium(),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(100),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppTheme.skillsBackground,
                          AppTheme.background
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Skill Exhibition",
                          style: AppTheme.fontSize(56).makeBold(),
                        ),
                        Text(
                          "“A perfect blend of the best”",
                          style:
                              AppTheme.fontSize(21).makeMedium().makeItalic(),
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
                              url: AboutMe.gmailUrl,
                              image: AppIcons.gmail,
                              hoverColor: Colors.blue.shade200,
                              hoverTextColor: AppTheme.foreground,
                            ),
                          ],
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
                          style: AppTheme.fontSize(56).makeBold(),
                        ),
                        Text(
                          "“the bleeding edge collection”",
                          style:
                              AppTheme.fontSize(21).makeMedium().makeItalic(),
                        ),
                        const Image(
                          image: AppArtworks.langCollage,
                          width: 960,
                        ),
                        const Gap(20),
                        SizedBox(
                          width: 800,
                          child: Text(
                            Technologies.short,
                            textAlign: TextAlign.center,
                            style: AppTheme.fontSize(14).makeMedium(),
                          ),
                        ),
                        const Gap(15),
                        Text(
                          "and counting, I am a confident individual who never stops learning. 😉",
                          style: AppTheme.fontSize(15).makeMedium().makeBold(),
                        ),
                      ],
                    ),
                  ),
                  const Gap(50),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppTheme.projectsBackground,
                          AppTheme.background,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Center(
                      child: SizedBox(
                        width: 1280,
                        child: Column(
                          children: [
                            const Gap(50),
                            Text(
                              "Project Gallery",
                              style: AppTheme.fontSize(56).makeBold(),
                            ),
                            Text(
                              "“mind blowing tech mixes”",
                              style: AppTheme.fontSize(21)
                                  .makeMedium()
                                  .makeItalic(),
                            ),
                            const Gap(50),
                            Wrap(
                              spacing: 50,
                              runSpacing: 50,
                              runAlignment: WrapAlignment.center,
                              alignment: WrapAlignment.center,
                              children: [
                                ProjectCard(
                                  gradientColors: const [
                                    Color(0xFFEC8525),
                                    Color(0xFF7D14D0)
                                  ],
                                  image: AppImages.kiranafast,
                                  imageWidth: 468.75,
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
                                  onVideoPlaying: () {
                                    _scrollTo(4700);
                                  },
                                ),
                                ProjectCard(
                                  gradientColors: const [
                                    Color(0xFF0DB29F),
                                    Color(0xFFD0EF11)
                                  ],
                                  image: AppImages.scoodel,
                                  imageWidth: 468.75,
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
                                        "ScooDel is an application, developed to avail exclusive hyper local\ndeliveries as well as bike taxi services to all the customers in multiple cities.",
                                    url: 'https://www.goscoodel.com/',
                                  ),
                                  onVideoPlaying: () {
                                    _scrollTo(5400);
                                  },
                                ),
                                ProjectCard(
                                  gradientColors: const [
                                    Color(0xFFE44F1F),
                                    Color(0xFFF91C86)
                                  ],
                                  image: AppImages.relaxapp,
                                  imageWidth: 468.5,
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
                                        "Welcome to Relax, your ultimate sleep companion. Unwind,\nde-stress, and discover the sleep you deserve with our complete\nsleep wellness app. Designed to provide a tranquil experience,\nRelax offers curated content to help you unwind, fall asleep faster,\nand wake up refreshed.",
                                    url: 'https://apps.apple.com/in/app/relax-sleep-wellness-app/id6449683947',
                                  ),
                                  onVideoPlaying: () {
                                    _scrollTo(5400);
                                  },
                                ),
                                ProjectCard(
                                  gradientColors: const [
                                    Color(0xFF4E9FEA),
                                    Color(0xFFF9C81C)
                                  ],
                                  image: AppImages.goaviralnews,
                                  imageWidth: 468.5,
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
                                         "Introducing Goa Viral News - Your Ultimate Travel Companion! Get ready\nfor an unforgettable Goan adventure with personalized travel plans, vibrant\nnightlife, pristine beaches, hidden waterfalls, thrilling sports, and updates.",
                                    url:
                                        'https://play.google.com/store/apps/details?id=com.goaviralnews.goaviralnews&hl=en&gl=US',
                                  ),
                                  onVideoPlaying: () {
                                    _scrollTo(6000);
                                  },
                                ),
                              ],
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
                  const Gap(50),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppTheme.experienceBackground,
                          AppTheme.background,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      children: [
                        const Gap(50),
                        Text(
                          "Experience",
                          style: AppTheme.fontSize(56).makeBold(),
                        ),
                        Text(
                          "“way more than my age”",
                          style:
                              AppTheme.fontSize(21).makeMedium().makeItalic(),
                        ),
                        Gap(25),
                        LinkButton(
                          text: "Grab My Resume",
                          image: AppIcons.ai,
                          url: AboutMe.resumeUrl,
                        ),
                        const Gap(50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 200,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "${_service.projects.toString().formatted}+",
                                    style: AppTheme.fontSize(56)
                                        .withColor(Colors.pink)
                                        .makeBold(),
                                  ),
                                  const Gap(10),
                                  Text(
                                    "total contributions",
                                    style: AppTheme.fontSize(16)
                                        .withColor(Colors.black)
                                        .makeMedium(),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "${_service.stars.toString().formatted}+",
                                    style: AppTheme.fontSize(56)
                                        .withColor(Colors.pink)
                                        .makeBold(),
                                  ),
                                  const Gap(10),
                                  Text(
                                    "stars on github",
                                    style: AppTheme.fontSize(16)
                                        .withColor(Colors.black)
                                        .makeMedium(),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "${_service.forks.toString().formatted}+",
                                    style: AppTheme.fontSize(56)
                                        .withColor(Colors.pink)
                                        .makeBold(),
                                  ),
                                  const Gap(10),
                                  Text(
                                    "forks of my projects",
                                    style: AppTheme.fontSize(16)
                                        .withColor(Colors.black)
                                        .makeMedium(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Gap(50),
                        Text(
                          "Contributed to",
                          style: AppTheme.fontSize(36).makeMedium(),
                        ),
                        const Gap(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                launchUrlString(
                                    'https://github.com/Nitinjiwnani?tab=overview&from=2022-12-01&to=2022-12-31&org=JetBrains');
                              },
                              child: const MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Image(
                                  image: AppIcons.android,
                                  width: 96,
                                ),
                              ),
                            ),
                            // const Gap(20),
                            // GestureDetector(
                            //   onTap: () {
                            //     launchUrlString(
                            //         'https://github.com/Nitinjiwnani?from=2022-12-01&to=2022-12-31&org=openai&year_list=1');
                            //   },
                            //   child: const MouseRegion(
                            //     cursor: SystemMouseCursors.click,
                            //     child: Image(
                            //       image: AppIcons.openai,
                            //       width: 96,
                            //     ),
                            //   ),
                            // ),
                            const Gap(20),
                            GestureDetector(
                              onTap: () {
                                launchUrlString(
                                    'https://github.com/Nitinjiwnani?from=2023-12-01&to=2023-12-31&org=vlang&year_list=1');
                              },
                              child: const MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Image(
                                  image: AppIcons.cplus,
                                  width: 96,
                                ),
                              ),
                            ),
                            const Gap(20),
                            GestureDetector(
                              onTap: () {
                                launchUrlString(
                                    'https://github.com/Nitinjiwnani?tab=overview&from=2022-12-01&to=2022-12-31&org=flutter');
                              },
                              child: const MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Image(
                                  image: AppIcons.flutter,
                                  width: 96,
                                ),
                              ),
                            ),
                            const Gap(20),
                            // GestureDetector(
                            //   onTap: () {
                            //     launchUrlString(
                            //         'https://github.com/Nitinjiwnani?from=2020-12-01&to=2020-12-31&org=atom&year_list=1');
                            //   },
                            //   child: const MouseRegion(
                            //     cursor: SystemMouseCursors.click,
                            //     child: Image(
                            //       image: AppIcons.atom,
                            //       width: 96,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                        const Gap(50),
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
                                      width: 172.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Gap(20),
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
                                      width: 172.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Gap(20),
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
                                      width: 172.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Gap(20),
                        Text(
                          "I recently worked as a Flutter Engineer at Kirana Fast.",
                          style: AppTheme.fontSize(21).makeBold(),
                        ),
                        Text(
                          "It's an Inventory, Billing, Accounting and Online Store Management System for the Indian FMCG industry",
                          style: AppTheme.fontSize(16)
                              .withColor(Colors.pink.shade800)
                              .makeBold(),
                        ),
                      ],
                    ),
                  ),
                  const Gap(100),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    color: AppTheme.background,
                    child: Center(
                      child: SizedBox(
                        width: 1000,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // const Image(
                                //   image: AppIcons.avatar,
                                //   width: 22,
                                // ),
                                const Gap(4),
                                Text(
                                  "Nitin Jiwnani",
                                  style:
                                      AppTheme.fontSize(21).makeBold().useSen(),
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
                                style:
                                    AppTheme.fontSize(16).makeMedium().useSen(),
                              ),
                            ),
                            const Gap(10),
                            Row(
                              children: [
                                Text(
                                  "Udaipur, Rajasthan, India",
                                  style: AppTheme.fontSize(16)
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
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                LinkButton(
                                  text: "Reddit",
                                  image: AppIcons.reddit,
                                  url: AboutMe.redditUrl,
                                ),
                                Gap(10),
                                    LinkButton(
                                        text: "Linkedin",
                                        image: AppIcons.linkedin,
                                        url: AboutMe.linkedinUrl,
                                      ),
                                Gap(10),
                                LinkButton(
                                  text: "Youtube",
                                  image: AppIcons.youtube,
                                  url: AboutMe.youtubeUrl,
                                ),
                                Gap(10),
                                LinkButton(
                                  text: "Dev.to",
                                  image: AppIcons.devTo,
                                  url: AboutMe.devToUrl,
                                ),
                                Gap(10),
                                LinkButton(
                                  text: "Github",
                                  image: AppIcons.github,
                                  url: AboutMe.githubUrl,
                                ),
                                Gap(10),
                                LinkButton(
                                  text: "Instagram",
                                  image: AppIcons.instagram,
                                  url: AboutMe.instagramUrl,
                                  hoverColor: Colors.pink,
                                ),
                                Gap(10),
                                LinkButton(
                                  text: "Whatsapp",
                                  image: AppIcons.whatsapp,
                                  url: AboutMe.whatsappUrl,
                                  hoverColor: Colors.green,
                                ),
                              ],
                            ),
                          ],
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
            alignment: Alignment.topCenter,
            child: TopPanel(
              controller: widget.controller,
              scrollController: scrollController,
            ),
          ),
          Align(
            child: AnimatedBackground(
              vsync: this,
              behaviour: RandomParticleBehaviour(
                options: const ParticleOptions(
                  baseColor: Colors.black,
                  maxOpacity: 1.0,
                  minOpacity: 0.4,
                  spawnMinRadius: 1.0,
                  spawnMaxRadius: 1.2,
                  spawnMinSpeed: 2.0,
                  spawnMaxSpeed: 15.0,
                  particleCount: 50,
                ),
              ),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
