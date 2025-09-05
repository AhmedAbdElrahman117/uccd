import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Core/Components/custom_button.dart';
import 'package:uccd/Core/Components/custom_sliver_list_view.dart';
import 'package:uccd/Core/Components/data_error_widget.dart';
import 'package:uccd/Core/Components/loading_indicator.dart';
import 'package:uccd/Core/Components/no_data_widget.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Admin%20Certificate%20Cubit/admin_certfifcate_states.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Admin%20Certificate%20Cubit/admin_certificate_cubit.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/admin_course_button.dart';

class AdminArchiveStudentsView extends StatefulWidget {
  const AdminArchiveStudentsView({super.key, required this.course});

  final CourseModel course;

  static String id = '/AdminCertificateView';

  @override
  State<AdminArchiveStudentsView> createState() =>
      _AdminArchiveStudentsViewState();
}

class _AdminArchiveStudentsViewState extends State<AdminArchiveStudentsView> {
  bool selectionView = false;

  List<String> selected = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminCertificateCubit(
        courseID: widget.course.courseID!,
      ),
      child: Scaffold(
        body: CustomSliverListView(
          appBarTitle: 'Students',
          body: BlocConsumer<AdminCertificateCubit, AdminCertfifcateStates>(
            listener: (context, state) {},
            builder: (context, state) {
              switch (state) {
                case AdminCertificateInitialState():
                  return const SizedBox();
                case DataLoading():
                  return const LoadingIndicator();
                case DataEmpty():
                  return const NoDataWidget(
                    message: 'No Accepted Students',
                  );
                case DataFailed():
                  return DataErrorWidget(
                    message: state.errorMessage,
                  );
                case DataLoaded():
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: CheckboxListTile(
                          value: selectionView,
                          activeColor: AppColor.primary,
                          onChanged: (value) {
                            selectionView = value!;
                            if (value == false) {
                              selected.clear();
                            }
                            setState(() {});
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          title: const Text('Multiple Check'),
                          secondary: const Icon(
                            Icons.checklist_rounded,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.acceptedStudents.length,
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                              ),
                              child: AdaptiveContainer(
                                onTap: selectionView
                                    ? () {
                                        if (selected.contains(
                                          state.acceptedStudents[index]
                                              .studentID,
                                        )) {
                                          selected.remove(
                                            state.acceptedStudents[index]
                                                .studentID!,
                                          );
                                        } else {
                                          selected.add(
                                            state.acceptedStudents[index]
                                                .studentID!,
                                          );
                                        }
                                        setState(() {});
                                      }
                                    : () {
                                        OverlayController.showStudentAttendance(
                                          context,
                                          state.acceptedStudents[index],
                                        );
                                      },
                                allPadding: 12,
                                child: Column(
                                  spacing: 16,
                                  children: [
                                    ListTile(
                                      leading: selectionView
                                          ? Checkbox.adaptive(
                                              value: selected.contains(
                                                state.acceptedStudents[index]
                                                    .studentID,
                                              ),
                                              activeColor: AppColor.primary,
                                              onChanged: (value) {
                                                setState(() {
                                                  if (value!) {
                                                    selected.add(
                                                      state
                                                          .acceptedStudents[
                                                              index]
                                                          .studentID!,
                                                    );
                                                  } else {
                                                    selected.remove(
                                                      state
                                                          .acceptedStudents[
                                                              index]
                                                          .studentID!,
                                                    );
                                                  }
                                                });
                                              },
                                            )
                                          : const CircleAvatar(),
                                      title: Text(
                                        state.acceptedStudents[index].name!,
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state
                                                .acceptedStudents[index].email!,
                                          ),
                                          const Text(
                                            'Attend: 6',
                                          ),
                                          const Text(
                                            'Absent: 0',
                                          ),
                                        ],
                                      ),
                                      trailing: IconButton(
                                        onPressed: () {
                                          OverlayController
                                              .showStudentInfoDialog(
                                            context,
                                            state.acceptedStudents[index],
                                          );
                                        },
                                        icon: const Icon(
                                            FontAwesomeIcons.circleInfo),
                                      ),
                                    ),
                                    Visibility(
                                      visible: !selectionView,
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: AdminCourseButton(
                                          title: 'Send Notification',
                                          backgroundColor:
                                              AppColor.secondryDark,
                                          icon: Icons.notifications,
                                          onPressed: () {},
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
              }
            },
          ),
        ),
        bottomNavigationBar: Visibility(
          visible: selectionView,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: CustomButton(
              title: 'Send All',
              icon: Icons.notifications,
              backgroundColor: AppColor.secondryDark,
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
