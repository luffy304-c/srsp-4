import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget infoCard(
    BuildContext context,
    IconData icon,
    String title,
    String text,
  ) => Card(
    color: AppColors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 42.sp, color: AppColors.primary),
          SizedBox(height: 12.h),
          Text(
            title.tr(context: context),
            style: AppTextStyles.body.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.h),
          Text(text.tr(context: context), style: AppTextStyles.caption),
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) => ListView(
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
    children: [
      Text('app_name'.tr(context: context), style: AppTextStyles.title),
      SizedBox(height: 12.h),
      Text('welcome'.tr(context: context), style: AppTextStyles.body),
      SizedBox(height: 20.h),
      infoCard(context, Icons.school, 'study_title', 'study_text'),
      SizedBox(height: 12.h),
      infoCard(context, Icons.favorite_border, 'save_title', 'save_text'),
    ],
  );
}
