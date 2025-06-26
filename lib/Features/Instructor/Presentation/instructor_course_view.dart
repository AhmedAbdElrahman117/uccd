import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/Models/student_model.dart';
import 'package:uccd/Core/app_banners.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/Core/Components/loading_indicator.dart';
import 'package:uccd/Core/Enums/attendance_status.dart';
import 'package:uccd/Features/Instructor/Cubit/instructor_cubit.dart';
import 'package:uccd/Features/Instructor/Cubit/instructor_states.dart';
import 'package:uccd/Features/Instructor/Presentation/Widgets/instructor_view_header.dart';
import 'package:uccd/Features/Instructor/Presentation/Widgets/student_attendance_card.dart';
import 'package:uccd/generated/l10n.dart';
import 'package:uccd/Features/Instructor/Presentation/Widgets/upload_material_button.dart';

class InstructorCourseView extends StatefulWidget {
  const InstructorCourseView({
    super.key,
    required this.course,
  });

  final CourseModel course;

  @override
  State<InstructorCourseView> createState() => _InstructorCourseViewState();
}

class _InstructorCourseViewState extends State<InstructorCourseView> {
  DateTime? selectedDate;
  Map<String, Map<String, AttendanceStatus>> dailyAttendance = {};
  List<DateTime> courseDates = [];
  Map<String, AttendanceStatus> currentAttendance =
      {}; // studentId -> AttendanceStatus
  Set<String> savingAttendance =
      {}; // Track which students' attendance is being saved

