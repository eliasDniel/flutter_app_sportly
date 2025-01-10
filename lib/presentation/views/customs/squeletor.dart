import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomSqueletor extends StatelessWidget {
  const CustomSqueletor({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          children: List.generate(
            3, // Aquí creamos 3 "partidos" para simular el efecto shimmer
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                height: 50,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}