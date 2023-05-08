import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_interview_task/common/resources/icons.dart';

import '../../common/resources/colors.dart';

class ReusableAppBar extends StatelessWidget implements PreferredSizeWidget {
  ReusableAppBar({
    Key? key,
  }) : super(key: key);

  final AppBar appBar = AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SvgPicture.asset(AppIcons.appbarLogo),
      titleSpacing: 0.0,
      actions: [
        SvgPicture.asset(AppIcons.wifi),
        IconButton(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            onPressed: () {},
            icon: SvgPicture.asset(AppIcons.settings))
      ],
      centerTitle: false,
      backgroundColor: AppColors.whiteBackground,
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(appBar.preferredSize.height);
  }
}
