import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receptyUser/core/constants/app_strings.dart';
import 'package:receptyUser/features/components/custom_progress_loader.dart';
import 'package:receptyUser/features/components/custom_snackbar.dart';
import 'package:receptyUser/features/components/my_context.dart';
import 'package:receptyUser/features/screens/category/cubit/category_cubit.dart';
import 'package:receptyUser/features/screens/category/cubit/category_state.dart';
import 'package:receptyUser/features/screens/home/widget/category_card.dart';
import 'package:receptyUser/features/screens/recipe/view/recipe_homepage.dart';

import '../../recipe/model/helper.dart';

class CategoryPage extends StatefulWidget {
  final CategorySelect? categorySelect;

  const CategoryPage({Key? key, this.categorySelect}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    context.read<CategoryCubit>().getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {
        if (state.status == CategoryStatus.loading) {
          showProgressDialog();
          log("loading state...........");
        } else if (state.status == CategoryStatus.success) {
          dismissProgressDialog();
        } else if (state.status == CategoryStatus.categoryDeleteSuccess) {
          context.read<CategoryCubit>().getCategory().then((value) {
            dismissProgressDialog();
            showCustomSnackBar(
                context: context, message: state.message, isError: false);
          });
        } else {
          dismissProgressDialog();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppStrings.category.tr()),
          ),
          body: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(
                    state.categoryModel?.categories?.length ?? 0,
                    (index) => CategoryCard(
                      onTap: (){
                        GetContext.to(RecipeHomepage(categories: state.categoryModel?.categories?[index],));
                      },
                      name: state.categoryModel?.categories?[index].name,
                      image: state.categoryModel?.categories?[index].image,
                    ),
                  ),
                ),
              ),
            ),
          )
          /*ListView.builder(
              itemCount: state.categoryModel?.categories?.length ?? 0,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: CategoryCard(
                    name: state.categoryModel?.categories?[index].name,
                    image: state.categoryModel?.categories?[index].image,
                  ),
                );
              })*/
          ,
        );
      },
    );
  }
}
