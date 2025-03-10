import 'package:anime_list/presentation/shared/guest_user_dashboard/components/carousel_anime_card.dart';
import 'package:anime_list/presentation/shared/guest_user_dashboard/components/list_anime.dart';
import 'package:anime_list/presentation/shared/guest_user_dashboard/components/search.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:anime_list/domain/utils/core/constant_style.dart';
import 'package:anime_list/domain/utils/exntension/extension.dart';

class GuestUserPage extends StatelessWidget {
  const GuestUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final leftAnimes = [
      "attack on titan",
      "One Piece",
      "Boku no Hero",
      "Kimetsu no Yaiba"
    ];
    final rightAnimes = ["naruto", "sijjin", "balaeka", "nominos"];

    // Data untuk slider menggunakan asset image
    final List<Map<String, String>> animeSliderData = [
      {
        'imageAsset': 'assets/images/chooper.jpg',
        'title': 'One Piece season 2',
        'genres': 'Petualangan, Aksi, Fantasi, Komedi, Shounen',
        'seasonInfo': 'Fall 1999 – Spring 2001',
        'synopsis':
            'Musim kedua dari serial anime One Piece melanjutkan petualangan Monkey D. Luffy dan kru Bajak Laut Topi Jerami...',
      },
      {
        'imageAsset': 'assets/images/naruto.png',
        'title': 'Naruto Shippuden',
        'genres': 'Action, Adventure, Shounen',
        'seasonInfo': 'Winter 2007 – 2017',
        'synopsis':
            'Melanjutkan perjalanan Naruto Uzumaki yang berusaha mewujudkan impiannya menjadi Hokage...',
      },
      {
        'imageAsset': 'assets/images/kimetsu.png',
        'title': 'Kimetsu no Yaiba',
        'genres': 'Action, Supernatural, Historical, Shounen',
        'seasonInfo': 'Spring 2019 – Present',
        'synopsis':
            'Bercerita tentang Tanjiro yang menjadi pembasmi iblis untuk menyelamatkan adiknya yang terinfeksi...',
      },
    ];

    return Scaffold(
      body: Stack(
        children: [
          /// Container dengan Border Radius di Bagian Atas
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(70.radius),
                ),
                color: AppColors.primaryColor,
              ),
            ),
          ),

          /// Bagian Header (Welcome User + Icon + Search Bar + List Anime + Carousel Slider)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.03,
            left: 20,
            right: 20,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Row untuk teks Welcome dan Icon User
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome user',
                            style: TextStyle(
                              color: AppColors.netralColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            'Selamat Malam',
                            style: TextStyle(
                              color: AppColors.netralColor,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.netralColor,
                        child: const Icon(Icons.person_outline,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  /// Memanggil Search Bar dari file search.dart
                  const SearchBarWidget(),
                  const SizedBox(height: 20),

                  /// Memanggil List Anime dari file list_anime.dart
                  ListAnimeWidget(
                    leftAnimes: leftAnimes,
                    rightAnimes: rightAnimes,
                  ),
                  const SizedBox(height: 20),

                  /// Carousel Slider untuk menampilkan AnimeCardWidget
                  SizedBox(
                    height: 250, // Tinggi slider
                    child: CarouselSlider(
                      items: animeSliderData.map((anime) {
                        return AnimeCardWidget(
                          imageAsset: anime['imageAsset'] ?? '',
                          title: anime['title'] ?? '',
                          genres: anime['genres'] ?? '',
                          seasonInfo: anime['seasonInfo'] ?? '',
                          synopsis: anime['synopsis'] ?? '',
                        );
                      }).toList(),
                      options: CarouselOptions(
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 5),
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                        enableInfiniteScroll: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
