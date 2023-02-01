enum FlavorStatus {
  production,
  development,
  staging,
}

class AppFlavor {
  static FlavorStatus appFlavor = FlavorStatus.production;

  static bool get getFlavor {
    switch (appFlavor) {
      case FlavorStatus.production:
        return false;
      case FlavorStatus.development:
        return true;
      case FlavorStatus.staging:
        return true;
      default:
        return true;
    }
  }
}
