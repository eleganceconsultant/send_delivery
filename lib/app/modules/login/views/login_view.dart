import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:send_delivery/app/modules/login/views/phoneloginview_view.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFFA1010),
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: size.height/10),
        child: Center(
            child: Column(
          children: [
            Image.asset(
              "assets/login.png",
              width: 150,
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height / 8),
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.white)),
                  child: TextButton.icon(
                      label: Text(
                        "เข้าสู่ระบบด้วยเบอร์โทรศัพท์",
                        style: GoogleFonts.notoSansThai(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Get.to(PhoneloginviewView());
                      },
                      icon: Icon(
                        Icons.phone_forwarded_outlined,
                        color: Color(0xFFFFFFFF),
                      )),
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width / 3,
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                Text(
                  " หรือ ",
                  style: GoogleFonts.notoSansThai(color: Colors.white),
                ),
                Container(
                  width: size.width / 3,
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            SocialLoginButton(
                backgroundColor: Color(0xFF1A1A1A),
                
                text: "เข้าสู่ระบบด้วยอีเมล",
                buttonType: SocialLoginButtonType.generalLogin, onPressed: () {}),
            SizedBox(
              height: 10,
            ),
            SocialLoginButton(
                buttonType: SocialLoginButtonType.facebook, onPressed: () {
                 
                }),
            SizedBox(
              height: 10,
            ),
            SocialLoginButton(
                buttonType: SocialLoginButtonType.google, onPressed: () {}),
          ],
        )),
      ),
    );
  }
}
