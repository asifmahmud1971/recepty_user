import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receptyUser/core/app/app_dependency.dart';
import 'package:receptyUser/core/app/app_preference.dart';
import 'package:receptyUser/core/constants/app_colors.dart';
import 'package:receptyUser/core/constants/app_size.dart';
import 'package:receptyUser/core/constants/app_strings.dart';
import 'package:receptyUser/data/network/urls.dart';
import 'package:receptyUser/features/components/custom_image.dart';
import 'package:receptyUser/features/components/custom_progress_loader.dart';
import 'package:receptyUser/features/components/my_context.dart';
import 'package:receptyUser/features/router/routes.dart';
import 'package:receptyUser/features/screens/profile/view/edit_profile_page.dart';
import 'package:receptyUser/features/screens/recipe/widget/language.dart';
import 'package:receptyUser/features/screens/theme/cubit/theme_cubit.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _ProfileScreenState createState() => new _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    log(preferences.getUserData()?.user?.profileInformation?.profilePicture);
    dismissProgressDialog();
    super.initState();
  }

  AppPreferences preferences = instance.get();
  final List<String> items = [
    'English',
    'Czech',
    'Slovak',
  ];
  String selectedValue = "Czech";

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    if (context.locale.toString() == "en_US") {
      selectedValue = "English";
    } else if (context.locale.toString() == "cs_CZ") {
      selectedValue = "Czech";
    }else{
      selectedValue = "Slovak";
    }

    return Scaffold(
      body: new Container(
        child: new Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                  gradient: new LinearGradient(colors: [
                AppColors.kPrimaryColor,
                AppColors.kWhiteColor,
              ], begin: Alignment.topCenter, end: Alignment.center)),
            ),
            new Scaffold(
              body: new Container(
                child: new Stack(
                  children: <Widget>[
                /*    new Align(
                      alignment: Alignment.center,
                      child: new Padding(
                        padding: new EdgeInsets.only(top: _height / 15),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            CustomImage(
                              isCircle: true,
                              size: 150.r,
                              baseUrl: Urls.imageUrl +
                                      preferences
                                          .getUserData()
                                          ?.user
                                          ?.profileInformation
                                          ?.profilePicture ??
                                  "",
                            ),
                           kHeightBox10,
                            new Text(
                              preferences.getUserData()?.user?.name ?? "",
                              style: new TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),*/
                    Positioned(
                      top: 50.h,
                      right: 10.w,
                      child: IconButton(
                        onPressed: () {
                          GetContext.to(EditProfilePage());
                        },
                        icon: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(width: 1)),
                            child: Icon(
                              Icons.edit_outlined,
                            )),
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.only(
                          top: _height / 2.6,
                          left: _width / 20,
                          right: _width / 20),
                      child: new Column(
                        children: <Widget>[
                          /*   new Container(
                            decoration: new BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  new BoxShadow(
                                      color: Colors.black45,
                                      blurRadius: 2.0,
                                      offset: new Offset(0.0, 2.0))
                                ]),
                            child: new Padding(
                              padding: new EdgeInsets.all(_width / 20),
                              child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    headerChild('Bookmarks', 114),
                                    headerChild('Subscription', 1205),
                                    headerChild('Following', 360),
                                  ]),
                            ),
                          ),*/
                          new Padding(
                            padding: new EdgeInsets.only(top: _height / 20),
                            child: new Column(
                              children: <Widget>[
                                infoChild(
                                    _width,
                                    Icons.person,
                                    preferences.getUserData()?.user?.name ??
                                        ""),
                                infoChild(
                                    _width,
                                    Icons.email,
                                    preferences.getUserData()?.user?.email ??
                                        ""),
                              /*  infoChild(
                                    _width,
                                    Icons.call,
                                    preferences
                                            .getUserData()
                                            ?.user
                                            ?.phoneNumber ??
                                        ""),*/
                                /*InkWell(
                                  onTap: () {
                                    BlocProvider.of<ThemeCubit>(context)
                                        .toggleTheme();
                                  },
                                  child: BlocBuilder<ThemeCubit, ThemeState>(
                                    builder: (context, state) {
                                      if (state.themeMode ==
                                          ThemeModeStatus.dark) {
                                        return infoChild(
                                            _width, Icons.light_mode, "Light");
                                      } else {
                                        return infoChild(
                                            _width, Icons.dark_mode, "Dark");
                                      }
                                    },
                                  ),
                                ),*/
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    infoChild(_width, Icons.language,
                                        selectedValue ?? ""),
                                    InkWell(
                                      onTap: () {

                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return LanguageDialog();
                                          },
                                        );

                                        setState(() {});
                                        if (selectedValue == "English") {
                                          context.setLocale(Locale('en', 'US'));
                                        } else if (selectedValue == "Czech") {
                                          context.setLocale(Locale('cs', 'CZ'));
                                        }
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 8.0, left: 100.w),
                                        child: Text(
                                          "Change",
                                          style: kRegularLine16.copyWith(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    preferences.logout();
                                    GetContext.offAll(Routes.welcomeScreen);
                                  },
                                  child: new Padding(
                                    padding:
                                        new EdgeInsets.only(top: _height / 30),
                                    child: new Container(
                                      width: _width / 3,
                                      height: _height / 20,
                                      decoration: new BoxDecoration(
                                          color: AppColors.kPrimaryColor,
                                          borderRadius: new BorderRadius.all(
                                              new Radius.circular(
                                                  _height / 40)),
                                          boxShadow: [
                                            new BoxShadow(
                                                color: Colors.black87,
                                                blurRadius: 2.0,
                                                offset: new Offset(0.0, 1.0))
                                          ]),
                                      child: new Center(
                                        child: Text(AppStrings.logout.tr(),
                                            style: kRegularLine12.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget headerChild(String header, int value) => new Expanded(
          child: new Column(
        children: <Widget>[
          new Text(header),
          new SizedBox(
            height: 8.0,
          ),
          new Text(
            '$value',
            style: kRegularLine14.copyWith(
                fontWeight: FontWeight.bold, color: AppColors.kPrimaryColor),
          )
        ],
      ));

  Widget infoChild(double width, IconData icon, data, {VoidCallback? onTap}) =>
      new Padding(
        padding: new EdgeInsets.only(bottom: 8.0),
        child: Row(
          children: <Widget>[
            new SizedBox(
              width: width / 10,
            ),
            new Icon(
              icon,
              size: 36.0,
            ),
            new SizedBox(
              width: width / 20,
            ),
            new Text(data)
          ],
        ),
      );
}
