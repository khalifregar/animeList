import 'package:flutter/material.dart';
import 'package:anime_list/domain/utils/exntension/extension.dart';

class ListAnimeWidget extends StatelessWidget {
  final List<String> leftAnimes;
  final List<String> rightAnimes;

  const ListAnimeWidget({
    Key? key,
    required this.leftAnimes,
    required this.rightAnimes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.radius),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Kolom Kiri
          Expanded(
            child: _buildAnimeColumn(
              title: 'Top Anime List',
              animes: leftAnimes,
            ),
          ),

          const SizedBox(width: 20),

          /// Kolom Kanan
          Expanded(
            child: _buildAnimeColumn(
              title: 'Top Anime Old',
              animes: rightAnimes,
            ),
          ),
        ],
      ),
    );
  }

  /// Widget Builder untuk kolom anime
  Widget _buildAnimeColumn({
    required String title,
    required List<String> animes,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Judul Kolom
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp, // Pastikan Anda punya extension .sp
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),

        /// Pengulangan daftar anime
        for (int i = 0; i < animes.length; i++) ...[
          Row(
            children: [
              /// Kotak placeholder untuk gambar/ikon
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 8),

              /// Nama Anime
              Expanded(
                child: Text(
                  animes[i],
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ],
          ),

          /// Jarak antar item, kecuali item terakhir
          if (i != animes.length - 1) const SizedBox(height: 8),
        ],
      ],
    );
  }
}
