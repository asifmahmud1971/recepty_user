import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theme/cubit/theme_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            BlocProvider.of<ThemeCubit>(context).toggleTheme();
          },
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              if (state.themeMode == ThemeModeStatus.dark) {
                return const Icon(Icons.light_mode);
              } else {
                return const Icon(Icons.dark_mode);
              }
            },
          ),
        ),
      ),
    );
  }
}
