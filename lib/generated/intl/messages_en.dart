// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(count) => "Absent: ${count}";

  static String m1(count) => "Absent: ${count}";

  static String m2(category) => "Advanced ${category}";

  static String m3(courseName) =>
      "View statistics for archived course ${courseName}";

  static String m4(count) => "Attended: ${count}";

  static String m5(category) => "${category} for Beginners";

  static String m6(count) =>
      "${count} ${Intl.plural(count, one: 'category', other: 'categories')} available";

  static String m7(courseName) => "Change category for ${courseName}";

  static String m8(courseName) => "Change instructor for ${courseName}";

  static String m9(count) => "Comments: ${count}";

  static String m10(courseName) => "You are about to enroll in ${courseName}.";

  static String m11(startDate, endDate) =>
      "Course Period: ${startDate} - ${endDate}";

  static String m12(startDate, endDate) =>
      "Course runs from ${startDate} to ${endDate}";

  static String m13(courseName) => "View ratings for ${courseName}";

  static String m14(hours) => "${hours} hrs";

  static String m15(weeks) => "${weeks} weeks";

  static String m16(courseName) => "View students for ${courseName}";

  static String m17(date) => "Date: ${date}";

  static String m18(courseName) => "Delete ${courseName}";

  static String m19(categoryName) =>
      "Are you sure you want to delete \"${categoryName}\"?\n\n *This action cannot be undone.";

  static String m20(courseName) =>
      "Do you want to Delete ${courseName} permanently?";

  static String m21(courseName) => "Edit ${courseName}";

  static String m22(errorMessage) => "Error: ${errorMessage}";

  static String m23(courseName) => "Successfully enrolled in ${courseName}";

  static String m24(error) => "Error loading comments: ${error}";

  static String m25(error) => "Failed to pick image: ${error}";

  static String m26(errorMessage) =>
      "Failed to save attendance: ${errorMessage}";

  static String m27(goalNumber) => "Enter Goal ${goalNumber}";

  static String m28(goalNumber) => "Goal ${goalNumber}";

  static String m29(name) => "Instructor: ${name}";

  static String m30(courseName) => "Manage interviews for ${courseName}";

  static String m31(startDate, endDate) =>
      "Interview Period: ${startDate} - ${endDate}";

  static String m32(startDate, endDate) =>
      "Interview starts on ${startDate} and ends on ${endDate}";

  static String m33(count) => "Likes: ${count}";

  static String m34(filter) => "No ${filter} reviews";

  static String m35(number) => "Prerequisites/Skill ${number}";

  static String m36(count) => "Present: ${count}";

  static String m37(count) => "${count} reviews";

  static String m38(date) => "Selected: ${date}";

  static String m39(count, filter) => "Showing ${count} ${filter} reviews";

  static String m40(count) => "Showing ${count} reviews";

  static String m41(filter) => "Showing 1 ${filter} review";

  static String m42(courseName) => "View statistics for ${courseName}";

  static String m43(count) => "Students (${count})";

  static String m44(days) => "Total: ${days} Days";

  static String m45(count) => "Unmarked: ${count}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "Absent": MessageLookupByLibrary.simpleMessage("Absent"),
    "Active": MessageLookupByLibrary.simpleMessage("Active"),
    "Archived": MessageLookupByLibrary.simpleMessage("Archived"),
    "Back": MessageLookupByLibrary.simpleMessage("Back"),
    "ComingSoon": MessageLookupByLibrary.simpleMessage("Coming Soon"),
    "ComingSoonlabel": MessageLookupByLibrary.simpleMessage(
      "This feature is coming soon!",
    ),
    "CreatedOn": MessageLookupByLibrary.simpleMessage("Created On"),
    "Disability": MessageLookupByLibrary.simpleMessage("Disability"),
    "Hour": MessageLookupByLibrary.simpleMessage("Hour"),
    "IAgree": MessageLookupByLibrary.simpleMessage("I Agree"),
    "LiveData": MessageLookupByLibrary.simpleMessage("Live Data"),
    "ManageCourses": MessageLookupByLibrary.simpleMessage("Manage Course"),
    "Next": MessageLookupByLibrary.simpleMessage("Next"),
    "No": MessageLookupByLibrary.simpleMessage("No"),
    "NothingToEdit": MessageLookupByLibrary.simpleMessage("Nothing to Edit"),
    "Post": MessageLookupByLibrary.simpleMessage("Post"),
    "Present": MessageLookupByLibrary.simpleMessage("Present"),
    "Review": MessageLookupByLibrary.simpleMessage("Review"),
    "SkillsAndPrerequisites": MessageLookupByLibrary.simpleMessage(
      "Skills & Prerequisites",
    ),
    "Student": MessageLookupByLibrary.simpleMessage("Student"),
    "Submit": MessageLookupByLibrary.simpleMessage("Submit"),
    "SystemConfiguration": MessageLookupByLibrary.simpleMessage(
      "System configuration",
    ),
    "TermsAndConditions": MessageLookupByLibrary.simpleMessage(
      "Terms and Conditions",
    ),
    "TermsText1": MessageLookupByLibrary.simpleMessage(
      "I agree and authorize the UCCD to use my data and my photographs taken during my participation in the training programs and/or career development service offered by the center for the purposes of UCCD reporting, publications, and employer networking",
    ),
    "TermsText2": MessageLookupByLibrary.simpleMessage(
      "and authorizing UCCD app to collect Data about my participation in courses for analysis and improving user Experience",
    ),
    "Unmarked": MessageLookupByLibrary.simpleMessage("Unmarked"),
    "WhatYouWillLearn": MessageLookupByLibrary.simpleMessage(
      "What You Will Learn",
    ),
    "aboutThisCourseTitle": MessageLookupByLibrary.simpleMessage(
      "About This Course",
    ),
    "absenceDaysTitle": MessageLookupByLibrary.simpleMessage("Absence Days"),
    "absent": MessageLookupByLibrary.simpleMessage("Absent"),
    "absentCount": m0,
    "absentDays": m1,
    "accept": MessageLookupByLibrary.simpleMessage("Accept"),
    "accepted": MessageLookupByLibrary.simpleMessage("Accepted"),
    "account": MessageLookupByLibrary.simpleMessage("Account"),
    "actions": MessageLookupByLibrary.simpleMessage("Actions"),
    "activeStudents": MessageLookupByLibrary.simpleMessage("Active Students"),
    "addAdminTitle": MessageLookupByLibrary.simpleMessage("Add Admin"),
    "addButtonLabel": MessageLookupByLibrary.simpleMessage("Add"),
    "addCategory": MessageLookupByLibrary.simpleMessage("Add Category"),
    "addCategoryTitle": MessageLookupByLibrary.simpleMessage("Add Category"),
    "addCommentHint": MessageLookupByLibrary.simpleMessage("Add a comment..."),
    "addCourse": MessageLookupByLibrary.simpleMessage("Add Course"),
    "addCourseTitle": MessageLookupByLibrary.simpleMessage("Add Course"),
    "addGoal": MessageLookupByLibrary.simpleMessage("Add Goal"),
    "addInstructor": MessageLookupByLibrary.simpleMessage("Add Instructor"),
    "addInstructorTitle": MessageLookupByLibrary.simpleMessage(
      "Add Instructor",
    ),
    "addPost": MessageLookupByLibrary.simpleMessage("Add Post"),
    "addPrerequisiteSkill": MessageLookupByLibrary.simpleMessage(
      "Add Prerequisite/Skill",
    ),
    "addStudent": MessageLookupByLibrary.simpleMessage("Add Student"),
    "addStudentTitle": MessageLookupByLibrary.simpleMessage("Add Student"),
    "admin": MessageLookupByLibrary.simpleMessage("Admin"),
    "adminAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Admin Added Successfully",
    ),
    "adminDashboard": MessageLookupByLibrary.simpleMessage("Admin Dashboard"),
    "adminEmailHint": MessageLookupByLibrary.simpleMessage("Enter admin email"),
    "adminEmailLabel": MessageLookupByLibrary.simpleMessage("Admin Email"),
    "adminFeatures": MessageLookupByLibrary.simpleMessage("Admin Features"),
    "adminNameHint": MessageLookupByLibrary.simpleMessage(
      "Enter admin username",
    ),
    "adminNameLabel": MessageLookupByLibrary.simpleMessage("Admin Name"),
    "adminPasswordLabel": MessageLookupByLibrary.simpleMessage(
      "Admin Password",
    ),
    "adminUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Admin Updated Successfully",
    ),
    "admins": MessageLookupByLibrary.simpleMessage("Admins"),
    "advancedCourse": m2,
    "all": MessageLookupByLibrary.simpleMessage("All"),
    "allRatings": MessageLookupByLibrary.simpleMessage("All"),
    "arabic": MessageLookupByLibrary.simpleMessage("Arabic"),
    "archivePanel": MessageLookupByLibrary.simpleMessage("Archive Panel"),
    "archiveStatisticsSemanticLabel": m3,
    "archiveStatisticsTooltip": MessageLookupByLibrary.simpleMessage(
      "View archived course statistics and analytics",
    ),
    "archivedCourses": MessageLookupByLibrary.simpleMessage("Archived"),
    "assignedCourses": MessageLookupByLibrary.simpleMessage("Assigned Courses"),
    "attend": MessageLookupByLibrary.simpleMessage("Attend"),
    "attendanceOnlyToday": MessageLookupByLibrary.simpleMessage(
      "Attendance is only available for today\'s date",
    ),
    "attendanceOnlyTodayDate": MessageLookupByLibrary.simpleMessage(
      "Attendance can only be marked for today\'s date",
    ),
    "attendedDays": m4,
    "authInvalidEmail": MessageLookupByLibrary.simpleMessage("Invalid Email"),
    "autoDepartment": MessageLookupByLibrary.simpleMessage("Auto"),
    "autotronics": MessageLookupByLibrary.simpleMessage("Autotronics"),
    "available": MessageLookupByLibrary.simpleMessage("Available"),
    "availableCourses": MessageLookupByLibrary.simpleMessage("Available"),
    "beFirstToComment": MessageLookupByLibrary.simpleMessage(
      "Be the first to comment on this post!",
    ),
    "beFirstToShare": MessageLookupByLibrary.simpleMessage(
      "Be the first to share something with the community!",
    ),
    "beginnerCourse": m5,
    "browseCourses": MessageLookupByLibrary.simpleMessage("Browse Courses"),
    "browseCoursesHint": MessageLookupByLibrary.simpleMessage(
      "Browse available courses and enroll to see them here",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "cancelButtonLabel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "categories": MessageLookupByLibrary.simpleMessage("Categories"),
    "categoriesLabel": MessageLookupByLibrary.simpleMessage("Categories"),
    "categoriesOverview": MessageLookupByLibrary.simpleMessage(
      "Categories Overview",
    ),
    "categoryAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Category Added Successfully",
    ),
    "categoryAvailable": m6,
    "categoryChangedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Category Changed Successfully",
    ),
    "categoryDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Category Deleted Successfully",
    ),
    "categoryNameHint": MessageLookupByLibrary.simpleMessage(
      "Enter Category Name",
    ),
    "categoryNameLabel": MessageLookupByLibrary.simpleMessage("Category Name"),
    "categoryNameRequired": MessageLookupByLibrary.simpleMessage(
      "Category Name Required",
    ),
    "categoryUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Category Updated Successfully",
    ),
    "categoryUsageInfo": MessageLookupByLibrary.simpleMessage(
      "This category can be used to organize courses and content.",
    ),
    "change": MessageLookupByLibrary.simpleMessage("Change"),
    "changeCategory": MessageLookupByLibrary.simpleMessage("Change Category"),
    "changeCategoryButtonSemanticLabel": m7,
    "changeCategoryButtonTitle": MessageLookupByLibrary.simpleMessage(
      "Change Category",
    ),
    "changeCategoryButtonTooltip": MessageLookupByLibrary.simpleMessage(
      "Change course category",
    ),
    "changeInstructor": MessageLookupByLibrary.simpleMessage(
      "Change Instrcutor",
    ),
    "changeInstructorButtonSemanticLabel": m8,
    "changeInstructorButtonTitle": MessageLookupByLibrary.simpleMessage(
      "Change Instructor",
    ),
    "changeInstructorButtonTooltip": MessageLookupByLibrary.simpleMessage(
      "Change course instructor",
    ),
    "checkInternetConnection": MessageLookupByLibrary.simpleMessage(
      "Check Your Internet Connection And Try Again Later",
    ),
    "checkInternetConnectionAndTryAgain": MessageLookupByLibrary.simpleMessage(
      "Check your Internet Connection and try again",
    ),
    "closeDialogTooltip": MessageLookupByLibrary.simpleMessage("Close dialog"),
    "codeResent": MessageLookupByLibrary.simpleMessage("Code Resent"),
    "commentAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Comment Added Successfully",
    ),
    "commentValidationEmpty": MessageLookupByLibrary.simpleMessage(
      "Please enter a comment",
    ),
    "commentValidationTrimmed": MessageLookupByLibrary.simpleMessage(
      "Comment cannot be empty",
    ),
    "commentsButtonLabel": MessageLookupByLibrary.simpleMessage("Comments"),
    "commentsCount": m9,
    "commentsTitle": MessageLookupByLibrary.simpleMessage("Comments"),
    "community": MessageLookupByLibrary.simpleMessage("Community"),
    "communityPost": MessageLookupByLibrary.simpleMessage("Community post"),
    "communitySubtitle": MessageLookupByLibrary.simpleMessage(
      "Follow Events of UCCD Center",
    ),
    "communityTitle": MessageLookupByLibrary.simpleMessage("Community"),
    "completed": MessageLookupByLibrary.simpleMessage("Completed"),
    "confirmButton": MessageLookupByLibrary.simpleMessage("Confirm"),
    "confirmEnrollmentMessage": m10,
    "confirmEnrollmentTitle": MessageLookupByLibrary.simpleMessage(
      "Confirm Enrollment",
    ),
    "connectionTimeout": MessageLookupByLibrary.simpleMessage(
      "Connection Timeout",
    ),
    "connectionTimeoutTryAgain": MessageLookupByLibrary.simpleMessage(
      "Connection Timeout Try Again Later",
    ),
    "contactSupport": MessageLookupByLibrary.simpleMessage("Contact Support"),
    "contentRating": MessageLookupByLibrary.simpleMessage("Content"),
    "continueLearningJourney": MessageLookupByLibrary.simpleMessage(
      "Continue learning journey",
    ),
    "controlPanel": MessageLookupByLibrary.simpleMessage("Control Panel"),
    "course": MessageLookupByLibrary.simpleMessage("Course"),
    "courseAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Course Added Successfully",
    ),
    "courseAnalytics": MessageLookupByLibrary.simpleMessage("Course Analytics"),
    "courseDates": MessageLookupByLibrary.simpleMessage("Course Dates"),
    "courseDatesDescription": MessageLookupByLibrary.simpleMessage(
      "Now Let\'s set the Dates of the Course",
    ),
    "courseDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Course Deleted Successfully",
    ),
    "courseEndDateAfterInterviews": MessageLookupByLibrary.simpleMessage(
      "Course End Date must be After Interviews",
    ),
    "courseEndDateAfterStartDate": MessageLookupByLibrary.simpleMessage(
      "Course End Date must be After Start Date",
    ),
    "courseEndDateHint": MessageLookupByLibrary.simpleMessage(
      "Enter Course End Date",
    ),
    "courseEndDateLabel": MessageLookupByLibrary.simpleMessage(
      "Course End Date",
    ),
    "courseEndDateRequired": MessageLookupByLibrary.simpleMessage(
      "End Date Required",
    ),
    "courseFull": MessageLookupByLibrary.simpleMessage("Full"),
    "courseGoals": MessageLookupByLibrary.simpleMessage("Course Goals"),
    "courseGoalsDescription": MessageLookupByLibrary.simpleMessage(
      "Set The Course Outcomes for Students",
    ),
    "courseGoalsNote": MessageLookupByLibrary.simpleMessage(
      "Note: you must set at least one goal",
    ),
    "courseImage": MessageLookupByLibrary.simpleMessage("Course Image"),
    "courseImageDescription": MessageLookupByLibrary.simpleMessage(
      "Finally you can Add an Image to your course",
    ),
    "courseImageNote": MessageLookupByLibrary.simpleMessage(
      "Note: if you Don\'t add an image to the course the course will have the UCCD logo automatically",
    ),
    "courseInfo": MessageLookupByLibrary.simpleMessage("Course Info"),
    "courseInfoDescription": MessageLookupByLibrary.simpleMessage(
      "Let\'s Start With Course Basic Info",
    ),
    "coursePeriodLabel": m11,
    "coursePeriodSubtitle": m12,
    "coursePeriodTitle": MessageLookupByLibrary.simpleMessage("Course Period"),
    "courseRatingsSemanticLabel": m13,
    "courseRatingsTooltip": MessageLookupByLibrary.simpleMessage(
      "View course ratings and feedback",
    ),
    "courseScheduleTitle": MessageLookupByLibrary.simpleMessage(
      "Course Schedule",
    ),
    "courseStartDateAfterInterviews": MessageLookupByLibrary.simpleMessage(
      "Course Start Date must be After Interviews",
    ),
    "courseStartDateBeforeEndDate": MessageLookupByLibrary.simpleMessage(
      "Course Start Date must be before End Date",
    ),
    "courseStartDateHint": MessageLookupByLibrary.simpleMessage(
      "Enter Course Start Date",
    ),
    "courseStartDateLabel": MessageLookupByLibrary.simpleMessage(
      "Course Start Date",
    ),
    "courseStartDateRequired": MessageLookupByLibrary.simpleMessage(
      "Start Date Required",
    ),
    "courseStatsDuration": MessageLookupByLibrary.simpleMessage("Duration"),
    "courseStatsDurationValue": m14,
    "courseStatsLength": MessageLookupByLibrary.simpleMessage("Length"),
    "courseStatsLengthValue": m15,
    "courseStatsPrerequisites": MessageLookupByLibrary.simpleMessage(
      "Prerequisites",
    ),
    "courseStatsRoom": MessageLookupByLibrary.simpleMessage("Room"),
    "courseStudentsSemanticLabel": m16,
    "courseStudentsTooltip": MessageLookupByLibrary.simpleMessage(
      "View archived course students",
    ),
    "courseTimelineTitle": MessageLookupByLibrary.simpleMessage(
      "Course Timeline",
    ),
    "courseTitleHint": MessageLookupByLibrary.simpleMessage(
      "Enter Course Title",
    ),
    "courseTitleLabel": MessageLookupByLibrary.simpleMessage("Course Title"),
    "courseUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Course Updated Successfully",
    ),
    "courses": MessageLookupByLibrary.simpleMessage("Courses"),
    "coursesManagement": MessageLookupByLibrary.simpleMessage(
      "Courses Management",
    ),
    "coursesWillAppear": MessageLookupByLibrary.simpleMessage(
      "Courses will appear here once they are available",
    ),
    "coursesWillAppearAssigned": MessageLookupByLibrary.simpleMessage(
      "Courses will appear here once they are assigned to you",
    ),
    "createNewCourse": MessageLookupByLibrary.simpleMessage(
      "Create new course",
    ),
    "createPostButton": MessageLookupByLibrary.simpleMessage("Create Post"),
    "createPostDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Create Post",
    ),
    "currentYear": MessageLookupByLibrary.simpleMessage("Current Year"),
    "darkMode": MessageLookupByLibrary.simpleMessage("Dark Mode"),
    "dashboard": MessageLookupByLibrary.simpleMessage("Dashboard"),
    "dashboardOverview": MessageLookupByLibrary.simpleMessage(
      "Dashboard Overview",
    ),
    "dateLabel": m17,
    "dateRequired": MessageLookupByLibrary.simpleMessage("Date Required"),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "deleteButtonSemanticLabel": m18,
    "deleteButtonText": MessageLookupByLibrary.simpleMessage("Delete"),
    "deleteButtonTitle": MessageLookupByLibrary.simpleMessage("Delete"),
    "deleteButtonTooltip": MessageLookupByLibrary.simpleMessage(
      "Delete course permanently",
    ),
    "deleteCategoryConfirmation": m19,
    "deleteCourseConfirmMessage": m20,
    "deleteDialogTitle": MessageLookupByLibrary.simpleMessage("Delete"),
    "deletePostConfirmMessage": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this post?",
    ),
    "deletePostOption": MessageLookupByLibrary.simpleMessage("Delete Post"),
    "deletePostTitle": MessageLookupByLibrary.simpleMessage("Delete Post"),
    "department": MessageLookupByLibrary.simpleMessage("Department"),
    "departmentHint": MessageLookupByLibrary.simpleMessage("Department"),
    "departmentLabel": MessageLookupByLibrary.simpleMessage("Department"),
    "descriptionHint": MessageLookupByLibrary.simpleMessage(
      "Enter Course Description",
    ),
    "descriptionLabel": MessageLookupByLibrary.simpleMessage("Description"),
    "didntRecieveCode": MessageLookupByLibrary.simpleMessage(
      "Didn\'t receive a code?",
    ),
    "disabilityLabel": MessageLookupByLibrary.simpleMessage("Disability"),
    "durationHint": MessageLookupByLibrary.simpleMessage(
      "Enter Course Duration",
    ),
    "durationLabel": MessageLookupByLibrary.simpleMessage("Duration"),
    "edit": MessageLookupByLibrary.simpleMessage("Edit"),
    "editAdminTitle": MessageLookupByLibrary.simpleMessage("Edit Admin"),
    "editButtonLabel": MessageLookupByLibrary.simpleMessage("Edit"),
    "editButtonSemanticLabel": m21,
    "editButtonTitle": MessageLookupByLibrary.simpleMessage("Edit"),
    "editButtonTooltip": MessageLookupByLibrary.simpleMessage(
      "Edit course information and settings",
    ),
    "editCategoryTitle": MessageLookupByLibrary.simpleMessage("Edit Category"),
    "editCourseTitle": MessageLookupByLibrary.simpleMessage("Edit Course"),
    "editInstructorTitle": MessageLookupByLibrary.simpleMessage(
      "Edit Instructor",
    ),
    "editPostContentHint": MessageLookupByLibrary.simpleMessage(
      "Edit your post...",
    ),
    "editPostDialogTitle": MessageLookupByLibrary.simpleMessage("Edit Post"),
    "editPostOption": MessageLookupByLibrary.simpleMessage("Edit Post"),
    "editStudentTitle": MessageLookupByLibrary.simpleMessage("Edit Student"),
    "emailAlreadyInUse": MessageLookupByLibrary.simpleMessage(
      "Email Already in Use",
    ),
    "emailNotEnabled": MessageLookupByLibrary.simpleMessage(
      "Email is Not Enabled Contact Support",
    ),
    "emailOrPasswordInvalid": MessageLookupByLibrary.simpleMessage(
      "Email Or Password is Invalid",
    ),
    "emailRequired": MessageLookupByLibrary.simpleMessage(
      "Email field is required",
    ),
    "emailUsernameTooShort": MessageLookupByLibrary.simpleMessage(
      "Email username must be at least 3 characters",
    ),
    "endDateRequired": MessageLookupByLibrary.simpleMessage(
      "End Date Required",
    ),
    "ended": MessageLookupByLibrary.simpleMessage("Ended"),
    "ends": MessageLookupByLibrary.simpleMessage("Ends"),
    "english": MessageLookupByLibrary.simpleMessage("English"),
    "enroll": MessageLookupByLibrary.simpleMessage("Enroll"),
    "enrollNow": MessageLookupByLibrary.simpleMessage("Enroll Now"),
    "enrollNowButton": MessageLookupByLibrary.simpleMessage("Enroll Now"),
    "enrolledInThisCategory": MessageLookupByLibrary.simpleMessage(
      "Enrolled in This Category",
    ),
    "enrollmentAlmostFull": MessageLookupByLibrary.simpleMessage(
      "Almost full!",
    ),
    "enrollmentError": m22,
    "enrollmentFillingUp": MessageLookupByLibrary.simpleMessage("Filling up"),
    "enrollmentFull": MessageLookupByLibrary.simpleMessage("Full"),
    "enrollmentSpotsAvailable": MessageLookupByLibrary.simpleMessage(
      "Spots available",
    ),
    "enrollmentSuccess": m23,
    "enrollments": MessageLookupByLibrary.simpleMessage("Enrollments"),
    "enterInterviewEndDate": MessageLookupByLibrary.simpleMessage(
      "Enter Interview End Date",
    ),
    "enterInterviewStartDate": MessageLookupByLibrary.simpleMessage(
      "Enter Interview Start Date",
    ),
    "enterMaxAcceptedStudents": MessageLookupByLibrary.simpleMessage(
      "Enter Max Accepted Students",
    ),
    "error": MessageLookupByLibrary.simpleMessage("Error"),
    "errorLoadingComments": m24,
    "errorLoadingCourses": MessageLookupByLibrary.simpleMessage(
      "Error loading courses",
    ),
    "errorLoadingRatings": MessageLookupByLibrary.simpleMessage(
      "Error loading ratings",
    ),
    "errorLoadingStudents": MessageLookupByLibrary.simpleMessage(
      "Error loading students",
    ),
    "failed": MessageLookupByLibrary.simpleMessage("Failed"),
    "failedToLoadCourses": MessageLookupByLibrary.simpleMessage(
      "Failed to load courses",
    ),
    "failedToLoadCoursesWithHelp": MessageLookupByLibrary.simpleMessage(
      "Failed to load courses.\nPlease check your internet connection and try again.",
    ),
    "failedToLoadData": MessageLookupByLibrary.simpleMessage(
      "Failed to retrieve Data",
    ),
    "failedToPickImage": m25,
    "failedToSaveAttendance": m26,
    "firstYear": MessageLookupByLibrary.simpleMessage("1st Year"),
    "fiveStars": MessageLookupByLibrary.simpleMessage("5 Stars"),
    "fourStars": MessageLookupByLibrary.simpleMessage("4 Stars"),
    "fourthYear": MessageLookupByLibrary.simpleMessage("4th Year"),
    "genderLabel": MessageLookupByLibrary.simpleMessage("Gender"),
    "goalHint": m27,
    "goalLabel": m28,
    "graduationYear": MessageLookupByLibrary.simpleMessage("Graduation year"),
    "graduationYearHint": MessageLookupByLibrary.simpleMessage(
      "Enter your Expected Graduation year",
    ),
    "graduationYearIncorrect": MessageLookupByLibrary.simpleMessage(
      "Graduation year is Incorrect",
    ),
    "graduationYearLabel": MessageLookupByLibrary.simpleMessage(
      "Graduation Year",
    ),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "imageSizeLimit": MessageLookupByLibrary.simpleMessage(
      "Image Size limit is 10 MB",
    ),
    "inProgress": MessageLookupByLibrary.simpleMessage("In Progress"),
    "informationTechnology": MessageLookupByLibrary.simpleMessage(
      "Information Technology",
    ),
    "instructor": MessageLookupByLibrary.simpleMessage("Instructor"),
    "instructorAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Instructor Added Successfully",
    ),
    "instructorCreatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Instructor Created Successfully",
    ),
    "instructorDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Instructor Deleted Successfully",
    ),
    "instructorEmailHint": MessageLookupByLibrary.simpleMessage(
      "Enter instructor email",
    ),
    "instructorEmailLabel": MessageLookupByLibrary.simpleMessage(
      "Instructor Email",
    ),
    "instructorLabel": m29,
    "instructorNameHint": MessageLookupByLibrary.simpleMessage(
      "Enter instructor name",
    ),
    "instructorNameLabel": MessageLookupByLibrary.simpleMessage(
      "Instructor Name",
    ),
    "instructorPasswordHint": MessageLookupByLibrary.simpleMessage(
      "Enter Instructor Password",
    ),
    "instructorPasswordLabel": MessageLookupByLibrary.simpleMessage(
      "Instructor Password",
    ),
    "instructorRating": MessageLookupByLibrary.simpleMessage("Instructor"),
    "instructorTitle": MessageLookupByLibrary.simpleMessage("Instructor"),
    "instructorUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Instructor Updated Successfully",
    ),
    "instructors": MessageLookupByLibrary.simpleMessage("Instructors"),
    "instructorsLabel": MessageLookupByLibrary.simpleMessage("Instructors"),
    "interview": MessageLookupByLibrary.simpleMessage("Interview"),
    "interviewBeforeCourse": MessageLookupByLibrary.simpleMessage(
      "Interview dates must be before course dates",
    ),
    "interviewButtonSemanticLabel": m30,
    "interviewButtonTitle": MessageLookupByLibrary.simpleMessage("Interview"),
    "interviewButtonTooltip": MessageLookupByLibrary.simpleMessage(
      "Manage course interviews and applications",
    ),
    "interviewDatesBeforeCourseDates": MessageLookupByLibrary.simpleMessage(
      "Interview Dates must be before Course Dates",
    ),
    "interviewEndDate": MessageLookupByLibrary.simpleMessage(
      "Interview End Date",
    ),
    "interviewEndDateAfterStartDate": MessageLookupByLibrary.simpleMessage(
      "Interview End Date must be after Start Date",
    ),
    "interviewEndDateBeforeCourses": MessageLookupByLibrary.simpleMessage(
      "Interview End Date must be Before Courses",
    ),
    "interviewPeriodLabel": m31,
    "interviewPeriodSubtitle": m32,
    "interviewPeriodTitle": MessageLookupByLibrary.simpleMessage(
      "Interview Period",
    ),
    "interviewStartDate": MessageLookupByLibrary.simpleMessage(
      "Interview Start Date",
    ),
    "interviewStartDateBeforeCourses": MessageLookupByLibrary.simpleMessage(
      "Interview Start Date must be Before Courses",
    ),
    "interviewStartDateBeforeEndDate": MessageLookupByLibrary.simpleMessage(
      "Interview Start Date must be before End Date",
    ),
    "invalidCourseDates": MessageLookupByLibrary.simpleMessage(
      "Invalid Course Dates",
    ),
    "invalidEmail": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid email address",
    ),
    "invalidInterviewDates": MessageLookupByLibrary.simpleMessage(
      "Invalid Interview Dates",
    ),
    "invalidPhoneNumber": MessageLookupByLibrary.simpleMessage(
      "Invalid Phone Number",
    ),
    "itDepartment": MessageLookupByLibrary.simpleMessage("IT"),
    "korean": MessageLookupByLibrary.simpleMessage("Korean"),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "likeButtonLabel": MessageLookupByLibrary.simpleMessage("Like"),
    "likesCount": m33,
    "loadingComment": MessageLookupByLibrary.simpleMessage(
      "Loading comment text that will be replaced with actual content...",
    ),
    "loadingText": MessageLookupByLibrary.simpleMessage("Loading"),
    "loadingUserName": MessageLookupByLibrary.simpleMessage(
      "Loading User Name",
    ),
    "loginButton": MessageLookupByLibrary.simpleMessage("Login"),
    "logout": MessageLookupByLibrary.simpleMessage("Logout"),
    "logoutButtonText": MessageLookupByLibrary.simpleMessage("Logout"),
    "logoutConfirmation": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to Logout",
    ),
    "logoutDialogTitle": MessageLookupByLibrary.simpleMessage("Logout"),
    "logs": MessageLookupByLibrary.simpleMessage("Logs"),
    "manageCategories": MessageLookupByLibrary.simpleMessage(
      "Manage categories",
    ),
    "manageCategoriesEfficiently": MessageLookupByLibrary.simpleMessage(
      "Manage your categories efficiently",
    ),
    "maxAcceptedStudents": MessageLookupByLibrary.simpleMessage(
      "Max Accepted Students",
    ),
    "mechaDepartment": MessageLookupByLibrary.simpleMessage("Mecha"),
    "mechatronics": MessageLookupByLibrary.simpleMessage("Mechatronics"),
    "monthApr": MessageLookupByLibrary.simpleMessage("Apr"),
    "monthAug": MessageLookupByLibrary.simpleMessage("Aug"),
    "monthDec": MessageLookupByLibrary.simpleMessage("Dec"),
    "monthFeb": MessageLookupByLibrary.simpleMessage("Feb"),
    "monthJan": MessageLookupByLibrary.simpleMessage("Jan"),
    "monthJul": MessageLookupByLibrary.simpleMessage("Jul"),
    "monthJun": MessageLookupByLibrary.simpleMessage("Jun"),
    "monthMar": MessageLookupByLibrary.simpleMessage("Mar"),
    "monthMay": MessageLookupByLibrary.simpleMessage("May"),
    "monthNov": MessageLookupByLibrary.simpleMessage("Nov"),
    "monthOct": MessageLookupByLibrary.simpleMessage("Oct"),
    "monthSep": MessageLookupByLibrary.simpleMessage("Sep"),
    "multipleCheck": MessageLookupByLibrary.simpleMessage("Multiple Check"),
    "myCourses": MessageLookupByLibrary.simpleMessage("My Courses"),
    "myCoursesTitle": MessageLookupByLibrary.simpleMessage("My Courses"),
    "nameRequired": MessageLookupByLibrary.simpleMessage("Name Required"),
    "nationalIdHint": MessageLookupByLibrary.simpleMessage("Enter National ID"),
    "nationalIdLabel": MessageLookupByLibrary.simpleMessage("National ID"),
    "nationalIdLengthError": MessageLookupByLibrary.simpleMessage(
      "National ID must be 14 characters length",
    ),
    "nationalIdRequired": MessageLookupByLibrary.simpleMessage(
      "National ID Required",
    ),
    "newInstructor": MessageLookupByLibrary.simpleMessage("New instructor"),
    "noAcceptedStudents": MessageLookupByLibrary.simpleMessage(
      "No Accepted Students",
    ),
    "noCategoriesRegistered": MessageLookupByLibrary.simpleMessage(
      "No Categories Registered",
    ),
    "noCommentsYet": MessageLookupByLibrary.simpleMessage("No comments yet"),
    "noCoursesAssignedYet": MessageLookupByLibrary.simpleMessage(
      "No courses assigned yet",
    ),
    "noCoursesAvailable": MessageLookupByLibrary.simpleMessage(
      "No courses available",
    ),
    "noCoursesFound": MessageLookupByLibrary.simpleMessage("No courses found"),
    "noCoursesInProgress": MessageLookupByLibrary.simpleMessage(
      "No courses in progress",
    ),
    "noEnrolledCourses": MessageLookupByLibrary.simpleMessage(
      "No enrolled courses",
    ),
    "noFilteredReviews": m34,
    "noGoalsProvided": MessageLookupByLibrary.simpleMessage(
      "No goals provided",
    ),
    "noInstructorsRegistered": MessageLookupByLibrary.simpleMessage(
      "No Instructors Registered",
    ),
    "noInternetConnection": MessageLookupByLibrary.simpleMessage(
      "No Internet Connection",
    ),
    "noLogsInThisDay": MessageLookupByLibrary.simpleMessage(
      "No Logs in This Day",
    ),
    "noPostsYet": MessageLookupByLibrary.simpleMessage("No posts yet"),
    "noRatingsMessage": MessageLookupByLibrary.simpleMessage(
      "This course hasn\'t received any ratings yet.",
    ),
    "noRatingsYet": MessageLookupByLibrary.simpleMessage("No ratings yet"),
    "noRegisteredCategories": MessageLookupByLibrary.simpleMessage(
      "No Registered Categories",
    ),
    "noReviewsYet": MessageLookupByLibrary.simpleMessage("No reviews yet"),
    "noStudentsEnrolled": MessageLookupByLibrary.simpleMessage(
      "No students enrolled",
    ),
    "noStudentsToInterview": MessageLookupByLibrary.simpleMessage(
      "No Students to Interview",
    ),
    "noSuchEmailFound": MessageLookupByLibrary.simpleMessage(
      "No Such Email Found",
    ),
    "noUser": MessageLookupByLibrary.simpleMessage("No User"),
    "noUserFoundContactSupport": MessageLookupByLibrary.simpleMessage(
      "No User Found\nPlease Contact Support",
    ),
    "notificationSentSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Notification Sent Successfully",
    ),
    "onTerms": MessageLookupByLibrary.simpleMessage(
      "on Terms and Condition of UCCD Center",
    ),
    "oneStar": MessageLookupByLibrary.simpleMessage("1 Star"),
    "onlyBtuEmail": MessageLookupByLibrary.simpleMessage(
      "Only BTU university emails (@btu.edu.eg) are allowed",
    ),
    "opDepartment": MessageLookupByLibrary.simpleMessage("O&P"),
    "orDivider": MessageLookupByLibrary.simpleMessage("or"),
    "orthoticsProsthetics": MessageLookupByLibrary.simpleMessage("O&P"),
    "otpVerification": MessageLookupByLibrary.simpleMessage("OTP Verification"),
    "overallRating": MessageLookupByLibrary.simpleMessage("Overall"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordHint": MessageLookupByLibrary.simpleMessage("Enter your Password"),
    "passwordLengthError": MessageLookupByLibrary.simpleMessage(
      "Password must be at least 8 characters",
    ),
    "passwordRequired": MessageLookupByLibrary.simpleMessage(
      "Password Required",
    ),
    "pending": MessageLookupByLibrary.simpleMessage("Pending"),
    "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone"),
    "phoneNumberHint": MessageLookupByLibrary.simpleMessage(
      "Enter your Phone Number",
    ),
    "phoneNumberLabel": MessageLookupByLibrary.simpleMessage("Phone Number"),
    "phoneNumberTooShort": MessageLookupByLibrary.simpleMessage(
      "Phone Number are less Than 11 Numbers",
    ),
    "pickImageTooltip": MessageLookupByLibrary.simpleMessage("Pick image"),
    "postAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Post Added Successfully",
    ),
    "postButtonLabel": MessageLookupByLibrary.simpleMessage("Post"),
    "postContentEmpty": MessageLookupByLibrary.simpleMessage(
      "Post content cannot be empty",
    ),
    "postContentHint": MessageLookupByLibrary.simpleMessage(
      "What\'s on your mind?",
    ),
    "postDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Post Deleted Successfully",
    ),
    "postUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Post Updated Successfully",
    ),
    "prerequisiteFieldRequired": MessageLookupByLibrary.simpleMessage(
      "This field cannot be empty",
    ),
    "prerequisiteSkillHint": MessageLookupByLibrary.simpleMessage(
      "Say something about this Prerequisites/Skill",
    ),
    "prerequisiteSkillLabel": m35,
    "prerequisitesNoneNote": MessageLookupByLibrary.simpleMessage(
      "Note: if you don\'t have any skills or prerequisites, you can Write \"None\" in the field below",
    ),
    "prerequisitesNote": MessageLookupByLibrary.simpleMessage(
      "Note: Define at least one skill or prerequisite",
    ),
    "presentCount": m36,
    "profile": MessageLookupByLibrary.simpleMessage("Profile"),
    "quickActions": MessageLookupByLibrary.simpleMessage("Quick Actions"),
    "rateCourse": MessageLookupByLibrary.simpleMessage("Rate Course"),
    "ratingOverview": MessageLookupByLibrary.simpleMessage("Rating Overview"),
    "ratings": MessageLookupByLibrary.simpleMessage("Ratings"),
    "ratingsTitle": MessageLookupByLibrary.simpleMessage("Ratings"),
    "reDepartment": MessageLookupByLibrary.simpleMessage("RE"),
    "readTerms": MessageLookupByLibrary.simpleMessage(
      "Please Read Terms and Condition Carefully before Proceed in",
    ),
    "recentCourses": MessageLookupByLibrary.simpleMessage("Recent Courses"),
    "registerStudent": MessageLookupByLibrary.simpleMessage("Register student"),
    "registrationFailed": MessageLookupByLibrary.simpleMessage(
      "Registration Failed",
    ),
    "reject": MessageLookupByLibrary.simpleMessage("Reject"),
    "rejected": MessageLookupByLibrary.simpleMessage("Rejected"),
    "relatedCoursesTitle": MessageLookupByLibrary.simpleMessage(
      "Related Courses",
    ),
    "removeImageTooltip": MessageLookupByLibrary.simpleMessage("Remove image"),
    "renewableEnergy": MessageLookupByLibrary.simpleMessage("Renewable Energy"),
    "rensendCode": MessageLookupByLibrary.simpleMessage("Resend Code"),
    "requiredField": MessageLookupByLibrary.simpleMessage("Required Field"),
    "retry": MessageLookupByLibrary.simpleMessage("Retry"),
    "reviewsCount": m37,
    "roleAdmin": MessageLookupByLibrary.simpleMessage("Admin"),
    "roleInstructor": MessageLookupByLibrary.simpleMessage("Instructor"),
    "roleStudent": MessageLookupByLibrary.simpleMessage("Student"),
    "roleSuperAdmin": MessageLookupByLibrary.simpleMessage("Super Admin"),
    "room": MessageLookupByLibrary.simpleMessage("Room"),
    "roomNumberHint": MessageLookupByLibrary.simpleMessage("Enter Room Number"),
    "roomNumberLabel": MessageLookupByLibrary.simpleMessage("Room Number"),
    "searchCourses": MessageLookupByLibrary.simpleMessage("Search courses..."),
    "secondYear": MessageLookupByLibrary.simpleMessage("2nd Year"),
    "selectCategory": MessageLookupByLibrary.simpleMessage("Select Category"),
    "selectDateAttendance": MessageLookupByLibrary.simpleMessage(
      "Select Date for Attendance",
    ),
    "selectDepartment": MessageLookupByLibrary.simpleMessage(
      "Select Department",
    ),
    "selectOneInstructor": MessageLookupByLibrary.simpleMessage(
      "Select One Instructor",
    ),
    "selectTodayDateAttendance": MessageLookupByLibrary.simpleMessage(
      "Please select today\'s date to view attendance",
    ),
    "selectYear": MessageLookupByLibrary.simpleMessage("Select year"),
    "selectedDate": m38,
    "sendAll": MessageLookupByLibrary.simpleMessage("Send All"),
    "sendNotification": MessageLookupByLibrary.simpleMessage(
      "Send Notification",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "showAllCourses": MessageLookupByLibrary.simpleMessage("Show All Courses"),
    "showingMultipleFilteredReviews": m39,
    "showingMultipleReviews": m40,
    "showingOneFilteredReview": m41,
    "showingOneReview": MessageLookupByLibrary.simpleMessage(
      "Showing 1 review",
    ),
    "skillsAndPrerequisitesDescription": MessageLookupByLibrary.simpleMessage(
      "What are the skills and Prerequisites required from the student",
    ),
    "splashLoading": MessageLookupByLibrary.simpleMessage("Loading..."),
    "splashText": MessageLookupByLibrary.simpleMessage(
      "University Center for Career Development",
    ),
    "startDateRequired": MessageLookupByLibrary.simpleMessage(
      "Start Date Required",
    ),
    "starts": MessageLookupByLibrary.simpleMessage("Starts"),
    "statistics": MessageLookupByLibrary.simpleMessage("Statistics"),
    "statisticsButtonSemanticLabel": m42,
    "statisticsButtonTitle": MessageLookupByLibrary.simpleMessage("Statistics"),
    "statisticsButtonTooltip": MessageLookupByLibrary.simpleMessage(
      "View course statistics and analytics",
    ),
    "studentAcceptedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Student Accepted Successfully",
    ),
    "studentAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Student Added Successfully",
    ),
    "studentAttendanceUnmarked": MessageLookupByLibrary.simpleMessage(
      "Student attendance unmarked",
    ),
    "studentEmailHint": MessageLookupByLibrary.simpleMessage(
      "Enter Student Email",
    ),
    "studentEmailLabel": MessageLookupByLibrary.simpleMessage("Student Email"),
    "studentEmailRequired": MessageLookupByLibrary.simpleMessage(
      "Student Email Required",
    ),
    "studentInfo": MessageLookupByLibrary.simpleMessage("Student Info"),
    "studentInfoDescription": MessageLookupByLibrary.simpleMessage(
      "Let\'s Start by Providing us with some info",
    ),
    "studentInterests": MessageLookupByLibrary.simpleMessage(
      "Student Interests",
    ),
    "studentInterestsDescription": MessageLookupByLibrary.simpleMessage(
      "What Categories of Courses or Fields you are interested in",
    ),
    "studentMarkedAbsent": MessageLookupByLibrary.simpleMessage(
      "Student marked as absent",
    ),
    "studentMarkedPresent": MessageLookupByLibrary.simpleMessage(
      "Student marked as present",
    ),
    "studentNameHint": MessageLookupByLibrary.simpleMessage(
      "Enter student name",
    ),
    "studentNameLabel": MessageLookupByLibrary.simpleMessage("Student Name"),
    "studentNameRequired": MessageLookupByLibrary.simpleMessage(
      "Student Name Required",
    ),
    "studentPasswordHint": MessageLookupByLibrary.simpleMessage(
      "Enter Student Password",
    ),
    "studentPasswordLabel": MessageLookupByLibrary.simpleMessage(
      "Student Password",
    ),
    "studentUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Student Updated Successfully",
    ),
    "students": MessageLookupByLibrary.simpleMessage("Students"),
    "studentsByDepartmentAndYear": MessageLookupByLibrary.simpleMessage(
      "Students By Department & year",
    ),
    "studentsByDepartments": MessageLookupByLibrary.simpleMessage(
      "Students By Departments",
    ),
    "studentsByYear": MessageLookupByLibrary.simpleMessage("Students By year"),
    "studentsCount": m43,
    "studentsWillAppearEnrolled": MessageLookupByLibrary.simpleMessage(
      "Students will appear here once they are enrolled in the course",
    ),
    "success": MessageLookupByLibrary.simpleMessage("Success"),
    "tapToAddImage": MessageLookupByLibrary.simpleMessage("Tab to Add Image"),
    "thirdYear": MessageLookupByLibrary.simpleMessage("3rd Year"),
    "threeStars": MessageLookupByLibrary.simpleMessage("3 Stars"),
    "totalCourses": MessageLookupByLibrary.simpleMessage("Total Courses"),
    "totalDays": m44,
    "totalStudents": MessageLookupByLibrary.simpleMessage("Total Students"),
    "trackEnrolledCourses": MessageLookupByLibrary.simpleMessage(
      "Track your enrolled courses and progress",
    ),
    "tryAgain": MessageLookupByLibrary.simpleMessage("Try Again"),
    "tryAgainLater": MessageLookupByLibrary.simpleMessage("Try Again Later"),
    "tryChangingFilters": MessageLookupByLibrary.simpleMessage(
      "Try changing your filters or search terms",
    ),
    "twoStars": MessageLookupByLibrary.simpleMessage("2 Stars"),
    "uccdMobileApp": MessageLookupByLibrary.simpleMessage("UCCD Mobile App"),
    "universityEmail": MessageLookupByLibrary.simpleMessage("University Email"),
    "universityEmailHint": MessageLookupByLibrary.simpleMessage(
      "Enter your University Email",
    ),
    "universityEmailsOnly": MessageLookupByLibrary.simpleMessage(
      "University Emails Only",
    ),
    "universityIdHint": MessageLookupByLibrary.simpleMessage(
      "Enter Student University ID",
    ),
    "universityIdLabel": MessageLookupByLibrary.simpleMessage("University ID"),
    "universityIdLengthError": MessageLookupByLibrary.simpleMessage(
      "University ID must be 9 characters length",
    ),
    "universityIdRequired": MessageLookupByLibrary.simpleMessage(
      "University ID Required",
    ),
    "unknownError": MessageLookupByLibrary.simpleMessage("Unknown Error"),
    "unmarkedCount": m45,
    "updateButtonLabel": MessageLookupByLibrary.simpleMessage("Update"),
    "uploadCourseMaterials": MessageLookupByLibrary.simpleMessage(
      "Upload Course Materials",
    ),
    "userAccountDisabled": MessageLookupByLibrary.simpleMessage(
      "User Account is Disabled Contact Support",
    ),
    "userCreatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "User Created Successfully",
    ),
    "userDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "User Deleted Successfully",
    ),
    "userUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "User Updated Successfully",
    ),
    "usernameRequired": MessageLookupByLibrary.simpleMessage(
      "Please enter a username",
    ),
    "users": MessageLookupByLibrary.simpleMessage("Users"),
    "verificationEmailInbox": MessageLookupByLibrary.simpleMessage(
      " with an OTP Number please Check your Inbox",
    ),
    "verificationEmailSent": MessageLookupByLibrary.simpleMessage(
      "We Sent a Verification Email to ",
    ),
    "versionNumber": MessageLookupByLibrary.simpleMessage("Version 1.0.0"),
    "viewAll": MessageLookupByLibrary.simpleMessage("View All"),
    "viewCourseButton": MessageLookupByLibrary.simpleMessage("View Course"),
    "welcomeBack": MessageLookupByLibrary.simpleMessage("Welcome back,"),
    "welcomeBackComma": MessageLookupByLibrary.simpleMessage("Welcome back, "),
    "welcomeTo": MessageLookupByLibrary.simpleMessage("Welcome to"),
    "wrongPassword": MessageLookupByLibrary.simpleMessage("Wrong Password"),
    "yearHint": MessageLookupByLibrary.simpleMessage("year"),
    "yearLabel": MessageLookupByLibrary.simpleMessage("Year"),
    "yes": MessageLookupByLibrary.simpleMessage("Yes"),
    "yourProgress": MessageLookupByLibrary.simpleMessage("Your Progress"),
  };
}
