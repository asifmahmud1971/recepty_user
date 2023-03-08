import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receptyUser/core/constants/app_size.dart';
import 'package:receptyUser/features/components/custom_progress_loader.dart';
import 'package:receptyUser/features/screens/home/cubit/home_cubit.dart';
import 'package:receptyUser/features/screens/home/widget/category_card.dart';
import 'package:receptyUser/features/screens/home/widget/food_card.dart';
import 'package:receptyUser/features/screens/home/widget/get_premium_card.dart';
import 'package:receptyUser/features/screens/home/widget/homepage_header.dart';
import 'package:receptyUser/features/screens/home/widget/news_card.dart';
import 'package:receptyUser/features/screens/home/widget/search_bar.dart';

import '../../../../core/constants/app_strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().getHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.status == HomeStatus.loading) {
          showProgressDialog();
        } else if (state.status == HomeStatus.success) {
          dismissProgressDialog();
        } else if (state.status == HomeStatus.failure) {
          dismissProgressDialog();
        }
      },
      builder: (context, state) {
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
                      style:
                          kRegularLine16.copyWith(fontWeight: FontWeight.w600),
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
                    children: List.generate(
                        state.homeModel?.categories?.length ?? 0,
                        (index) => CategoryCard(
                              name: state.homeModel?.categories?[index].name,
                              image: state.homeModel?.categories?[index].image,
                            )),
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
                      style:
                          kRegularLine16.copyWith(fontWeight: FontWeight.w600),
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
                    itemCount: state.homeModel?.tutorials?.length??0,
                    itemBuilder: (context, index) {
                      return FoodCard(
                        title: state.homeModel?.tutorials?[index].title,
                        image: state.homeModel?.tutorials?[index].tutorialImages?[0].image
                        ,
                        videoLength:  state.homeModel?.tutorials?[index].videoLength,
                        calorie:  state.homeModel?.tutorials?[index].calorie,

                      );
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
                      style:
                          kRegularLine16.copyWith(fontWeight: FontWeight.w600),
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
                  itemCount: state.homeModel?.blogs?.length??0,
                  itemBuilder: (context, index) {
                    return NewsCard(
                      title:state.homeModel?.blogs?[index].name ,
                      image: state.homeModel?.blogs?[index].image,
                      description: state.homeModel?.blogs?[index].description,
                    );
                  }),
            ],
          ),
        );
      },
    );
  }
}
