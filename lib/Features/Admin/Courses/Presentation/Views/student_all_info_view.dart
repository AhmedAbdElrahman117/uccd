import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uccd/Core/Components/overlay_background.dart';
import 'package:uccd/Core/Components/page_indicator.dart';
import 'package:uccd/Core/Models/student_model.dart';
import 'package:uccd/Core/app_assets.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/Core/app_text.dart';

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
              const CircleAvatar(
                radius: 45,
                child: Image(
                  image: AssetImage(AppAssets.imagesUCCDGrouplogo2),
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              ExpandablePageView(
                controller: pageController,
                children: [
                  Column(
                    children: [
                      ListTile(
                        leading: const Icon(FontAwesomeIcons.solidUser),
                        title: Text(
                          'Name: ${widget.student.name}',
                          style: AppText.style16Bold(context),
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),
                      ListTile(
                        leading: const Icon(Icons.email),
                        title: Text(
                          'Email: ${widget.student.email}',
                          style: AppText.style16Bold(context),
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),
                      ListTile(
                        leading: const Icon(FontAwesomeIcons.solidAddressCard),
                        title: Text(
                          'University ID: ${widget.student.universityID}',
                          style: AppText.style16Bold(context),
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),
                      ListTile(
                        leading: const Icon(FontAwesomeIcons.industry),
                        title: Text(
                          'Department: ${widget.student.department}',
                          style: AppText.style14Bold(context),
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),
                      ListTile(
                        leading: const Icon(FontAwesomeIcons.solidCalendar),
                        title: Text(
                          'year: ${widget.student.year}',
                          style: AppText.style16Bold(context),
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ListTile(
                        leading: const Icon(FontAwesomeIcons.solidIdCard),
                        title: Text(
                          'National ID: ${widget.student.nationalID}',
                          style: AppText.style16Bold(context),
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),
                      ListTile(
                        leading: const Icon(FontAwesomeIcons.venusMars),
                        title: Text(
                          'Gender: ${widget.student.gender}',
                          style: AppText.style16Bold(context),
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),
                      ListTile(
                        leading: const Icon(FontAwesomeIcons.accessibleIcon),
                        title: Text(
                          'Disability: ${widget.student.disability}',
                          style: AppText.style16Bold(context),
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),
                      ListTile(
                        leading: const Icon(FontAwesomeIcons.phone),
                        title: Text(
                          'Phone Number: ${widget.student.phone}',
                          style: AppText.style16Bold(context),
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),
                      ListTile(
                        leading:
                            const Icon(FontAwesomeIcons.solidCalendarCheck),
                        title: Text(
                          'Graduation year: ${AppDates.timeStampToString(widget.student.expectedGraduationYear)}',
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
