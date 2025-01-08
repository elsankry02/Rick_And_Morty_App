import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rick_and_morty/core/constant/colors.dart';
import 'package:rick_and_morty/core/router/router.dart';
import 'package:rick_and_morty/data/models/results_model.dart';

class DetailsCharacterWidget extends StatelessWidget {
  final Results results;
  const DetailsCharacterWidget({super.key, required this.results});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(
          DetailsCharacterRoute(results: results),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: AppColors.white,
        ),
        child: GridTile(
          footer: Container(
            decoration: const BoxDecoration(
              color: Colors.black54,
            ),
            child: Text(
              results.name!,
              maxLines: 1,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: results.image!,
            fit: BoxFit.cover,
            placeholder: (context, url) => Center(
              child: LoadingAnimationWidget.twistingDots(
                leftDotColor: AppColors.grey,
                rightDotColor: AppColors.yellow,
                size: 50,
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
