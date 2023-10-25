import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/modules/auth/binding.dart';
import 'package:triwarna_rebuild/app/modules/auth/widgets/forgot_password/identify/binding.dart';
import 'package:triwarna_rebuild/app/modules/auth/widgets/forgot_password/identify/view.dart';
import 'package:triwarna_rebuild/app/modules/auth/widgets/forgot_password/send_link/binding.dart';
import 'package:triwarna_rebuild/app/modules/auth/widgets/forgot_password/send_link/view.dart';
import 'package:triwarna_rebuild/app/modules/auth/widgets/login/binding.dart';
import 'package:triwarna_rebuild/app/modules/auth/widgets/login/view.dart';
import 'package:triwarna_rebuild/app/modules/auth/widgets/register/binding.dart';
import 'package:triwarna_rebuild/app/modules/auth/widgets/register/view.dart';
import 'package:triwarna_rebuild/app/modules/auth/widgets/verify/view.dart';
import 'package:triwarna_rebuild/app/modules/benefit/binding.dart';
import 'package:triwarna_rebuild/app/modules/benefit/view.dart';
import 'package:triwarna_rebuild/app/modules/contents/all_contents/view.dart';
import 'package:triwarna_rebuild/app/modules/contents/binding.dart';
import 'package:triwarna_rebuild/app/modules/contents/detail_content/view.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/binding.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/view.dart';
import 'package:triwarna_rebuild/app/modules/detail_lottery/binding.dart';
import 'package:triwarna_rebuild/app/modules/detail_lottery/view.dart';
import 'package:triwarna_rebuild/app/modules/error/view.dart';
import 'package:triwarna_rebuild/app/modules/onboard/view.dart';
import 'package:triwarna_rebuild/app/modules/pin_input/binding.dart';
import 'package:triwarna_rebuild/app/modules/pin_input/view.dart';
import 'package:triwarna_rebuild/app/modules/point/binding.dart';
import 'package:triwarna_rebuild/app/modules/point/history_point/view.dart';
import 'package:triwarna_rebuild/app/modules/point/my_point/view.dart';
import 'package:triwarna_rebuild/app/modules/profile/binding.dart';
import 'package:triwarna_rebuild/app/modules/profile/change_password/view.dart';
import 'package:triwarna_rebuild/app/modules/profile/edit_profile/view.dart';
import 'package:triwarna_rebuild/app/modules/profile/pin/change_pin/view.dart';
import 'package:triwarna_rebuild/app/modules/profile/pin/create_pin/view.dart';
import 'package:triwarna_rebuild/app/modules/shopping/binding.dart';
import 'package:triwarna_rebuild/app/modules/shopping/shopping_history/view.dart';
import 'package:triwarna_rebuild/app/modules/splash/binding.dart';
import 'package:triwarna_rebuild/app/modules/splash/view.dart';
import 'package:triwarna_rebuild/app/modules/tracking/binding.dart';
import 'package:triwarna_rebuild/app/modules/tracking/view.dart';
import 'package:triwarna_rebuild/app/modules/update_apps/binding.dart';
import 'package:triwarna_rebuild/app/modules/update_apps/view.dart';
import 'package:triwarna_rebuild/app/modules/voucher/binding.dart';
import 'package:triwarna_rebuild/app/modules/voucher/view.dart';
import 'package:triwarna_rebuild/app/routes/routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.update,
      page: () => const UpdateApps(),
      binding: UpdateBinding(),
    ),
    GetPage(
      name: Routes.onboard,
      page: () => const OnBoardPage(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.verify,
      page: () => const VerifyPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.identify,
      page: () => const IdentifyPage(),
      binding: IdentifyBinding(),
    ),
    GetPage(
      name: Routes.sendLink,
      page: () => const SendLinkPage(),
      binding: SendLinkBinding(),
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.benefit,
      page: () => const BenefitPage(),
      binding: BenefitBinding(),
    ),
    GetPage(
      name: Routes.detailLottery,
      page: () => const DetailLotteryPage(),
      binding: LotteryBinding(),
    ),

    GetPage(
      name: Routes.contents,
      page: () => const ContentsPage(),
      binding: ContentsBinding(),
    ),
    GetPage(
      name: Routes.detailContent,
      page: () => const DetailContentPage(),
      binding: ContentsBinding(),
    ),

    GetPage(
      name: Routes.point,
      page: () => const PointPage(),
      binding: PointBinding(),
    ),
    GetPage(
      name: Routes.historyPoint,
      page: () => const HistoryPointPage(),
      binding: PointBinding(),
    ),
    GetPage(
      name: Routes.pinInput,
      page: () => const PinInputPage(),
      binding: PinInputBinding(),
    ),

    GetPage(
      name: Routes.voucher,
      page: () => const VoucherPage(),
      binding: VoucherBinding(),
    ),
    GetPage(
      name: Routes.tracking,
      page: () => const TrackingPage(),
      binding: TrackingBinding(),
    ),
    GetPage(
      name: Routes.shoppingHistory,
      page: () => const ShoppingHistoryPage(),
      binding: ShoppingBinding(),
    ),

    // PROFILE
    GetPage(
      name: Routes.editProfile,
      page: () => const EditProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.changePass,
      page: () => const ChangePassPage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.createPin,
      page: () => const CreatePinPage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.changePin,
      page: () => const ChangePinPage(),
      binding: ProfileBinding(),
    ),

    // HANDLER
    GetPage(
      name: Routes.error,
      page: () => const ErrorPage(),
    ),
  ];
}
