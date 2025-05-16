import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character_model.dart';
import 'package:rick_and_morty/pages/character_page/character_page.dart';
import 'package:rick_and_morty/pages/character_profile_page/character_profile_page.dart';
import 'package:rick_and_morty/pages/splash_page/splash_page.dart';

part 'router.gr.dart';

final router = AppRouter();

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: CharacterRoute.page),
        AutoRoute(page: DetailsCharacterRoute.page),
      ];
}
