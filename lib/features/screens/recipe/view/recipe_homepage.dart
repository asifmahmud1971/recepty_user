import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:receptyUser/core/constants/app_colors.dart';
import 'package:receptyUser/core/constants/app_size.dart';
import 'package:receptyUser/core/constants/app_strings.dart';
import 'package:receptyUser/features/components/custom_progress_loader.dart';
import 'package:receptyUser/features/screens/category/model/category_model.dart';
import 'package:receptyUser/features/screens/recipe/cubit/recipe_cubit.dart';
import 'package:receptyUser/features/screens/recipe/cubit/recipe_state.dart';
import 'package:receptyUser/features/screens/recipe/view/product_item_screen.dart';
import 'package:receptyUser/features/screens/recipe/widget/food_card.dart';

import '../../../components/my_context.dart';

class RecipeHomepage extends StatefulWidget {
  final dynamic categories;
  const RecipeHomepage({Key? key, this.categories}) : super(key: key);

  @override
  State<RecipeHomepage> createState() => _RecipeHomepageState();
}

class _RecipeHomepageState extends State<RecipeHomepage> {
  @override
  void initState() {
    context.read<RecipeCubit>().getRecipeList(catId: widget.categories?.id.toString());
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
            title: Text(widget.categories?.name??AppStrings.allRecipe.tr()),

          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MasonryGridView.count(
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 0,
              itemCount: state.recipeListModel?.tutorials?.length ?? 0,
              itemBuilder: (context, index) {
                return FoodCard(
                  onTap: (){
                    GetContext.to(ProductItemScreen(recipeId: state.recipeListModel!.tutorials![index].id
                        .toString(), videoId: state.recipeListModel!.tutorials![index].video,));
                  },
                  calorie: state.recipeListModel?.tutorials?[index].calorie,
                  tutorialLength: state.recipeListModel?.tutorials?[index].videoLength,
                  title: state.recipeListModel?.tutorials?[index].title,
                  image: state.recipeListModel?.tutorials?[index].tutorialImages?[0].image,
                  isPremium: state
                      .recipeListModel?.tutorials?[index].isPremium
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
