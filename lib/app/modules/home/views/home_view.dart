import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:send_delivery/app/modules/login/views/login_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   Size size = MediaQuery.of(context).size;
    return Scaffold(
    body: FlutterSplashScreen.fadeIn(
        backgroundImage: Image.asset("assets/splash.png"),
        duration: Duration(seconds: 3),
          onInit: () {
            debugPrint("On Init");
          },
          onEnd: () {
            debugPrint("On End");
          },
          childWidget: SizedBox(
            height: size.width,
            width: size.height,
            
          ),
          onAnimationEnd: () => debugPrint("On Fade In End"),
          nextScreen:  LoginView(),
        )
    );
  }
}
