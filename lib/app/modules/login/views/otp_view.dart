import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:send_delivery/app/modules/login/controllers/otp_controller.dart';
class OtpView extends GetView {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final otpController = Get.put(OtpController());
    return Scaffold(
      appBar: AppBar(title: Text("ยืนยันรหัส OTP",style: GoogleFonts.notoSansThai(),)),
      body: Center(
        child: Container(
        
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset("assets/otp.png",width: 100,),

                  ),
                  SizedBox(height: 25,),
                  Text("เราได้ส่งรหัส OTP ไปยัง ${otpController.phoneNumber.value}",style: GoogleFonts.notoSansThai(fontSize: 18,),),
                 SizedBox(height: 25,),
                 PinCodeFields(
                  length: 6,
                  onComplete: (pinCode){
                    print(pinCode);
                    otpController.verifyOTP(pinCode);
                    
                 })
                ],
              )),
        ),
      ),
    );
  }
}
