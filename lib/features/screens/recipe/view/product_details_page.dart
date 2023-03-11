
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receptyUser/features/screens/recipe/cubit/recipe_cubit.dart';

class ProductDetailsPage extends StatefulWidget {
  final String? recipeId;
  const ProductDetailsPage({Key? key, this.recipeId}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {

  @override
  void initState() {
    context.read<RecipeCubit>().getRecipeDesc(id: widget.recipeId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
