import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/rick_and_morty_model.dart';
import 'package:rick_and_morty/pages/character/character_page.dart';
import 'package:rick_and_morty/pages/details_character/details_character_page.dart';
import 'package:rick_and_morty/pages/splash/splash_page.dart';

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
