import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receptyUser/core/constants/app_size.dart';
import 'package:receptyUser/features/screens/home/widget/category_card.dart';
import 'package:receptyUser/features/screens/home/widget/food_card.dart';
import 'package:receptyUser/features/screens/home/widget/get_premium_card.dart';
import 'package:receptyUser/features/screens/home/widget/homepage_header.dart';
import 'package:receptyUser/features/screens/home/widget/search_bar.dart';

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
                      "Category",
                      style: kRegularLine16.copyWith(fontWeight: FontWeight.w600),
                    )),
                Text("See All",
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
                  "Trending Recipe",
                  style: kRegularLine16.copyWith(fontWeight: FontWeight.w600),
                )),
                Text("See All",
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
          )
        ],
      ),
    );
  }
}