  @override
  void initState() {
    super.initState();
    _initializeCourseDates();
    _setInitialSelectedDate();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? const Color(0xFF1A1A1A) : Colors.white;

    return BlocProvider(
      create: (context) =>
          InstructorCubit()..getCourseStudents(widget.course.courseID ?? ''),
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: Text(
            widget.course.title,
          ),
          elevation: 2,
          backgroundColor: Theme.of(context).colorScheme.surface,
          foregroundColor: Theme.of(context).colorScheme.onSurface,
        ),
        body: Builder(
          builder: (builderContext) {
            return CustomScrollView(
              slivers: [
                // Course Info Header
                SliverToBoxAdapter(
                  child: InstructorViewHeader(
                    course: widget.course,
                  ),
                ),

                // Upload Materials Button
                SliverToBoxAdapter(
                  child: UploadMaterialButton(),
                ),

                // Date Selection
                SliverToBoxAdapter(
                  child: _buildDateSelector(),
                ),

                // Students List
                _buildStudentsListSliver(builderContext),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildDateSelector() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).selectDateAttendance,
            style: AppText.style18Bold(context),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: courseDates.length,
              itemBuilder: (context, index) {
                final date = courseDates[index];
                final isSelected =
                    selectedDate != null && _isSameDay(date, selectedDate!);
                final isAccessible = _isDateAccessible(date);

                return GestureDetector(
                  onTap: isAccessible
                      ? () {
                          setState(
                            () {
                              selectedDate = date;
                              // The attendance will be updated when BlocBuilder rebuilds
                            },
                          );
                        }
                      : null,
                  child: Container(
                    width: 80,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: !isAccessible
                          ? Colors.grey[300]
                          : isSelected
                              ? AppColor.primary
                              : Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color:
                            isSelected ? AppColor.primary : Colors.grey[300]!,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppDates.formatLocalizedNumberDigits(
                              date.day, context),
                          style: AppText.style20Bold(context).copyWith(
                            color: !isAccessible
                                ? Colors.grey[600]
                                : isSelected
                                    ? Colors.white
                                    : Colors.black87,
                          ),
                        ),
                        Text(
                          _getMonthName(date.month),
                          style: AppText.style12Regular(context).copyWith(
                            color: !isAccessible
                                ? Colors.grey[600]
                                : isSelected
                                    ? Colors.white70
                                    : Colors.grey[600],
                          ),
                        ),
                        if (!isAccessible)
                          Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Icon(
                                Icons.lock,
                                size: 16,
                                color: Colors.grey[600],
                              ),
                            ],
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
    );
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return S.of(context).monthJan;
      case 2:
        return S.of(context).monthFeb;
      case 3:
        return S.of(context).monthMar;
      case 4:
        return S.of(context).monthApr;
      case 5:
        return S.of(context).monthMay;
      case 6:
        return S.of(context).monthJun;
      case 7:
        return S.of(context).monthJul;
      case 8:
        return S.of(context).monthAug;
      case 9:
        return S.of(context).monthSep;
      case 10:
        return S.of(context).monthOct;
      case 11:
        return S.of(context).monthNov;
      case 12:
        return S.of(context).monthDec;
      default:
        return '';
    }
  }

  Widget _buildStudentsListSliver(BuildContext blocContext) {
    // Check if students list should be visible (only when date is accessible)
    if (selectedDate == null || !_isDateAccessible(selectedDate!)) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  selectedDate == null ? Icons.calendar_today : Icons.lock,
                  size: 64,
                  color: Colors.grey[400],
                ),
                const SizedBox(height: 16),
                Text(
                  selectedDate == null
                      ? S.of(context).selectTodayDateAttendance
                      : S.of(context).attendanceOnlyToday,
                  style: AppText.style16Regular(context).copyWith(
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
                if (selectedDate != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    S
                        .of(context)
                        .selectedDate(AppDates.dateTimeToString(selectedDate!)),
                    style: AppText.style14Regular(context).copyWith(
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      );
    }
    return BlocConsumer<InstructorCubit, InstructorStates>(
      listener: (context, state) {
        // Handle attendance-specific states
        if (state is StudentAttendanceLoaded) {
          // Clear saving states when attendance is successfully saved
          setState(() {
            savingAttendance.clear();
          });
        } else if (state is StudentAttendanceFailed) {
          // Clear saving states and show error
          setState(() {
            savingAttendance.clear();
          });
        }
      },
      buildWhen: (previous, current) {
        return current is CourseStudentsLoading ||
            current is InstructorStudentsLoaded ||
            current is InstructorStudentsFailed ||
            current is InstructorInitialState;
      },
      builder: (context, state) {
        if (state is CourseStudentsLoading || state is InstructorInitialState) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: LoadingIndicator(),
              ),
            ),
          );
        } else if (state is InstructorStudentsLoaded) {
          final students = state.students;
          _updateCurrentAttendanceForStudents(students);

          return SliverList(
            delegate: SliverChildListDelegate(
              [
                // Students List Header
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).studentsCount(
                                AppDates.formatLocalizedNumberDigits(
                                    students.length, context)),
                            style: AppText.style20Bold(context),
                          ),
                          Text(
                            S.of(context).dateLabel(
                                AppDates.dateTimeToString(selectedDate!)),
                            style: AppText.style12Regular(context).copyWith(
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        S.of(context).presentCount(
                            AppDates.formatLocalizedNumberDigits(
                                currentAttendance.values
                                    .where((status) => status.isPresent)
                                    .length,
                                context)),
                        style: AppText.style14Bold(context).copyWith(
                          color: Colors.green[600],
                        ),
                      ),
                      Text(
                        S.of(context).absentCount(
                            AppDates.formatLocalizedNumberDigits(
                                currentAttendance.values
                                    .where((status) => status.isAbsent)
                                    .length,
                                context)),
                        style: AppText.style14Bold(context).copyWith(
                          color: Colors.red[600],
                        ),
                      ),
                      Text(
                        S.of(context).unmarkedCount(
                            AppDates.formatLocalizedNumberDigits(
                                currentAttendance.values
                                    .where((status) => status.isUnmarked)
                                    .length,
                                context)),
                        style: AppText.style14Bold(context).copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                // Students Cards
                ...students.asMap().entries.map(
                  (entry) {
                    final student = entry.value;
                    final studentId =
                        student.studentID ?? student.universityID ?? '';
                    final attendanceStatus = currentAttendance[studentId] ??
                        AttendanceStatus.unmarked;
                    final isLoading = savingAttendance.contains(studentId);

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      child: StudentAttendanceCard(
                        student: student,
                        attendanceStatus: attendanceStatus,
                        isLoading: isLoading,
                        onPresentToggle: isLoading
                            ? null
                            : () {
                                _toggleAttendance(
                                  blocContext,
                                  studentId,
                                  true, // true for present button
                                );
                              },
                        onAbsentToggle: isLoading
                            ? null
                            : () {
                                _toggleAttendance(blocContext, studentId,
                                    false); // false for absent button
                              },
                      ),
                    );
                  },
                ),
                // Bottom padding
                const SizedBox(height: 20),
              ],
            ),
          );
        } else if (state is InstructorStudentsFailed) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      S.of(context).errorLoadingStudents,
                      style: AppText.style18Bold(context).copyWith(
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.errorMessage,
                      style: AppText.style14Regular(context).copyWith(
                        color: Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        blocContext
                            .read<InstructorCubit>()
                            .getCourseStudents(widget.course.courseID ?? '');
                      },
                      child: Text(S.of(context).retry),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.people_outline,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    S.of(context).noStudentsEnrolled,
                    style: AppText.style18Bold(context).copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    S.of(context).studentsWillAppearEnrolled,
                    style: AppText.style14Regular(context).copyWith(
                      color: Colors.grey[500],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _updateCurrentAttendanceForStudents(List<StudentModel> students) {
    if (selectedDate == null) return;

    // Update current attendance status based on selected date and actual student data
    currentAttendance.clear();
    for (final student in students) {
      final studentId = student.studentID ?? student.universityID ?? '';

      // Determine attendance status for the selected date
      AttendanceStatus status = _getAttendanceStatus(student, selectedDate!);
      currentAttendance[studentId] = status;

      // Also update the dailyAttendance map
      final dateKey = AppDates.dateTimeToString(selectedDate!);
      if (dailyAttendance[dateKey] == null) {
        dailyAttendance[dateKey] = {};
      }
      dailyAttendance[dateKey]![studentId] = status;
    }
  }

  AttendanceStatus _getAttendanceStatus(StudentModel student, DateTime date) {
    // Check if we're looking at today's date
    final now = DateTime.now();
    if (_isSameDay(date, now)) {
      // Use the isAttended field for today's date
      if (student.isAttended == true) {
        return AttendanceStatus.present;
      } else if (student.isAttended == false) {
        return AttendanceStatus.absent;
      } else {
        return AttendanceStatus.unmarked;
      }
    }

    // For other dates, use the original logic

    // If neither present nor absent, return unmarked
    return AttendanceStatus.unmarked;
  }

  void _toggleAttendance(
      BuildContext context, String studentId, bool isPresent) async {
    if (selectedDate == null) return;

    // Only allow attendance changes for today's date
    final now = DateTime.now();
    if (!_isSameDay(selectedDate!, now)) {
      AppBanners.showFailed(
        message: S.of(context).attendanceOnlyTodayDate,
      );
      return;
    }

    // Get current attendance status
    final currentStatus =
        currentAttendance[studentId] ?? AttendanceStatus.unmarked;
    AttendanceStatus newStatus;

    // Determine new status based on button pressed and current status
    if (isPresent) {
      // Present button pressed
      if (currentStatus.isPresent) {
        // If already present, unmark (toggle off)
        newStatus = AttendanceStatus.unmarked;
      } else {
        // Mark as present
        newStatus = AttendanceStatus.present;
      }
    } else {
      // Absent button pressed
      if (currentStatus.isAbsent) {
        // If already absent, unmark (toggle off)
        newStatus = AttendanceStatus.unmarked;
      } else {
        // Mark as absent
        newStatus = AttendanceStatus.absent;
      }
    }

    // Store original status for potential rollback
    final originalStatus = currentStatus;

    // Update local state immediately for better UX (optimistic update)
    setState(() {
      final dateKey = AppDates.dateTimeToString(selectedDate!);
      if (dailyAttendance[dateKey] == null) {
        dailyAttendance[dateKey] = {};
      }
      dailyAttendance[dateKey]![studentId] = newStatus;
      currentAttendance[studentId] = newStatus;
      savingAttendance.add(studentId); // Add to saving set
    });

    try {
      // Save to database
      final selectedTimestamp = Timestamp.fromDate(selectedDate!);
      final courseId = widget.course.courseID ?? '';
      if (newStatus.isPresent) {
        await context.read<InstructorCubit>().markStudentPresent(
              courseId: courseId,
              studentId: studentId,
              date: selectedTimestamp,
            );
      } else if (newStatus.isAbsent) {
        await context.read<InstructorCubit>().markStudentAbsent(
              courseId: courseId,
              studentId: studentId,
              date: selectedTimestamp,
            );
      } else {
        // Unmark attendance
        await context.read<InstructorCubit>().unmarkStudentAttendance(
              courseId: courseId,
              studentId: studentId,
              date: selectedTimestamp,
            );
      }

      // Show success feedback
      if (mounted) {
        String message;
        if (newStatus.isPresent) {
          message = S.of(context).studentMarkedPresent;
        } else if (newStatus.isAbsent) {
          message = S.of(context).studentMarkedAbsent;
        } else {
          message = S.of(context).studentAttendanceUnmarked;
        }

        AppBanners.showSuccess(
          message: message,
        );
      }
    } catch (error) {
      // Revert local state if saving failed
      if (mounted) {
        setState(() {
          final dateKey = AppDates.dateTimeToString(selectedDate!);
          dailyAttendance[dateKey]![studentId] = originalStatus;
          currentAttendance[studentId] = originalStatus;
        });

        AppBanners.showFailed(
          message: error.toString(),
        );
      }
    } finally {
      // Remove from saving set regardless of success/failure
      if (mounted) {
        setState(() {
          savingAttendance.remove(studentId);
        });
      }
    }
  }

  void _initializeCourseDates() {
    final startDate = widget.course.courseStartDate.toDate();
    final endDate = widget.course.courseEndDate.toDate();

    courseDates.clear();
    DateTime current = DateTime(startDate.year, startDate.month, startDate.day);
    final end = DateTime(endDate.year, endDate.month, endDate.day);

    while (current.isBefore(end) || current.isAtSameMomentAs(end)) {
      courseDates.add(DateTime(current.year, current.month, current.day));
      current = current.add(const Duration(days: 1));
    }
  }

  void _setInitialSelectedDate() {
    final now = DateTime.now();

    // Only select today's date if it's within the course dates
    for (final date in courseDates) {
      if (_isSameDay(date, now)) {
        selectedDate = date;
        break;
      }
    }
    // If today is not a course date, selectedDate remains null
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  bool _isDateAccessible(DateTime date) {
    final now = DateTime.now();
    // Only allow access if the date is exactly today
    return _isSameDay(date, now);
  }
}
