import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_interview_task/common/resources/icons.dart';
import 'package:movies_interview_task/data/providers/connectivity_provider.dart';
import 'package:movies_interview_task/data/providers/repositories/movies_repository_provider.dart';

import '../../common/resources/colors.dart';

class ReusableAppBar extends ConsumerWidget implements PreferredSizeWidget {
  ReusableAppBar({
    Key? key,
  }) : super(key: key);

  final AppBar appBar = AppBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var connectivityStatus = ref.watch(connectivityProvider);
    //var provider = ref.watch(moviesRepositoryProvider);
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
          onPressed: () async {
            try {
              ref.read(moviesRepositoryProvider).whenData(
                (moviesRepo) async {
                  await moviesRepo.fetchAndSaveMoviesPageToDb(3);
                },
              );
            } catch (e) {
              print("Imas error");
            }
          },
          icon: SvgPicture.asset(AppIcons.settings),
        ),
        IconButton(
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
          ),
          onPressed: () async {
            try {
              ref.read(moviesRepositoryProvider).whenData(
                (moviesRepo) async {
                  await moviesRepo.clearMovieDb();
                },
              );
            } catch (e) {
              print("Imas error");
            }
          },
          icon: const Icon(
            Icons.delete,
            color: Colors.black,
          ),
        )
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
