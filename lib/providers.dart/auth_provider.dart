import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import '../models/user_model.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String phone = '';
  String password = '';
  bool rememberMe = false;
  String verificationId = '';
  String smsCode = '';
  bool isLoading = false;
  String? errorMessage;
  User? currentUser;

  AuthProvider() {
    // Listen to auth state changes
    _auth.authStateChanges().listen((User? user) {
      currentUser = user;
      notifyListeners();
    });
  }

  void setPhone(String value) {
    phone = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  void setSmsCode(String value) {
    smsCode = value;
    notifyListeners();
  }

  void toggleRemember(bool? value) {
    rememberMe = value ?? false;
    notifyListeners();
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void setError(String? message) {
    errorMessage = message;
    notifyListeners();
  }

  // Send OTP to phone number
  Future<void> sendOTP(String phoneNumber) async {
    setLoading(true);
    setError(null);

    try {
      // Format phone number (add country code if needed)
      String formattedPhone = phoneNumber;
      if (!phoneNumber.startsWith('+')) {
        formattedPhone = '+251$phoneNumber'; // Ethiopia country code
      }

      await _auth.verifyPhoneNumber(
        phoneNumber: formattedPhone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto-verification (Android only)
          await _auth.signInWithCredential(credential);
          setLoading(false);
          debugPrint('Phone number automatically verified and user signed in');
        },
        verificationFailed: (FirebaseAuthException e) {
          setLoading(false);
          if (e.code == 'invalid-phone-number') {
            setError('The phone number is invalid.');
          } else {
            setError(e.message ?? 'Verification failed');
          }
          debugPrint('Verification failed: ${e.message}');
        },
        codeSent: (String verId, int? resendToken) {
          verificationId = verId;
          setLoading(false);
          setError(null);
          debugPrint('OTP sent to $formattedPhone');
        },
        codeAutoRetrievalTimeout: (String verId) {
          verificationId = verId;
          debugPrint('Auto retrieval timeout');
        },
        timeout: const Duration(seconds: 60),
      );
    } catch (e) {
      setLoading(false);
      setError(e.toString());
      debugPrint('Error sending OTP: $e');
    }
  }

  // Verify OTP and sign in
  Future<bool> verifyOTP(String sms) async {
    setLoading(true);
    setError(null);

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: sms,
      );

      UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );
      currentUser = userCredential.user;
      setLoading(false);
      debugPrint('User signed in successfully: ${currentUser?.uid}');
      return true;
    } catch (e) {
      setLoading(false);
      setError('Invalid OTP. Please try again.');
      debugPrint('Error verifying OTP: $e');
      return false;
    }
  }

  // Sign in with phone and password (legacy method)
  Future<void> signIn() async {
    setLoading(true);
    setError(null);

    try {
      // For now, trigger OTP sending
      await sendOTP(phone);
    } catch (e) {
      setLoading(false);
      setError(e.toString());
      debugPrint('Error signing in: $e');
    }
  }

  // Send password reset code
  Future<void> sendCode() async {
    await sendOTP(phone);
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      currentUser = null;
      notifyListeners();
    } catch (e) {
      debugPrint('Error signing out: $e');
    }
  }

  // Check if user is signed in
  bool get isSignedIn => currentUser != null;
}
