import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uccd/Core/Components/section_title.dart';
import 'package:uccd/Core/app_assets.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/Login/Presentation/Views%20Model/Register%20Form%20Cubit/register_form_cubit.dart';
import 'package:uccd/Features/Login/Presentation/Views%20Model/Register%20Form%20Cubit/register_form_states.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/terms_conditions.dart';
import 'package:uccd/generated/l10n.dart';

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
        Center(
          child: SectionTitle(
            title: S.of(context).TermsAndConditions,
          ),
        ),
        const SizedBox(height: 30),
        Center(
          child: Text(
            S.of(context).readTerms,
            style: AppText.style16Regular(context),
          ),
        ),
        const SizedBox(height: 30),
        Center(
          child: Text(
            '${S.of(context).TermsText1}\n\n${S.of(context).TermsText2}',
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
