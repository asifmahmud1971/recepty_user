import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:receptyUser/core/constants/app_colors.dart';
import 'package:receptyUser/core/constants/app_size.dart';
import 'package:receptyUser/features/components/custom_progress_loader.dart';
import 'package:receptyUser/features/components/my_context.dart';
import 'package:receptyUser/features/screens/blogs/view/blog_details.dart';
import 'package:receptyUser/features/screens/blogs/view/blogs_homepage.dart';
import 'package:receptyUser/features/screens/category/view/category_page.dart';
import 'package:receptyUser/features/screens/home/cubit/home_cubit.dart';
import 'package:receptyUser/features/screens/home/widget/category_card.dart';
import 'package:receptyUser/features/screens/home/widget/food_card.dart';
import 'package:receptyUser/features/screens/home/widget/get_premium_card.dart';
import 'package:receptyUser/features/screens/home/widget/news_card.dart';
import 'package:receptyUser/features/screens/home/widget/search_bar.dart';
import 'package:receptyUser/features/screens/recipe/view/product_item_screen.dart';
import 'package:receptyUser/features/screens/recipe/view/recipe_homepage.dart';
import 'package:receptyUser/features/screens/recipe/view/search_recipe.dart';

import '../../../../core/constants/app_strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin{
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
            title: /*HomePageHeader()*/ Text(
              AppStrings.appName.tr(),
              style: GoogleFonts.italianno(
                textStyle: TextStyle(color: AppColors.kSecondaryColor, letterSpacing: .5,fontSize: 50.sp),
              ),
            ),
            centerTitle: true,
          ),
          body: state.homeModel != null
              ? ListView(
                  children: [
                    SearchBar(
                      onTap: () {
                        GetContext.to(SearchRecipe());
                      },
                    ),
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
                            style: kRegularLine18.copyWith(
                                fontWeight: FontWeight.w600),
                          )),
                          InkWell(
                            onTap: () {
                              GetContext.to(CategoryPage());
                            },
                            child: Text(AppStrings.seeAll.tr(),
                                style: kRegularLine18.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.kSecondaryColor)),
                          )
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
                                    onTap: () {
                                      GetContext.to(RecipeHomepage(
                                        categories:
                                            state.homeModel?.categories?[index],
                                      ));
                                    },
                                    name: state
                                        .homeModel?.categories?[index].name,
                                    image: state
                                        .homeModel?.categories?[index].image,
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
                            style: kRegularLine18.copyWith(
                                fontWeight: FontWeight.w600),
                          )),
                          InkWell(
                            onTap: () {
                              GetContext.to(RecipeHomepage());
                            },
                            child: Text(AppStrings.seeAll.tr(),
                                style: kRegularLine18.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.kSecondaryColor)),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 250.h,
                      child: ListView.builder(
                          padding: EdgeInsets.only(left: 10),
                          scrollDirection: Axis.horizontal,
                          itemCount: state.homeModel?.tutorials?.length ?? 0,
                          itemBuilder: (context, index) {
                            return FoodCard(
                              onTap: () {
                                GetContext.to(ProductItemScreen(
                                  recipeId: state
                                      .homeModel?.tutorials?[index].id
                                      .toString(), videoId:state
                                    .homeModel?.tutorials?[index].video??"",
                                ));
                              },
                              title: state.homeModel?.tutorials?[index].title,
                              image: state.homeModel?.tutorials?[index]
                                  .tutorialImages?[0].image,
                              videoLength: state
                                  .homeModel?.tutorials?[index].videoLength,
                              calorie:
                                  state.homeModel?.tutorials?[index].calorie,
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
                            style: kRegularLine18.copyWith(
                                fontWeight: FontWeight.w600),
                          )),
                          InkWell(
                            onTap: () {
                              GetContext.to(BlogsHomepage());
                            },
                            child: Text(AppStrings.seeAll.tr(),
                                style: kRegularLine16.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.kSecondaryColor)),
                          )
                        ],
                      ),
                    ),
                    ListView.builder(
                        padding: EdgeInsets.only(left: 10),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.homeModel?.blogs?.length ?? 0,
                        itemBuilder: (context, index) {
                          return NewsCard(
                            onTap: () {
                              GetContext.to(BlogsDetailPage(
                                blogs: state.homeModel?.blogs?[index],
                              ));
                            },
                            title: state.homeModel?.blogs?[index].name,
                            image: state.homeModel?.blogs?[index].image,
                            description:
                                state.homeModel?.blogs?[index].description,
                          );
                        }),
                  ],
                )
              : SizedBox(),
        );
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
