import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/constant/colors.dart';
import 'package:rick_and_morty/core/router/router.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _splashRickAndMotry();
    super.initState();
  }

  _splashRickAndMotry() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        context.router.replace(
          const CharacterRoute(),
        );
      },
    );
  }

  @override
  void dispose() {
    _splashRickAndMotry();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/rick-and-morty.jpg',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
