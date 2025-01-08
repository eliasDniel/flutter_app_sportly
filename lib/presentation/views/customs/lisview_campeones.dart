import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_sportly/insfrastructure/models/league.dart';
import 'package:go_router/go_router.dart';


class MoviesSlideshow extends StatelessWidget {
  final List<Season> seasons;

  const MoviesSlideshow({
    super.key, 
    required this.seasons,
  });

  @override
  Widget build(BuildContext context) {
    final filteredSeasons = seasons.where((season) => season.winner != null).toList();
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        itemCount: filteredSeasons.length,
        itemBuilder: (context, index) => _Slide(winner: filteredSeasons[index].winner!),
      ),
    );
  }
}


class _Slide extends StatelessWidget {

  final Winner winner;

  const _Slide({required this.winner});

  @override
  Widget build(BuildContext context) {

    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 10,
          offset: Offset(0, 10)
        )
      ]
    );

      
    return Padding(
      padding: const EdgeInsets.only( bottom: 30 ),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: GestureDetector(
            onTap: () => context.push('/home/0/movie/${ winner.id }'),
            child: FadeInImage(
              fit: BoxFit.contain,
              placeholder: const AssetImage('assets/loaders/bottle-loader.gif'),
              image: NetworkImage(winner.crest),
            ),
          )
        )
      ),
    );
  }
}
