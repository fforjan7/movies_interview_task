import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/resources/colors.dart';
import '../../../../common/resources/icons.dart';

class MovieDetailsCustomAppBar extends StatelessWidget {
  const MovieDetailsCustomAppBar({
    super.key,
    required this.isFavorite,
    required this.onTap,
  });

  final bool isFavorite;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.only(top: 24.0, left: 12, right: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackButton(color: AppColors.white),
            const Spacer(),
            GestureDetector(
              onTap: onTap,
              child: Container(
                color: Colors.transparent,
                height: 40,
                width: 40,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: child,
                    );
                  },
                  child: SvgPicture.asset(
                    isFavorite ? AppIcons.favorite : AppIcons.addToFavorite,
                    key: ValueKey(isFavorite),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
