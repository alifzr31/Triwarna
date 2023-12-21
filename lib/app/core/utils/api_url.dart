class ApiUrl {
  static const String baseUrl = 'https://member.triwarna.co.id/api';
  static const String baseStorageUrl = 'https://member.triwarna.co.id/storage';
  static EndPoint endPoint = EndPoint();
  static StorageUrl storageUrl = StorageUrl();
}

class EndPoint {
  static const String fcmtoken = '/fcm_token';
  
  // AUTH
  static const String login = '/login';
  static const String register = '/register';
  static const String identifyForgotPassword = '/identify';
  static const String sendForgotPassword = '/send-forgot-password';
  static const String verify = '/send-verify-email';
  static const String logout = '/logout';
  
  static const String profile = '/profile';
  static const String content = '/content';
  static const String lottery = '/undian';
  static const String store = '/triwarna_store';

  static const String contents = '/contents';

  static const String point = '/point';
  static const String redeemPoint = '/point/update';
  static const String prize = '/point/prize_list';

  static const String voucher = '/voucher';
  static const String shoppingHistory = '/history';

  static const String kelurahan = '/desa';
  static const String editProfile = '/profile/update';
  static const String changePass = '/profile/password/update';
  static const String createPin = '/profile/pin/create';
  static const String changePin = '/profile/pin/update';

  static const String sendOtp = '/profile/pin/send-otp';
  static const String verifyOtp = '/profile/pin/send-otp/identify';
  static const String resetPin = '/profile/pin/reset';

  static const String deleteAccountOtp = '/profile/delete/send-otp';
  static const String deleteAccount = '/profile/delete';
}

class StorageUrl {
  static const String profile = '/profile';
  static const String qr = '/qr/members';
  static const String prize = '/prizes';
}