import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rick_and_morty/business_logic/cubit/character_cubit.dart';
import 'package:rick_and_morty/constant/colors.dart';
import 'package:rick_and_morty/presentation/widgets/details_character_widget.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.yellow,
        title: const Text(
          'Rick and Morty',
          style: TextStyle(
            color: AppColors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: AppColors.grey,
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
                      leftDotColor: AppColors.white,
                      rightDotColor: AppColors.yellow,
                      size: 200),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

OutlineInputBorder outLineinputBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.yellow),
    borderRadius: BorderRadius.circular(8),
  );
}
