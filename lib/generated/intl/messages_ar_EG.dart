// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar_EG locale. All the
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
  String get localeName => 'ar_EG';

  static String m0(count) => "الغياب: ${count}";

  static String m1(count) => "الغياب: ${count}";

  static String m2(category) => "${category} متقدم";

  static String m3(courseName) => "عرض إحصائيات الدورة المؤرشفة ${courseName}";

  static String m4(count) => "الحضور: ${count}";

  static String m5(category) => "${category} للمبتدئين";

  static String m6(count) =>
      "${count} ${Intl.plural(count, one: 'فئة', other: 'فئات')} متاحة";

  static String m7(courseName) => "تغيير فئة ${courseName}";

  static String m8(courseName) => "تغيير مدرب ${courseName}";

  static String m9(count) => "التعليقات: ${count}";

  static String m10(courseName) => "أنت على وشك التسجيل في ${courseName}.";

  static String m11(startDate, endDate) =>
      "فترة الدورة: ${startDate} - ${endDate}";

  static String m12(startDate, endDate) =>
      "تمتد الدورة من ${startDate} إلى ${endDate}";

  static String m13(courseName) => "عرض تقييمات ${courseName}";

  static String m14(hours) => "${hours} ساعة";

  static String m15(weeks) => "${weeks} أسبوع";

  static String m16(courseName) => "عرض طلاب ${courseName}";

  static String m17(date) => "التاريخ: ${date}";

  static String m18(courseName) => "حذف ${courseName}";

  static String m19(categoryName) =>
      "هل أنت متأكد من حذف \"${categoryName}\"?\n\n *لا يمكن التراجع عن هذا الإجراء.";

  static String m20(courseName) => "هل تريد حذف ${courseName} نهائياً؟";

  static String m21(courseName) => "تعديل ${courseName}";

  static String m22(errorMessage) => "خطأ: ${errorMessage}";

  static String m23(courseName) => "تم التسجيل بنجاح في ${courseName}";

  static String m24(error) => "خطأ في تحميل التعليقات: ${error}";

  static String m25(error) => "فشل في اختيار الصورة: ${error}";

  static String m26(errorMessage) => "فشل في حفظ الحضور: ${errorMessage}";

  static String m27(goalNumber) => "أدخل الهدف ${goalNumber}";

  static String m28(goalNumber) => "الهدف ${goalNumber}";

  static String m29(name) => "المدرب: ${name}";

  static String m30(courseName) => "إدارة مقابلات ${courseName}";

  static String m31(startDate, endDate) =>
      "فترة المقابلة: ${startDate} - ${endDate}";

  static String m32(startDate, endDate) =>
      "تبدأ المقابلة في ${startDate} وتنتهي في ${endDate}";

  static String m33(count) => "الإعجابات: ${count}";

  static String m34(filter) => "لا توجد تقييمات ${filter}";

  static String m35(number) => "المتطلبات المسبقة/المهارة ${number}";

  static String m36(count) => "الحضور: ${count}";

  static String m37(count) => "${count} تقييم";

  static String m38(date) => "المحدد: ${date}";

  static String m39(count, filter) => "عرض ${count} تقييم ${filter}";

  static String m40(count) => "عرض ${count} تقييم";

  static String m41(filter) => "عرض تقييم واحد ${filter}";

  static String m42(courseName) => "عرض إحصائيات ${courseName}";

  static String m43(count) => "الطلاب (${count})";

  static String m44(days) => "المجموع: ${days} أيام";

  static String m45(count) => "غير محدد: ${count}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "Absent": MessageLookupByLibrary.simpleMessage("غياب"),
    "Active": MessageLookupByLibrary.simpleMessage("نشط"),
    "Archived": MessageLookupByLibrary.simpleMessage("مؤرشفة"),
    "Back": MessageLookupByLibrary.simpleMessage("العودة"),
    "ComingSoon": MessageLookupByLibrary.simpleMessage("قريباً"),
    "ComingSoonlabel": MessageLookupByLibrary.simpleMessage(
      "هذا القسم قيد التطوير وسيتم إطلاقه قريباً. شكراً لصبرك!",
    ),
    "CreatedOn": MessageLookupByLibrary.simpleMessage("تم الإنشاء في"),
    "Disability": MessageLookupByLibrary.simpleMessage("إعاقة"),
    "Hour": MessageLookupByLibrary.simpleMessage("ساعة"),
    "IAgree": MessageLookupByLibrary.simpleMessage("أوافق"),
    "LiveData": MessageLookupByLibrary.simpleMessage("بيانات حية"),
    "ManageCourses": MessageLookupByLibrary.simpleMessage("إدارة الدورة"),
    "Next": MessageLookupByLibrary.simpleMessage("التالي"),
    "No": MessageLookupByLibrary.simpleMessage("لا"),
    "NothingToEdit": MessageLookupByLibrary.simpleMessage(
      "لا يوجد شيء لتعديله",
    ),
    "Post": MessageLookupByLibrary.simpleMessage("نشر"),
    "Present": MessageLookupByLibrary.simpleMessage("حضور"),
    "Review": MessageLookupByLibrary.simpleMessage("تقييم"),
    "SkillsAndPrerequisites": MessageLookupByLibrary.simpleMessage(
      "المهارات والمتطلبات المسبقة",
    ),
    "Student": MessageLookupByLibrary.simpleMessage("طالب"),
    "Submit": MessageLookupByLibrary.simpleMessage("إرسال"),
    "SystemConfiguration": MessageLookupByLibrary.simpleMessage(
      "إعدادات النظام",
    ),
    "TermsAndConditions": MessageLookupByLibrary.simpleMessage(
      "الشروط والأحكام",
    ),
    "TermsText1": MessageLookupByLibrary.simpleMessage(
      "أوافق وأفوض مركز UCCD باستخدام بياناتي وصوري التي التقطتها أثناء مشاركتي في برامج التدريب و/أو خدمة التطوير المهني التي يقدمها المركز لأغراض إعداد التقارير والمنشورات والتواصل مع أصحاب العمل في مركز UCCD",
    ),
    "TermsText2": MessageLookupByLibrary.simpleMessage(
      "وتفويض تطبيق UCCD بجمع البيانات حول مشاركتي في الدورات التدريبية للتحليل وتحسين تجربة المستخدم",
    ),
    "Unmarked": MessageLookupByLibrary.simpleMessage("غير محدد"),
    "WhatYouWillLearn": MessageLookupByLibrary.simpleMessage("ماذا ستتعلم"),
    "aboutThisCourseTitle": MessageLookupByLibrary.simpleMessage(
      "حول هذه الدورة",
    ),
    "absenceDaysTitle": MessageLookupByLibrary.simpleMessage("أيام الغياب"),
    "absent": MessageLookupByLibrary.simpleMessage("الغياب"),
    "absentCount": m0,
    "absentDays": m1,
    "accept": MessageLookupByLibrary.simpleMessage("قبول"),
    "accepted": MessageLookupByLibrary.simpleMessage("مقبول"),
    "account": MessageLookupByLibrary.simpleMessage("الحساب"),
    "actions": MessageLookupByLibrary.simpleMessage("إجراءات"),
    "activeStudents": MessageLookupByLibrary.simpleMessage("الطلاب النشطين"),
    "addAdminTitle": MessageLookupByLibrary.simpleMessage("إضافة مشرف"),
    "addButtonLabel": MessageLookupByLibrary.simpleMessage("إضافة"),
    "addCategory": MessageLookupByLibrary.simpleMessage("إضافة فئة"),
    "addCategoryTitle": MessageLookupByLibrary.simpleMessage("إضافة فئة"),
    "addCommentHint": MessageLookupByLibrary.simpleMessage("أضف تعليقاً..."),
    "addCourse": MessageLookupByLibrary.simpleMessage("إضافة دورة"),
    "addCourseTitle": MessageLookupByLibrary.simpleMessage("إضافة دورة"),
    "addGoal": MessageLookupByLibrary.simpleMessage("إضافة هدف"),
    "addInstructor": MessageLookupByLibrary.simpleMessage("إضافة مدرب"),
    "addInstructorTitle": MessageLookupByLibrary.simpleMessage("إضافة مدرب"),
    "addPost": MessageLookupByLibrary.simpleMessage("إضافة منشور"),
    "addPrerequisiteSkill": MessageLookupByLibrary.simpleMessage(
      "إضافة متطلب مسبق/مهارة",
    ),
    "addStudent": MessageLookupByLibrary.simpleMessage("إضافة طالب"),
    "addStudentTitle": MessageLookupByLibrary.simpleMessage("إضافة طالب"),
    "admin": MessageLookupByLibrary.simpleMessage("مشرف"),
    "adminAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "تم إضافة المشرف بنجاح",
    ),
    "adminDashboard": MessageLookupByLibrary.simpleMessage("لوحة تحكم المشرف"),
    "adminEmailHint": MessageLookupByLibrary.simpleMessage("أدخل بريد المشرف"),
    "adminEmailLabel": MessageLookupByLibrary.simpleMessage("بريد المشرف"),
    "adminFeatures": MessageLookupByLibrary.simpleMessage("ميزات المشرف"),
    "adminNameHint": MessageLookupByLibrary.simpleMessage(
      "أدخل اسم المستخدم للمشرف",
    ),
    "adminNameLabel": MessageLookupByLibrary.simpleMessage("اسم المشرف"),
    "adminPasswordLabel": MessageLookupByLibrary.simpleMessage(
      "كلمة مرور المشرف",
    ),
    "adminUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "تم تحديث المشرف بنجاح",
    ),
    "admins": MessageLookupByLibrary.simpleMessage("المشرفين"),
    "advancedCourse": m2,
    "all": MessageLookupByLibrary.simpleMessage("الكل"),
    "allRatings": MessageLookupByLibrary.simpleMessage("الكل"),
    "arabic": MessageLookupByLibrary.simpleMessage("العربية"),
    "archivePanel": MessageLookupByLibrary.simpleMessage("لوحة الأرشيف"),
    "archiveStatisticsSemanticLabel": m3,
    "archiveStatisticsTooltip": MessageLookupByLibrary.simpleMessage(
      "عرض إحصائيات وتحليلات الدورة المؤرشفة",
    ),
    "archivedCourses": MessageLookupByLibrary.simpleMessage("المؤرشفة"),
    "assignedCourses": MessageLookupByLibrary.simpleMessage("الدورات المعينة"),
    "attend": MessageLookupByLibrary.simpleMessage("الحضور"),
    "attendanceOnlyToday": MessageLookupByLibrary.simpleMessage(
      "الحضور متاح فقط لتاريخ اليوم",
    ),
    "attendanceOnlyTodayDate": MessageLookupByLibrary.simpleMessage(
      "يمكن تسجيل الحضور فقط لتاريخ اليوم",
    ),
    "attendedDays": m4,
    "authInvalidEmail": MessageLookupByLibrary.simpleMessage(
      "بريد إلكتروني غير صحيح",
    ),
    "autoDepartment": MessageLookupByLibrary.simpleMessage("الأوتوترونيكس"),
    "autotronics": MessageLookupByLibrary.simpleMessage("الأوتوترونيكس"),
    "available": MessageLookupByLibrary.simpleMessage("المتاح"),
    "availableCourses": MessageLookupByLibrary.simpleMessage("المتاحة"),
    "beFirstToComment": MessageLookupByLibrary.simpleMessage(
      "كن أول من يعلق على هذا المنشور!",
    ),
    "beFirstToShare": MessageLookupByLibrary.simpleMessage(
      "كن أول من يشارك شيئاً مع المجتمع!",
    ),
    "beginnerCourse": m5,
    "browseCourses": MessageLookupByLibrary.simpleMessage("تصفح الدورات"),
    "browseCoursesHint": MessageLookupByLibrary.simpleMessage(
      "تصفح الدورات المتاحة واشترك لتراها هنا",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("إلغاء"),
    "cancelButtonLabel": MessageLookupByLibrary.simpleMessage("إلغاء"),
    "categories": MessageLookupByLibrary.simpleMessage("الفئات"),
    "categoriesLabel": MessageLookupByLibrary.simpleMessage("الفئات"),
    "categoriesOverview": MessageLookupByLibrary.simpleMessage(
      "نظرة عامة على الفئات",
    ),
    "categoryAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "تم إضافة الفئة بنجاح",
    ),
    "categoryAvailable": m6,
    "categoryChangedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "تم تغيير الفئة بنجاح",
    ),
    "categoryDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "تم حذف الفئة بنجاح",
    ),
    "categoryNameHint": MessageLookupByLibrary.simpleMessage("أدخل اسم الفئة"),
    "categoryNameLabel": MessageLookupByLibrary.simpleMessage("اسم الفئة"),
    "categoryNameRequired": MessageLookupByLibrary.simpleMessage(
      "اسم الفئة مطلوب",
    ),
    "categoryUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "تم تحديث الفئة بنجاح",
    ),
    "categoryUsageInfo": MessageLookupByLibrary.simpleMessage(
      "يمكن استخدام هذه الفئة لتنظيم الدورات والمحتوى.",
    ),
    "change": MessageLookupByLibrary.simpleMessage("تغيير"),
    "changeCategory": MessageLookupByLibrary.simpleMessage("تغيير الفئة"),
    "changeCategoryButtonSemanticLabel": m7,
    "changeCategoryButtonTitle": MessageLookupByLibrary.simpleMessage(
      "تغيير الفئة",
    ),
    "changeCategoryButtonTooltip": MessageLookupByLibrary.simpleMessage(
      "تغيير فئة الدورة",
    ),
    "changeInstructor": MessageLookupByLibrary.simpleMessage("تغيير المدرب"),
    "changeInstructorButtonSemanticLabel": m8,
    "changeInstructorButtonTitle": MessageLookupByLibrary.simpleMessage(
      "تغيير المدرب",
    ),
    "changeInstructorButtonTooltip": MessageLookupByLibrary.simpleMessage(
      "تغيير مدرب الدورة",
    ),
    "checkInternetConnection": MessageLookupByLibrary.simpleMessage(
      "تحقق من اتصالك بالإنترنت وحاول مرة أخرى لاحقاً",
    ),
    "checkInternetConnectionAndTryAgain": MessageLookupByLibrary.simpleMessage(
      "تحقق من اتصالك بالإنترنت وحاول مرة أخرى",
    ),
    "closeDialogTooltip": MessageLookupByLibrary.simpleMessage("إغلاق النافذة"),
    "codeResent": MessageLookupByLibrary.simpleMessage("تم إعادة إرسال الرمز"),
    "commentAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "تم إضافة التعليق بنجاح",
    ),
    "commentValidationEmpty": MessageLookupByLibrary.simpleMessage(
      "من فضلك أدخل تعليقاً",
    ),
    "commentValidationTrimmed": MessageLookupByLibrary.simpleMessage(
      "التعليق لا يمكن أن يكون فارغاً",
    ),
    "commentsButtonLabel": MessageLookupByLibrary.simpleMessage("التعليقات"),
    "commentsCount": m9,
    "commentsTitle": MessageLookupByLibrary.simpleMessage("التعليقات"),
    "community": MessageLookupByLibrary.simpleMessage("المجتمع"),
    "communityPost": MessageLookupByLibrary.simpleMessage("منشور المجتمع"),
    "communitySubtitle": MessageLookupByLibrary.simpleMessage(
      "تابع أحداث مركز UCCD",
    ),
    "communityTitle": MessageLookupByLibrary.simpleMessage("المجتمع"),
    "completed": MessageLookupByLibrary.simpleMessage("مكتملة"),
    "confirmButton": MessageLookupByLibrary.simpleMessage("تأكيد"),
    "confirmEnrollmentMessage": m10,
    "confirmEnrollmentTitle": MessageLookupByLibrary.simpleMessage(
      "تأكيد التسجيل",
    ),
    "connectionTimeout": MessageLookupByLibrary.simpleMessage(
      "انتهت مهلة الاتصال",
    ),
    "connectionTimeoutTryAgain": MessageLookupByLibrary.simpleMessage(
      "انتهت مهلة الاتصال، حاول مرة أخرى لاحقاً",
    ),
    "contactSupport": MessageLookupByLibrary.simpleMessage("تواصل مع الدعم"),
    "contentRating": MessageLookupByLibrary.simpleMessage("المحتوى"),
    "continueLearningJourney": MessageLookupByLibrary.simpleMessage(
      "تابع رحلة التعلم",
    ),
    "controlPanel": MessageLookupByLibrary.simpleMessage("لوحة التحكم"),
    "course": MessageLookupByLibrary.simpleMessage("الدورة"),
    "courseAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "تم إضافة الدورة بنجاح",
    ),
    "courseAnalytics": MessageLookupByLibrary.simpleMessage("تحليلات الدورة"),
    "courseDates": MessageLookupByLibrary.simpleMessage("تواريخ الدورة"),
    "courseDatesDescription": MessageLookupByLibrary.simpleMessage(
      "الآن لنحدد تواريخ الدورة",
    ),
    "courseDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "تم حذف الدورة بنجاح",
    ),
    "courseEndDateAfterInterviews": MessageLookupByLibrary.simpleMessage(
      "يجب أن يكون تاريخ نهاية الدورة بعد المقابلات",
    ),
    "courseEndDateAfterStartDate": MessageLookupByLibrary.simpleMessage(
      "يجب أن يكون تاريخ نهاية الدورة بعد تاريخ البداية",
    ),
    "courseEndDateHint": MessageLookupByLibrary.simpleMessage(
      "أدخل تاريخ نهاية الدورة",
    ),
    "courseEndDateLabel": MessageLookupByLibrary.simpleMessage(
      "تاريخ نهاية الدورة",
    ),
    "courseEndDateRequired": MessageLookupByLibrary.simpleMessage(
      "تاريخ النهاية مطلوب",
    ),
    "courseFull": MessageLookupByLibrary.simpleMessage("مكتمل"),
    "courseGoals": MessageLookupByLibrary.simpleMessage("أهداف الدورة"),
    "courseGoalsDescription": MessageLookupByLibrary.simpleMessage(
      "حدد النتائج المتوقعة للطلاب من الدورة",
    ),
    "courseGoalsNote": MessageLookupByLibrary.simpleMessage(
      "ملاحظة: يجب تحديد هدف واحد على الأقل",
    ),
    "courseImage": MessageLookupByLibrary.simpleMessage("صورة الدورة"),
    "courseImageDescription": MessageLookupByLibrary.simpleMessage(
      "أخيراً يمكنك إضافة صورة للدورة",
    ),
    "courseImageNote": MessageLookupByLibrary.simpleMessage(
      "ملاحظة: إذا لم تضع صورة للدورة فستظهر شعار UCCD تلقائياً",
    ),
    "courseInfo": MessageLookupByLibrary.simpleMessage("معلومات الدورة"),
    "courseInfoDescription": MessageLookupByLibrary.simpleMessage(
      "لنبدأ بالمعلومات الأساسية للدورة",
    ),
    "coursePeriodLabel": m11,
    "coursePeriodSubtitle": m12,
    "coursePeriodTitle": MessageLookupByLibrary.simpleMessage("فترة الدورة"),
    "courseRatingsSemanticLabel": m13,
    "courseRatingsTooltip": MessageLookupByLibrary.simpleMessage(
      "عرض تقييمات وملاحظات الدورة",
    ),
    "courseScheduleTitle": MessageLookupByLibrary.simpleMessage("جدول الدورة"),
    "courseStartDateAfterInterviews": MessageLookupByLibrary.simpleMessage(
      "يجب أن يكون تاريخ بداية الدورة بعد المقابلات",
    ),
    "courseStartDateBeforeEndDate": MessageLookupByLibrary.simpleMessage(
      "يجب أن يكون تاريخ بداية الدورة قبل تاريخ النهاية",
    ),
    "courseStartDateHint": MessageLookupByLibrary.simpleMessage(
      "أدخل تاريخ بداية الدورة",
    ),
    "courseStartDateLabel": MessageLookupByLibrary.simpleMessage(
      "تاريخ بداية الدورة",
    ),
    "courseStartDateRequired": MessageLookupByLibrary.simpleMessage(
      "تاريخ البداية مطلوب",
    ),
    "courseStatsDuration": MessageLookupByLibrary.simpleMessage("المدة"),
    "courseStatsDurationValue": m14,
    "courseStatsLength": MessageLookupByLibrary.simpleMessage("المهلة"),
    "courseStatsLengthValue": m15,
    "courseStatsPrerequisites": MessageLookupByLibrary.simpleMessage(
      "المتطلبات المسبقة",
    ),
    "courseStatsRoom": MessageLookupByLibrary.simpleMessage("القاعة"),
    "courseStudentsSemanticLabel": m16,
    "courseStudentsTooltip": MessageLookupByLibrary.simpleMessage(
      "عرض طلاب الدورة المؤرشفة",
    ),
    "courseTimelineTitle": MessageLookupByLibrary.simpleMessage(
      "الجدول الزمني للدورة",
    ),
    "courseTitleHint": MessageLookupByLibrary.simpleMessage(
      "أدخل عنوان الدورة",
    ),
    "courseTitleLabel": MessageLookupByLibrary.simpleMessage("عنوان الدورة"),
    "courseUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "تم تحديث الدورة بنجاح",
    ),
    "courses": MessageLookupByLibrary.simpleMessage("الدورات"),
    "coursesManagement": MessageLookupByLibrary.simpleMessage("إدارة الدورات"),
    "coursesWillAppear": MessageLookupByLibrary.simpleMessage(
      "ستظهر الدورات هنا بمجرد توفرها",
    ),
    "coursesWillAppearAssigned": MessageLookupByLibrary.simpleMessage(
      "ستظهر الدورات هنا بمجرد تعيينها لك",
    ),
    "createNewCourse": MessageLookupByLibrary.simpleMessage("إنشاء دورة جديدة"),
    "createPostButton": MessageLookupByLibrary.simpleMessage("إنشاء منشور"),
    "createPostDialogTitle": MessageLookupByLibrary.simpleMessage(
      "إنشاء منشور",
    ),
    "currentYear": MessageLookupByLibrary.simpleMessage("السنة الحالية"),
    "darkMode": MessageLookupByLibrary.simpleMessage("الوضع المظلم"),
    "dashboard": MessageLookupByLibrary.simpleMessage("لوحة التحكم"),
    "dashboardOverview": MessageLookupByLibrary.simpleMessage(
      "نظرة عامة على لوحة التحكم",
    ),
    "dateLabel": m17,
    "dateRequired": MessageLookupByLibrary.simpleMessage("التاريخ مطلوب"),
    "delete": MessageLookupByLibrary.simpleMessage("حذف"),
    "deleteButtonSemanticLabel": m18,
    "deleteButtonText": MessageLookupByLibrary.simpleMessage("حذف"),
    "deleteButtonTitle": MessageLookupByLibrary.simpleMessage("حذف"),
    "deleteButtonTooltip": MessageLookupByLibrary.simpleMessage(
      "حذف الدورة نهائياً",
    ),
    "deleteCategoryConfirmation": m19,
    "deleteCourseConfirmMessage": m20,
    "deleteDialogTitle": MessageLookupByLibrary.simpleMessage("حذف"),
    "deletePostConfirmMessage": MessageLookupByLibrary.simpleMessage(
      "هل أنت متأكد من حذف هذا المنشور؟",
    ),
    "deletePostOption": MessageLookupByLibrary.simpleMessage("حذف المنشور"),
    "deletePostTitle": MessageLookupByLibrary.simpleMessage("حذف المنشور"),
    "department": MessageLookupByLibrary.simpleMessage("القسم"),
    "departmentHint": MessageLookupByLibrary.simpleMessage("القسم"),
    "departmentLabel": MessageLookupByLibrary.simpleMessage("القسم"),
    "descriptionHint": MessageLookupByLibrary.simpleMessage("أدخل وصف الدورة"),
    "descriptionLabel": MessageLookupByLibrary.simpleMessage("الوصف"),
    "didntRecieveCode": MessageLookupByLibrary.simpleMessage("لم تستلم الرمز؟"),
    "disabilityLabel": MessageLookupByLibrary.simpleMessage("الإعاقة"),
    "durationHint": MessageLookupByLibrary.simpleMessage("أدخل مدة الدورة"),
    "durationLabel": MessageLookupByLibrary.simpleMessage("المدة"),
    "edit": MessageLookupByLibrary.simpleMessage("تعديل"),
    "editAdminTitle": MessageLookupByLibrary.simpleMessage("تعديل مشرف"),
    "editButtonLabel": MessageLookupByLibrary.simpleMessage("تعديل"),
    "editButtonSemanticLabel": m21,
    "editButtonTitle": MessageLookupByLibrary.simpleMessage("تعديل"),
    "editButtonTooltip": MessageLookupByLibrary.simpleMessage(
      "تعديل معلومات وإعدادات الدورة",
    ),
    "editCategoryTitle": MessageLookupByLibrary.simpleMessage("تعديل فئة"),
    "editCourseTitle": MessageLookupByLibrary.simpleMessage("تعديل دورة"),
    "editInstructorTitle": MessageLookupByLibrary.simpleMessage("تعديل مدرب"),
    "editPostContentHint": MessageLookupByLibrary.simpleMessage(
      "عدل منشورك...",
    ),
    "editPostDialogTitle": MessageLookupByLibrary.simpleMessage(
      "تعديل المنشور",
    ),
    "editPostOption": MessageLookupByLibrary.simpleMessage("تعديل المنشور"),
    "editStudentTitle": MessageLookupByLibrary.simpleMessage("تعديل طالب"),
    "emailAlreadyInUse": MessageLookupByLibrary.simpleMessage(
      "البريد الإلكتروني مستخدم بالفعل",
    ),
    "emailNotEnabled": MessageLookupByLibrary.simpleMessage(
      "البريد الإلكتروني غير مفعل، تواصل مع الدعم",
    ),
    "emailOrPasswordInvalid": MessageLookupByLibrary.simpleMessage(
      "البريد الإلكتروني أو كلمة المرور غير صحيحة",
    ),
    "emailRequired": MessageLookupByLibrary.simpleMessage(
      "حقل البريد الإلكتروني مطلوب",
    ),
    "emailUsernameTooShort": MessageLookupByLibrary.simpleMessage(
      "اسم المستخدم في البريد يجب أن يكون 3 أحرف على الأقل",
    ),
    "endDateRequired": MessageLookupByLibrary.simpleMessage(
      "تاريخ النهاية مطلوب",
    ),
    "ended": MessageLookupByLibrary.simpleMessage("انتهت"),
    "ends": MessageLookupByLibrary.simpleMessage("تنتهي"),
    "english": MessageLookupByLibrary.simpleMessage("الإنجليزية"),
    "enroll": MessageLookupByLibrary.simpleMessage("التسجيل"),
    "enrollNow": MessageLookupByLibrary.simpleMessage("سجل الآن"),
    "enrollNowButton": MessageLookupByLibrary.simpleMessage("سجل الآن"),
    "enrolledInThisCategory": MessageLookupByLibrary.simpleMessage(
      "مسجل في هذه الفئة",
    ),
    "enrollmentAlmostFull": MessageLookupByLibrary.simpleMessage("تكاد تكتمل!"),
    "enrollmentError": m22,
    "enrollmentFillingUp": MessageLookupByLibrary.simpleMessage("تمتلئ"),
    "enrollmentFull": MessageLookupByLibrary.simpleMessage("مكتملة"),
    "enrollmentSpotsAvailable": MessageLookupByLibrary.simpleMessage(
      "أماكن متاحة",
    ),
    "enrollmentSuccess": m23,
    "enrollments": MessageLookupByLibrary.simpleMessage("التسجيلات"),
    "enterInterviewEndDate": MessageLookupByLibrary.simpleMessage(
      "أدخل تاريخ نهاية المقابلة",
    ),
    "enterInterviewStartDate": MessageLookupByLibrary.simpleMessage(
      "أدخل تاريخ بداية المقابلة",
    ),
    "enterMaxAcceptedStudents": MessageLookupByLibrary.simpleMessage(
      "أدخل الحد الأقصى للطلاب المقبولين",
    ),
    "error": MessageLookupByLibrary.simpleMessage("خطأ"),
    "errorLoadingComments": m24,
    "errorLoadingCourses": MessageLookupByLibrary.simpleMessage(
      "خطأ في تحميل الدورات",
    ),
    "errorLoadingRatings": MessageLookupByLibrary.simpleMessage(
      "خطأ في تحميل التقييمات",
    ),
    "errorLoadingStudents": MessageLookupByLibrary.simpleMessage(
      "خطأ في تحميل الطلاب",
    ),
    "failed": MessageLookupByLibrary.simpleMessage("فشل"),
    "failedToLoadCourses": MessageLookupByLibrary.simpleMessage(
      "فشل في تحميل الدورات",
    ),
    "failedToLoadCoursesWithHelp": MessageLookupByLibrary.simpleMessage(
      "فشل في تحميل الدورات.\nيرجى التحقق من اتصالك بالإنترنت والمحاولة مرة أخرى.",
    ),
    "failedToLoadData": MessageLookupByLibrary.simpleMessage(
      "فشل في استرداد البيانات",
    ),
    "failedToPickImage": m25,
    "failedToSaveAttendance": m26,
    "firstYear": MessageLookupByLibrary.simpleMessage("السنة الاولى"),
    "fiveStars": MessageLookupByLibrary.simpleMessage("5 نجوم"),
    "fourStars": MessageLookupByLibrary.simpleMessage("4 نجوم"),
    "fourthYear": MessageLookupByLibrary.simpleMessage("السنة الرابعة"),
    "genderLabel": MessageLookupByLibrary.simpleMessage("الجنس"),
    "goalHint": m27,
    "goalLabel": m28,
    "graduationYear": MessageLookupByLibrary.simpleMessage("سنة التخرج"),
    "graduationYearHint": MessageLookupByLibrary.simpleMessage(
      "أدخل سنة التخرج المتوقعة",
    ),
    "graduationYearIncorrect": MessageLookupByLibrary.simpleMessage(
      "سنة التخرج غير صحيحة",
    ),
    "graduationYearLabel": MessageLookupByLibrary.simpleMessage("سنة التخرج"),
    "home": MessageLookupByLibrary.simpleMessage("الرئيسية"),
    "imageSizeLimit": MessageLookupByLibrary.simpleMessage(
      "الحد الاقصي لحجم الصورة 10 ميجابايت",
    ),
    "inProgress": MessageLookupByLibrary.simpleMessage("قيد التقدم"),
    "informationTechnology": MessageLookupByLibrary.simpleMessage(
      "تكنولوجيا المعلومات",
    ),
    "instructor": MessageLookupByLibrary.simpleMessage("المدرب"),
    "instructorAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "تم إضافة المدرب بنجاح",
    ),
    "instructorCreatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "تم إنشاء المدرس بنجاح",
    ),
    "instructorDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "تم حذف المدرس بنجاح",
    ),
    "instructorEmailHint": MessageLookupByLibrary.simpleMessage(
      "أدخل بريد المدرب",
    ),
    "instructorEmailLabel": MessageLookupByLibrary.simpleMessage("بريد المدرب"),
    "instructorLabel": m29,
    "instructorNameHint": MessageLookupByLibrary.simpleMessage(
      "أدخل اسم المدرب",
    ),
    "instructorNameLabel": MessageLookupByLibrary.simpleMessage("اسم المدرب"),
    "instructorPasswordHint": MessageLookupByLibrary.simpleMessage(
      "أدخل كلمة مرور المدرب",
    ),
    "instructorPasswordLabel": MessageLookupByLibrary.simpleMessage(
      "كلمة مرور المدرب",
    ),
    "instructorRating": MessageLookupByLibrary.simpleMessage("المدرب"),
    "instructorTitle": MessageLookupByLibrary.simpleMessage("المدرب"),
    "instructorUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "تم تحديث المدرب بنجاح",
    ),
    "instructors": MessageLookupByLibrary.simpleMessage("المدربين"),
    "instructorsLabel": MessageLookupByLibrary.simpleMessage("المدربين"),
    "interview": MessageLookupByLibrary.simpleMessage("المقابلة"),
    "interviewBeforeCourse": MessageLookupByLibrary.simpleMessage(
      "يجب أن تكون مواعيد المقابلة قبل مواعيد الدورة",
    ),
    "interviewButtonSemanticLabel": m30,
    "interviewButtonTitle": MessageLookupByLibrary.simpleMessage("المقابلة"),
    "interviewButtonTooltip": MessageLookupByLibrary.simpleMessage(
      "إدارة مقابلات وطلبات الدورة",
    ),
    "interviewDatesBeforeCourseDates": MessageLookupByLibrary.simpleMessage(
      "يجب أن تكون تواريخ المقابلة قبل تواريخ الدورة",
    ),
    "interviewEndDate": MessageLookupByLibrary.simpleMessage(
      "تاريخ نهاية المقابلة",
    ),
    "interviewEndDateAfterStartDate": MessageLookupByLibrary.simpleMessage(
      "يجب أن يكون تاريخ نهاية المقابلة بعد تاريخ البداية",
    ),
    "interviewEndDateBeforeCourses": MessageLookupByLibrary.simpleMessage(
      "يجب أن يكون تاريخ نهاية المقابلة قبل الدورات",
    ),
    "interviewPeriodLabel": m31,
    "interviewPeriodSubtitle": m32,
    "interviewPeriodTitle": MessageLookupByLibrary.simpleMessage(
      "فترة المقابلة",
    ),
    "interviewStartDate": MessageLookupByLibrary.simpleMessage(
      "تاريخ بداية المقابلة",
    ),
    "interviewStartDateBeforeCourses": MessageLookupByLibrary.simpleMessage(
      "يجب أن يكون تاريخ بداية المقابلة قبل الدورات",
    ),
    "interviewStartDateBeforeEndDate": MessageLookupByLibrary.simpleMessage(
      "يجب أن يكون تاريخ بداية المقابلة قبل تاريخ النهاية",
    ),
    "invalidCourseDates": MessageLookupByLibrary.simpleMessage(
      "تواريخ الدورة غير صحيحة",
    ),
    "invalidEmail": MessageLookupByLibrary.simpleMessage(
      "من فضلك أدخل عنوان بريد إلكتروني صحيح",
    ),
    "invalidInterviewDates": MessageLookupByLibrary.simpleMessage(
      "تواريخ المقابلة غير صحيحة",
    ),
    "invalidPhoneNumber": MessageLookupByLibrary.simpleMessage(
      "رقم هاتف غير صحيح",
    ),
    "itDepartment": MessageLookupByLibrary.simpleMessage("تكنولوجيا المعلومات"),
    "korean": MessageLookupByLibrary.simpleMessage("الكورية"),
    "language": MessageLookupByLibrary.simpleMessage("اللغة"),
    "likeButtonLabel": MessageLookupByLibrary.simpleMessage("إعجاب"),
    "likesCount": m33,
    "loadingComment": MessageLookupByLibrary.simpleMessage(
      "جاري تحميل نص التعليق الذي سيتم استبداله بالمحتوى الفعلي...",
    ),
    "loadingText": MessageLookupByLibrary.simpleMessage("جاري التحميل"),
    "loadingUserName": MessageLookupByLibrary.simpleMessage(
      "جاري تحميل اسم المستخدم",
    ),
    "loginButton": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
    "logout": MessageLookupByLibrary.simpleMessage("تسجيل الخروج"),
    "logoutButtonText": MessageLookupByLibrary.simpleMessage("تسجيل الخروج"),
    "logoutConfirmation": MessageLookupByLibrary.simpleMessage(
      "هل أنت متأكد أنك تريد تسجيل الخروج",
    ),
    "logoutDialogTitle": MessageLookupByLibrary.simpleMessage("تسجيل الخروج"),
    "logs": MessageLookupByLibrary.simpleMessage("السجلات"),
    "manageCategories": MessageLookupByLibrary.simpleMessage("إدارة الفئات"),
    "manageCategoriesEfficiently": MessageLookupByLibrary.simpleMessage(
      "إدارة فئاتك بكفاءة",
    ),
    "maxAcceptedStudents": MessageLookupByLibrary.simpleMessage(
      "الحد الأقصى للطلاب المقبولين",
    ),
    "mechaDepartment": MessageLookupByLibrary.simpleMessage("الميكاترونيكس"),
    "mechatronics": MessageLookupByLibrary.simpleMessage("الميكاترونيكس"),
    "monthApr": MessageLookupByLibrary.simpleMessage("أبريل"),
    "monthAug": MessageLookupByLibrary.simpleMessage("أغسطس"),
    "monthDec": MessageLookupByLibrary.simpleMessage("ديسمبر"),
    "monthFeb": MessageLookupByLibrary.simpleMessage("فبراير"),
    "monthJan": MessageLookupByLibrary.simpleMessage("يناير"),
    "monthJul": MessageLookupByLibrary.simpleMessage("يوليو"),
    "monthJun": MessageLookupByLibrary.simpleMessage("يونيو"),
    "monthMar": MessageLookupByLibrary.simpleMessage("مارس"),
    "monthMay": MessageLookupByLibrary.simpleMessage("مايو"),
    "monthNov": MessageLookupByLibrary.simpleMessage("نوفمبر"),
    "monthOct": MessageLookupByLibrary.simpleMessage("أكتوبر"),
    "monthSep": MessageLookupByLibrary.simpleMessage("سبتمبر"),
    "multipleCheck": MessageLookupByLibrary.simpleMessage("اختيار متعدد"),
    "myCourses": MessageLookupByLibrary.simpleMessage("دوراتي"),
    "myCoursesTitle": MessageLookupByLibrary.simpleMessage("دوراتي"),
    "nameRequired": MessageLookupByLibrary.simpleMessage("الاسم مطلوب"),
    "nationalIdHint": MessageLookupByLibrary.simpleMessage("أدخل الرقم القومي"),
    "nationalIdLabel": MessageLookupByLibrary.simpleMessage("الرقم القومي"),
    "nationalIdLengthError": MessageLookupByLibrary.simpleMessage(
      "يجب أن يكون الرقم القومي 14 رقم",
    ),
    "nationalIdRequired": MessageLookupByLibrary.simpleMessage(
      "الرقم القومي مطلوب",
    ),
    "newInstructor": MessageLookupByLibrary.simpleMessage("مدرب جديد"),
    "noAcceptedStudents": MessageLookupByLibrary.simpleMessage(
      "لا يوجد طلاب مقبولين",
    ),
    "noCategoriesRegistered": MessageLookupByLibrary.simpleMessage(
      "لا يوجد فئات مسجلة",
    ),
    "noCommentsYet": MessageLookupByLibrary.simpleMessage(
      "لا توجد تعليقات بعد",
    ),
    "noCoursesAssignedYet": MessageLookupByLibrary.simpleMessage(
      "لم يتم تعيين دورات بعد",
    ),
    "noCoursesAvailable": MessageLookupByLibrary.simpleMessage(
      "لا توجد دورات متاحة",
    ),
    "noCoursesFound": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على دورات",
    ),
    "noCoursesInProgress": MessageLookupByLibrary.simpleMessage(
      "لا توجد دورات قيد التقدم",
    ),
    "noEnrolledCourses": MessageLookupByLibrary.simpleMessage(
      "لا توجد دورات مسجلة",
    ),
    "noFilteredReviews": m34,
    "noGoalsProvided": MessageLookupByLibrary.simpleMessage(
      "لم يتم تحديد أهداف",
    ),
    "noInstructorsRegistered": MessageLookupByLibrary.simpleMessage(
      "لا يوجد مدربين مسجلين",
    ),
    "noInternetConnection": MessageLookupByLibrary.simpleMessage(
      "لا يوجد اتصال بالإنترنت",
    ),
    "noLogsInThisDay": MessageLookupByLibrary.simpleMessage(
      "لا توجد سجلات في هذا اليوم",
    ),
    "noPostsYet": MessageLookupByLibrary.simpleMessage("لا توجد منشورات بعد"),
    "noRatingsMessage": MessageLookupByLibrary.simpleMessage(
      "لم تحصل هذه الدورة على أي تقييمات بعد.",
    ),
    "noRatingsYet": MessageLookupByLibrary.simpleMessage("لا توجد تقييمات بعد"),
    "noRegisteredCategories": MessageLookupByLibrary.simpleMessage(
      "لا توجد فئات مسجلة",
    ),
    "noReviewsYet": MessageLookupByLibrary.simpleMessage("لا توجد تقييمات بعد"),
    "noStudentsEnrolled": MessageLookupByLibrary.simpleMessage(
      "لا يوجد طلاب مسجلين",
    ),
    "noStudentsToInterview": MessageLookupByLibrary.simpleMessage(
      "لا يوجد طلاب للمقابلة",
    ),
    "noSuchEmailFound": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على هذا البريد الإلكتروني",
    ),
    "noUser": MessageLookupByLibrary.simpleMessage("لا يوجد مستخدم"),
    "noUserFoundContactSupport": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على مستخدم\nيرجى التواصل مع الدعم",
    ),
    "notificationSentSuccessfully": MessageLookupByLibrary.simpleMessage(
      "تم إرسال الإشعار بنجاح",
    ),
    "onTerms": MessageLookupByLibrary.simpleMessage(
      "على الشروط والأحكام لمركز UCCD",
    ),
    "oneStar": MessageLookupByLibrary.simpleMessage("نجمة واحدة"),
    "onlyBtuEmail": MessageLookupByLibrary.simpleMessage(
      "فقط بريد جامعة BTU (@btu.edu.eg) مسموح",
    ),
    "opDepartment": MessageLookupByLibrary.simpleMessage("الأطراف الصناعية"),
    "orDivider": MessageLookupByLibrary.simpleMessage("أو"),
    "orthoticsProsthetics": MessageLookupByLibrary.simpleMessage(
      "الأطراف والأجهزة التعويضية",
    ),
    "otpVerification": MessageLookupByLibrary.simpleMessage("تحقق OTP"),
    "overallRating": MessageLookupByLibrary.simpleMessage("إجمالي"),
    "password": MessageLookupByLibrary.simpleMessage("كلمة المرور"),
    "passwordHint": MessageLookupByLibrary.simpleMessage("أدخل كلمة المرور"),
    "passwordLengthError": MessageLookupByLibrary.simpleMessage(
      "يجب أن تكون كلمة المرور 8 أحرف على الأقل",
    ),
    "passwordRequired": MessageLookupByLibrary.simpleMessage(
      "كلمة المرور مطلوبة",
    ),
    "pending": MessageLookupByLibrary.simpleMessage("في الانتظار"),
    "phoneNumber": MessageLookupByLibrary.simpleMessage("الهاتف"),
    "phoneNumberHint": MessageLookupByLibrary.simpleMessage("أدخل رقم هاتفك"),
    "phoneNumberLabel": MessageLookupByLibrary.simpleMessage("رقم الهاتف"),
    "phoneNumberTooShort": MessageLookupByLibrary.simpleMessage(
      "رقم الهاتف أقل من 11 رقم",
    ),
    "pickImageTooltip": MessageLookupByLibrary.simpleMessage("اختيار صورة"),
    "postAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "تم إضافة المنشور بنجاح",
    ),
    "postButtonLabel": MessageLookupByLibrary.simpleMessage("نشر"),
    "postContentEmpty": MessageLookupByLibrary.simpleMessage(
      "محتوى المنشور لا يمكن أن يكون فارغاً",
    ),
    "postContentHint": MessageLookupByLibrary.simpleMessage(
      "ما الذي تفكر فيه؟",
    ),
    "postDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "تم حذف المنشور بنجاح",
    ),
    "postUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "تم تحديث المنشور بنجاح",
    ),
    "prerequisiteFieldRequired": MessageLookupByLibrary.simpleMessage(
      "هذا الحقل لا يمكن أن يكون فارغاً",
    ),
    "prerequisiteSkillHint": MessageLookupByLibrary.simpleMessage(
      "قل شيئاً عن هذه المتطلبات المسبقة/المهارة",
    ),
    "prerequisiteSkillLabel": m35,
    "prerequisitesNoneNote": MessageLookupByLibrary.simpleMessage(
      "ملاحظة: إذا لم تكن لديك أي مهارات أو متطلبات مسبقة، يمكنك كتابة \"لا يوجد\" في الحقل أدناه",
    ),
    "prerequisitesNote": MessageLookupByLibrary.simpleMessage(
      "ملاحظة: حدد مهارة واحدة أو متطلب مسبق واحد على الأقل",
    ),
    "presentCount": m36,
    "profile": MessageLookupByLibrary.simpleMessage("الملف الشخصي"),
    "quickActions": MessageLookupByLibrary.simpleMessage("الإجراءات السريعة"),
    "rateCourse": MessageLookupByLibrary.simpleMessage("تقييم الدورة"),
    "ratingOverview": MessageLookupByLibrary.simpleMessage(
      "نظرة عامة على التقييمات",
    ),
    "ratings": MessageLookupByLibrary.simpleMessage("التقييمات"),
    "ratingsTitle": MessageLookupByLibrary.simpleMessage("التقييمات"),
    "reDepartment": MessageLookupByLibrary.simpleMessage("الطاقة المتجددة"),
    "readTerms": MessageLookupByLibrary.simpleMessage(
      "يرجى قراءة الشروط والأحكام بعناية قبل المتابعة",
    ),
    "recentCourses": MessageLookupByLibrary.simpleMessage("الدورات الحديثة"),
    "registerStudent": MessageLookupByLibrary.simpleMessage("تسجيل طالب"),
    "registrationFailed": MessageLookupByLibrary.simpleMessage("فشل التسجيل"),
    "reject": MessageLookupByLibrary.simpleMessage("رفض"),
    "rejected": MessageLookupByLibrary.simpleMessage("مرفوض"),
    "relatedCoursesTitle": MessageLookupByLibrary.simpleMessage(
      "الدورات ذات الصلة",
    ),
    "removeImageTooltip": MessageLookupByLibrary.simpleMessage("إزالة الصورة"),
    "renewableEnergy": MessageLookupByLibrary.simpleMessage("الطاقة المتجددة"),
    "rensendCode": MessageLookupByLibrary.simpleMessage("إعادة إرسال الرمز"),
    "requiredField": MessageLookupByLibrary.simpleMessage("حقل مطلوب"),
    "retry": MessageLookupByLibrary.simpleMessage("إعادة المحاولة"),
    "reviewsCount": m37,
    "roleAdmin": MessageLookupByLibrary.simpleMessage("مشرف"),
    "roleInstructor": MessageLookupByLibrary.simpleMessage("مدرب"),
    "roleStudent": MessageLookupByLibrary.simpleMessage("طالب"),
    "roleSuperAdmin": MessageLookupByLibrary.simpleMessage("مشرف عام"),
    "room": MessageLookupByLibrary.simpleMessage("القاعة"),
    "roomNumberHint": MessageLookupByLibrary.simpleMessage("أدخل رقم القاعة"),
    "roomNumberLabel": MessageLookupByLibrary.simpleMessage("رقم القاعة"),
    "searchCourses": MessageLookupByLibrary.simpleMessage(
      "البحث في الدورات...",
    ),
    "secondYear": MessageLookupByLibrary.simpleMessage("السنة الثانية"),
    "selectCategory": MessageLookupByLibrary.simpleMessage("اختر فئة"),
    "selectDateAttendance": MessageLookupByLibrary.simpleMessage(
      "اختر تاريخ الحضور",
    ),
    "selectDepartment": MessageLookupByLibrary.simpleMessage("اختر القسم"),
    "selectOneInstructor": MessageLookupByLibrary.simpleMessage(
      "اختر مدرب واحد",
    ),
    "selectTodayDateAttendance": MessageLookupByLibrary.simpleMessage(
      "يرجى اختيار تاريخ اليوم لعرض الحضور",
    ),
    "selectYear": MessageLookupByLibrary.simpleMessage("اختر السنة"),
    "selectedDate": m38,
    "sendAll": MessageLookupByLibrary.simpleMessage("إرسال للجميع"),
    "sendNotification": MessageLookupByLibrary.simpleMessage("إرسال إشعار"),
    "settings": MessageLookupByLibrary.simpleMessage("الإعدادات"),
    "showAllCourses": MessageLookupByLibrary.simpleMessage("عرض جميع الدورات"),
    "showingMultipleFilteredReviews": m39,
    "showingMultipleReviews": m40,
    "showingOneFilteredReview": m41,
    "showingOneReview": MessageLookupByLibrary.simpleMessage("عرض تقييم واحد"),
    "skillsAndPrerequisitesDescription": MessageLookupByLibrary.simpleMessage(
      "ما هي المهارات والمتطلبات المسبقة المطلوبة من الطالب",
    ),
    "splashLoading": MessageLookupByLibrary.simpleMessage("جاري التحميل..."),
    "splashText": MessageLookupByLibrary.simpleMessage(
      "المركز الجامعي للتطوير المهني",
    ),
    "startDateRequired": MessageLookupByLibrary.simpleMessage(
      "تاريخ البداية مطلوب",
    ),
    "starts": MessageLookupByLibrary.simpleMessage("يبدأ"),
    "statistics": MessageLookupByLibrary.simpleMessage("الإحصائيات"),
    "statisticsButtonSemanticLabel": m42,
    "statisticsButtonTitle": MessageLookupByLibrary.simpleMessage("الإحصائيات"),
    "statisticsButtonTooltip": MessageLookupByLibrary.simpleMessage(
      "عرض إحصائيات وتحليلات الدورة",
    ),
    "studentAcceptedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "تم قبول الطالب بنجاح",
    ),
    "studentAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "تم إضافة الطالب بنجاح",
    ),
    "studentAttendanceUnmarked": MessageLookupByLibrary.simpleMessage(
      "تم إلغاء تسجيل حضور الطالب",
    ),
    "studentEmailHint": MessageLookupByLibrary.simpleMessage(
      "أدخل بريد الطالب",
    ),
    "studentEmailLabel": MessageLookupByLibrary.simpleMessage("بريد الطالب"),
    "studentEmailRequired": MessageLookupByLibrary.simpleMessage(
      "بريد الطالب مطلوب",
    ),
    "studentInfo": MessageLookupByLibrary.simpleMessage("بيانات الطالب"),
    "studentInfoDescription": MessageLookupByLibrary.simpleMessage(
      "لنبدأ بتقديم بعض المعلومات عنك",
    ),
    "studentInterests": MessageLookupByLibrary.simpleMessage("اهتمامات الطالب"),
    "studentInterestsDescription": MessageLookupByLibrary.simpleMessage(
      "ما هي فئات الدورات التي تهتم بها",
    ),
    "studentMarkedAbsent": MessageLookupByLibrary.simpleMessage(
      "تم تسجيل الطالب كغائب",
    ),
    "studentMarkedPresent": MessageLookupByLibrary.simpleMessage(
      "تم تسجيل الطالب كحاضر",
    ),
    "studentNameHint": MessageLookupByLibrary.simpleMessage("أدخل اسم الطالب"),
    "studentNameLabel": MessageLookupByLibrary.simpleMessage("اسم الطالب"),
    "studentNameRequired": MessageLookupByLibrary.simpleMessage(
      "اسم الطالب مطلوب",
    ),
    "studentPasswordHint": MessageLookupByLibrary.simpleMessage(
      "أدخل كلمة مرور الطالب",
    ),
    "studentPasswordLabel": MessageLookupByLibrary.simpleMessage(
      "كلمة مرور الطالب",
    ),
    "studentUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "تم تحديث الطالب بنجاح",
    ),
    "students": MessageLookupByLibrary.simpleMessage("الطلاب"),
    "studentsByDepartmentAndYear": MessageLookupByLibrary.simpleMessage(
      "الطلاب حسب القسم والسنة",
    ),
    "studentsByDepartments": MessageLookupByLibrary.simpleMessage(
      "الطلاب حسب الأقسام",
    ),
    "studentsByYear": MessageLookupByLibrary.simpleMessage("الطلاب حسب السنة"),
    "studentsCount": m43,
    "studentsWillAppearEnrolled": MessageLookupByLibrary.simpleMessage(
      "سيظهر الطلاب هنا بمجرد تسجيلهم في الدورة",
    ),
    "success": MessageLookupByLibrary.simpleMessage("نجح"),
    "tapToAddImage": MessageLookupByLibrary.simpleMessage("اضغط لإضافة صورة"),
    "thirdYear": MessageLookupByLibrary.simpleMessage("السنة الثالثة"),
    "threeStars": MessageLookupByLibrary.simpleMessage("3 نجوم"),
    "totalCourses": MessageLookupByLibrary.simpleMessage("إجمالي الدورات"),
    "totalDays": m44,
    "totalStudents": MessageLookupByLibrary.simpleMessage("إجمالي الطلاب"),
    "trackEnrolledCourses": MessageLookupByLibrary.simpleMessage(
      "تتبع الدورات المسجلة والتقدم",
    ),
    "tryAgain": MessageLookupByLibrary.simpleMessage("حاول مرة أخرى"),
    "tryAgainLater": MessageLookupByLibrary.simpleMessage(
      "حاول مرة أخرى لاحقاً",
    ),
    "tryChangingFilters": MessageLookupByLibrary.simpleMessage(
      "جرب تغيير المرشحات أو مصطلحات البحث",
    ),
    "twoStars": MessageLookupByLibrary.simpleMessage("نجمتان"),
    "uccdMobileApp": MessageLookupByLibrary.simpleMessage("تطبيق UCCD"),
    "universityEmail": MessageLookupByLibrary.simpleMessage("البريد الجامعي"),
    "universityEmailHint": MessageLookupByLibrary.simpleMessage(
      "أدخل بريدك الجامعي",
    ),
    "universityEmailsOnly": MessageLookupByLibrary.simpleMessage(
      "البريد الجامعي فقط",
    ),
    "universityIdHint": MessageLookupByLibrary.simpleMessage(
      "أدخل الرقم الجامعي للطالب",
    ),
    "universityIdLabel": MessageLookupByLibrary.simpleMessage("الرقم الجامعي"),
    "universityIdLengthError": MessageLookupByLibrary.simpleMessage(
      "يجب أن يكون الرقم الجامعي 9 أرقام",
    ),
    "universityIdRequired": MessageLookupByLibrary.simpleMessage(
      "الرقم الجامعي مطلوب",
    ),
    "unknownError": MessageLookupByLibrary.simpleMessage("خطأ غير معروف"),
    "unmarkedCount": m45,
    "updateButtonLabel": MessageLookupByLibrary.simpleMessage("تحديث"),
    "uploadCourseMaterials": MessageLookupByLibrary.simpleMessage(
      "رفع مواد الدورة",
    ),
    "userAccountDisabled": MessageLookupByLibrary.simpleMessage(
      "حساب المستخدم معطل، تواصل مع الدعم",
    ),
    "userCreatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "تم إنشاء المستخدم بنجاح",
    ),
    "userDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "تم حذف المستخدم بنجاح",
    ),
    "userUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "تم تحديث المستخدم بنجاح",
    ),
    "usernameRequired": MessageLookupByLibrary.simpleMessage(
      "من فضلك أدخل اسم المستخدم",
    ),
    "users": MessageLookupByLibrary.simpleMessage("المستخدمون"),
    "verificationEmailInbox": MessageLookupByLibrary.simpleMessage(
      " مع رمز OTP، يرجى التحقق من صندوق الوارد",
    ),
    "verificationEmailSent": MessageLookupByLibrary.simpleMessage(
      "لقد أرسلنا بريد تحقق إلى ",
    ),
    "versionNumber": MessageLookupByLibrary.simpleMessage("الإصدار 1.0.0"),
    "viewAll": MessageLookupByLibrary.simpleMessage("عرض الكل"),
    "viewCourseButton": MessageLookupByLibrary.simpleMessage("عرض الدورة"),
    "welcomeBack": MessageLookupByLibrary.simpleMessage("أهلاً بعودتك،"),
    "welcomeBackComma": MessageLookupByLibrary.simpleMessage("أهلاً بعودتك، "),
    "welcomeTo": MessageLookupByLibrary.simpleMessage("أهلاً بك في"),
    "wrongPassword": MessageLookupByLibrary.simpleMessage("كلمة مرور خاطئة"),
    "yearHint": MessageLookupByLibrary.simpleMessage("السنة"),
    "yearLabel": MessageLookupByLibrary.simpleMessage("السنة"),
    "yes": MessageLookupByLibrary.simpleMessage("نعم"),
    "yourProgress": MessageLookupByLibrary.simpleMessage("تقدمك"),
  };
}
