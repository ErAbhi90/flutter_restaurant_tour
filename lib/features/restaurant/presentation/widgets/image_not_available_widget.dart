import 'package:flutter/material.dart';
import 'package:restaurant_tour/core/constants/app_icons.dart';
import 'package:restaurant_tour/core/constants/app_strings.dart';

class ImageNotAvailableWidget extends StatelessWidget {
  const ImageNotAvailableWidget({
    super.key,
    required this.imageWidth,
    required this.imageHeight,
  });

  final double imageWidth;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: imageWidth,
      height: imageHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            AppIcons.imageNotAvailable,
            size: 40,
          ),
          Text(
            AppStrings.imageNotAvailable,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
