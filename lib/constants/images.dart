class Images {
  static final Images _images = Images._internal();

  Images._internal();

  factory Images() {
    return _images;
  }

  static String get imageRoot => _imageRoot;

  static const String _imageRoot = 'assets/';
  static const String splashScreenImage =
      _imageRoot + 'splash_screen_image.svg';
  static const String calendar = _imageRoot + 'calendar.svg';
}
