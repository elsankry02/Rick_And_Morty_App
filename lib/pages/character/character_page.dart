import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rick_and_morty/business_logic/cubit/character_cubit.dart';
import 'package:rick_and_morty/core/constant/color_manger.dart';
import 'package:rick_and_morty/data/web_services/character_api.dart';
import 'package:rick_and_morty/pages/character/widget/details_character_widget.dart';

@RoutePage()
class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CharacterCubit>(
      create: (context) => CharacterCubit(
        ApiService(Dio()),
      )..fetchAllCharacter(),
      child: Scaffold(
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<CharacterCubit, CharacterState>(
              listener: (context, state) {
                if (state is CharactersFailuer) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('bad response'),
                    ),
                  );
                }
                if (state is CharactersSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('success'),
                    ),
                  );
                }
              },
              builder: (context, state) {
                //! Success
                if (state is CharactersSuccess) {
                  return Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 2 / 3,
                        ),
                        itemCount: state.characterModel.length,
                        itemBuilder: (context, index) => DetailsCharacterWidget(
                          results: state.characterModel[index],
                        ),
                      ),
                    ),
                  );
                }
                //! Failuer
                if (state is CharactersFailuer) {
                  return Center(
                    child: Text(
                      state.errorMassage,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }
                //! Loading
                {
                  return Center(
                    child: LoadingAnimationWidget.twistingDots(
                        leftDotColor: ColorManger.white,
                        rightDotColor: ColorManger.yellow,
                        size: 200),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

OutlineInputBorder outLineinputBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(color: ColorManger.yellow),
    borderRadius: BorderRadius.circular(8),
  );
}
