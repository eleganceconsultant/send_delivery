import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:send_delivery/util/constants.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = stripe_pk;
  await dotenv.load(fileName: "assets/.env");

  // Initialize Firebase SDK
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: FirebaseOptions(
              apiKey: "AIzaSyDgYAJHbDOPZa_U85qGK2KtrCmXmll7F8k",
              appId: "1:847898737291:android:0fc97a4d6574257783728e",
              messagingSenderId: "847898737291",
              projectId: "send-good"))
      : await Firebase.initializeApp();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Send Delivery",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        fontFamily: GoogleFonts.notoSansThai().fontFamily)
      ),
    
  );
}
