import 'package:get/get.dart';
import 'package:flutter_portfolio/core/service/github_service.dart';

class Injector {
  Injector._();

  static void inject() {
    Get.put<GithubService>(GithubService(), permanent: true);
  }
}
