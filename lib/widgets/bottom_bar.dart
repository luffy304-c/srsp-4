import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  const BottomBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex: currentIndex,
    onTap: onTap,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.textSecondary,
    selectedFontSize: 12.sp,
    unselectedFontSize: 11.sp,
    iconSize: 24.sp,
    items: [
      BottomNavigationBarItem(
        icon: const Icon(Icons.home),
        label: 'home'.tr(context: context),
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.shopping_bag),
        label: 'catalog'.tr(context: context),
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.favorite),
        label: 'favorites'.tr(context: context),
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.person),
        label: 'profile'.tr(context: context),
      ),
    ],
  );
}
