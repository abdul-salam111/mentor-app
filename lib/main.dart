import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mentor_app/app/storage/storage.dart';

import 'app/routes/app_pages.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageServices.to.init();
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          builder:EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          title: "Mentor App",
          initialRoute: Routes.NAVIGATION_BAR,
          getPages: AppPages.routes,
        );
      },
    ),
  );
}
