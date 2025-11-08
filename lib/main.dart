import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottery_app/firebase_options.dart';
import 'package:lottery_app/auth/providers/auth_provider.dart';
import 'package:lottery_app/auth/screens/forgot_password_view.dart';
import 'package:lottery_app/auth/screens/sign_in_view.dart';
import 'package:lottery_app/auth/screens/welcome_view.dart';
import 'package:lottery_app/main_screen.dart';
import 'package:lottery_app/test_main_screen.dart'; // Changed to test screen
import 'package:lottery_app/home/controller/plancard_controller.dart';
import 'package:provider/provider.dart';

void main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const lottery_App());
}

class lottery_App extends StatelessWidget {
  const lottery_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => PlanController()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Lottery App',
            theme: ThemeData(fontFamily: 'Poppins'),
            initialRoute: '/',
            routes: {
              '/': (context) => const MainScreen(),
              // '/signin': (context) => const WelcomeView(),
              // '/forgot-password': (context) => const ForgotPasswordView(),
            },
          );
        },
      ),
    );
  }
}
