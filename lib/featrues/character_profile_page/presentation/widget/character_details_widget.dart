import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/constant/color_manger.dart';
import 'package:rick_and_morty/featrues/character_page/data/models/character_model.dart';

class CharacterDetailsWidget extends StatelessWidget {
  final Results results;
  final String title;
  final String value;
  final double endIndent;
  const CharacterDetailsWidget(
      {super.key,
      required this.title,
      required this.value,
      required this.endIndent,
      required this.results});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              '$title : ',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: ColorManger.white,
              ),
            ),
          ],
        ),
        Divider(
          endIndent: endIndent,
          thickness: 2,
          color: ColorManger.yellow,
        )
      ],
    );
  }
}
