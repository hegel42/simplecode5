abstract class AppAssets {
  static const images = _Images();
  static const svg = _Svg();
}

class _Images {
  const _Images();

  final String noAvatar = 'assets/images/bitmap/no_avatar.png';
  final String loginScreen = 'assets/images/bitmap/login_screen.png';
  final String splashScreen = 'assets/images/bitmap/splash_screen.png';
}

class _Svg {
  const _Svg();
  final String account = 'assets/images/svg/account.svg';
  final String password = 'assets/images/svg/password.svg';
  final String characterIcon = 'assets/images/svg/character_icon.svg';
}
