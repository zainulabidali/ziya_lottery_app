import 'package:flutter/material.dart';
import 'package:lottery_app/screens/auth/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class AuthController {
  static void handleSignIn(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context, listen: false);
    provider.signIn();
  }

  // static void handleSendCode(BuildContext context) {
  //   final provider = Provider.of<AuthProvider>(context, listen: false);
  //   provider.sendCode();
  // }
}
