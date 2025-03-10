import 'package:flutter/material.dart';
import 'package:anime_list/domain/utils/exntension/extension.dart'; // Pastikan extension untuk .sp dan .radius tersedia

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          isDense: false,
          hintText: "Find Anime",
          hintStyle: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
            color: Colors.grey[500],
          ),
          border: InputBorder.none,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 30,
            minHeight: 40,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 0,
          ),
        ),
      ),
    );
  }
}
