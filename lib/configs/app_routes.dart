import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:pert_5/models/user.dart";
import "package:pert_5/modules/news_detail_screen/news_detail_screen.dart";

import "../modules/home_screen/home_screen.dart";
import "../modules/splash_screen/splash_screen.dart";

class AppRoutes {
  static const String splash = "splash";
  static const String home = "home";
  static const String newsDetail = "news-detail";
  static const String newsDetailHot = "news-detail-hot";

  static Page _splashScreenRouteBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return const MaterialPage(
      child: SplashScreen(),
    );
  }

  static Page _homeScreenRouteBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    late User user;
    if (state.extra != null && state.extra is User) {
      user = state.extra as User;
    } else {
      user = User(
        id: 002,
        name: "Trii Putra",
        userName: "tritan7",
        email: "tritan7@gmail.com",
        profilePhoto:
            "https://cdn.myanimelist.net/images/characters/11/286916.jpg",
        phoneNumber: "082111222333",
      );
    }
    return MaterialPage(
      child: HomeScreen(
        user: user,
      ),
    );
  }

  static Page _newsDetailScreenRouteBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return MaterialPage(
      child: NewsDetailScreen(
        id: state.params["id"]!,
      ),
    );
  }

  static final GoRouter goRouter = GoRouter(
    routes: [
      GoRoute(
          name: splash,
          path: "/splash",
          pageBuilder: _splashScreenRouteBuilder),
      GoRoute(
        name: home,
        path: "/home",
        pageBuilder: _homeScreenRouteBuilder,
        routes: [
          GoRoute(
            name: newsDetail,
            path: "news-detail/:id",
            pageBuilder: _newsDetailScreenRouteBuilder,
          ),
        ],
      ),
    ],
    initialLocation: "/splash",
  );
}
