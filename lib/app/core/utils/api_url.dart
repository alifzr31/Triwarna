class ApiUrl {
  static const String baseUrl = 'http://staging.triwarna.co.id/api';
  static const String baseStorageUrl = 'http://staging.triwarna.co.id/storage';
  static EndPoint endPoint = EndPoint();
  static StorageUrl storageUrl = StorageUrl();
}

class EndPoint {
  static const String fcmtoken = '/fcm_token';
  
  // AUTH
  static const String login = '/login';
  static const String register = '/register';
  static const String sendVerifyOtp = '/register/verify/send';
  static const String verifyOtpWhatsapp = '/register/verify/wa';
  static const String identifyForgotPassword = '/password/reset/identify';
  static const String sendForgotPassword = '/password/reset/send';
  static const String verifyOtpForgotPassword = '/password/reset/wa';
  static const String resetPassword = '/password/reset';
  static const String logout = '/logout';
  
  static const String profile = '/profile';
  static const String content = '/content';
  static const String lottery = '/undian';
  static const String winner = '/undian/pemenang';
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

  static const String sendOtp = '/profile/pin/send';
  static const String verifyOtp = '/profile/pin/wa';
  static const String resetPin = '/profile/pin/reset';

  static const String deleteAccountOtp = '/profile/delete/send-otp';
  static const String deleteAccount = '/profile/delete';
}

class StorageUrl {
  static const String profile = '/profile';
  static const String qr = '/qr/members';
  static const String prize = '/prizes';
  static const String attachments = '/attachments';
  static const String signatures = '/signatures';
}