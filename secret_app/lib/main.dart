import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:secret_app/app/app.bottomsheets.dart';
import 'package:secret_app/app/app.dialogs.dart';
import 'package:secret_app/app/app.locator.dart';
import 'package:secret_app/app/app.router.dart';
import 'package:secret_app/ui/common/app_colors.dart';
import 'package:stacked_services/stacked_services.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setupLocator();
  setupDialogUi();
  setupBottomSheetUi();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Secure App',
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        primaryColor: kcBackgroundColor,
        focusColor: kcPrimaryColor,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: kcPrimaryColor,
          onPrimary: kcDarkGreyColor,
          secondary: kcPrimaryColorDark,
          onSecondary: kcLightGrey,
          error: Colors.red,
          onError: Colors.white,
          background: kcVeryLightGrey,
          onBackground: kcPrimaryColor,
          surface: Colors.white,
          onSurface: kcDarkGreyColor,
        ),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.black,
            ),
      ),
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
