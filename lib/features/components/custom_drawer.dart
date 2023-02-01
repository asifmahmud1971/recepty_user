import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receptyUser/core/constants/app_strings.dart';
import 'package:receptyUser/generated/assets.dart';

import '../../core/constants/app_colors.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: AppColors.kPrimaryColor),
            accountName: const Text(
              'Admin',
            ),
            accountEmail: const Text(
              'almahmudasif6@gmail.com',
            ),
            currentAccountPicture: Image.asset(
              Assets.imagesReceptyLogo,
              height: 150.r,
              width: 150.r,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: const Icon(
              Icons.no_food,
              color: AppColors.kPrimaryColor,
            ),
            title: Text(
              AppStrings.addRecipe.tr(),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: const Icon(
              Icons.category,
              color: AppColors.kPrimaryColor,
            ),
            title: Text(
              AppStrings.addCategory.tr(),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: const Icon(
              Icons.dining_rounded,
              color: AppColors.kPrimaryColor,
            ),
            title: Text(
              AppStrings.addIngredients.tr(),
            ),
          ),
          // ListTile(
          //   onTap: () {
          //     Navigator.pop(context);
          //     if (LocalizationHelper().getCurrentLanguage() == 'Bangla') {
          //       LocalizationHelper().changeLocale('English');
          //     } else {
          //       LocalizationHelper().changeLocale('Bangla');
          //     }
          //   },
          //   leading: const Icon(
          //     Icons.language,
          //     color: kPrimaryColor,
          //   ),
          //   title: Text(
          //     LocalizationHelper().getCurrentLanguage() == 'Bangla'
          //         ? 'Bangla'
          //         : 'English',
          //   ),
          // ),
          // GetBuilder<ThemeController>(
          //   builder: (themeController) {
          //     return ListTile(
          //       onTap: () async {
          //         Navigator.pop(context);
          //         Get.find<ThemeController>().toggleTheme();
          //       },
          //       leading: Icon(
          //         themeController.darkTheme
          //             ? Icons.light_mode
          //             : Icons.dark_mode,
          //         color: kPrimaryColor,
          //       ),
          //       title: const Text(
          //         'Change Theme',
          //       ),
          //     );
          //   },
          // ),
          ListTile(
            onTap: () async {
              Navigator.pop(context);
            },
            leading: const Icon(
              Icons.food_bank,
              color: AppColors.kPrimaryColor,
            ),
            title: Text(
              AppStrings.viewRecipe.tr(),
            ),
          ),
          ListTile(
            onTap: () async {
              Navigator.pop(context);
            },
            leading: const Icon(
              Icons.category_sharp,
              color: AppColors.kPrimaryColor,
            ),
            title: Text(
              AppStrings.viewCategory.tr(),
            ),
          ),
          ListTile(
            onTap: () async {},
            leading: const Icon(
              Icons.rate_review,
              color: AppColors.kPrimaryColor,
            ),
            title: const Text(
              'Rate Us',
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: const Icon(
              Icons.share,
              color: AppColors.kPrimaryColor,
            ),
            title: const Text(
              'Share App',
            ),
          ),
        ],
      ),
    );
  }
}
