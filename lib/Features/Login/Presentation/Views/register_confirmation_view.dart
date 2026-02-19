import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:uccd/Core/Components/custom_button.dart';
import 'package:uccd/Core/Components/loading_indicator.dart';
import 'package:uccd/Core/app_assets.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/Login/Presentation/Views%20Model/Register%20Form%20Cubit/register_form_cubit.dart';
import 'package:uccd/Features/Login/Presentation/Views%20Model/Register%20Form%20Cubit/register_form_states.dart';
import 'package:uccd/Features/User/user_view.dart';
import 'package:uccd/generated/l10n.dart';

class RegisterConfirmationView extends StatelessWidget {
  const RegisterConfirmationView({super.key, required this.cubit});

  static String id = '/RegisterConfirmationView';

  final RegisterFormCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RegisterFormCubit, RegisterFormStates>(
        bloc: cubit,
        builder: (context, state) {
          switch (state) {
            case RegisterLoading():
              return const LoadingIndicator();
            case RegisterFailed():
              return RegisterFailure(
                disability: state.disability,
                graduationYear: state.graduationYear,
                id: state.id,
                phone: state.phone,
                cubit: cubit,
              );
            case RegisterSuccess():
              return const RegisterSuccessfully();

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}

class RegisterSuccessfully extends StatelessWidget {
  const RegisterSuccessfully({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16,
        children: [
          RepaintBoundary(
            child: Lottie.asset(
              AppAssets.imagesCheck,
              repeat: false,
              frameRate: FrameRate.max,
            ),
          ),
          Text(
            'Registered Successfully',
            style: AppText.style24Bold(context),
          ),
          Text(
            'Welcome to UCCD Family you can now go to your account',
            textAlign: TextAlign.center,
            style: AppText.style18Regular(context),
          ),
          CustomButton(
            title: 'My Account',
            icon: Icons.login,
            onPressed: () {
              context.go(
                UserView.id,
              );
            },
          ),
        ],
      ),
    );
  }
}

class RegisterFailure extends StatelessWidget {
  const RegisterFailure({
    super.key,
    required this.id,
    required this.phone,
    required this.graduationYear,
    required this.disability,
    required this.cubit,
  });

  final String id;
  final String phone;
  final Timestamp graduationYear;
  final String disability;
  final RegisterFormCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 28,
        children: [
          RepaintBoundary(
            child: Lottie.asset(
              AppAssets.imagesFail,
              height: 180,
              repeat: false,
              frameRate: FrameRate.max,
            ),
          ),
          Text(
            S.of(context).registrationFailed,
            style: AppText.style24Bold(context),
          ),
          Text(
            S.of(context).checkInternetConnectionAndTryAgain,
            textAlign: TextAlign.center,
            style: AppText.style18Regular(context),
          ),
          CustomButton(
            title: S.of(context).tryAgain,
            icon: FontAwesomeIcons.xmark,
            backgroundColor: Colors.red,
            onPressed: () {
              cubit.register(
                id: id,
                phone: phone,
                graduationYear: graduationYear,
                disability: disability,
              );
            },
          ),
        ],
      ),
    );
  }
}
