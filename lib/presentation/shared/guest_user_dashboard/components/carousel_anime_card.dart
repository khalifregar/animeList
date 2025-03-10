import 'package:flutter/material.dart';
import 'package:anime_list/domain/utils/exntension/extension.dart';

class AnimeCardWidget extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String genres;
  final String seasonInfo;
  final String synopsis;

  const AnimeCardWidget({
    Key? key,
    required this.imageAsset,
    required this.title,
    required this.genres,
    required this.seasonInfo,
    required this.synopsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const cardHeight = 220.0;

    return Container(
      /// Tambahkan margin horizontal agar ada jarak antar card
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.radius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.radius),
        child: Stack(
          children: [
            // Background Image
            Image.asset(
              imageAsset,
              width: double.infinity,
              height: cardHeight,
              fit: BoxFit.cover,
            ),

            // Overlay
            Container(
              width: double.infinity,
              height: cardHeight,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.2),
                    Colors.black.withOpacity(0.6),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),

            // Play Icon
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.blueAccent,
                  size: 30,
                ),
              ),
            ),

            // Text Overlay
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$genres\n$seasonInfo',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    synopsis,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.white.withOpacity(0.9),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
