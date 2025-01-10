import 'package:flutter/material.dart';
import '../views/customs/customs_navigator.dart';
import '../views/home_view.dart';
import '../views/scores_screen_view.dart';
import '../views/watch_screen_view.dart';

class HomeScreen extends StatefulWidget {
  static const String name = 'home_screen';
  final int pageIndex;
  final String code;

  const HomeScreen({super.key, required this.pageIndex, required this.code});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(keepPage: true);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (pageController.hasClients) {
      pageController.animateToPage(
        widget.pageIndex,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 250),
      );
    }

    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          HomeView(code: widget.code),
          const ScoresScreen(),
          const WatchScreen(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: widget.pageIndex,
        code: widget.code,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
