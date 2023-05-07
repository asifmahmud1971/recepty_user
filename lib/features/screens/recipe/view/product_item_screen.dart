import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receptyUser/core/constants/app_colors.dart';
import 'package:receptyUser/core/constants/app_size.dart';
import 'package:receptyUser/core/constants/app_strings.dart';
import 'package:receptyUser/core/constants/colors.dart';
import 'package:receptyUser/features/components/custom_image.dart';
import 'package:receptyUser/features/components/custom_progress_loader.dart';
import 'package:receptyUser/features/components/my_context.dart';
import 'package:receptyUser/features/screens/recipe/cubit/recipe_cubit.dart';
import 'package:receptyUser/features/screens/recipe/cubit/recipe_state.dart';
import 'package:receptyUser/features/screens/recipe/view/fullscreen_video.dart';
import 'package:receptyUser/features/screens/theme/cubit/theme_cubit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ProductItemScreen extends StatefulWidget {
  final String? recipeId;
  final String videoId;

  const ProductItemScreen({Key? key, this.recipeId, required this.videoId})
      : super(key: key);

  @override
  State<ProductItemScreen> createState() => _ProductItemScreenState();
}

class _ProductItemScreenState extends State<ProductItemScreen> {
  late YoutubePlayerController _controller;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    context
        .read<RecipeCubit>()
        .getRecipeDesc(id: widget.recipeId.toString())
        .then((value) => {
              _controller = YoutubePlayerController(
                initialVideoId: widget.videoId,
                flags: const YoutubePlayerFlags(
                  mute: false,
                  autoPlay: false,
                  disableDragSeek: false,
                  loop: false,
                  isLive: false,
                  forceHD: false,
                  enableCaption: true,
                ),
              )..addListener(listener)
            });


  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {

      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecipeCubit, RecipeState>(
      listener: (context, state) {
    if (state.status == RecipeStatus.loading) {
      showProgressDialog();
    } else if (state.status == RecipeStatus.success) {
      dismissProgressDialog();
    } else if (state.status == RecipeStatus.bookmarkAddSuccess) {
      context
          .read<RecipeCubit>()
          .getRecipeDesc(id: widget.recipeId.toString())
          .whenComplete(() => {dismissProgressDialog()});
    } else {
      dismissProgressDialog();
    }
      },
      builder: (context, state) {
    return WillPopScope(
      onWillPop: () async {
        if (_controller.value.isFullScreen) {
          _controller.toggleFullScreenMode();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body:  state.status != RecipeStatus.loading
              ? ListView(children: [

                state.recipeDescModel?.tutorial?.video != null
                    ? Stack(
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          width: 1.sw,
                          height: _controller.value.isFullScreen ? 1.sh :300.h,
                          decoration: const BoxDecoration(),
                          child: YoutubePlayerBuilder(

                              player: YoutubePlayer(
                                aspectRatio: 16 / 9,
                                controller: _controller,
                              ),
                              builder: (context, player) {
                                return Container(
                                  child: player,
                                );
                              }),
                        ),
                        _controller.value.isFullScreen
                            ? SizedBox()
                            : Positioned(
                          top: 10.h,
                          left: 10,
                          child:  buttonArrow(context),),
                        _controller.value.isFullScreen
                            ? SizedBox()
                            :  Positioned(
                          top: 10.h,
                          right: 10,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: InkWell(
                              onTap: () {
                                context.read<RecipeCubit>().addBookmark(
                                    id: state.recipeDescModel?.tutorial?.id);
                              },
                              child: CircleAvatar(
                                radius: 20.r,
                                backgroundColor: Colors.teal,
                                child: Icon(
                                  state.recipeDescModel?.tutorial
                                      ?.isBookmarked ??
                                      false
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                    : SizedBox(),
                scroll()

                ,
              ],)
              : SizedBox(),
      ),
    );
      },
    );
  }

  buttonArrow(BuildContext context) {
    return InkWell(
      onTap: () {
        if (_controller.value.isFullScreen) {
          _controller.toggleFullScreenMode();
        } else {
          Navigator.pop(context);
        }
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.white),
        child: const Icon(
          Icons.arrow_back_ios_new,
          size: 20,
          color: Colors.black,
        ),
      ),
    );
  }

  scroll() {
    return BlocConsumer<RecipeCubit, RecipeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: AppColors.kPrimaryColor,
            /*borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20)),*/
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 5,
                      width: 35,
                      color: Colors.black12,
                    ),
                  ],
                ),
              ),
              Text(
                state.recipeDescModel?.tutorial?.title ?? "",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              kHeightBox10,
              Text(
                "Food ${state.recipeDescModel?.tutorial?.videoLength ?? 0} min",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.kSecondaryColor),
              ),
              kHeightBox15,
              SizedBox(
                width: 1.sw,
                height: 300.h,
                child: PageView.builder(
                    itemCount: state.recipeDescModel?.tutorial
                        ?.tutorialImages?.length ??
                        0,
                    itemBuilder: (context, index) {
                      return CustomImage(
                        width: 1.sw,
                        baseUrl: state.recipeDescModel?.tutorial
                            ?.tutorialImages?[index].image,
                      );
                    }),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Divider(
                  height: 4,
                ),
              ),
              Text(
                AppStrings.description.tr(),
              ),
              kHeightBox10,
              Text(
                state.recipeDescModel?.tutorial?.description ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: SecondaryText),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Divider(
                  height: 4.h,
                ),
              ),
              Text(
                AppStrings.ingredients.tr(),
              ),
              kHeightBox10,
              Wrap(
                direction: Axis.horizontal,
                children: List.generate(
                    state.recipeDescModel?.tutorial?.ingredients
                        ?.length ??
                        0,
                        (index) => ingredients(
                        name: state.recipeDescModel?.tutorial
                            ?.ingredients?[index].name,
                        image: state.recipeDescModel?.tutorial
                            ?.ingredients?[index].image)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Divider(
                  height: 4.h,
                ),
              ),
              Text(
                AppStrings.steps.tr(),
              ),
              kHeightBox10,
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.recipeDescModel?.tutorial
                    ?.tutorialSteps?.length ??
                    0,
                itemBuilder: (context, index) => steps(
                    context: context,
                    name: state.recipeDescModel?.tutorial
                        ?.tutorialSteps?[index].name,
                    step: state.recipeDescModel?.tutorial
                        ?.tutorialSteps?[index].description),
              ),
            ],
          ),
        );
      },
    );
  }

  ingredients({String? name, String? image}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black12)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            /* Icon(
              Icons.check,
              color: Colors.green,
            ),
            kHeightBox10,*/
            Text(
              name ?? "",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  steps({BuildContext? context, String? name, String? step}) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                backgroundColor: mainText,
                radius: 12,
                child: Text(name!),
              ),
              Column(
                children: [
                  SizedBox(
                    width: 270,
                    child: Text(
                      step!,
                      maxLines: 3,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: state.themeMode == ThemeModeStatus.dark
                              ? Colors.white
                              : mainText),
                    ),
                  ),
                  kHeightBox10,
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
