import 'package:firebase_auth/firebase_auth.dart';

String getFirebaseAuthErrorMessage(FirebaseAuthException e) {
  switch (e.code) {

    case 'invalid-email':
      return 'Please enter a valid email address.';

    case 'user-disabled':
      return 'This account has been disabled. Contact support.';

    case 'user-not-found':
      return 'No account found with this email.';

    case 'wrong-password':
      return 'Incorrect password. Please try again.';

    case 'email-already-in-use':
      return 'This email is already registered. Try logging in.';

    case 'weak-password':
      return 'Password should be at least 6 characters.';

    case 'operation-not-allowed':
      return 'This sign-in method is not enabled.';

    case 'network-request-failed':
      return 'No internet connection. Please check your network.';

    case 'too-many-requests':
      return 'Too many attempts. Try again later.';

    default:
      return 'Something went wrong. Please try again.';
  }
}