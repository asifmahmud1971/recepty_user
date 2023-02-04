import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receptyUser/core/constants/app_size.dart';
import 'package:receptyUser/features/screens/home/widget/category_card.dart';
import 'package:receptyUser/features/screens/home/widget/food_card.dart';
import 'package:receptyUser/features/screens/home/widget/get_premium_card.dart';
import 'package:receptyUser/features/screens/home/widget/homepage_header.dart';
import 'package:receptyUser/features/screens/home/widget/news_card.dart';
import 'package:receptyUser/features/screens/home/widget/search_bar.dart';

import '../../../../core/constants/app_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.h,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: HomePageHeader(),
      ),
      body: ListView(
        children: [
          SearchBar(),
          kHeightBox10,
          PremiumCard(),
          kHeightBox10,
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                      AppStrings.category.tr(),
                      style: kRegularLine16.copyWith(fontWeight: FontWeight.w600),
                    )),
                Text(AppStrings.seeAll.tr(),
                    style: kRegularLine16.copyWith(
                        fontWeight: FontWeight.w500, color: Colors.teal))
              ],
            ),
          ),
          kHeightBox10,
          SizedBox(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(10, (index) => CategoryCard()),
              ),
            ),
          ),
          kHeightBox10,
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  AppStrings.trendingRecipe.tr(),
                  style: kRegularLine16.copyWith(fontWeight: FontWeight.w600),
                )),
                Text(AppStrings.seeAll.tr(),
                    style: kRegularLine16.copyWith(
                        fontWeight: FontWeight.w500, color: Colors.teal))
              ],
            ),
          ),
          SizedBox(
            height: 250.h,
            child: ListView.builder(
                padding: EdgeInsets.only(left: 10),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return FoodCard();
                }),
          ),
          Divider(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                      AppStrings.todayNews.tr(),
                      style: kRegularLine16.copyWith(fontWeight: FontWeight.w600),
                    )),
                Text(AppStrings.seeAll.tr(),
                    style: kRegularLine16.copyWith(
                        fontWeight: FontWeight.w500, color: Colors.teal))
              ],
            ),
          ),
          ListView.builder(
              padding: EdgeInsets.only(left: 10),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return NewsCard();
              }),
        ],
      ),
    );
  }
}
