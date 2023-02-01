part of 'theme_cubit.dart';

enum ThemeModeStatus { initial, dark, light }

class ThemeState extends Equatable {
  final ThemeModeStatus themeMode;

  const ThemeState({this.themeMode = ThemeModeStatus.initial});

  ThemeState copyWith({final ThemeModeStatus? themeMode}) {
    return ThemeState(themeMode: themeMode ?? this.themeMode);
  }

  @override
  List<Object> get props => [themeMode];
}
