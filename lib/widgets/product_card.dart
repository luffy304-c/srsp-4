import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final bool isFavorite;
  final VoidCallback onFavorite;
  const ProductCard({
    super.key,
    required this.product,
    required this.isFavorite,
    required this.onFavorite,
  });

  @override
  Widget build(BuildContext context) => Card(
    color: AppColors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      child: Row(
        children: [
          Image.asset(
            product.image,
            width: 70.w.clamp(50, 110),
            height: 80.h.clamp(50, 110),
            fit: BoxFit.contain,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.nameKey.tr(context: context),
                  style: AppTextStyles.body,
                ),
                SizedBox(height: 8.h),
                Text(
                  'price'.tr(
                    context: context,
                    args: [product.price.toString()],
                  ),
                  style: AppTextStyles.caption,
                ),
              ],
            ),
          ),
          IconButton(
            tooltip: (isFavorite ? 'remove_favorite' : 'add_favorite').tr(
              context: context,
            ),
            onPressed: onFavorite,
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              size: 24.sp,
              color: isFavorite ? AppColors.favorite : AppColors.textSecondary,
            ),
          ),
        ],
      ),
    ),
  );
}
