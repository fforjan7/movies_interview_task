import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_interview_task/common/resources/icons.dart';
import 'package:movies_interview_task/data/connectivity_provider.dart';

import '../../common/resources/colors.dart';

class ReusableAppBar extends ConsumerWidget implements PreferredSizeWidget {
  ReusableAppBar({
    required this.func,
    Key? key,
  }) : super(key: key);

  final AppBar appBar = AppBar();
  final Function() func;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var connectivityStatus = ref.watch(connectivityProvider);

    return AppBar(
      title: SvgPicture.asset(AppIcons.appbarLogo),
      titleSpacing: 0.0,
      elevation: 0.0,
      //bottomOpacity: 0.0,
      actions: [
        connectivityStatus == ConnectivityResult.none
            ? SvgPicture.asset(AppIcons.wifi)
            : const SizedBox(),
        IconButton(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            onPressed: func,
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
