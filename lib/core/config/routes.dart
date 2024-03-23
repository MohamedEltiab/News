
import 'package:flutter/material.dart';
import 'package:untitled2/core/config/pages_route_name.dart';

import '../../pages/home/pages/article_details_view.dart';
import '../../pages/home/pages/home_view.dart';
import '../../pages/setting/page/setting_view.dart';
import '../../pages/splash/splash_view.dart';


class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRouteName.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );

      case PagesRouteName.homeView:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
          settings: settings,
        );

      case PagesRouteName.settingsView:
        return MaterialPageRoute(
          builder: (context) => const SettingsView(),
          settings: settings,
        );

      case PagesRouteName.articleDetailsView:
        return MaterialPageRoute(
          builder: (context) =>  const ArticleDetailsView(articleModel: ,),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
    }
  }
}
