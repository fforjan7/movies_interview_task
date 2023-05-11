import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_interview_task/common/resources/icons.dart';

import '../../../common/constants/routes.dart';
import '../../../data/providers/initial_provider.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  late Timer _timer;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _timer = Timer(
      const Duration(seconds: 3),
      () {
        context.go(AppRoutes.navigation);
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(initialProvider);
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(AppIcons.splashLogo),
      ),
    );
  }
}
