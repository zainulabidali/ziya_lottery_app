import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottery_app/firebase_options.dart';
import 'package:lottery_app/providers.dart/auth_provider.dart';
import 'package:lottery_app/screens/auth/welcome_view.dart';
import 'package:lottery_app/screens/auth/sign_in_view.dart';
import 'package:lottery_app/screens/auth/forgot_password_view.dart';
import 'package:provider/provider.dart';

void main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const AuthApp());
}


class AuthApp extends StatelessWidget {
  const AuthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
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
              '/': (context) => const WelcomeView(),
              '/signin': (context) => const SignInView(),
              '/forgot-password': (context) => const ForgotPasswordView(),
            },
          );
        },
      ),
    );
  }
}
