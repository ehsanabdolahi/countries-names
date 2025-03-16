abstract class StringCategory {
  static const noInternetConnection = 'No internet connection';
  static const worldsCountries = 'کشورهای جهان';
  static const tryAgain = 'تلاش مجدد';
  static const pleaseTapLoadingButton = 'لطفاً برای دریافت لیست کشورها، روی دکمه بارگیری کلیک کنید.';
  static const emptyString = '';


  static failedToLoadCountries(String statusCode) =>
      'Failed to load countries: $statusCode';
  static errorIndicator(String errorMessage) =>
      'خطا: $errorMessage';
  static capitalIndicator(String capital) =>
      'پایتخت: $capital';
}