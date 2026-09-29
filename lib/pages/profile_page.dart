import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => ListView(
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
    children: [
      CircleAvatar(
        radius: 40.r.clamp(32, 64),
        backgroundColor: AppColors.primary,
        child: Icon(Icons.person, size: 48.sp, color: AppColors.white),
      ),
      SizedBox(height: 12.h),
      Text(
        'user_name'.tr(context: context),
        textAlign: TextAlign.center,
        style: AppTextStyles.title,
      ),
      Text(
        'student'.tr(context: context),
        textAlign: TextAlign.center,
        style: AppTextStyles.caption,
      ),
      SizedBox(height: 24.h),
      Text('settings'.tr(context: context), style: AppTextStyles.body),
      SizedBox(height: 12.h),
      Text('language'.tr(context: context), style: AppTextStyles.caption),
      DropdownButton<String>(
        isExpanded: true,
        value: context.locale.languageCode,
        style: AppTextStyles.body,
        items: [
          DropdownMenuItem(
            value: 'ru',
            child: Text('russian'.tr(context: context)),
          ),
          DropdownMenuItem(
            value: 'en',
            child: Text('english'.tr(context: context)),
          ),
        ],
        onChanged: (value) async {
          if (value != null) await context.setLocale(Locale(value));
        },
      ),
      ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(Icons.info_outline, size: 24.sp),
        title: Text('about'.tr(context: context), style: AppTextStyles.body),
        onTap: () => showDialog<void>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('about'.tr(context: context)),
            content: Text('about_text'.tr(context: context)),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('close'.tr(context: context)),
              ),
            ],
          ),
        ),
      ),
      ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(Icons.memory, size: 24.sp),
        title: Text('storage'.tr(context: context), style: AppTextStyles.body),
        subtitle: Text(
          'storage_text'.tr(context: context),
          style: AppTextStyles.caption,
        ),
      ),
    ],
  );
}
