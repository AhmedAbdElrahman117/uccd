import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uccd/Core/Components/section_title.dart';
import 'package:uccd/Core/app_assets.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/Login/Presentation/Views%20Model/Register%20Form%20Cubit/register_form_cubit.dart';
import 'package:uccd/Features/Login/Presentation/Views%20Model/Register%20Form%20Cubit/register_form_states.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/terms_conditions.dart';

class TermsRegisterPage extends StatelessWidget {
  const TermsRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 30),
        SvgPicture.asset(
          AppAssets.imagesTermsConditions,
          height: MediaQuery.sizeOf(context).height * 0.2,
        ),
        const SizedBox(height: 30),
        const Center(
          child: SectionTitle(
            title: 'Terms and Conditions',
          ),
        ),
        const SizedBox(height: 30),
        Center(
          child: Text(
            'Please Read Terms and Condition Carefully before Proceed in',
            style: AppText.style16Regular(context),
          ),
        ),
        const SizedBox(height: 30),
        Center(
          child: Text(
            'I agree and authorize the UCCD to use my data and my photographs taken during my participation in the training programs and/or career development service offered by the center for the purposes of UCCD reporting, publications, and employer networking \n\nand authorizing UCCD app to collect Data about my participation in courses for analysis and improving user Experience',
            style: AppText.style16Bold(context),
          ),
        ),
        const SizedBox(height: 30),
        BlocBuilder<RegisterFormCubit, RegisterFormStates>(
          buildWhen: (previous, current) => current is TermsAgreed,
          builder: (context, state) {
            return TermsConditionsTile(
              value: BlocProvider.of<RegisterFormCubit>(context).isAgree,
              onChanged: (value) {
                BlocProvider.of<RegisterFormCubit>(context).triggerAgree();
              },
            );
          },
        ),
      ],
    );
  }
}
