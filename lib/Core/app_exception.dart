import 'package:flutter/material.dart';
import 'package:uccd/generated/l10n.dart';

class AppException {
  static String firebaseAuthSignup(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'emailAlreadyInUse';
      case 'invalid-email':
        return 'authInvalidEmail';
      case 'operation-not-allowed':
        return 'emailNotEnabled';
      case 'too-many-requests':
        return 'tryAgainLater';
      case 'network-request-failed':
        return 'checkInternetConnection';
      default:
        return '';
    }
  }

  static String firebaseAuthLogin(String code) {
    switch (code) {
      case 'user-disabled':
        return 'userAccountDisabled';
      case 'user-not-found':
        return 'noSuchEmailFound';
      case 'invalid-email':
        return 'authInvalidEmail';
      case 'wrong-password':
        return 'wrongPassword';
      case 'INVALID_LOGIN_CREDENTIALS':
      case 'invalid-credential':
        return 'emailOrPasswordInvalid';
      case 'operation-not-allowed':
        return 'emailNotEnabled';
      case 'too-many-requests':
        return 'tryAgainLater';
      case 'network-request-failed':
        return 'checkInternetConnection';
      default:
        return 'unknownError';
    }
  }

  /// Translates error message keys to localized strings
  static String getLocalizedMessage(String errorKey, BuildContext context) {
    switch (errorKey) {
      case 'emailAlreadyInUse':
        return S.of(context).emailAlreadyInUse;
      case 'authInvalidEmail':
        return S.of(context).authInvalidEmail;
      case 'emailNotEnabled':
        return S.of(context).emailNotEnabled;
      case 'tryAgainLater':
        return S.of(context).tryAgainLater;
      case 'checkInternetConnection':
        return S.of(context).checkInternetConnection;
      case 'userAccountDisabled':
        return S.of(context).userAccountDisabled;
      case 'noSuchEmailFound':
        return S.of(context).noSuchEmailFound;
      case 'wrongPassword':
        return S.of(context).wrongPassword;
      case 'emailOrPasswordInvalid':
        return S.of(context).emailOrPasswordInvalid;
      case 'unknownError':
        return S.of(context).unknownError;
      case 'connectionTimeout':
        return S.of(context).connectionTimeout;
      case 'noUser':
        return S.of(context).noUser;
      case 'noUserFoundContactSupport':
        return S.of(context).noUserFoundContactSupport;
      default:
        return errorKey; // Return the key itself if not found
    }
  }
}
