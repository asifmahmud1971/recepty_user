import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receptyUser/core/constants/app_size.dart';
import 'package:receptyUser/core/constants/app_strings.dart';
import 'package:receptyUser/features/screens/theme/cubit/theme_cubit.dart';

class SearchBar extends StatelessWidget {
  final VoidCallback?onTap;

  const SearchBar({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: state.themeMode ==
                      ThemeModeStatus.dark?Colors.white: Colors.black12,),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10),
                    child: Icon(Icons.search_sharp, color:state.themeMode ==
                        ThemeModeStatus.dark?Colors.white: Colors.black26,),
                  ),
                  Expanded(child: Container(
                    child: Text(AppStrings.searchHint.tr(),
                      style: kRegularLine16.copyWith(color: state.themeMode ==
                          ThemeModeStatus.dark?Colors.white: Colors.black26,),),
                  ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
