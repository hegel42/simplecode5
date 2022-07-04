abstract class AppAssets {
  static const images = _Images();
  static const svg = _Svg();
}

class _Images {
  const _Images();

  final String noAvatar = 'assets/images/bitmap/no_avatar.png';
  final String loginScreen = 'assets/images/bitmap/login_screen.png';
  final String splashScreen = 'assets/images/bitmap/splash_screen.png';
  final String backgroundScreen = 'assets/images/bitmap/background.png';
  final String mortyImage = 'assets/images/bitmap/morty.png';
  final String rickImage = 'assets/images/bitmap/rick.png';
  final String logoImage = 'assets/images/bitmap/logo.png';
}

class _Svg {
  const _Svg();
  final String account = 'assets/images/svg/account.svg';
  final String password = 'assets/images/svg/password.svg';
  final String characterIcon = 'assets/images/svg/character_icon.svg';
}
