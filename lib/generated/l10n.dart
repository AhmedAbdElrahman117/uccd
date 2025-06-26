// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `University Center for Career Development`
  String get splashText {
    return Intl.message(
      'University Center for Career Development',
      name: 'splashText',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get splashLoading {
    return Intl.message(
      'Loading...',
      name: 'splashLoading',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to`
  String get welcomeTo {
    return Intl.message('Welcome to', name: 'welcomeTo', desc: '', args: []);
  }

  /// `Login`
  String get loginButton {
    return Intl.message('Login', name: 'loginButton', desc: '', args: []);
  }

  /// `Contact Support`
  String get contactSupport {
    return Intl.message(
      'Contact Support',
      name: 'contactSupport',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get orDivider {
    return Intl.message('or', name: 'orDivider', desc: '', args: []);
  }

  /// `UCCD Mobile App`
  String get uccdMobileApp {
    return Intl.message(
      'UCCD Mobile App',
      name: 'uccdMobileApp',
      desc: '',
      args: [],
    );
  }

  /// `Version 1.0.0`
  String get versionNumber {
    return Intl.message(
      'Version 1.0.0',
      name: 'versionNumber',
      desc: '',
      args: [],
    );
  }

  /// `University Email`
  String get universityEmail {
    return Intl.message(
      'University Email',
      name: 'universityEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter your University Email`
  String get universityEmailHint {
    return Intl.message(
      'Enter your University Email',
      name: 'universityEmailHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Enter your Password`
  String get passwordHint {
    return Intl.message(
      'Enter your Password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Email field is required`
  String get emailRequired {
    return Intl.message(
      'Email field is required',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get invalidEmail {
    return Intl.message(
      'Please enter a valid email address',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Only BTU university emails (@btu.edu.eg) are allowed`
  String get onlyBtuEmail {
    return Intl.message(
      'Only BTU university emails (@btu.edu.eg) are allowed',
      name: 'onlyBtuEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email username must be at least 3 characters`
  String get emailUsernameTooShort {
    return Intl.message(
      'Email username must be at least 3 characters',
      name: 'emailUsernameTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Student Interests`
  String get studentInterests {
    return Intl.message(
      'Student Interests',
      name: 'studentInterests',
      desc: '',
      args: [],
    );
  }

  /// `What Categories of Courses or Fields you are interested in`
  String get studentInterestsDescription {
    return Intl.message(
      'What Categories of Courses or Fields you are interested in',
      name: 'studentInterestsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Student Info`
  String get studentInfo {
    return Intl.message(
      'Student Info',
      name: 'studentInfo',
      desc: '',
      args: [],
    );
  }

  /// `Let's Start by Providing us with some info`
  String get studentInfoDescription {
    return Intl.message(
      'Let\'s Start by Providing us with some info',
      name: 'studentInfoDescription',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phoneNumber {
    return Intl.message('Phone', name: 'phoneNumber', desc: '', args: []);
  }

  /// `Enter your Phone Number`
  String get phoneNumberHint {
    return Intl.message(
      'Enter your Phone Number',
      name: 'phoneNumberHint',
      desc: '',
      args: [],
    );
  }

  /// `Required Field`
  String get requiredField {
    return Intl.message(
      'Required Field',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number are less Than 11 Numbers`
  String get phoneNumberTooShort {
    return Intl.message(
      'Phone Number are less Than 11 Numbers',
      name: 'phoneNumberTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Phone Number`
  String get invalidPhoneNumber {
    return Intl.message(
      'Invalid Phone Number',
      name: 'invalidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Graduation year`
  String get graduationYear {
    return Intl.message(
      'Graduation year',
      name: 'graduationYear',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Expected Graduation year`
  String get graduationYearHint {
    return Intl.message(
      'Enter your Expected Graduation year',
      name: 'graduationYearHint',
      desc: '',
      args: [],
    );
  }

  /// `Date Required`
  String get dateRequired {
    return Intl.message(
      'Date Required',
      name: 'dateRequired',
      desc: '',
      args: [],
    );
  }

  /// `Graduation year is Incorrect`
  String get graduationYearIncorrect {
    return Intl.message(
      'Graduation year is Incorrect',
      name: 'graduationYearIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `We Sent a Verification Email to `
  String get verificationEmailSent {
    return Intl.message(
      'We Sent a Verification Email to ',
      name: 'verificationEmailSent',
      desc: '',
      args: [],
    );
  }

  /// ` with an OTP Number please Check your Inbox`
  String get verificationEmailInbox {
    return Intl.message(
      ' with an OTP Number please Check your Inbox',
      name: 'verificationEmailInbox',
      desc: '',
      args: [],
    );
  }

  /// `OTP Verification`
  String get otpVerification {
    return Intl.message(
      'OTP Verification',
      name: 'otpVerification',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive a code?`
  String get didntRecieveCode {
    return Intl.message(
      'Didn\'t receive a code?',
      name: 'didntRecieveCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get rensendCode {
    return Intl.message('Resend Code', name: 'rensendCode', desc: '', args: []);
  }

  /// `Disability`
  String get Disability {
    return Intl.message('Disability', name: 'Disability', desc: '', args: []);
  }

  /// `Yes`
  String get yes {
    return Intl.message('Yes', name: 'yes', desc: '', args: []);
  }

  /// `No`
  String get No {
    return Intl.message('No', name: 'No', desc: '', args: []);
  }

  /// `Next`
  String get Next {
    return Intl.message('Next', name: 'Next', desc: '', args: []);
  }

  /// `Back`
  String get Back {
    return Intl.message('Back', name: 'Back', desc: '', args: []);
  }

  /// `Submit`
  String get Submit {
    return Intl.message('Submit', name: 'Submit', desc: '', args: []);
  }

  /// `Terms and Conditions`
  String get TermsAndConditions {
    return Intl.message(
      'Terms and Conditions',
      name: 'TermsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Please Read Terms and Condition Carefully before Proceed in`
  String get readTerms {
    return Intl.message(
      'Please Read Terms and Condition Carefully before Proceed in',
      name: 'readTerms',
      desc: '',
      args: [],
    );
  }

  /// `I agree and authorize the UCCD to use my data and my photographs taken during my participation in the training programs and/or career development service offered by the center for the purposes of UCCD reporting, publications, and employer networking`
  String get TermsText1 {
    return Intl.message(
      'I agree and authorize the UCCD to use my data and my photographs taken during my participation in the training programs and/or career development service offered by the center for the purposes of UCCD reporting, publications, and employer networking',
      name: 'TermsText1',
      desc: '',
      args: [],
    );
  }

  /// `and authorizing UCCD app to collect Data about my participation in courses for analysis and improving user Experience`
  String get TermsText2 {
    return Intl.message(
      'and authorizing UCCD app to collect Data about my participation in courses for analysis and improving user Experience',
      name: 'TermsText2',
      desc: '',
      args: [],
    );
  }

  /// `I Agree`
  String get IAgree {
    return Intl.message('I Agree', name: 'IAgree', desc: '', args: []);
  }

  /// `on Terms and Condition of UCCD Center`
  String get onTerms {
    return Intl.message(
      'on Terms and Condition of UCCD Center',
      name: 'onTerms',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Courses`
  String get courses {
    return Intl.message('Courses', name: 'courses', desc: '', args: []);
  }

  /// `My Courses`
  String get myCourses {
    return Intl.message('My Courses', name: 'myCourses', desc: '', args: []);
  }

  /// `Community`
  String get community {
    return Intl.message('Community', name: 'community', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Assigned Courses`
  String get assignedCourses {
    return Intl.message(
      'Assigned Courses',
      name: 'assignedCourses',
      desc: '',
      args: [],
    );
  }

  /// `No courses assigned yet`
  String get noCoursesAssignedYet {
    return Intl.message(
      'No courses assigned yet',
      name: 'noCoursesAssignedYet',
      desc: '',
      args: [],
    );
  }

  /// `Courses will appear here once they are assigned to you`
  String get coursesWillAppearAssigned {
    return Intl.message(
      'Courses will appear here once they are assigned to you',
      name: 'coursesWillAppearAssigned',
      desc: '',
      args: [],
    );
  }

  /// `Error loading courses`
  String get errorLoadingCourses {
    return Intl.message(
      'Error loading courses',
      name: 'errorLoadingCourses',
      desc: '',
      args: [],
    );
  }

  /// `Quick Actions`
  String get quickActions {
    return Intl.message(
      'Quick Actions',
      name: 'quickActions',
      desc: '',
      args: [],
    );
  }

  /// `Add Course`
  String get addCourse {
    return Intl.message('Add Course', name: 'addCourse', desc: '', args: []);
  }

  /// `Create new course`
  String get createNewCourse {
    return Intl.message(
      'Create new course',
      name: 'createNewCourse',
      desc: '',
      args: [],
    );
  }

  /// `Add Category`
  String get addCategory {
    return Intl.message(
      'Add Category',
      name: 'addCategory',
      desc: '',
      args: [],
    );
  }

  /// `Manage categories`
  String get manageCategories {
    return Intl.message(
      'Manage categories',
      name: 'manageCategories',
      desc: '',
      args: [],
    );
  }

  /// `Add Post`
  String get addPost {
    return Intl.message('Add Post', name: 'addPost', desc: '', args: []);
  }

  /// `Community post`
  String get communityPost {
    return Intl.message(
      'Community post',
      name: 'communityPost',
      desc: '',
      args: [],
    );
  }

  /// `Add Instructor`
  String get addInstructor {
    return Intl.message(
      'Add Instructor',
      name: 'addInstructor',
      desc: '',
      args: [],
    );
  }

  /// `New instructor`
  String get newInstructor {
    return Intl.message(
      'New instructor',
      name: 'newInstructor',
      desc: '',
      args: [],
    );
  }

  /// `Add Student`
  String get addStudent {
    return Intl.message('Add Student', name: 'addStudent', desc: '', args: []);
  }

  /// `Register student`
  String get registerStudent {
    return Intl.message(
      'Register student',
      name: 'registerStudent',
      desc: '',
      args: [],
    );
  }

  /// `Actions`
  String get actions {
    return Intl.message('Actions', name: 'actions', desc: '', args: []);
  }

  /// `Admin Dashboard`
  String get adminDashboard {
    return Intl.message(
      'Admin Dashboard',
      name: 'adminDashboard',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back,`
  String get welcomeBack {
    return Intl.message(
      'Welcome back,',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Admin`
  String get admin {
    return Intl.message('Admin', name: 'admin', desc: '', args: []);
  }

  /// `Total Courses`
  String get totalCourses {
    return Intl.message(
      'Total Courses',
      name: 'totalCourses',
      desc: '',
      args: [],
    );
  }

  /// `Active Students`
  String get activeStudents {
    return Intl.message(
      'Active Students',
      name: 'activeStudents',
      desc: '',
      args: [],
    );
  }

  /// `Students By year`
  String get studentsByYear {
    return Intl.message(
      'Students By year',
      name: 'studentsByYear',
      desc: '',
      args: [],
    );
  }

  /// `Students By Departments`
  String get studentsByDepartments {
    return Intl.message(
      'Students By Departments',
      name: 'studentsByDepartments',
      desc: '',
      args: [],
    );
  }

  /// `Students By Department & year`
  String get studentsByDepartmentAndYear {
    return Intl.message(
      'Students By Department & year',
      name: 'studentsByDepartmentAndYear',
      desc: '',
      args: [],
    );
  }

  /// `Change Instrcutor`
  String get changeInstructor {
    return Intl.message(
      'Change Instrcutor',
      name: 'changeInstructor',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message('Change', name: 'change', desc: '', args: []);
  }

  /// `Interview`
  String get interview {
    return Intl.message('Interview', name: 'interview', desc: '', args: []);
  }

  /// `Statistics`
  String get statistics {
    return Intl.message('Statistics', name: 'statistics', desc: '', args: []);
  }

  /// `Change Category`
  String get changeCategory {
    return Intl.message(
      'Change Category',
      name: 'changeCategory',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `Multiple Check`
  String get multipleCheck {
    return Intl.message(
      'Multiple Check',
      name: 'multipleCheck',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message('Dashboard', name: 'dashboard', desc: '', args: []);
  }

  /// `Admins`
  String get admins {
    return Intl.message('Admins', name: 'admins', desc: '', args: []);
  }

  /// `Categories`
  String get categories {
    return Intl.message('Categories', name: 'categories', desc: '', args: []);
  }

  /// `Instructors`
  String get instructors {
    return Intl.message('Instructors', name: 'instructors', desc: '', args: []);
  }

  /// `Course Analytics`
  String get courseAnalytics {
    return Intl.message(
      'Course Analytics',
      name: 'courseAnalytics',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Dashboard Overview`
  String get dashboardOverview {
    return Intl.message(
      'Dashboard Overview',
      name: 'dashboardOverview',
      desc: '',
      args: [],
    );
  }

  /// `Course`
  String get course {
    return Intl.message('Course', name: 'course', desc: '', args: []);
  }

  /// `Reject`
  String get reject {
    return Intl.message('Reject', name: 'reject', desc: '', args: []);
  }

  /// `Live Data`
  String get LiveData {
    return Intl.message('Live Data', name: 'LiveData', desc: '', args: []);
  }

  /// `System configuration`
  String get SystemConfiguration {
    return Intl.message(
      'System configuration',
      name: 'SystemConfiguration',
      desc: '',
      args: [],
    );
  }

  /// `Courses Management`
  String get coursesManagement {
    return Intl.message(
      'Courses Management',
      name: 'coursesManagement',
      desc: '',
      args: [],
    );
  }

  /// `Students`
  String get students {
    return Intl.message('Students', name: 'students', desc: '', args: []);
  }

  /// `Send Notification`
  String get sendNotification {
    return Intl.message(
      'Send Notification',
      name: 'sendNotification',
      desc: '',
      args: [],
    );
  }

  /// `Send All`
  String get sendAll {
    return Intl.message('Send All', name: 'sendAll', desc: '', args: []);
  }

  /// `Ratings`
  String get ratings {
    return Intl.message('Ratings', name: 'ratings', desc: '', args: []);
  }

  /// `Accept`
  String get accept {
    return Intl.message('Accept', name: 'accept', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `No Accepted Students`
  String get noAcceptedStudents {
    return Intl.message(
      'No Accepted Students',
      name: 'noAcceptedStudents',
      desc: '',
      args: [],
    );
  }

  /// `Attend`
  String get attend {
    return Intl.message('Attend', name: 'attend', desc: '', args: []);
  }

  /// `Absent`
  String get absent {
    return Intl.message('Absent', name: 'absent', desc: '', args: []);
  }

  /// `Invalid Course Dates`
  String get invalidCourseDates {
    return Intl.message(
      'Invalid Course Dates',
      name: 'invalidCourseDates',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Interview Dates`
  String get invalidInterviewDates {
    return Intl.message(
      'Invalid Interview Dates',
      name: 'invalidInterviewDates',
      desc: '',
      args: [],
    );
  }

  /// `Interview Dates must be before Course Dates`
  String get interviewDatesBeforeCourseDates {
    return Intl.message(
      'Interview Dates must be before Course Dates',
      name: 'interviewDatesBeforeCourseDates',
      desc: '',
      args: [],
    );
  }

  /// `Max Accepted Students`
  String get maxAcceptedStudents {
    return Intl.message(
      'Max Accepted Students',
      name: 'maxAcceptedStudents',
      desc: '',
      args: [],
    );
  }

  /// `Enter Max Accepted Students`
  String get enterMaxAcceptedStudents {
    return Intl.message(
      'Enter Max Accepted Students',
      name: 'enterMaxAcceptedStudents',
      desc: '',
      args: [],
    );
  }

  /// `Enter Interview Start Date`
  String get enterInterviewStartDate {
    return Intl.message(
      'Enter Interview Start Date',
      name: 'enterInterviewStartDate',
      desc: '',
      args: [],
    );
  }

  /// `Enter Interview End Date`
  String get enterInterviewEndDate {
    return Intl.message(
      'Enter Interview End Date',
      name: 'enterInterviewEndDate',
      desc: '',
      args: [],
    );
  }

  /// `Interview Start Date`
  String get interviewStartDate {
    return Intl.message(
      'Interview Start Date',
      name: 'interviewStartDate',
      desc: '',
      args: [],
    );
  }

  /// `Interview End Date`
  String get interviewEndDate {
    return Intl.message(
      'Interview End Date',
      name: 'interviewEndDate',
      desc: '',
      args: [],
    );
  }

  /// `Start Date Required`
  String get startDateRequired {
    return Intl.message(
      'Start Date Required',
      name: 'startDateRequired',
      desc: '',
      args: [],
    );
  }

  /// `End Date Required`
  String get endDateRequired {
    return Intl.message(
      'End Date Required',
      name: 'endDateRequired',
      desc: '',
      args: [],
    );
  }

  /// `Interview Start Date must be before End Date`
  String get interviewStartDateBeforeEndDate {
    return Intl.message(
      'Interview Start Date must be before End Date',
      name: 'interviewStartDateBeforeEndDate',
      desc: '',
      args: [],
    );
  }

  /// `Interview End Date must be after Start Date`
  String get interviewEndDateAfterStartDate {
    return Intl.message(
      'Interview End Date must be after Start Date',
      name: 'interviewEndDateAfterStartDate',
      desc: '',
      args: [],
    );
  }

  /// `Interview Start Date must be Before Courses`
  String get interviewStartDateBeforeCourses {
    return Intl.message(
      'Interview Start Date must be Before Courses',
      name: 'interviewStartDateBeforeCourses',
      desc: '',
      args: [],
    );
  }

  /// `Interview End Date must be Before Courses`
  String get interviewEndDateBeforeCourses {
    return Intl.message(
      'Interview End Date must be Before Courses',
      name: 'interviewEndDateBeforeCourses',
      desc: '',
      args: [],
    );
  }

  /// `Available`
  String get availableCourses {
    return Intl.message(
      'Available',
      name: 'availableCourses',
      desc: '',
      args: [],
    );
  }

  /// `Archived`
  String get archivedCourses {
    return Intl.message(
      'Archived',
      name: 'archivedCourses',
      desc: '',
      args: [],
    );
  }

  /// `Manage Course`
  String get ManageCourses {
    return Intl.message(
      'Manage Course',
      name: 'ManageCourses',
      desc: '',
      args: [],
    );
  }

  /// `Archived`
  String get Archived {
    return Intl.message('Archived', name: 'Archived', desc: '', args: []);
  }

  /// `Active`
  String get Active {
    return Intl.message('Active', name: 'Active', desc: '', args: []);
  }

  /// `Student`
  String get Student {
    return Intl.message('Student', name: 'Student', desc: '', args: []);
  }

  /// `Control Panel`
  String get controlPanel {
    return Intl.message(
      'Control Panel',
      name: 'controlPanel',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Pending`
  String get pending {
    return Intl.message('Pending', name: 'pending', desc: '', args: []);
  }

  /// `Accepted`
  String get accepted {
    return Intl.message('Accepted', name: 'accepted', desc: '', args: []);
  }

  /// `Rejected`
  String get rejected {
    return Intl.message('Rejected', name: 'rejected', desc: '', args: []);
  }

  /// `Student Accepted Successfully`
  String get studentAcceptedSuccessfully {
    return Intl.message(
      'Student Accepted Successfully',
      name: 'studentAcceptedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Enrollments`
  String get enrollments {
    return Intl.message('Enrollments', name: 'enrollments', desc: '', args: []);
  }

  /// `Available`
  String get available {
    return Intl.message('Available', name: 'available', desc: '', args: []);
  }

  /// `Total Students`
  String get totalStudents {
    return Intl.message(
      'Total Students',
      name: 'totalStudents',
      desc: '',
      args: [],
    );
  }

  /// `No Students to Interview`
  String get noStudentsToInterview {
    return Intl.message(
      'No Students to Interview',
      name: 'noStudentsToInterview',
      desc: '',
      args: [],
    );
  }

  /// `Statistics`
  String get statisticsButtonTitle {
    return Intl.message(
      'Statistics',
      name: 'statisticsButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `View course statistics and analytics`
  String get statisticsButtonTooltip {
    return Intl.message(
      'View course statistics and analytics',
      name: 'statisticsButtonTooltip',
      desc: '',
      args: [],
    );
  }

  /// `View statistics for {courseName}`
  String statisticsButtonSemanticLabel(String courseName) {
    return Intl.message(
      'View statistics for $courseName',
      name: 'statisticsButtonSemanticLabel',
      desc: '',
      args: [courseName],
    );
  }

  /// `Interview`
  String get interviewButtonTitle {
    return Intl.message(
      'Interview',
      name: 'interviewButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Manage course interviews and applications`
  String get interviewButtonTooltip {
    return Intl.message(
      'Manage course interviews and applications',
      name: 'interviewButtonTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Manage interviews for {courseName}`
  String interviewButtonSemanticLabel(String courseName) {
    return Intl.message(
      'Manage interviews for $courseName',
      name: 'interviewButtonSemanticLabel',
      desc: '',
      args: [courseName],
    );
  }

  /// `Edit`
  String get editButtonTitle {
    return Intl.message('Edit', name: 'editButtonTitle', desc: '', args: []);
  }

  /// `Edit course information and settings`
  String get editButtonTooltip {
    return Intl.message(
      'Edit course information and settings',
      name: 'editButtonTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Edit {courseName}`
  String editButtonSemanticLabel(String courseName) {
    return Intl.message(
      'Edit $courseName',
      name: 'editButtonSemanticLabel',
      desc: '',
      args: [courseName],
    );
  }

  /// `Change Instructor`
  String get changeInstructorButtonTitle {
    return Intl.message(
      'Change Instructor',
      name: 'changeInstructorButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Change course instructor`
  String get changeInstructorButtonTooltip {
    return Intl.message(
      'Change course instructor',
      name: 'changeInstructorButtonTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Change instructor for {courseName}`
  String changeInstructorButtonSemanticLabel(String courseName) {
    return Intl.message(
      'Change instructor for $courseName',
      name: 'changeInstructorButtonSemanticLabel',
      desc: '',
      args: [courseName],
    );
  }

  /// `Change Category`
  String get changeCategoryButtonTitle {
    return Intl.message(
      'Change Category',
      name: 'changeCategoryButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Change course category`
  String get changeCategoryButtonTooltip {
    return Intl.message(
      'Change course category',
      name: 'changeCategoryButtonTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Change category for {courseName}`
  String changeCategoryButtonSemanticLabel(String courseName) {
    return Intl.message(
      'Change category for $courseName',
      name: 'changeCategoryButtonSemanticLabel',
      desc: '',
      args: [courseName],
    );
  }

  /// `Delete`
  String get deleteButtonTitle {
    return Intl.message(
      'Delete',
      name: 'deleteButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Delete course permanently`
  String get deleteButtonTooltip {
    return Intl.message(
      'Delete course permanently',
      name: 'deleteButtonTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Delete {courseName}`
  String deleteButtonSemanticLabel(String courseName) {
    return Intl.message(
      'Delete $courseName',
      name: 'deleteButtonSemanticLabel',
      desc: '',
      args: [courseName],
    );
  }

  /// `Do you want to Delete {courseName} permanently?`
  String deleteCourseConfirmMessage(String courseName) {
    return Intl.message(
      'Do you want to Delete $courseName permanently?',
      name: 'deleteCourseConfirmMessage',
      desc: '',
      args: [courseName],
    );
  }

  /// `1st Year`
  String get firstYear {
    return Intl.message('1st Year', name: 'firstYear', desc: '', args: []);
  }

  /// `2nd Year`
  String get secondYear {
    return Intl.message('2nd Year', name: 'secondYear', desc: '', args: []);
  }

  /// `3rd Year`
  String get thirdYear {
    return Intl.message('3rd Year', name: 'thirdYear', desc: '', args: []);
  }

  /// `4th Year`
  String get fourthYear {
    return Intl.message('4th Year', name: 'fourthYear', desc: '', args: []);
  }

  /// `IT`
  String get itDepartment {
    return Intl.message('IT', name: 'itDepartment', desc: '', args: []);
  }

  /// `Mecha`
  String get mechaDepartment {
    return Intl.message('Mecha', name: 'mechaDepartment', desc: '', args: []);
  }

  /// `Auto`
  String get autoDepartment {
    return Intl.message('Auto', name: 'autoDepartment', desc: '', args: []);
  }

  /// `RE`
  String get reDepartment {
    return Intl.message('RE', name: 'reDepartment', desc: '', args: []);
  }

  /// `O&P`
  String get opDepartment {
    return Intl.message('O&P', name: 'opDepartment', desc: '', args: []);
  }

  /// `Add Course`
  String get addCourseTitle {
    return Intl.message(
      'Add Course',
      name: 'addCourseTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit Course`
  String get editCourseTitle {
    return Intl.message(
      'Edit Course',
      name: 'editCourseTitle',
      desc: '',
      args: [],
    );
  }

  /// `Course Added Successfully`
  String get courseAddedSuccessfully {
    return Intl.message(
      'Course Added Successfully',
      name: 'courseAddedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Course Updated Successfully`
  String get courseUpdatedSuccessfully {
    return Intl.message(
      'Course Updated Successfully',
      name: 'courseUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Course Deleted Successfully`
  String get courseDeletedSuccessfully {
    return Intl.message(
      'Course Deleted Successfully',
      name: 'courseDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Category Changed Successfully`
  String get categoryChangedSuccessfully {
    return Intl.message(
      'Category Changed Successfully',
      name: 'categoryChangedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Interview dates must be before course dates`
  String get interviewBeforeCourse {
    return Intl.message(
      'Interview dates must be before course dates',
      name: 'interviewBeforeCourse',
      desc: '',
      args: [],
    );
  }

  /// `Course Info`
  String get courseInfo {
    return Intl.message('Course Info', name: 'courseInfo', desc: '', args: []);
  }

  /// `Let's Start With Course Basic Info`
  String get courseInfoDescription {
    return Intl.message(
      'Let\'s Start With Course Basic Info',
      name: 'courseInfoDescription',
      desc: '',
      args: [],
    );
  }

  /// `Course Goals`
  String get courseGoals {
    return Intl.message(
      'Course Goals',
      name: 'courseGoals',
      desc: '',
      args: [],
    );
  }

  /// `Set The Course Outcomes for Students`
  String get courseGoalsDescription {
    return Intl.message(
      'Set The Course Outcomes for Students',
      name: 'courseGoalsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Note: you must set at least one goal`
  String get courseGoalsNote {
    return Intl.message(
      'Note: you must set at least one goal',
      name: 'courseGoalsNote',
      desc: '',
      args: [],
    );
  }

  /// `Goal {goalNumber}`
  String goalLabel(int goalNumber) {
    return Intl.message(
      'Goal $goalNumber',
      name: 'goalLabel',
      desc: '',
      args: [goalNumber],
    );
  }

  /// `Enter Goal {goalNumber}`
  String goalHint(int goalNumber) {
    return Intl.message(
      'Enter Goal $goalNumber',
      name: 'goalHint',
      desc: '',
      args: [goalNumber],
    );
  }

  /// `Add Goal`
  String get addGoal {
    return Intl.message('Add Goal', name: 'addGoal', desc: '', args: []);
  }

  /// `Course Dates`
  String get courseDates {
    return Intl.message(
      'Course Dates',
      name: 'courseDates',
      desc: '',
      args: [],
    );
  }

  /// `Now Let's set the Dates of the Course`
  String get courseDatesDescription {
    return Intl.message(
      'Now Let\'s set the Dates of the Course',
      name: 'courseDatesDescription',
      desc: '',
      args: [],
    );
  }

  /// `Course Image`
  String get courseImage {
    return Intl.message(
      'Course Image',
      name: 'courseImage',
      desc: '',
      args: [],
    );
  }

  /// `Finally you can Add an Image to your course`
  String get courseImageDescription {
    return Intl.message(
      'Finally you can Add an Image to your course',
      name: 'courseImageDescription',
      desc: '',
      args: [],
    );
  }

  /// `Note: if you Don't add an image to the course the course will have the UCCD logo automatically`
  String get courseImageNote {
    return Intl.message(
      'Note: if you Don\'t add an image to the course the course will have the UCCD logo automatically',
      name: 'courseImageNote',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get addButtonLabel {
    return Intl.message('Add', name: 'addButtonLabel', desc: '', args: []);
  }

  /// `Edit`
  String get editButtonLabel {
    return Intl.message('Edit', name: 'editButtonLabel', desc: '', args: []);
  }

  /// `Course Title`
  String get courseTitleLabel {
    return Intl.message(
      'Course Title',
      name: 'courseTitleLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter Course Title`
  String get courseTitleHint {
    return Intl.message(
      'Enter Course Title',
      name: 'courseTitleHint',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get descriptionLabel {
    return Intl.message(
      'Description',
      name: 'descriptionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter Course Description`
  String get descriptionHint {
    return Intl.message(
      'Enter Course Description',
      name: 'descriptionHint',
      desc: '',
      args: [],
    );
  }

  /// `Room Number`
  String get roomNumberLabel {
    return Intl.message(
      'Room Number',
      name: 'roomNumberLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter Room Number`
  String get roomNumberHint {
    return Intl.message(
      'Enter Room Number',
      name: 'roomNumberHint',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get durationLabel {
    return Intl.message('Duration', name: 'durationLabel', desc: '', args: []);
  }

  /// `Enter Course Duration`
  String get durationHint {
    return Intl.message(
      'Enter Course Duration',
      name: 'durationHint',
      desc: '',
      args: [],
    );
  }

  /// `Course Start Date`
  String get courseStartDateLabel {
    return Intl.message(
      'Course Start Date',
      name: 'courseStartDateLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter Course Start Date`
  String get courseStartDateHint {
    return Intl.message(
      'Enter Course Start Date',
      name: 'courseStartDateHint',
      desc: '',
      args: [],
    );
  }

  /// `Start Date Required`
  String get courseStartDateRequired {
    return Intl.message(
      'Start Date Required',
      name: 'courseStartDateRequired',
      desc: '',
      args: [],
    );
  }

  /// `Course Start Date must be before End Date`
  String get courseStartDateBeforeEndDate {
    return Intl.message(
      'Course Start Date must be before End Date',
      name: 'courseStartDateBeforeEndDate',
      desc: '',
      args: [],
    );
  }

  /// `Course Start Date must be After Interviews`
  String get courseStartDateAfterInterviews {
    return Intl.message(
      'Course Start Date must be After Interviews',
      name: 'courseStartDateAfterInterviews',
      desc: '',
      args: [],
    );
  }

  /// `Course End Date`
  String get courseEndDateLabel {
    return Intl.message(
      'Course End Date',
      name: 'courseEndDateLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter Course End Date`
  String get courseEndDateHint {
    return Intl.message(
      'Enter Course End Date',
      name: 'courseEndDateHint',
      desc: '',
      args: [],
    );
  }

  /// `End Date Required`
  String get courseEndDateRequired {
    return Intl.message(
      'End Date Required',
      name: 'courseEndDateRequired',
      desc: '',
      args: [],
    );
  }

  /// `Course End Date must be After Start Date`
  String get courseEndDateAfterStartDate {
    return Intl.message(
      'Course End Date must be After Start Date',
      name: 'courseEndDateAfterStartDate',
      desc: '',
      args: [],
    );
  }

  /// `Course End Date must be After Interviews`
  String get courseEndDateAfterInterviews {
    return Intl.message(
      'Course End Date must be After Interviews',
      name: 'courseEndDateAfterInterviews',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get loadingText {
    return Intl.message('Loading', name: 'loadingText', desc: '', args: []);
  }

  /// `No Instructors Registered`
  String get noInstructorsRegistered {
    return Intl.message(
      'No Instructors Registered',
      name: 'noInstructorsRegistered',
      desc: '',
      args: [],
    );
  }

  /// `Instructors`
  String get instructorsLabel {
    return Intl.message(
      'Instructors',
      name: 'instructorsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Select One Instructor`
  String get selectOneInstructor {
    return Intl.message(
      'Select One Instructor',
      name: 'selectOneInstructor',
      desc: '',
      args: [],
    );
  }

  /// `No Categories Registered`
  String get noCategoriesRegistered {
    return Intl.message(
      'No Categories Registered',
      name: 'noCategoriesRegistered',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categoriesLabel {
    return Intl.message(
      'Categories',
      name: 'categoriesLabel',
      desc: '',
      args: [],
    );
  }

  /// `Select Category`
  String get selectCategory {
    return Intl.message(
      'Select Category',
      name: 'selectCategory',
      desc: '',
      args: [],
    );
  }

  /// `Tab to Add Image`
  String get tapToAddImage {
    return Intl.message(
      'Tab to Add Image',
      name: 'tapToAddImage',
      desc: '',
      args: [],
    );
  }

  /// `Image Size limit is 10 MB`
  String get imageSizeLimit {
    return Intl.message(
      'Image Size limit is 10 MB',
      name: 'imageSizeLimit',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get deleteDialogTitle {
    return Intl.message(
      'Delete',
      name: 'deleteDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get deleteButtonText {
    return Intl.message('Delete', name: 'deleteButtonText', desc: '', args: []);
  }

  /// `Logout`
  String get logoutDialogTitle {
    return Intl.message(
      'Logout',
      name: 'logoutDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logoutButtonText {
    return Intl.message('Logout', name: 'logoutButtonText', desc: '', args: []);
  }

  /// `Delete Post`
  String get deletePostTitle {
    return Intl.message(
      'Delete Post',
      name: 'deletePostTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this post?`
  String get deletePostConfirmMessage {
    return Intl.message(
      'Are you sure you want to delete this post?',
      name: 'deletePostConfirmMessage',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `University ID`
  String get universityIdLabel {
    return Intl.message(
      'University ID',
      name: 'universityIdLabel',
      desc: '',
      args: [],
    );
  }

  /// `National ID`
  String get nationalIdLabel {
    return Intl.message(
      'National ID',
      name: 'nationalIdLabel',
      desc: '',
      args: [],
    );
  }

  /// `Department`
  String get departmentLabel {
    return Intl.message(
      'Department',
      name: 'departmentLabel',
      desc: '',
      args: [],
    );
  }

  /// `Year`
  String get yearLabel {
    return Intl.message('Year', name: 'yearLabel', desc: '', args: []);
  }

  /// `Gender`
  String get genderLabel {
    return Intl.message('Gender', name: 'genderLabel', desc: '', args: []);
  }

  /// `Disability`
  String get disabilityLabel {
    return Intl.message(
      'Disability',
      name: 'disabilityLabel',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumberLabel {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumberLabel',
      desc: '',
      args: [],
    );
  }

  /// `Graduation Year`
  String get graduationYearLabel {
    return Intl.message(
      'Graduation Year',
      name: 'graduationYearLabel',
      desc: '',
      args: [],
    );
  }

  /// `Archive Panel`
  String get archivePanel {
    return Intl.message(
      'Archive Panel',
      name: 'archivePanel',
      desc: '',
      args: [],
    );
  }

  /// `View archived course statistics and analytics`
  String get archiveStatisticsTooltip {
    return Intl.message(
      'View archived course statistics and analytics',
      name: 'archiveStatisticsTooltip',
      desc: '',
      args: [],
    );
  }

  /// `View statistics for archived course {courseName}`
  String archiveStatisticsSemanticLabel(String courseName) {
    return Intl.message(
      'View statistics for archived course $courseName',
      name: 'archiveStatisticsSemanticLabel',
      desc: '',
      args: [courseName],
    );
  }

  /// `View archived course students`
  String get courseStudentsTooltip {
    return Intl.message(
      'View archived course students',
      name: 'courseStudentsTooltip',
      desc: '',
      args: [],
    );
  }

  /// `View students for {courseName}`
  String courseStudentsSemanticLabel(String courseName) {
    return Intl.message(
      'View students for $courseName',
      name: 'courseStudentsSemanticLabel',
      desc: '',
      args: [courseName],
    );
  }

  /// `View course ratings and feedback`
  String get courseRatingsTooltip {
    return Intl.message(
      'View course ratings and feedback',
      name: 'courseRatingsTooltip',
      desc: '',
      args: [],
    );
  }

  /// `View ratings for {courseName}`
  String courseRatingsSemanticLabel(String courseName) {
    return Intl.message(
      'View ratings for $courseName',
      name: 'courseRatingsSemanticLabel',
      desc: '',
      args: [courseName],
    );
  }

  /// `Ratings`
  String get ratingsTitle {
    return Intl.message('Ratings', name: 'ratingsTitle', desc: '', args: []);
  }

  /// `All`
  String get allRatings {
    return Intl.message('All', name: 'allRatings', desc: '', args: []);
  }

  /// `5 Stars`
  String get fiveStars {
    return Intl.message('5 Stars', name: 'fiveStars', desc: '', args: []);
  }

  /// `4 Stars`
  String get fourStars {
    return Intl.message('4 Stars', name: 'fourStars', desc: '', args: []);
  }

  /// `3 Stars`
  String get threeStars {
    return Intl.message('3 Stars', name: 'threeStars', desc: '', args: []);
  }

  /// `2 Stars`
  String get twoStars {
    return Intl.message('2 Stars', name: 'twoStars', desc: '', args: []);
  }

  /// `1 Star`
  String get oneStar {
    return Intl.message('1 Star', name: 'oneStar', desc: '', args: []);
  }

  /// `No ratings yet`
  String get noRatingsYet {
    return Intl.message(
      'No ratings yet',
      name: 'noRatingsYet',
      desc: '',
      args: [],
    );
  }

  /// `This course hasn't received any ratings yet.`
  String get noRatingsMessage {
    return Intl.message(
      'This course hasn\'t received any ratings yet.',
      name: 'noRatingsMessage',
      desc: '',
      args: [],
    );
  }

  /// `Error loading ratings`
  String get errorLoadingRatings {
    return Intl.message(
      'Error loading ratings',
      name: 'errorLoadingRatings',
      desc: '',
      args: [],
    );
  }

  /// `Rating Overview`
  String get ratingOverview {
    return Intl.message(
      'Rating Overview',
      name: 'ratingOverview',
      desc: '',
      args: [],
    );
  }

  /// `Overall`
  String get overallRating {
    return Intl.message('Overall', name: 'overallRating', desc: '', args: []);
  }

  /// `Content`
  String get contentRating {
    return Intl.message('Content', name: 'contentRating', desc: '', args: []);
  }

  /// `Instructor`
  String get instructorRating {
    return Intl.message(
      'Instructor',
      name: 'instructorRating',
      desc: '',
      args: [],
    );
  }

  /// `{count} reviews`
  String reviewsCount(String count) {
    return Intl.message(
      '$count reviews',
      name: 'reviewsCount',
      desc: '',
      args: [count],
    );
  }

  /// `No reviews yet`
  String get noReviewsYet {
    return Intl.message(
      'No reviews yet',
      name: 'noReviewsYet',
      desc: '',
      args: [],
    );
  }

  /// `Showing 1 review`
  String get showingOneReview {
    return Intl.message(
      'Showing 1 review',
      name: 'showingOneReview',
      desc: '',
      args: [],
    );
  }

  /// `Showing {count} reviews`
  String showingMultipleReviews(String count) {
    return Intl.message(
      'Showing $count reviews',
      name: 'showingMultipleReviews',
      desc: '',
      args: [count],
    );
  }

  /// `No {filter} reviews`
  String noFilteredReviews(String filter) {
    return Intl.message(
      'No $filter reviews',
      name: 'noFilteredReviews',
      desc: '',
      args: [filter],
    );
  }

  /// `Showing 1 {filter} review`
  String showingOneFilteredReview(String filter) {
    return Intl.message(
      'Showing 1 $filter review',
      name: 'showingOneFilteredReview',
      desc: '',
      args: [filter],
    );
  }

  /// `Showing {count} {filter} reviews`
  String showingMultipleFilteredReviews(String count, String filter) {
    return Intl.message(
      'Showing $count $filter reviews',
      name: 'showingMultipleFilteredReviews',
      desc: '',
      args: [count, filter],
    );
  }

  /// `Loading User Name`
  String get loadingUserName {
    return Intl.message(
      'Loading User Name',
      name: 'loadingUserName',
      desc: '',
      args: [],
    );
  }

  /// `Loading comment text that will be replaced with actual content...`
  String get loadingComment {
    return Intl.message(
      'Loading comment text that will be replaced with actual content...',
      name: 'loadingComment',
      desc: '',
      args: [],
    );
  }

  /// `Total: {days} Days`
  String totalDays(String days) {
    return Intl.message(
      'Total: $days Days',
      name: 'totalDays',
      desc: '',
      args: [days],
    );
  }

  /// `Attended: {count}`
  String attendedDays(String count) {
    return Intl.message(
      'Attended: $count',
      name: 'attendedDays',
      desc: '',
      args: [count],
    );
  }

  /// `Absent: {count}`
  String absentDays(String count) {
    return Intl.message(
      'Absent: $count',
      name: 'absentDays',
      desc: '',
      args: [count],
    );
  }

  /// `Absence Days`
  String get absenceDaysTitle {
    return Intl.message(
      'Absence Days',
      name: 'absenceDaysTitle',
      desc: '',
      args: [],
    );
  }

  /// `Successfully enrolled in {courseName}`
  String enrollmentSuccess(String courseName) {
    return Intl.message(
      'Successfully enrolled in $courseName',
      name: 'enrollmentSuccess',
      desc: '',
      args: [courseName],
    );
  }

  /// `Error: {errorMessage}`
  String enrollmentError(String errorMessage) {
    return Intl.message(
      'Error: $errorMessage',
      name: 'enrollmentError',
      desc: '',
      args: [errorMessage],
    );
  }

  /// `No goals provided`
  String get noGoalsProvided {
    return Intl.message(
      'No goals provided',
      name: 'noGoalsProvided',
      desc: '',
      args: [],
    );
  }

  /// `Advanced {category}`
  String advancedCourse(String category) {
    return Intl.message(
      'Advanced $category',
      name: 'advancedCourse',
      desc: '',
      args: [category],
    );
  }

  /// `{category} for Beginners`
  String beginnerCourse(String category) {
    return Intl.message(
      '$category for Beginners',
      name: 'beginnerCourse',
      desc: '',
      args: [category],
    );
  }

  /// `Review`
  String get Review {
    return Intl.message('Review', name: 'Review', desc: '', args: []);
  }

  /// `Full`
  String get enrollmentFull {
    return Intl.message('Full', name: 'enrollmentFull', desc: '', args: []);
  }

  /// `Almost full!`
  String get enrollmentAlmostFull {
    return Intl.message(
      'Almost full!',
      name: 'enrollmentAlmostFull',
      desc: '',
      args: [],
    );
  }

  /// `Filling up`
  String get enrollmentFillingUp {
    return Intl.message(
      'Filling up',
      name: 'enrollmentFillingUp',
      desc: '',
      args: [],
    );
  }

  /// `Spots available`
  String get enrollmentSpotsAvailable {
    return Intl.message(
      'Spots available',
      name: 'enrollmentSpotsAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get courseStatsDuration {
    return Intl.message(
      'Duration',
      name: 'courseStatsDuration',
      desc: '',
      args: [],
    );
  }

  /// `Room`
  String get courseStatsRoom {
    return Intl.message('Room', name: 'courseStatsRoom', desc: '', args: []);
  }

  /// `Length`
  String get courseStatsLength {
    return Intl.message(
      'Length',
      name: 'courseStatsLength',
      desc: '',
      args: [],
    );
  }

  /// `Prerequisites`
  String get courseStatsPrerequisites {
    return Intl.message(
      'Prerequisites',
      name: 'courseStatsPrerequisites',
      desc: '',
      args: [],
    );
  }

  /// `{hours} hrs`
  String courseStatsDurationValue(String hours) {
    return Intl.message(
      '$hours hrs',
      name: 'courseStatsDurationValue',
      desc: '',
      args: [hours],
    );
  }

  /// `{weeks} weeks`
  String courseStatsLengthValue(String weeks) {
    return Intl.message(
      '$weeks weeks',
      name: 'courseStatsLengthValue',
      desc: '',
      args: [weeks],
    );
  }

  /// `Course Schedule`
  String get courseScheduleTitle {
    return Intl.message(
      'Course Schedule',
      name: 'courseScheduleTitle',
      desc: '',
      args: [],
    );
  }

  /// `Related Courses`
  String get relatedCoursesTitle {
    return Intl.message(
      'Related Courses',
      name: 'relatedCoursesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Instructor`
  String get instructorTitle {
    return Intl.message(
      'Instructor',
      name: 'instructorTitle',
      desc: '',
      args: [],
    );
  }

  /// `About This Course`
  String get aboutThisCourseTitle {
    return Intl.message(
      'About This Course',
      name: 'aboutThisCourseTitle',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Enrollment`
  String get confirmEnrollmentTitle {
    return Intl.message(
      'Confirm Enrollment',
      name: 'confirmEnrollmentTitle',
      desc: '',
      args: [],
    );
  }

  /// `You are about to enroll in {courseName}.`
  String confirmEnrollmentMessage(String courseName) {
    return Intl.message(
      'You are about to enroll in $courseName.',
      name: 'confirmEnrollmentMessage',
      desc: '',
      args: [courseName],
    );
  }

  /// `Interview Period: {startDate} - {endDate}`
  String interviewPeriodLabel(String startDate, String endDate) {
    return Intl.message(
      'Interview Period: $startDate - $endDate',
      name: 'interviewPeriodLabel',
      desc: '',
      args: [startDate, endDate],
    );
  }

  /// `Course Period: {startDate} - {endDate}`
  String coursePeriodLabel(String startDate, String endDate) {
    return Intl.message(
      'Course Period: $startDate - $endDate',
      name: 'coursePeriodLabel',
      desc: '',
      args: [startDate, endDate],
    );
  }

  /// `Confirm`
  String get confirmButton {
    return Intl.message('Confirm', name: 'confirmButton', desc: '', args: []);
  }

  /// `Enroll Now`
  String get enrollNowButton {
    return Intl.message(
      'Enroll Now',
      name: 'enrollNowButton',
      desc: '',
      args: [],
    );
  }

  /// `Course Timeline`
  String get courseTimelineTitle {
    return Intl.message(
      'Course Timeline',
      name: 'courseTimelineTitle',
      desc: '',
      args: [],
    );
  }

  /// `Interview Period`
  String get interviewPeriodTitle {
    return Intl.message(
      'Interview Period',
      name: 'interviewPeriodTitle',
      desc: '',
      args: [],
    );
  }

  /// `Course Period`
  String get coursePeriodTitle {
    return Intl.message(
      'Course Period',
      name: 'coursePeriodTitle',
      desc: '',
      args: [],
    );
  }

  /// `Instructor: {name}`
  String instructorLabel(String name) {
    return Intl.message(
      'Instructor: $name',
      name: 'instructorLabel',
      desc: '',
      args: [name],
    );
  }

  /// `View Course`
  String get viewCourseButton {
    return Intl.message(
      'View Course',
      name: 'viewCourseButton',
      desc: '',
      args: [],
    );
  }

  /// `Skills & Prerequisites`
  String get SkillsAndPrerequisites {
    return Intl.message(
      'Skills & Prerequisites',
      name: 'SkillsAndPrerequisites',
      desc: '',
      args: [],
    );
  }

  /// `What You Will Learn`
  String get WhatYouWillLearn {
    return Intl.message(
      'What You Will Learn',
      name: 'WhatYouWillLearn',
      desc: '',
      args: [],
    );
  }

  /// `Interview starts on {startDate} and ends on {endDate}`
  String interviewPeriodSubtitle(String startDate, String endDate) {
    return Intl.message(
      'Interview starts on $startDate and ends on $endDate',
      name: 'interviewPeriodSubtitle',
      desc: '',
      args: [startDate, endDate],
    );
  }

  /// `Course runs from {startDate} to {endDate}`
  String coursePeriodSubtitle(String startDate, String endDate) {
    return Intl.message(
      'Course runs from $startDate to $endDate',
      name: 'coursePeriodSubtitle',
      desc: '',
      args: [startDate, endDate],
    );
  }

  /// `Community`
  String get communityTitle {
    return Intl.message(
      'Community',
      name: 'communityTitle',
      desc: '',
      args: [],
    );
  }

  /// `Follow Events of UCCD Center`
  String get communitySubtitle {
    return Intl.message(
      'Follow Events of UCCD Center',
      name: 'communitySubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Like`
  String get likeButtonLabel {
    return Intl.message('Like', name: 'likeButtonLabel', desc: '', args: []);
  }

  /// `Comments`
  String get commentsButtonLabel {
    return Intl.message(
      'Comments',
      name: 'commentsButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Edit Post`
  String get editPostOption {
    return Intl.message(
      'Edit Post',
      name: 'editPostOption',
      desc: '',
      args: [],
    );
  }

  /// `Delete Post`
  String get deletePostOption {
    return Intl.message(
      'Delete Post',
      name: 'deletePostOption',
      desc: '',
      args: [],
    );
  }

  /// `Create Post`
  String get createPostDialogTitle {
    return Intl.message(
      'Create Post',
      name: 'createPostDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit Post`
  String get editPostDialogTitle {
    return Intl.message(
      'Edit Post',
      name: 'editPostDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `What's on your mind?`
  String get postContentHint {
    return Intl.message(
      'What\'s on your mind?',
      name: 'postContentHint',
      desc: '',
      args: [],
    );
  }

  /// `Edit your post...`
  String get editPostContentHint {
    return Intl.message(
      'Edit your post...',
      name: 'editPostContentHint',
      desc: '',
      args: [],
    );
  }

  /// `Post`
  String get postButtonLabel {
    return Intl.message('Post', name: 'postButtonLabel', desc: '', args: []);
  }

  /// `Update`
  String get updateButtonLabel {
    return Intl.message(
      'Update',
      name: 'updateButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancelButtonLabel {
    return Intl.message(
      'Cancel',
      name: 'cancelButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Post content cannot be empty`
  String get postContentEmpty {
    return Intl.message(
      'Post content cannot be empty',
      name: 'postContentEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Failed to pick image: {error}`
  String failedToPickImage(String error) {
    return Intl.message(
      'Failed to pick image: $error',
      name: 'failedToPickImage',
      desc: '',
      args: [error],
    );
  }

  /// `Remove image`
  String get removeImageTooltip {
    return Intl.message(
      'Remove image',
      name: 'removeImageTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Close dialog`
  String get closeDialogTooltip {
    return Intl.message(
      'Close dialog',
      name: 'closeDialogTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Pick image`
  String get pickImageTooltip {
    return Intl.message(
      'Pick image',
      name: 'pickImageTooltip',
      desc: '',
      args: [],
    );
  }

  /// `No posts yet`
  String get noPostsYet {
    return Intl.message('No posts yet', name: 'noPostsYet', desc: '', args: []);
  }

  /// `Be the first to share something with the community!`
  String get beFirstToShare {
    return Intl.message(
      'Be the first to share something with the community!',
      name: 'beFirstToShare',
      desc: '',
      args: [],
    );
  }

  /// `Create Post`
  String get createPostButton {
    return Intl.message(
      'Create Post',
      name: 'createPostButton',
      desc: '',
      args: [],
    );
  }

  /// `No comments yet`
  String get noCommentsYet {
    return Intl.message(
      'No comments yet',
      name: 'noCommentsYet',
      desc: '',
      args: [],
    );
  }

  /// `Be the first to comment on this post!`
  String get beFirstToComment {
    return Intl.message(
      'Be the first to comment on this post!',
      name: 'beFirstToComment',
      desc: '',
      args: [],
    );
  }

  /// `Comments`
  String get commentsTitle {
    return Intl.message('Comments', name: 'commentsTitle', desc: '', args: []);
  }

  /// `Add a comment...`
  String get addCommentHint {
    return Intl.message(
      'Add a comment...',
      name: 'addCommentHint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a comment`
  String get commentValidationEmpty {
    return Intl.message(
      'Please enter a comment',
      name: 'commentValidationEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Comment cannot be empty`
  String get commentValidationTrimmed {
    return Intl.message(
      'Comment cannot be empty',
      name: 'commentValidationTrimmed',
      desc: '',
      args: [],
    );
  }

  /// `Error loading comments: {error}`
  String errorLoadingComments(String error) {
    return Intl.message(
      'Error loading comments: $error',
      name: 'errorLoadingComments',
      desc: '',
      args: [error],
    );
  }

  /// `Likes: {count}`
  String likesCount(String count) {
    return Intl.message(
      'Likes: $count',
      name: 'likesCount',
      desc: '',
      args: [count],
    );
  }

  /// `Comments: {count}`
  String commentsCount(String count) {
    return Intl.message(
      'Comments: $count',
      name: 'commentsCount',
      desc: '',
      args: [count],
    );
  }

  /// `Post`
  String get Post {
    return Intl.message('Post', name: 'Post', desc: '', args: []);
  }

  /// `Admin Features`
  String get adminFeatures {
    return Intl.message(
      'Admin Features',
      name: 'adminFeatures',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message('Account', name: 'account', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message('Dark Mode', name: 'darkMode', desc: '', args: []);
  }

  /// `Users`
  String get users {
    return Intl.message('Users', name: 'users', desc: '', args: []);
  }

  /// `Logs`
  String get logs {
    return Intl.message('Logs', name: 'logs', desc: '', args: []);
  }

  /// `No Logs in This Day`
  String get noLogsInThisDay {
    return Intl.message(
      'No Logs in This Day',
      name: 'noLogsInThisDay',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Are you sure you want to Logout`
  String get logoutConfirmation {
    return Intl.message(
      'Are you sure you want to Logout',
      name: 'logoutConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Korean`
  String get korean {
    return Intl.message('Korean', name: 'korean', desc: '', args: []);
  }

  /// `Student`
  String get roleStudent {
    return Intl.message('Student', name: 'roleStudent', desc: '', args: []);
  }

  /// `Instructor`
  String get roleInstructor {
    return Intl.message(
      'Instructor',
      name: 'roleInstructor',
      desc: '',
      args: [],
    );
  }

  /// `Admin`
  String get roleAdmin {
    return Intl.message('Admin', name: 'roleAdmin', desc: '', args: []);
  }

  /// `Super Admin`
  String get roleSuperAdmin {
    return Intl.message(
      'Super Admin',
      name: 'roleSuperAdmin',
      desc: '',
      args: [],
    );
  }

  /// `Add Student`
  String get addStudentTitle {
    return Intl.message(
      'Add Student',
      name: 'addStudentTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit Student`
  String get editStudentTitle {
    return Intl.message(
      'Edit Student',
      name: 'editStudentTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add Instructor`
  String get addInstructorTitle {
    return Intl.message(
      'Add Instructor',
      name: 'addInstructorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit Instructor`
  String get editInstructorTitle {
    return Intl.message(
      'Edit Instructor',
      name: 'editInstructorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add Admin`
  String get addAdminTitle {
    return Intl.message('Add Admin', name: 'addAdminTitle', desc: '', args: []);
  }

  /// `Edit Admin`
  String get editAdminTitle {
    return Intl.message(
      'Edit Admin',
      name: 'editAdminTitle',
      desc: '',
      args: [],
    );
  }

  /// `Student Name`
  String get studentNameLabel {
    return Intl.message(
      'Student Name',
      name: 'studentNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter student name`
  String get studentNameHint {
    return Intl.message(
      'Enter student name',
      name: 'studentNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Instructor Name`
  String get instructorNameLabel {
    return Intl.message(
      'Instructor Name',
      name: 'instructorNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter instructor name`
  String get instructorNameHint {
    return Intl.message(
      'Enter instructor name',
      name: 'instructorNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Admin Name`
  String get adminNameLabel {
    return Intl.message(
      'Admin Name',
      name: 'adminNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter admin username`
  String get adminNameHint {
    return Intl.message(
      'Enter admin username',
      name: 'adminNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Student Email`
  String get studentEmailLabel {
    return Intl.message(
      'Student Email',
      name: 'studentEmailLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter Student Email`
  String get studentEmailHint {
    return Intl.message(
      'Enter Student Email',
      name: 'studentEmailHint',
      desc: '',
      args: [],
    );
  }

  /// `Instructor Email`
  String get instructorEmailLabel {
    return Intl.message(
      'Instructor Email',
      name: 'instructorEmailLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter instructor email`
  String get instructorEmailHint {
    return Intl.message(
      'Enter instructor email',
      name: 'instructorEmailHint',
      desc: '',
      args: [],
    );
  }

  /// `Admin Email`
  String get adminEmailLabel {
    return Intl.message(
      'Admin Email',
      name: 'adminEmailLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter admin email`
  String get adminEmailHint {
    return Intl.message(
      'Enter admin email',
      name: 'adminEmailHint',
      desc: '',
      args: [],
    );
  }

  /// `Student Password`
  String get studentPasswordLabel {
    return Intl.message(
      'Student Password',
      name: 'studentPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Instructor Password`
  String get instructorPasswordLabel {
    return Intl.message(
      'Instructor Password',
      name: 'instructorPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Admin Password`
  String get adminPasswordLabel {
    return Intl.message(
      'Admin Password',
      name: 'adminPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter Student University ID`
  String get universityIdHint {
    return Intl.message(
      'Enter Student University ID',
      name: 'universityIdHint',
      desc: '',
      args: [],
    );
  }

  /// `Enter National ID`
  String get nationalIdHint {
    return Intl.message(
      'Enter National ID',
      name: 'nationalIdHint',
      desc: '',
      args: [],
    );
  }

  /// `Student Email Required`
  String get studentEmailRequired {
    return Intl.message(
      'Student Email Required',
      name: 'studentEmailRequired',
      desc: '',
      args: [],
    );
  }

  /// `University Emails Only`
  String get universityEmailsOnly {
    return Intl.message(
      'University Emails Only',
      name: 'universityEmailsOnly',
      desc: '',
      args: [],
    );
  }

  /// `University ID Required`
  String get universityIdRequired {
    return Intl.message(
      'University ID Required',
      name: 'universityIdRequired',
      desc: '',
      args: [],
    );
  }

  /// `National ID Required`
  String get nationalIdRequired {
    return Intl.message(
      'National ID Required',
      name: 'nationalIdRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password Required`
  String get passwordRequired {
    return Intl.message(
      'Password Required',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a username`
  String get usernameRequired {
    return Intl.message(
      'Please enter a username',
      name: 'usernameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Admin Added Successfully`
  String get adminAddedSuccessfully {
    return Intl.message(
      'Admin Added Successfully',
      name: 'adminAddedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Admin Updated Successfully`
  String get adminUpdatedSuccessfully {
    return Intl.message(
      'Admin Updated Successfully',
      name: 'adminUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Instructor Added Successfully`
  String get instructorAddedSuccessfully {
    return Intl.message(
      'Instructor Added Successfully',
      name: 'instructorAddedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Instructor Updated Successfully`
  String get instructorUpdatedSuccessfully {
    return Intl.message(
      'Instructor Updated Successfully',
      name: 'instructorUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Student Added Successfully`
  String get studentAddedSuccessfully {
    return Intl.message(
      'Student Added Successfully',
      name: 'studentAddedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Student Updated Successfully`
  String get studentUpdatedSuccessfully {
    return Intl.message(
      'Student Updated Successfully',
      name: 'studentUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `University ID must be 9 characters length`
  String get universityIdLengthError {
    return Intl.message(
      'University ID must be 9 characters length',
      name: 'universityIdLengthError',
      desc: '',
      args: [],
    );
  }

  /// `Student Name Required`
  String get studentNameRequired {
    return Intl.message(
      'Student Name Required',
      name: 'studentNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `National ID must be 14 characters length`
  String get nationalIdLengthError {
    return Intl.message(
      'National ID must be 14 characters length',
      name: 'nationalIdLengthError',
      desc: '',
      args: [],
    );
  }

  /// `Enter Student Password`
  String get studentPasswordHint {
    return Intl.message(
      'Enter Student Password',
      name: 'studentPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Department`
  String get departmentHint {
    return Intl.message(
      'Department',
      name: 'departmentHint',
      desc: '',
      args: [],
    );
  }

  /// `Select Department`
  String get selectDepartment {
    return Intl.message(
      'Select Department',
      name: 'selectDepartment',
      desc: '',
      args: [],
    );
  }

  /// `year`
  String get yearHint {
    return Intl.message('year', name: 'yearHint', desc: '', args: []);
  }

  /// `Select year`
  String get selectYear {
    return Intl.message('Select year', name: 'selectYear', desc: '', args: []);
  }

  /// `Information Technology`
  String get informationTechnology {
    return Intl.message(
      'Information Technology',
      name: 'informationTechnology',
      desc: '',
      args: [],
    );
  }

  /// `Mechatronics`
  String get mechatronics {
    return Intl.message(
      'Mechatronics',
      name: 'mechatronics',
      desc: '',
      args: [],
    );
  }

  /// `Autotronics`
  String get autotronics {
    return Intl.message('Autotronics', name: 'autotronics', desc: '', args: []);
  }

  /// `Renewable Energy`
  String get renewableEnergy {
    return Intl.message(
      'Renewable Energy',
      name: 'renewableEnergy',
      desc: '',
      args: [],
    );
  }

  /// `O&P`
  String get orthoticsProsthetics {
    return Intl.message(
      'O&P',
      name: 'orthoticsProsthetics',
      desc: '',
      args: [],
    );
  }

  /// `Enter Instructor Password`
  String get instructorPasswordHint {
    return Intl.message(
      'Enter Instructor Password',
      name: 'instructorPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Name Required`
  String get nameRequired {
    return Intl.message(
      'Name Required',
      name: 'nameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Browse available courses and enroll to see them here`
  String get browseCoursesHint {
    return Intl.message(
      'Browse available courses and enroll to see them here',
      name: 'browseCoursesHint',
      desc: '',
      args: [],
    );
  }

  /// `Browse Courses`
  String get browseCourses {
    return Intl.message(
      'Browse Courses',
      name: 'browseCourses',
      desc: '',
      args: [],
    );
  }

  /// `Try changing your filters or search terms`
  String get tryChangingFilters {
    return Intl.message(
      'Try changing your filters or search terms',
      name: 'tryChangingFilters',
      desc: '',
      args: [],
    );
  }

  /// `Courses will appear here once they are available`
  String get coursesWillAppear {
    return Intl.message(
      'Courses will appear here once they are available',
      name: 'coursesWillAppear',
      desc: '',
      args: [],
    );
  }

  /// `Show All Courses`
  String get showAllCourses {
    return Intl.message(
      'Show All Courses',
      name: 'showAllCourses',
      desc: '',
      args: [],
    );
  }

  /// `Upload Course Materials`
  String get uploadCourseMaterials {
    return Intl.message(
      'Upload Course Materials',
      name: 'uploadCourseMaterials',
      desc: '',
      args: [],
    );
  }

  /// `What are the skills and Prerequisites required from the student`
  String get skillsAndPrerequisitesDescription {
    return Intl.message(
      'What are the skills and Prerequisites required from the student',
      name: 'skillsAndPrerequisitesDescription',
      desc: '',
      args: [],
    );
  }

  /// `Note: Define at least one skill or prerequisite`
  String get prerequisitesNote {
    return Intl.message(
      'Note: Define at least one skill or prerequisite',
      name: 'prerequisitesNote',
      desc: '',
      args: [],
    );
  }

  /// `Note: if you don't have any skills or prerequisites, you can Write "None" in the field below`
  String get prerequisitesNoneNote {
    return Intl.message(
      'Note: if you don\'t have any skills or prerequisites, you can Write "None" in the field below',
      name: 'prerequisitesNoneNote',
      desc: '',
      args: [],
    );
  }

  /// `Prerequisites/Skill {number}`
  String prerequisiteSkillLabel(int number) {
    return Intl.message(
      'Prerequisites/Skill $number',
      name: 'prerequisiteSkillLabel',
      desc: '',
      args: [number],
    );
  }

  /// `Say something about this Prerequisites/Skill`
  String get prerequisiteSkillHint {
    return Intl.message(
      'Say something about this Prerequisites/Skill',
      name: 'prerequisiteSkillHint',
      desc: '',
      args: [],
    );
  }

  /// `This field cannot be empty`
  String get prerequisiteFieldRequired {
    return Intl.message(
      'This field cannot be empty',
      name: 'prerequisiteFieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `Add Prerequisite/Skill`
  String get addPrerequisiteSkill {
    return Intl.message(
      'Add Prerequisite/Skill',
      name: 'addPrerequisiteSkill',
      desc: '',
      args: [],
    );
  }

  /// `Email Already in Use`
  String get emailAlreadyInUse {
    return Intl.message(
      'Email Already in Use',
      name: 'emailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Email`
  String get authInvalidEmail {
    return Intl.message(
      'Invalid Email',
      name: 'authInvalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email is Not Enabled Contact Support`
  String get emailNotEnabled {
    return Intl.message(
      'Email is Not Enabled Contact Support',
      name: 'emailNotEnabled',
      desc: '',
      args: [],
    );
  }

  /// `Try Again Later`
  String get tryAgainLater {
    return Intl.message(
      'Try Again Later',
      name: 'tryAgainLater',
      desc: '',
      args: [],
    );
  }

  /// `Check Your Internet Connection And Try Again Later`
  String get checkInternetConnection {
    return Intl.message(
      'Check Your Internet Connection And Try Again Later',
      name: 'checkInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `User Account is Disabled Contact Support`
  String get userAccountDisabled {
    return Intl.message(
      'User Account is Disabled Contact Support',
      name: 'userAccountDisabled',
      desc: '',
      args: [],
    );
  }

  /// `No Such Email Found`
  String get noSuchEmailFound {
    return Intl.message(
      'No Such Email Found',
      name: 'noSuchEmailFound',
      desc: '',
      args: [],
    );
  }

  /// `Wrong Password`
  String get wrongPassword {
    return Intl.message(
      'Wrong Password',
      name: 'wrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email Or Password is Invalid`
  String get emailOrPasswordInvalid {
    return Intl.message(
      'Email Or Password is Invalid',
      name: 'emailOrPasswordInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Error`
  String get unknownError {
    return Intl.message(
      'Unknown Error',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `Connection Timeout`
  String get connectionTimeout {
    return Intl.message(
      'Connection Timeout',
      name: 'connectionTimeout',
      desc: '',
      args: [],
    );
  }

  /// `No User`
  String get noUser {
    return Intl.message('No User', name: 'noUser', desc: '', args: []);
  }

  /// `No User Found\nPlease Contact Support`
  String get noUserFoundContactSupport {
    return Intl.message(
      'No User Found\nPlease Contact Support',
      name: 'noUserFoundContactSupport',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `Code Resent`
  String get codeResent {
    return Intl.message('Code Resent', name: 'codeResent', desc: '', args: []);
  }

  /// `Failed`
  String get failed {
    return Intl.message('Failed', name: 'failed', desc: '', args: []);
  }

  /// `Password must be at least 8 characters`
  String get passwordLengthError {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'passwordLengthError',
      desc: '',
      args: [],
    );
  }

  /// `Nothing to Edit`
  String get NothingToEdit {
    return Intl.message(
      'Nothing to Edit',
      name: 'NothingToEdit',
      desc: '',
      args: [],
    );
  }

  /// `Add Category`
  String get addCategoryTitle {
    return Intl.message(
      'Add Category',
      name: 'addCategoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit Category`
  String get editCategoryTitle {
    return Intl.message(
      'Edit Category',
      name: 'editCategoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Category Name`
  String get categoryNameLabel {
    return Intl.message(
      'Category Name',
      name: 'categoryNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter Category Name`
  String get categoryNameHint {
    return Intl.message(
      'Enter Category Name',
      name: 'categoryNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Category Name Required`
  String get categoryNameRequired {
    return Intl.message(
      'Category Name Required',
      name: 'categoryNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `No Registered Categories`
  String get noRegisteredCategories {
    return Intl.message(
      'No Registered Categories',
      name: 'noRegisteredCategories',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete "{categoryName}"?\n\n *This action cannot be undone.`
  String deleteCategoryConfirmation(String categoryName) {
    return Intl.message(
      'Are you sure you want to delete "$categoryName"?\n\n *This action cannot be undone.',
      name: 'deleteCategoryConfirmation',
      desc: '',
      args: [categoryName],
    );
  }

  /// `Categories Overview`
  String get categoriesOverview {
    return Intl.message(
      'Categories Overview',
      name: 'categoriesOverview',
      desc: '',
      args: [],
    );
  }

  /// `{count} {count, plural, =1{category} other{categories}} available`
  String categoryAvailable(int count) {
    return Intl.message(
      '$count ${Intl.plural(count, one: 'category', other: 'categories')} available',
      name: 'categoryAvailable',
      desc: '',
      args: [count],
    );
  }

  /// `Manage your categories efficiently`
  String get manageCategoriesEfficiently {
    return Intl.message(
      'Manage your categories efficiently',
      name: 'manageCategoriesEfficiently',
      desc: '',
      args: [],
    );
  }

  /// `Created On`
  String get CreatedOn {
    return Intl.message('Created On', name: 'CreatedOn', desc: '', args: []);
  }

  /// `This category can be used to organize courses and content.`
  String get categoryUsageInfo {
    return Intl.message(
      'This category can be used to organize courses and content.',
      name: 'categoryUsageInfo',
      desc: '',
      args: [],
    );
  }

  /// `Recent Courses`
  String get recentCourses {
    return Intl.message(
      'Recent Courses',
      name: 'recentCourses',
      desc: '',
      args: [],
    );
  }

  /// `Current Year`
  String get currentYear {
    return Intl.message(
      'Current Year',
      name: 'currentYear',
      desc: '',
      args: [],
    );
  }

  /// `Department`
  String get department {
    return Intl.message('Department', name: 'department', desc: '', args: []);
  }

  /// `In Progress`
  String get inProgress {
    return Intl.message('In Progress', name: 'inProgress', desc: '', args: []);
  }

  /// `No courses in progress`
  String get noCoursesInProgress {
    return Intl.message(
      'No courses in progress',
      name: 'noCoursesInProgress',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load courses`
  String get failedToLoadCourses {
    return Intl.message(
      'Failed to load courses',
      name: 'failedToLoadCourses',
      desc: '',
      args: [],
    );
  }

  /// `No courses available`
  String get noCoursesAvailable {
    return Intl.message(
      'No courses available',
      name: 'noCoursesAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back, `
  String get welcomeBackComma {
    return Intl.message(
      'Welcome back, ',
      name: 'welcomeBackComma',
      desc: '',
      args: [],
    );
  }

  /// `Continue learning journey`
  String get continueLearningJourney {
    return Intl.message(
      'Continue learning journey',
      name: 'continueLearningJourney',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get viewAll {
    return Intl.message('View All', name: 'viewAll', desc: '', args: []);
  }

  /// `Enroll`
  String get enroll {
    return Intl.message('Enroll', name: 'enroll', desc: '', args: []);
  }

  /// `Check your Internet Connection and try again`
  String get checkInternetConnectionAndTryAgain {
    return Intl.message(
      'Check your Internet Connection and try again',
      name: 'checkInternetConnectionAndTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Connection Timeout Try Again Later`
  String get connectionTimeoutTryAgain {
    return Intl.message(
      'Connection Timeout Try Again Later',
      name: 'connectionTimeoutTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Enrolled in This Category`
  String get enrolledInThisCategory {
    return Intl.message(
      'Enrolled in This Category',
      name: 'enrolledInThisCategory',
      desc: '',
      args: [],
    );
  }

  /// `Full`
  String get courseFull {
    return Intl.message('Full', name: 'courseFull', desc: '', args: []);
  }

  /// `Enroll Now`
  String get enrollNow {
    return Intl.message('Enroll Now', name: 'enrollNow', desc: '', args: []);
  }

  /// `User Created Successfully`
  String get userCreatedSuccessfully {
    return Intl.message(
      'User Created Successfully',
      name: 'userCreatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `User Deleted Successfully`
  String get userDeletedSuccessfully {
    return Intl.message(
      'User Deleted Successfully',
      name: 'userDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `User Updated Successfully`
  String get userUpdatedSuccessfully {
    return Intl.message(
      'User Updated Successfully',
      name: 'userUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Instructor Created Successfully`
  String get instructorCreatedSuccessfully {
    return Intl.message(
      'Instructor Created Successfully',
      name: 'instructorCreatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Instructor Deleted Successfully`
  String get instructorDeletedSuccessfully {
    return Intl.message(
      'Instructor Deleted Successfully',
      name: 'instructorDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Category Added Successfully`
  String get categoryAddedSuccessfully {
    return Intl.message(
      'Category Added Successfully',
      name: 'categoryAddedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Category Deleted Successfully`
  String get categoryDeletedSuccessfully {
    return Intl.message(
      'Category Deleted Successfully',
      name: 'categoryDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Category Updated Successfully`
  String get categoryUpdatedSuccessfully {
    return Intl.message(
      'Category Updated Successfully',
      name: 'categoryUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Post Added Successfully`
  String get postAddedSuccessfully {
    return Intl.message(
      'Post Added Successfully',
      name: 'postAddedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Post Deleted Successfully`
  String get postDeletedSuccessfully {
    return Intl.message(
      'Post Deleted Successfully',
      name: 'postDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Post Updated Successfully`
  String get postUpdatedSuccessfully {
    return Intl.message(
      'Post Updated Successfully',
      name: 'postUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Comment Added Successfully`
  String get commentAddedSuccessfully {
    return Intl.message(
      'Comment Added Successfully',
      name: 'commentAddedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection`
  String get noInternetConnection {
    return Intl.message(
      'No Internet Connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Registration Failed`
  String get registrationFailed {
    return Intl.message(
      'Registration Failed',
      name: 'registrationFailed',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get tryAgain {
    return Intl.message('Try Again', name: 'tryAgain', desc: '', args: []);
  }

  /// `Failed to retrieve Data`
  String get failedToLoadData {
    return Intl.message(
      'Failed to retrieve Data',
      name: 'failedToLoadData',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load courses.\nPlease check your internet connection and try again.`
  String get failedToLoadCoursesWithHelp {
    return Intl.message(
      'Failed to load courses.\nPlease check your internet connection and try again.',
      name: 'failedToLoadCoursesWithHelp',
      desc: '',
      args: [],
    );
  }

  /// `Search courses...`
  String get searchCourses {
    return Intl.message(
      'Search courses...',
      name: 'searchCourses',
      desc: '',
      args: [],
    );
  }

  /// `No courses found`
  String get noCoursesFound {
    return Intl.message(
      'No courses found',
      name: 'noCoursesFound',
      desc: '',
      args: [],
    );
  }

  /// `Instructor`
  String get instructor {
    return Intl.message('Instructor', name: 'instructor', desc: '', args: []);
  }

  /// `Starts`
  String get starts {
    return Intl.message('Starts', name: 'starts', desc: '', args: []);
  }

  /// `Ended`
  String get ended {
    return Intl.message('Ended', name: 'ended', desc: '', args: []);
  }

  /// `Ends`
  String get ends {
    return Intl.message('Ends', name: 'ends', desc: '', args: []);
  }

  /// `Completed`
  String get completed {
    return Intl.message('Completed', name: 'completed', desc: '', args: []);
  }

  /// `My Courses`
  String get myCoursesTitle {
    return Intl.message(
      'My Courses',
      name: 'myCoursesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Rate Course`
  String get rateCourse {
    return Intl.message('Rate Course', name: 'rateCourse', desc: '', args: []);
  }

  /// `Your Progress`
  String get yourProgress {
    return Intl.message(
      'Your Progress',
      name: 'yourProgress',
      desc: '',
      args: [],
    );
  }

  /// `Track your enrolled courses and progress`
  String get trackEnrolledCourses {
    return Intl.message(
      'Track your enrolled courses and progress',
      name: 'trackEnrolledCourses',
      desc: '',
      args: [],
    );
  }

  /// `No enrolled courses`
  String get noEnrolledCourses {
    return Intl.message(
      'No enrolled courses',
      name: 'noEnrolledCourses',
      desc: '',
      args: [],
    );
  }

  /// `Notification Sent Successfully`
  String get notificationSentSuccessfully {
    return Intl.message(
      'Notification Sent Successfully',
      name: 'notificationSentSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Hour`
  String get Hour {
    return Intl.message('Hour', name: 'Hour', desc: '', args: []);
  }

  /// `Coming Soon`
  String get ComingSoon {
    return Intl.message('Coming Soon', name: 'ComingSoon', desc: '', args: []);
  }

  /// `This feature is coming soon!`
  String get ComingSoonlabel {
    return Intl.message(
      'This feature is coming soon!',
      name: 'ComingSoonlabel',
      desc: '',
      args: [],
    );
  }

  /// `Select Date for Attendance`
  String get selectDateAttendance {
    return Intl.message(
      'Select Date for Attendance',
      name: 'selectDateAttendance',
      desc: '',
      args: [],
    );
  }

  /// `Students ({count})`
  String studentsCount(String count) {
    return Intl.message(
      'Students ($count)',
      name: 'studentsCount',
      desc: '',
      args: [count],
    );
  }

  /// `Date: {date}`
  String dateLabel(String date) {
    return Intl.message(
      'Date: $date',
      name: 'dateLabel',
      desc: '',
      args: [date],
    );
  }

  /// `Present: {count}`
  String presentCount(String count) {
    return Intl.message(
      'Present: $count',
      name: 'presentCount',
      desc: '',
      args: [count],
    );
  }

  /// `Absent: {count}`
  String absentCount(String count) {
    return Intl.message(
      'Absent: $count',
      name: 'absentCount',
      desc: '',
      args: [count],
    );
  }

  /// `Unmarked: {count}`
  String unmarkedCount(String count) {
    return Intl.message(
      'Unmarked: $count',
      name: 'unmarkedCount',
      desc: '',
      args: [count],
    );
  }

  /// `Please select today's date to view attendance`
  String get selectTodayDateAttendance {
    return Intl.message(
      'Please select today\'s date to view attendance',
      name: 'selectTodayDateAttendance',
      desc: '',
      args: [],
    );
  }

  /// `Attendance is only available for today's date`
  String get attendanceOnlyToday {
    return Intl.message(
      'Attendance is only available for today\'s date',
      name: 'attendanceOnlyToday',
      desc: '',
      args: [],
    );
  }

  /// `Selected: {date}`
  String selectedDate(String date) {
    return Intl.message(
      'Selected: $date',
      name: 'selectedDate',
      desc: '',
      args: [date],
    );
  }

  /// `Jan`
  String get monthJan {
    return Intl.message('Jan', name: 'monthJan', desc: '', args: []);
  }

  /// `Feb`
  String get monthFeb {
    return Intl.message('Feb', name: 'monthFeb', desc: '', args: []);
  }

  /// `Mar`
  String get monthMar {
    return Intl.message('Mar', name: 'monthMar', desc: '', args: []);
  }

  /// `Apr`
  String get monthApr {
    return Intl.message('Apr', name: 'monthApr', desc: '', args: []);
  }

  /// `May`
  String get monthMay {
    return Intl.message('May', name: 'monthMay', desc: '', args: []);
  }

  /// `Jun`
  String get monthJun {
    return Intl.message('Jun', name: 'monthJun', desc: '', args: []);
  }

  /// `Jul`
  String get monthJul {
    return Intl.message('Jul', name: 'monthJul', desc: '', args: []);
  }

  /// `Aug`
  String get monthAug {
    return Intl.message('Aug', name: 'monthAug', desc: '', args: []);
  }

  /// `Sep`
  String get monthSep {
    return Intl.message('Sep', name: 'monthSep', desc: '', args: []);
  }

  /// `Oct`
  String get monthOct {
    return Intl.message('Oct', name: 'monthOct', desc: '', args: []);
  }

  /// `Nov`
  String get monthNov {
    return Intl.message('Nov', name: 'monthNov', desc: '', args: []);
  }

  /// `Dec`
  String get monthDec {
    return Intl.message('Dec', name: 'monthDec', desc: '', args: []);
  }

  /// `Failed to save attendance: {errorMessage}`
  String failedToSaveAttendance(String errorMessage) {
    return Intl.message(
      'Failed to save attendance: $errorMessage',
      name: 'failedToSaveAttendance',
      desc: '',
      args: [errorMessage],
    );
  }

  /// `Error loading students`
  String get errorLoadingStudents {
    return Intl.message(
      'Error loading students',
      name: 'errorLoadingStudents',
      desc: '',
      args: [],
    );
  }

  /// `No students enrolled`
  String get noStudentsEnrolled {
    return Intl.message(
      'No students enrolled',
      name: 'noStudentsEnrolled',
      desc: '',
      args: [],
    );
  }

  /// `Students will appear here once they are enrolled in the course`
  String get studentsWillAppearEnrolled {
    return Intl.message(
      'Students will appear here once they are enrolled in the course',
      name: 'studentsWillAppearEnrolled',
      desc: '',
      args: [],
    );
  }

  /// `Attendance can only be marked for today's date`
  String get attendanceOnlyTodayDate {
    return Intl.message(
      'Attendance can only be marked for today\'s date',
      name: 'attendanceOnlyTodayDate',
      desc: '',
      args: [],
    );
  }

  /// `Student marked as present`
  String get studentMarkedPresent {
    return Intl.message(
      'Student marked as present',
      name: 'studentMarkedPresent',
      desc: '',
      args: [],
    );
  }

  /// `Student marked as absent`
  String get studentMarkedAbsent {
    return Intl.message(
      'Student marked as absent',
      name: 'studentMarkedAbsent',
      desc: '',
      args: [],
    );
  }

  /// `Student attendance unmarked`
  String get studentAttendanceUnmarked {
    return Intl.message(
      'Student attendance unmarked',
      name: 'studentAttendanceUnmarked',
      desc: '',
      args: [],
    );
  }

  /// `Room`
  String get room {
    return Intl.message('Room', name: 'room', desc: '', args: []);
  }

  /// `Present`
  String get Present {
    return Intl.message('Present', name: 'Present', desc: '', args: []);
  }

  /// `Absent`
  String get Absent {
    return Intl.message('Absent', name: 'Absent', desc: '', args: []);
  }

  /// `Unmarked`
  String get Unmarked {
    return Intl.message('Unmarked', name: 'Unmarked', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar', countryCode: 'EG'),
      Locale.fromSubtags(languageCode: 'ko'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
