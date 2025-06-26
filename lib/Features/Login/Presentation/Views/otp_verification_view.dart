import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:uccd/Core/Components/custom_loading_indicator.dart';
import 'package:uccd/Core/app_assets.dart';
import 'package:uccd/Core/app_banners.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/Login/Presentation/Views%20Model/Verification%20Cubit/verification_cubit.dart';
import 'package:uccd/Features/Login/Presentation/Views%20Model/Verification%20Cubit/verification_states.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/info_text.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/pin_field.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/resent_code_text.dart';
import 'package:uccd/generated/l10n.dart';

class OtpVerificationView extends StatefulWidget {
  const OtpVerificationView({super.key, required this.email});

  static String id = '/OtpVerificationView';

  final String email;

  @override
  State<OtpVerificationView> createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends State<OtpVerificationView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerificationCubit(
        'ahmedaboelnaga713@gmail.com',
      ),
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(),
            body: Center(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                shrinkWrap: true,
                children: [
                  Lottie.asset(
                    AppAssets.imagesOtp,
                    height: MediaQuery.sizeOf(context).height * 0.22,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      S.of(context).otpVerification,
                      style: AppText.style20Bold(context),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InfoText(
                    email: widget.email,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const PinField(),
                  const SizedBox(
                    height: 24,
                  ),
                  const ResentCodeText(),
                ],
              ),
            ),
          ),
          BlocConsumer<VerificationCubit, VerificationStates>(
            listener: _listener,
            builder: (context, state) {
              return CustomLoadingIndicator(
                isLoading: state is SendLoading,
                child: const SizedBox(),
              );
            },
          ),
        ],
      ),
    );
  }

  void _listener(BuildContext context, VerificationStates state) {
    if (state is SendSuccess) {
      AppBanners.showResentEmail(
        message: state.successMessage,
        alignment: Alignment.topCenter,
      );
    } else if (state is SendFailed) {
      AppBanners.showFailedEmail(
        message: state.errorMessage,
        alignment: Alignment.topCenter,
      );
    }
  }
}
