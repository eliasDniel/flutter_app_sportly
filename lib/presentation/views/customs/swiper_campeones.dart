import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../../../insfrastructure/models/league/season.dart';
import 'card_campeones.dart';

class CampeonesSlideshow extends StatefulWidget {
  final List<Season> seasons;

  const CampeonesSlideshow({
    super.key,
    required this.seasons,
  });

  @override
  State<CampeonesSlideshow> createState() => _CampeonesSlideshowState();
}

class _CampeonesSlideshowState extends State<CampeonesSlideshow> {
  final ValueNotifier<int> activeIndex = ValueNotifier<int>(0);

  @override
  void dispose() {
    activeIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredSeasons =
        widget.seasons.where((season) => season.winner != null).toList();

    return SizedBox(
      height: 230,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        itemCount: filteredSeasons.length,
        onIndexChanged: (index) => activeIndex.value = index,
        itemBuilder: (context, index) => ValueListenableBuilder<int>(
          valueListenable: activeIndex,
          builder: (context, currentIndex, _) {
            return Slide(
              season: filteredSeasons[index],
              winner: filteredSeasons[index].winner!,
              isActive: currentIndex == index, // Verifica si es el activo
            );
          },
        ),
      ),
    );
  }
}


