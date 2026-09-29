import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../core/constants/app_text_styles.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class FavoritesPage extends StatelessWidget {
  final List<Product> favorites;
  final ValueChanged<Product> onFavorite;
  const FavoritesPage({
    super.key,
    required this.favorites,
    required this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    if (favorites.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Text(
            'empty_favorites'.tr(context: context),
            textAlign: TextAlign.center,
            style: AppTextStyles.body,
          ),
        ),
      );
    }
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        final product = favorites[index];
        return ProductCard(
          product: product,
          isFavorite: favorites.contains(product),
          onFavorite: () => onFavorite(product),
        );
      },
    );
  }
}
