sealed class VerificationStates {}

class VerificationInitialState extends VerificationStates {}

class SendSuccess extends VerificationStates {
  final String successMessage;

  SendSuccess({required this.successMessage});
}

class SendFailed extends VerificationStates {
  final String errorMessage;

  SendFailed({required this.errorMessage});
}

class SendLoading extends VerificationStates {}
