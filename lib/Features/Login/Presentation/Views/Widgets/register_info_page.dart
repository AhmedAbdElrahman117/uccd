import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uccd/Core/Components/section_title.dart';
import 'package:uccd/Core/app_assets.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/disability_section.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/gradution_year_field.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/phone_number_field.dart';
import 'package:uccd/generated/l10n.dart';

class RegisterInfoPage extends StatelessWidget {
  const RegisterInfoPage({
    super.key,
    required this.formKey,
    required this.phoneNumberController,
    required this.graduationYearController,
    required this.disabilityController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController phoneNumberController;
  final TextEditingController graduationYearController;
  final TextEditingController disabilityController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        children: [
          const SizedBox(height: 30),
          SvgPicture.asset(
            AppAssets.imagesFillForm2,
            height: MediaQuery.sizeOf(context).height * 0.2,
          ),
          const SizedBox(height: 30),
          Center(
            child: SectionTitle(
              title: S.of(context).studentInfo,
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: Text(
              S.of(context).studentInfoDescription,
              style: AppText.style16Regular(context),
            ),
          ),
          const SizedBox(height: 30),
          PhoneNumberField(
            phoneNumberController: phoneNumberController,
          ),
          const SizedBox(height: 30),
          GraduationYearField(
            graduationYearController: graduationYearController,
          ),
          const SizedBox(height: 30),
          DisabilitySection(
            disabilityController: disabilityController,
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
