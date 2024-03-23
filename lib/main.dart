import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:mentor_app/app/storage/storage.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageServices.to.init();
  Stripe.publishableKey =
      'pk_test_51OVD6sGSU7ONSj30sWfFK9wuUeiCGF8yvDCKPWd2KTFvIrD1KAi2Lb78VyErMYUefdi6AwlaS6LAwJd62aCIxIag00mW0qhuAF';

  await Stripe.instance.applySettings();
  final navigatorKey = GlobalKey<NavigatorState>();

  /// 1.1.2: set navigator key to ZegoUIKitPrebuiltCallInvitationService
  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);

  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          theme: ThemeData(useMaterial3: true),
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          title: "Mentor App",
          initialRoute: Routes.SPLASHSCREEN,
          getPages: AppPages.routes,
          navigatorKey: navigatorKey,
        );
      },
    ),
  );
}
