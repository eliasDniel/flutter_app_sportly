import 'package:flutter/material.dart';
import 'package:flutter_app_sportly/presentation/customs/customs_navigator.dart';
import 'package:flutter_app_sportly/presentation/views/home_views.dart';
import 'package:flutter_app_sportly/presentation/views/scores_views.dart';
import 'package:flutter_app_sportly/presentation/views/watch_views.dart';

class HomeScreen extends StatefulWidget {
  static const String name = 'home_screen';
  final int pageIndex;

  const HomeScreen({super.key, required this.pageIndex});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  late PageController pageController;
  late int currentIndex; // Variable local para manejar el índice actual

  @override
  void initState() {
    super.initState();
    currentIndex = widget.pageIndex; // Inicializar con el índice proporcionado
    pageController = PageController(initialPage: currentIndex, keepPage: true);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final viewRoutes = const <Widget>[
    HomeView(),
    ScoresViews(),
    WatchViews(),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index; // Actualiza el índice actual
          });
          pageController.jumpToPage(index); // Cambia a la página seleccionada
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
