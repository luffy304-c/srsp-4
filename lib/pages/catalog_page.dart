import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/product.dart';
import '../widgets/product_card.dart';

class CatalogPage extends StatelessWidget {
  final List<Product> favorites;
  final ValueChanged<Product> onFavorite;
  const CatalogPage({
    super.key,
    required this.favorites,
    required this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          product: product,
          isFavorite: favorites.contains(product),
          onFavorite: () => onFavorite(product),
        );
      },
    );
  }
}
