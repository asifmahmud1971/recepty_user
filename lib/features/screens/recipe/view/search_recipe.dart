import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:receptyUser/core/constants/app_colors.dart';
import 'package:receptyUser/core/constants/app_size.dart';
import 'package:receptyUser/core/constants/app_strings.dart';
import 'package:receptyUser/features/components/custom_progress_loader.dart';
import 'package:receptyUser/features/components/custom_text_field.dart';
import 'package:receptyUser/features/screens/category/model/category_model.dart';
import 'package:receptyUser/features/screens/recipe/cubit/recipe_cubit.dart';
import 'package:receptyUser/features/screens/recipe/cubit/recipe_state.dart';
import 'package:receptyUser/features/screens/recipe/view/product_item_screen.dart';
import 'package:receptyUser/features/screens/recipe/widget/food_card.dart';

import '../../../components/my_context.dart';

class SearchRecipe extends StatefulWidget {
  final dynamic categories;
  const SearchRecipe({Key? key, this.categories}) : super(key: key);

  @override
  State<SearchRecipe> createState() => _SearchRecipeState();
}

class _SearchRecipeState extends State<SearchRecipe> {
  @override
  void initState() {
    context.read<RecipeCubit>().searchRecipe(title: "");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecipeCubit, RecipeState>(
      listener: (context, state) {
        if (state.status == RecipeStatus.loading) {
          showProgressDialog();
        } else if (state.status == RecipeStatus.success) {
          dismissProgressDialog();
        } else {
          dismissProgressDialog();
        }
      },
      builder: (context, state) {
        return Scaffold(

          appBar: AppBar(
            titleSpacing: 0,
            title: CustomTextField(
              onChanged: (value) {
                context.read<RecipeCubit>().searchRecipe(title:value.toString());
              },
              prefixIcon: Icons.search,
              radius: 5,
              height: 20.h,
              prefixIconColor: Colors.black,
              fillColor: Colors.white,
              hint: AppStrings.searchHint.tr(),
              hintTextSize: 13.sp,
              hintColor: Colors.black,
            ),

          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MasonryGridView.count(
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 0,
              itemCount: state.searchList?.tutorials?.length ?? 0,
              itemBuilder: (context, index) {
                return FoodCard(
                  onTap: (){
                    GetContext.to(ProductItemScreen(recipeId: state.searchList!.tutorials![index].id
                        .toString(),));
                  },
                  calorie: state.searchList?.tutorials?[index].calorie,
                  tutorialLength: state.searchList?.tutorials?[index].videoLength,
                  title: state.searchList?.tutorials?[index].title,
                  image: state.searchList?.tutorials?[index].tutorialImages?[0].image,
                  isPremium: state
                      .searchList?.tutorials?[index].isPremium
                      .toString(),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
