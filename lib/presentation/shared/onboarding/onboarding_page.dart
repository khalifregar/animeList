import 'package:anime_list/domain/utils/core/constant_image.dart';
import 'package:anime_list/domain/utils/core/constant_style.dart';
import 'package:anime_list/domain/utils/exntension/extension.dart';
import 'package:anime_list/presentation/shared/router/app_router_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Menghilangkan AppBar dan SafeArea agar background bisa benar-benar memenuhi layar
      body: Stack(
        children: [
          /// BAGIAN BACKGROUND
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              // Ganti AssetImage dengan gambar Anda sendiri
              image: DecorationImage(
                image: AssetImage(ImagesApp.background),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// BAGIAN BOX DENGAN BORDER RADIUS DI BAGIAN ATAS
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // Atur tinggi box sesuai kebutuhan
              height: 300.height,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.netralColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(34.radius),
                  topRight: Radius.circular(34.radius),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Minna! Yuk, ',
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'Nobar Anime Seru Sekarang! Ima sugu mitene',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.height),
                    const Text(
                      'Dari isekai sampai shounen, lengkap banget! '
                      'Jangan sampai kelewatan, tonton sekarang sebelum kena spoiler',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.go(AppRouterPath.guestUserpage);
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.radius))),
                      child: const Text(
                        'Tonton semua anime',
                        style: TextStyle(color: AppColors.netralColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
