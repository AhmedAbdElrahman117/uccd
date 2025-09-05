class AppException {
  static String firebaseAuthSignup(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'Email Already in Use';
      case 'invalid-email':
        return 'Invalid Email';
      case 'operation-not-allowed':
        return 'Email is Not Enabled Contact Support';
      case 'too-many-requests':
        return 'Try Again Later';
      case 'network-request-failed':
        return 'Check Your Internet Connection And Try Again Later';
      default:
        return '';
    }
  }

  static String firebaseAuthLogin(String code) {
    switch (code) {
      case 'user-disabled':
        return 'User Account is Diabled Contact Support';
      case 'user-not-found':
        return 'No Such Email Found';
      case 'invalid-email':
        return 'Invalid Email';
      case 'wrong-password':
        return 'Wrong Password';
      case 'INVALID_LOGIN_CREDENTIALS':
      case 'invalid-credential':
        return 'Email Or Password is Invalid';
      case 'operation-not-allowed':
        return 'Email is Not Enabled Contact Support';
      case 'too-many-requests':
        return 'Try Again Later';
      case 'network-request-failed':
        return 'Check Your Internet Connection And Try Again Later';
      default:
        return 'Unknown Error';
    }
  }
}
