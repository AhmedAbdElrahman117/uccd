import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uccd/Core/Components/overlay_background.dart';
import 'package:uccd/Core/Components/page_indicator.dart';
import 'package:uccd/Core/Models/student_model.dart';
import 'package:uccd/Core/app_assets.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/generated/l10n.dart';

class StudentAllInfoView extends StatefulWidget {
  const StudentAllInfoView({super.key, required this.student});

  final StudentModel student;

  @override
  State<StudentAllInfoView> createState() => _StudentAllInfoViewState();
}

class _StudentAllInfoViewState extends State<StudentAllInfoView> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: OverlayBackground(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              ListTile(
                leading: const CircleAvatar(
                  child: Image(
                    image: AssetImage(AppAssets.imagesUCCDGrouplogo2),
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  '${widget.student.name}',
                  style: AppText.style16Bold(context),
                ),
                subtitle: Text(
                  '${widget.student.email}',
                  style: AppText.style14Bold(context),
                ),
              ),
              const Divider(),
              ExpandablePageView(
                controller: pageController,
                children: [
                  Column(
                    children: [
                      ListTile(
                        leading: const Icon(FontAwesomeIcons.solidAddressCard),
                        title: Text(
                          '${S.of(context).universityIdLabel}: ${widget.student.universityID}',
                          style: AppText.style16Bold(context),
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),
                      ListTile(
                        leading: const Icon(FontAwesomeIcons.solidIdCard),
                        title: Text(
                          '${S.of(context).nationalIdLabel}: ${widget.student.nationalID}',
                          style: AppText.style16Bold(context),
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),
                      ListTile(
                        leading: const Icon(FontAwesomeIcons.industry),
                        title: Text(
                          '${S.of(context).departmentLabel}: ${widget.student.department}',
                          style: AppText.style14Bold(context),
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),
                      ListTile(
                        leading: const Icon(FontAwesomeIcons.solidCalendar),
                        title: Text(
                          '${S.of(context).yearLabel}: ${widget.student.year}',
                          style: AppText.style16Bold(context),
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ListTile(
                        leading: const Icon(FontAwesomeIcons.venusMars),
                        title: Text(
                          '${S.of(context).genderLabel}: ${widget.student.gender}',
                          style: AppText.style16Bold(context),
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),
                      ListTile(
                        leading: const Icon(FontAwesomeIcons.accessibleIcon),
                        title: Text(
                          '${S.of(context).disabilityLabel}: ${widget.student.disability}',
                          style: AppText.style16Bold(context),
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),
                      ListTile(
                        leading: const Icon(FontAwesomeIcons.phone),
                        title: Text(
                          '${S.of(context).phoneNumberLabel}: ${widget.student.phone}',
                          style: AppText.style16Bold(context),
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),
                      ListTile(
                        leading:
                            const Icon(FontAwesomeIcons.solidCalendarCheck),
                        title: Text(
                          '${S.of(context).graduationYearLabel}: ${AppDates.timeStampToString(widget.student.expectedGraduationYear)}',
                          style: AppText.style16Bold(context),
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                ],
              ),
              PageIndicator(
                pageController: pageController,
                pagesCount: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
