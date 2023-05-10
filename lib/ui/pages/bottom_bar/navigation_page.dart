import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_interview_task/common/resources/colors.dart';
import 'package:movies_interview_task/common/resources/icons.dart';
import 'package:movies_interview_task/ui/widgets/reusable_app_bar.dart';
import 'package:movies_interview_task/utils/show_reusable_alert_dialog.dart';

import '../../../data/providers/connectivity_provider.dart';
import 'favorites_page.dart';
import 'movies_page.dart';

class NavigationPage extends ConsumerStatefulWidget {
  const NavigationPage({super.key});

  @override
  ConsumerState<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends ConsumerState<NavigationPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const MoviesPage(),
    const FavoritesPage(),
  ];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    var provider = ref.watch(connectivityProvider);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (provider == ConnectivityResult.none) {
        showInternetConnectionDialog(context);
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(connectivityProvider, (previous, next) {
      if (previous != ConnectivityResult.none ||
          next == ConnectivityResult.none) {
        showInternetConnectionDialog(context);
      }
    });
    return Scaffold(
      appBar: ReusableAppBar(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        backgroundColor: AppColors.whiteBackground,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppIcons.moviesSelected),
            icon: SvgPicture.asset(AppIcons.moviesNonselected),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppIcons.favoritesSelected),
            icon: SvgPicture.asset(AppIcons.favoritesNonSelected),
            label: 'Favorites',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
