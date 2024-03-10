import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_page_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/ordering/bindings/ordering_binding.dart';
import '../modules/ordering/views/ordering_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/wash/bindings/wash_binding.dart';
import '../modules/wash/views/wash_view.dart';
import '../modules/wash_list/bindings/wash_list_binding.dart';
import '../modules/wash_list/views/wash_list_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOMEPAGE,
      page: () => const HomePageView(),
    ),
    GetPage(
      name: _Paths.WASH,
      page: () => const WashView(),
      binding: WashBinding(),
    ),
    GetPage(
      name: _Paths.WASH_LIST,
      page: () => const WashListView(),
      binding: WashListBinding(),
    ),
    GetPage(
      name: _Paths.ORDERING,
      page: () => OrderingView(),
      binding: OrderingBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
  ];
}
