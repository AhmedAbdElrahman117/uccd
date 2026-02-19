import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Core/Components/custom_button.dart';
import 'package:uccd/Core/Components/custom_loading_indicator.dart';
import 'package:uccd/Core/Components/custom_sliver_list_view.dart';
import 'package:uccd/Core/Components/data_error_widget.dart';
import 'package:uccd/Core/Components/loading_indicator.dart';
import 'package:uccd/Core/Components/no_data_widget.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/Models/student_model.dart';
import 'package:uccd/Core/app_banners.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Admin%20Certificate%20Cubit/admin_certfifcate_states.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Admin%20Certificate%20Cubit/admin_certificate_cubit.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/admin_course_button.dart';
import 'package:uccd/generated/l10n.dart';

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

  List<StudentModel> selected = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminCertificateCubit(
        courseID: widget.course.courseID!,
      ),
      child: Stack(
        children: [
          BlocConsumer<AdminCertificateCubit, AdminCertfifcateStates>(
            listener: _listener,
            buildWhen: (previous, current) {
              return current is AdminCertificateInitialState ||
                  current is DataLoading ||
                  current is DataEmpty ||
                  current is DataFailed ||
                  current is DataLoaded;
            },
            builder: (context, state) {
              switch (state) {
                case AdminCertificateInitialState():
                  return const SizedBox();
                case DataLoading():
                  return const LoadingIndicator();
                case DataEmpty():
                  return NoDataWidget(
                    message: S.of(context).noAcceptedStudents,
                  );
                case DataFailed():
                  return DataErrorWidget(
                    message: state.errorMessage,
                  );
                case DataLoaded():
                  return Scaffold(
                    body: CustomSliverListView(
                      appBarTitle: S.of(context).students,
                      body: Column(
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
                              title: Text(S.of(context).multipleCheck),
                              secondary: const Icon(
                                Icons.checklist_rounded,
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: state.acceptedStudents.length,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  child: AdaptiveContainer(
                                    onTap: selectionView
                                        ? () {
                                            if (selected.contains(
                                              state.acceptedStudents[index],
                                            )) {
                                              selected.remove(
                                                state.acceptedStudents[index],
                                              );
                                            } else {
                                              selected.add(
                                                state.acceptedStudents[index],
                                              );
                                            }
                                            setState(() {});
                                          }
                                        : () {
                                            OverlayController
                                                .showStudentAttendance(
                                              context,
                                              state.acceptedStudents[index],
                                              widget.course,
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
                                                    state.acceptedStudents[
                                                        index],
                                                  ),
                                                  activeColor: AppColor.primary,
                                                  onChanged: (value) {
                                                    setState(
                                                      () {
                                                        if (value!) {
                                                          selected.add(
                                                            state.acceptedStudents[
                                                                index],
                                                          );
                                                        } else {
                                                          selected.remove(
                                                            state.acceptedStudents[
                                                                index],
                                                          );
                                                        }
                                                      },
                                                    );
                                                  },
                                                )
                                              : CircleAvatar(
                                                  backgroundColor: AppColor
                                                      .primary
                                                      .withValues(alpha: 0.2),
                                                  child: Text(
                                                    state
                                                        .acceptedStudents[index]
                                                        .name![0]
                                                        .toUpperCase(),
                                                    style: AppText.style16Bold(
                                                            context)
                                                        .copyWith(
                                                      color: AppColor.primary,
                                                    ),
                                                  ),
                                                ),
                                          title: Text(
                                            state.acceptedStudents[index].name!,
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                state.acceptedStudents[index]
                                                    .email!,
                                              ),
                                              Text(
                                                '${S.of(context).attend}: ${AppDates.formatLocalizedNumber(state.acceptedStudents[index].attendanceDates?.length ?? 0, context)}',
                                              ),
                                              Text(
                                                '${S.of(context).absent}: ${AppDates.formatLocalizedNumber(state.acceptedStudents[index].absenceDates?.length ?? 0, context)}',
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
                                              title: S
                                                  .of(context)
                                                  .sendNotification,
                                              backgroundColor:
                                                  AppColor.secondryDark,
                                              icon: Icons.notifications,
                                              onPressed: () {
                                                BlocProvider.of<
                                                            AdminCertificateCubit>(
                                                        context)
                                                    .notifyStudent(
                                                  student: state
                                                      .acceptedStudents[index],
                                                );
                                              },
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
                      ),
                    ),
                    bottomNavigationBar: Visibility(
                      visible: selectionView && selected.isNotEmpty,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 20, left: 20, right: 20),
                        child: CustomButton(
                          title: S.of(context).sendAll,
                          icon: Icons.notifications,
                          backgroundColor: AppColor.secondryDark,
                          onPressed: () {
                            BlocProvider.of<AdminCertificateCubit>(context)
                                .notifyStudents(
                              student: selected,
                            );
                          },
                        ),
                      ),
                    ),
                  );

                default:
                  return SizedBox();
              }
            },
          ),
          BlocSelector<AdminCertificateCubit, AdminCertfifcateStates, bool>(
            selector: (state) => state is DataNotifying,
            builder: (context, state) => CustomLoadingIndicator(
              isLoading: state,
              child: SizedBox(),
            ),
          ),
        ],
      ),
    );
  }

  void _listener(BuildContext context, AdminCertfifcateStates state) {
    if (state is DataNotified) {
      AppBanners.showSuccess(
        message: S.of(context).notificationSentSuccessfully,
      );
    } else if (state is DataNotifyFailed) {
      AppBanners.showFailed(
        message: state.errorMessage,
      );
    }
  }
}
