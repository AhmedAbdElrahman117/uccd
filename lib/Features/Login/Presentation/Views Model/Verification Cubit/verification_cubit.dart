import 'package:email_otp/email_otp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Features/Login/Presentation/Views%20Model/Verification%20Cubit/verification_states.dart';

class VerificationCubit extends Cubit<VerificationStates> {
  VerificationCubit(this.email) : super(VerificationInitialState()) {
    sendEmail();
  }

  final String email;

  void sendEmail() async {
    emit(SendLoading());

    await EmailOTP.sendOTP(email: email).then(
      (value) => value
          ? emit(
              SendSuccess(successMessage: 'Email Sent Successfully'),
            )
          : emit(
              SendFailed(
                errorMessage: 'Failed to Send OTP',
              ),
            ),
    );
  }
}
