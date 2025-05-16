import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rick_and_morty/constant/color_manger.dart';
import 'package:rick_and_morty/pages/character_page/widget/details_character_widget.dart';
import 'package:rick_and_morty/providers/rick_and_morty_provider.dart/rick_and_morty_provider.dart';

@RoutePage()
class CharacterPage extends ConsumerStatefulWidget {
  const CharacterPage({super.key});

  @override
  ConsumerState<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends ConsumerState<CharacterPage> {
  @override
  Widget build(BuildContext context) {
    final futurprovider = ref.watch(rickAndMortyProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorManger.yellow,
        title: const Text(
          'Rick and Morty',
          style: TextStyle(
            color: ColorManger.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: ColorManger.grey,
      body: futurprovider.when(
        data: (data) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 2 / 3,
                    ),
                    itemCount: data.length,
                    itemBuilder: (context, index) => DetailsCharacterWidget(
                      results: data[index],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        error: (error, _) {
          return Center(
            child: Text(
              '$error',
              style: const TextStyle(color: Colors.white),
            ),
          );
        },
        loading: () {
          return Center(
            child: LoadingAnimationWidget.twistingDots(
                leftDotColor: ColorManger.white,
                rightDotColor: ColorManger.yellow,
                size: 200),
          );
        },
      ),
    );
  }
}
