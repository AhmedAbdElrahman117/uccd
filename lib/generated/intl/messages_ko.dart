// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ko locale. All the
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
  String get localeName => 'ko';

  static String m0(count) => "결석: ${count}";

  static String m1(count) => "결석: ${count}";

  static String m2(category) => "고급 ${category}";

  static String m3(courseName) => "아카이브된 과정 ${courseName} 통계 보기";

  static String m4(count) => "출석: ${count}";

  static String m5(category) => "초보자를 위한 ${category}";

  static String m6(count) => "${count}개 카테고리 사용 가능";

  static String m7(courseName) => "${courseName} 카테고리 변경";

  static String m8(courseName) => "${courseName} 강사 변경";

  static String m9(count) => "댓글: ${count}";

  static String m10(courseName) => "${courseName}에 등록하려고 합니다.";

  static String m11(startDate, endDate) => "과정 기간: ${startDate} - ${endDate}";

  static String m12(startDate, endDate) =>
      "과정은 ${startDate}부터 ${endDate}까지 진행됩니다";

  static String m13(courseName) => "${courseName} 평점 보기";

  static String m14(hours) => "${hours}시간";

  static String m15(weeks) => "${weeks}주";

  static String m16(courseName) => "${courseName} 학생들 보기";

  static String m17(date) => "날짜: ${date}";

  static String m18(courseName) => "${courseName} 삭제";

  static String m19(categoryName) =>
      "\"${categoryName}\"을(를) 삭제하시겠습니까?\n\n *이 작업은 되돌릴 수 없습니다.";

  static String m20(courseName) => "${courseName}을(를) 영구적으로 삭제하시겠습니까?";

  static String m21(courseName) => "${courseName} 편집";

  static String m22(errorMessage) => "오류: ${errorMessage}";

  static String m23(courseName) => "${courseName}에 성공적으로 등록되었습니다";

  static String m24(error) => "댓글 로딩 오류: ${error}";

  static String m25(error) => "이미지 선택 실패: ${error}";

  static String m26(errorMessage) => "출석 저장 실패: ${errorMessage}";

  static String m27(goalNumber) => "목표 ${goalNumber} 입력";

  static String m28(goalNumber) => "목표 ${goalNumber}";

  static String m29(name) => "강사: ${name}";

  static String m30(courseName) => "${courseName} 인터뷰 관리";

  static String m31(startDate, endDate) => "면접 기간: ${startDate} - ${endDate}";

  static String m32(startDate, endDate) =>
      "면접은 ${startDate}에 시작하여 ${endDate}에 종료됩니다";

  static String m33(count) => "좋아요: ${count}";

  static String m34(filter) => "${filter} 리뷰가 없습니다";

  static String m35(number) => "전제 조건/기술 ${number}";

  static String m36(count) => "출석: ${count}";

  static String m37(count) => "${count}개 리뷰";

  static String m38(date) => "선택됨: ${date}";

  static String m39(count, filter) => "${count}개 ${filter} 리뷰 표시";

  static String m40(count) => "${count}개 리뷰 표시";

  static String m41(filter) => "1개 ${filter} 리뷰 표시";

  static String m42(courseName) => "${courseName} 통계 보기";

  static String m43(count) => "학생 (${count})";

  static String m44(days) => "총: ${days}일";

  static String m45(count) => "미표시: ${count}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "Absent": MessageLookupByLibrary.simpleMessage("결석한"),
    "Active": MessageLookupByLibrary.simpleMessage("활성"),
    "Archived": MessageLookupByLibrary.simpleMessage("보관됨"),
    "Back": MessageLookupByLibrary.simpleMessage("뒤쪽에"),
    "ComingSoon": MessageLookupByLibrary.simpleMessage("곧 출시 예정"),
    "ComingSoonlabel": MessageLookupByLibrary.simpleMessage("이 기능은 곧 출시됩니다!"),
    "CreatedOn": MessageLookupByLibrary.simpleMessage("생성됨"),
    "Disability": MessageLookupByLibrary.simpleMessage("무능"),
    "Hour": MessageLookupByLibrary.simpleMessage("시간"),
    "IAgree": MessageLookupByLibrary.simpleMessage("동의합니다"),
    "LiveData": MessageLookupByLibrary.simpleMessage("라이브 데이터"),
    "ManageCourses": MessageLookupByLibrary.simpleMessage("과정 관리"),
    "Next": MessageLookupByLibrary.simpleMessage("다음"),
    "No": MessageLookupByLibrary.simpleMessage("아니요"),
    "NothingToEdit": MessageLookupByLibrary.simpleMessage("편집할 것이 없습니다"),
    "Post": MessageLookupByLibrary.simpleMessage("우편"),
    "Present": MessageLookupByLibrary.simpleMessage("현재의"),
    "Review": MessageLookupByLibrary.simpleMessage("리뷰"),
    "SkillsAndPrerequisites": MessageLookupByLibrary.simpleMessage(
      "기술 및 전제 조건",
    ),
    "Student": MessageLookupByLibrary.simpleMessage("학생"),
    "Submit": MessageLookupByLibrary.simpleMessage("제출하다"),
    "SystemConfiguration": MessageLookupByLibrary.simpleMessage("시스템 구성"),
    "TermsAndConditions": MessageLookupByLibrary.simpleMessage("이용약관"),
    "TermsText1": MessageLookupByLibrary.simpleMessage(
      "저는 UCCD가 UCCD 보고, 출판 및 고용주 네트워킹 목적으로 센터에서 제공하는 교육 프로그램 및/또는 경력 개발 서비스에 참여하는 동안 촬영한 데이터와 사진을 사용하는 것에 동의하고 이를 승인합니다.",
    ),
    "TermsText2": MessageLookupByLibrary.simpleMessage(
      "그리고 UCCD 앱이 분석 및 사용자 경험 개선을 위해 내 코스 참여에 대한 데이터를 수집하도록 승인합니다.",
    ),
    "Unmarked": MessageLookupByLibrary.simpleMessage("표시되지 않음"),
    "WhatYouWillLearn": MessageLookupByLibrary.simpleMessage("당신이 배울 것"),
    "aboutThisCourseTitle": MessageLookupByLibrary.simpleMessage("이 과정에 대하여"),
    "absenceDaysTitle": MessageLookupByLibrary.simpleMessage("결석일"),
    "absent": MessageLookupByLibrary.simpleMessage("결석"),
    "absentCount": m0,
    "absentDays": m1,
    "accept": MessageLookupByLibrary.simpleMessage("수락"),
    "accepted": MessageLookupByLibrary.simpleMessage("승인됨"),
    "account": MessageLookupByLibrary.simpleMessage("계정"),
    "actions": MessageLookupByLibrary.simpleMessage("작업"),
    "activeStudents": MessageLookupByLibrary.simpleMessage("활성 학생"),
    "addAdminTitle": MessageLookupByLibrary.simpleMessage("관리자 추가"),
    "addButtonLabel": MessageLookupByLibrary.simpleMessage("추가"),
    "addCategory": MessageLookupByLibrary.simpleMessage("카테고리 추가"),
    "addCategoryTitle": MessageLookupByLibrary.simpleMessage("카테고리 추가"),
    "addCommentHint": MessageLookupByLibrary.simpleMessage("댓글을 추가하세요..."),
    "addCourse": MessageLookupByLibrary.simpleMessage("과정 추가"),
    "addCourseTitle": MessageLookupByLibrary.simpleMessage("과정 추가"),
    "addGoal": MessageLookupByLibrary.simpleMessage("목표 추가"),
    "addInstructor": MessageLookupByLibrary.simpleMessage("강사 추가"),
    "addInstructorTitle": MessageLookupByLibrary.simpleMessage("강사 추가"),
    "addPost": MessageLookupByLibrary.simpleMessage("게시물 추가"),
    "addPrerequisiteSkill": MessageLookupByLibrary.simpleMessage("전제 조건/기술 추가"),
    "addStudent": MessageLookupByLibrary.simpleMessage("학생 추가"),
    "addStudentTitle": MessageLookupByLibrary.simpleMessage("학생 추가"),
    "admin": MessageLookupByLibrary.simpleMessage("관리자"),
    "adminAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "관리자가 성공적으로 추가되었습니다",
    ),
    "adminDashboard": MessageLookupByLibrary.simpleMessage("관리자 대시보드"),
    "adminEmailHint": MessageLookupByLibrary.simpleMessage("관리자 이메일을 입력하세요"),
    "adminEmailLabel": MessageLookupByLibrary.simpleMessage("관리자 이메일"),
    "adminFeatures": MessageLookupByLibrary.simpleMessage("관리자 기능"),
    "adminNameHint": MessageLookupByLibrary.simpleMessage("관리자 사용자명을 입력하세요"),
    "adminNameLabel": MessageLookupByLibrary.simpleMessage("관리자 이름"),
    "adminPasswordLabel": MessageLookupByLibrary.simpleMessage("관리자 비밀번호"),
    "adminUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "관리자가 성공적으로 업데이트되었습니다",
    ),
    "admins": MessageLookupByLibrary.simpleMessage("관리자들"),
    "advancedCourse": m2,
    "all": MessageLookupByLibrary.simpleMessage("전체"),
    "allRatings": MessageLookupByLibrary.simpleMessage("전체"),
    "arabic": MessageLookupByLibrary.simpleMessage("아랍어"),
    "archivePanel": MessageLookupByLibrary.simpleMessage("아카이브 패널"),
    "archiveStatisticsSemanticLabel": m3,
    "archiveStatisticsTooltip": MessageLookupByLibrary.simpleMessage(
      "아카이브된 과정 통계 및 분석 보기",
    ),
    "archivedCourses": MessageLookupByLibrary.simpleMessage("보관소"),
    "assignedCourses": MessageLookupByLibrary.simpleMessage("할당된 과정"),
    "attend": MessageLookupByLibrary.simpleMessage("출석"),
    "attendanceOnlyToday": MessageLookupByLibrary.simpleMessage(
      "출석은 오늘 날짜에만 가능합니다",
    ),
    "attendanceOnlyTodayDate": MessageLookupByLibrary.simpleMessage(
      "출석은 오늘 날짜에만 표시할 수 있습니다",
    ),
    "attendedDays": m4,
    "authInvalidEmail": MessageLookupByLibrary.simpleMessage("유효하지 않은 이메일"),
    "autoDepartment": MessageLookupByLibrary.simpleMessage("오토트로닉스"),
    "autotronics": MessageLookupByLibrary.simpleMessage("오토트로닉스"),
    "available": MessageLookupByLibrary.simpleMessage("사용 가능"),
    "availableCourses": MessageLookupByLibrary.simpleMessage("사용 가능"),
    "beFirstToComment": MessageLookupByLibrary.simpleMessage(
      "이 게시물에 첫 번째로 댓글을 달아보세요!",
    ),
    "beFirstToShare": MessageLookupByLibrary.simpleMessage(
      "커뮤니티와 처음으로 무언가를 공유해보세요!",
    ),
    "beginnerCourse": m5,
    "browseCourses": MessageLookupByLibrary.simpleMessage("과정 찾아보기"),
    "browseCoursesHint": MessageLookupByLibrary.simpleMessage(
      "사용 가능한 과정을 찾아보고 등록하여 여기에서 확인하세요",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("취소"),
    "cancelButtonLabel": MessageLookupByLibrary.simpleMessage("취소"),
    "categories": MessageLookupByLibrary.simpleMessage("카테고리들"),
    "categoriesLabel": MessageLookupByLibrary.simpleMessage("카테고리들"),
    "categoriesOverview": MessageLookupByLibrary.simpleMessage("카테고리 개요"),
    "categoryAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "카테고리가 성공적으로 추가되었습니다",
    ),
    "categoryAvailable": m6,
    "categoryChangedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "카테고리가 성공적으로 변경되었습니다",
    ),
    "categoryDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "카테고리가 성공적으로 삭제되었습니다",
    ),
    "categoryNameHint": MessageLookupByLibrary.simpleMessage("카테고리 이름을 입력하세요"),
    "categoryNameLabel": MessageLookupByLibrary.simpleMessage("카테고리 이름"),
    "categoryNameRequired": MessageLookupByLibrary.simpleMessage(
      "카테고리 이름이 필요합니다",
    ),
    "categoryUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "카테고리가 성공적으로 업데이트되었습니다",
    ),
    "categoryUsageInfo": MessageLookupByLibrary.simpleMessage(
      "이 카테고리는 강좌와 콘텐츠를 정리하는 데 사용할 수 있습니다.",
    ),
    "change": MessageLookupByLibrary.simpleMessage("변경"),
    "changeCategory": MessageLookupByLibrary.simpleMessage("카테고리 변경"),
    "changeCategoryButtonSemanticLabel": m7,
    "changeCategoryButtonTitle": MessageLookupByLibrary.simpleMessage(
      "카테고리 변경",
    ),
    "changeCategoryButtonTooltip": MessageLookupByLibrary.simpleMessage(
      "과정 카테고리 변경",
    ),
    "changeInstructor": MessageLookupByLibrary.simpleMessage("강사 변경"),
    "changeInstructorButtonSemanticLabel": m8,
    "changeInstructorButtonTitle": MessageLookupByLibrary.simpleMessage(
      "강사 변경",
    ),
    "changeInstructorButtonTooltip": MessageLookupByLibrary.simpleMessage(
      "과정 강사 변경",
    ),
    "checkInternetConnection": MessageLookupByLibrary.simpleMessage(
      "인터넷 연결을 확인하고 나중에 다시 시도하세요",
    ),
    "checkInternetConnectionAndTryAgain": MessageLookupByLibrary.simpleMessage(
      "인터넷 연결을 확인하고 다시 시도하세요",
    ),
    "closeDialogTooltip": MessageLookupByLibrary.simpleMessage("대화상자 닫기"),
    "codeResent": MessageLookupByLibrary.simpleMessage("코드가 다시 전송됨"),
    "commentAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "댓글이 성공적으로 추가되었습니다",
    ),
    "commentValidationEmpty": MessageLookupByLibrary.simpleMessage(
      "댓글을 입력해주세요",
    ),
    "commentValidationTrimmed": MessageLookupByLibrary.simpleMessage(
      "댓글이 비어있을 수 없습니다",
    ),
    "commentsButtonLabel": MessageLookupByLibrary.simpleMessage("댓글"),
    "commentsCount": m9,
    "commentsTitle": MessageLookupByLibrary.simpleMessage("댓글"),
    "community": MessageLookupByLibrary.simpleMessage("커뮤니티"),
    "communityPost": MessageLookupByLibrary.simpleMessage("커뮤니티 게시물"),
    "communitySubtitle": MessageLookupByLibrary.simpleMessage(
      "UCCD 센터의 이벤트를 팔로우하세요",
    ),
    "communityTitle": MessageLookupByLibrary.simpleMessage("커뮤니티"),
    "completed": MessageLookupByLibrary.simpleMessage("완료됨"),
    "confirmButton": MessageLookupByLibrary.simpleMessage("확인"),
    "confirmEnrollmentMessage": m10,
    "confirmEnrollmentTitle": MessageLookupByLibrary.simpleMessage("등록 확인"),
    "connectionTimeout": MessageLookupByLibrary.simpleMessage("연결 시간 초과"),
    "connectionTimeoutTryAgain": MessageLookupByLibrary.simpleMessage(
      "연결 시간 초과, 나중에 다시 시도하세요",
    ),
    "contactSupport": MessageLookupByLibrary.simpleMessage("지원팀 문의"),
    "contentRating": MessageLookupByLibrary.simpleMessage("내용"),
    "continueLearningJourney": MessageLookupByLibrary.simpleMessage(
      "학습 여정을 계속하세요",
    ),
    "controlPanel": MessageLookupByLibrary.simpleMessage("제어판"),
    "course": MessageLookupByLibrary.simpleMessage("과정"),
    "courseAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "과정이 성공적으로 추가되었습니다",
    ),
    "courseAnalytics": MessageLookupByLibrary.simpleMessage("과정 분석"),
    "courseDates": MessageLookupByLibrary.simpleMessage("과정 날짜"),
    "courseDatesDescription": MessageLookupByLibrary.simpleMessage(
      "이제 과정 날짜를 설정해보겠습니다",
    ),
    "courseDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "과정이 성공적으로 삭제되었습니다",
    ),
    "courseEndDateAfterInterviews": MessageLookupByLibrary.simpleMessage(
      "과정 종료 날짜는 인터뷰 이후여야 합니다",
    ),
    "courseEndDateAfterStartDate": MessageLookupByLibrary.simpleMessage(
      "과정 종료 날짜는 시작 날짜보다 이후여야 합니다",
    ),
    "courseEndDateHint": MessageLookupByLibrary.simpleMessage("과정 종료 날짜 입력"),
    "courseEndDateLabel": MessageLookupByLibrary.simpleMessage("과정 종료 날짜"),
    "courseEndDateRequired": MessageLookupByLibrary.simpleMessage("종료 날짜 필수"),
    "courseFull": MessageLookupByLibrary.simpleMessage("가득 참"),
    "courseGoals": MessageLookupByLibrary.simpleMessage("과정 목표"),
    "courseGoalsDescription": MessageLookupByLibrary.simpleMessage(
      "학생을 위한 과정 결과 설정",
    ),
    "courseGoalsNote": MessageLookupByLibrary.simpleMessage(
      "참고: 최소 하나의 목표를 설정해야 합니다",
    ),
    "courseImage": MessageLookupByLibrary.simpleMessage("과정 이미지"),
    "courseImageDescription": MessageLookupByLibrary.simpleMessage(
      "마지막으로 과정에 이미지를 추가할 수 있습니다",
    ),
    "courseImageNote": MessageLookupByLibrary.simpleMessage(
      "참고: 과정에 이미지를 추가하지 않으면 자동으로 UCCD 로고가 표시됩니다",
    ),
    "courseInfo": MessageLookupByLibrary.simpleMessage("과정 정보"),
    "courseInfoDescription": MessageLookupByLibrary.simpleMessage(
      "과정 기본 정보부터 시작하겠습니다",
    ),
    "coursePeriodLabel": m11,
    "coursePeriodSubtitle": m12,
    "coursePeriodTitle": MessageLookupByLibrary.simpleMessage("과정 기간"),
    "courseRatingsSemanticLabel": m13,
    "courseRatingsTooltip": MessageLookupByLibrary.simpleMessage(
      "과정 평점 및 피드백 보기",
    ),
    "courseScheduleTitle": MessageLookupByLibrary.simpleMessage("과정 일정"),
    "courseStartDateAfterInterviews": MessageLookupByLibrary.simpleMessage(
      "과정 시작 날짜는 인터뷰 이후여야 합니다",
    ),
    "courseStartDateBeforeEndDate": MessageLookupByLibrary.simpleMessage(
      "과정 시작 날짜는 종료 날짜보다 이전이어야 합니다",
    ),
    "courseStartDateHint": MessageLookupByLibrary.simpleMessage("과정 시작 날짜 입력"),
    "courseStartDateLabel": MessageLookupByLibrary.simpleMessage("과정 시작 날짜"),
    "courseStartDateRequired": MessageLookupByLibrary.simpleMessage("시작 날짜 필수"),
    "courseStatsDuration": MessageLookupByLibrary.simpleMessage("기간"),
    "courseStatsDurationValue": m14,
    "courseStatsLength": MessageLookupByLibrary.simpleMessage("수업 기간"),
    "courseStatsLengthValue": m15,
    "courseStatsPrerequisites": MessageLookupByLibrary.simpleMessage("선수과목"),
    "courseStatsRoom": MessageLookupByLibrary.simpleMessage("강의실"),
    "courseStudentsSemanticLabel": m16,
    "courseStudentsTooltip": MessageLookupByLibrary.simpleMessage(
      "아카이브된 과정 학생들 보기",
    ),
    "courseTimelineTitle": MessageLookupByLibrary.simpleMessage("과정 일정표"),
    "courseTitleHint": MessageLookupByLibrary.simpleMessage("과정 제목 입력"),
    "courseTitleLabel": MessageLookupByLibrary.simpleMessage("과정 제목"),
    "courseUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "과정이 성공적으로 업데이트되었습니다",
    ),
    "courses": MessageLookupByLibrary.simpleMessage("과정"),
    "coursesManagement": MessageLookupByLibrary.simpleMessage("과정 관리"),
    "coursesWillAppear": MessageLookupByLibrary.simpleMessage(
      "과정이 사용 가능해지면 여기에 나타납니다",
    ),
    "coursesWillAppearAssigned": MessageLookupByLibrary.simpleMessage(
      "과정이 할당되면 여기에 표시됩니다",
    ),
    "createNewCourse": MessageLookupByLibrary.simpleMessage("새 과정 만들기"),
    "createPostButton": MessageLookupByLibrary.simpleMessage("게시물 작성"),
    "createPostDialogTitle": MessageLookupByLibrary.simpleMessage("게시물 작성"),
    "currentYear": MessageLookupByLibrary.simpleMessage("현재 학년"),
    "darkMode": MessageLookupByLibrary.simpleMessage("다크 모드"),
    "dashboard": MessageLookupByLibrary.simpleMessage("대시보드"),
    "dashboardOverview": MessageLookupByLibrary.simpleMessage("대시보드 개요"),
    "dateLabel": m17,
    "dateRequired": MessageLookupByLibrary.simpleMessage("날짜 필수"),
    "delete": MessageLookupByLibrary.simpleMessage("삭제"),
    "deleteButtonSemanticLabel": m18,
    "deleteButtonText": MessageLookupByLibrary.simpleMessage("삭제"),
    "deleteButtonTitle": MessageLookupByLibrary.simpleMessage("삭제"),
    "deleteButtonTooltip": MessageLookupByLibrary.simpleMessage("과정을 영구적으로 삭제"),
    "deleteCategoryConfirmation": m19,
    "deleteCourseConfirmMessage": m20,
    "deleteDialogTitle": MessageLookupByLibrary.simpleMessage("삭제"),
    "deletePostConfirmMessage": MessageLookupByLibrary.simpleMessage(
      "이 게시물을 삭제하시겠습니까?",
    ),
    "deletePostOption": MessageLookupByLibrary.simpleMessage("게시물 삭제"),
    "deletePostTitle": MessageLookupByLibrary.simpleMessage("게시물 삭제"),
    "department": MessageLookupByLibrary.simpleMessage("학과"),
    "departmentHint": MessageLookupByLibrary.simpleMessage("학과"),
    "departmentLabel": MessageLookupByLibrary.simpleMessage("학과"),
    "descriptionHint": MessageLookupByLibrary.simpleMessage("과정 설명 입력"),
    "descriptionLabel": MessageLookupByLibrary.simpleMessage("설명"),
    "didntRecieveCode": MessageLookupByLibrary.simpleMessage("코드를 받지 못하셨나요?"),
    "disabilityLabel": MessageLookupByLibrary.simpleMessage("장애"),
    "durationHint": MessageLookupByLibrary.simpleMessage("과정 기간 입력"),
    "durationLabel": MessageLookupByLibrary.simpleMessage("기간"),
    "edit": MessageLookupByLibrary.simpleMessage("편집"),
    "editAdminTitle": MessageLookupByLibrary.simpleMessage("관리자 편집"),
    "editButtonLabel": MessageLookupByLibrary.simpleMessage("편집"),
    "editButtonSemanticLabel": m21,
    "editButtonTitle": MessageLookupByLibrary.simpleMessage("편집"),
    "editButtonTooltip": MessageLookupByLibrary.simpleMessage("과정 정보 및 설정 편집"),
    "editCategoryTitle": MessageLookupByLibrary.simpleMessage("카테고리 편집"),
    "editCourseTitle": MessageLookupByLibrary.simpleMessage("과정 편집"),
    "editInstructorTitle": MessageLookupByLibrary.simpleMessage("강사 편집"),
    "editPostContentHint": MessageLookupByLibrary.simpleMessage(
      "게시물을 편집하세요...",
    ),
    "editPostDialogTitle": MessageLookupByLibrary.simpleMessage("게시물 편집"),
    "editPostOption": MessageLookupByLibrary.simpleMessage("게시물 편집"),
    "editStudentTitle": MessageLookupByLibrary.simpleMessage("학생 편집"),
    "emailAlreadyInUse": MessageLookupByLibrary.simpleMessage(
      "이메일이 이미 사용 중입니다",
    ),
    "emailNotEnabled": MessageLookupByLibrary.simpleMessage(
      "이메일이 활성화되지 않음, 지원팀에 문의하세요",
    ),
    "emailOrPasswordInvalid": MessageLookupByLibrary.simpleMessage(
      "이메일 또는 비밀번호가 유효하지 않습니다",
    ),
    "emailRequired": MessageLookupByLibrary.simpleMessage("이메일 필드는 필수입니다"),
    "emailUsernameTooShort": MessageLookupByLibrary.simpleMessage(
      "이메일 사용자명은 최소 3자 이상이어야 합니다",
    ),
    "endDateRequired": MessageLookupByLibrary.simpleMessage("종료 날짜 필수"),
    "ended": MessageLookupByLibrary.simpleMessage("종료됨"),
    "ends": MessageLookupByLibrary.simpleMessage("종료"),
    "english": MessageLookupByLibrary.simpleMessage("영어"),
    "enroll": MessageLookupByLibrary.simpleMessage("등록"),
    "enrollNow": MessageLookupByLibrary.simpleMessage("지금 등록"),
    "enrollNowButton": MessageLookupByLibrary.simpleMessage("지금 등록"),
    "enrolledInThisCategory": MessageLookupByLibrary.simpleMessage(
      "이 카테고리에 등록됨",
    ),
    "enrollmentAlmostFull": MessageLookupByLibrary.simpleMessage("거의 마감!"),
    "enrollmentError": m22,
    "enrollmentFillingUp": MessageLookupByLibrary.simpleMessage("마감 임박"),
    "enrollmentFull": MessageLookupByLibrary.simpleMessage("정원 마감"),
    "enrollmentSpotsAvailable": MessageLookupByLibrary.simpleMessage("여석 있음"),
    "enrollmentSuccess": m23,
    "enrollments": MessageLookupByLibrary.simpleMessage("등록"),
    "enterInterviewEndDate": MessageLookupByLibrary.simpleMessage(
      "인터뷰 종료 날짜 입력",
    ),
    "enterInterviewStartDate": MessageLookupByLibrary.simpleMessage(
      "인터뷰 시작 날짜 입력",
    ),
    "enterMaxAcceptedStudents": MessageLookupByLibrary.simpleMessage(
      "최대 승인 학생 수 입력",
    ),
    "error": MessageLookupByLibrary.simpleMessage("오류"),
    "errorLoadingComments": m24,
    "errorLoadingCourses": MessageLookupByLibrary.simpleMessage("과정 로딩 오류"),
    "errorLoadingRatings": MessageLookupByLibrary.simpleMessage("평점 로딩 오류"),
    "errorLoadingStudents": MessageLookupByLibrary.simpleMessage("학생 로딩 오류"),
    "failed": MessageLookupByLibrary.simpleMessage("실패"),
    "failedToLoadCourses": MessageLookupByLibrary.simpleMessage("과정 로딩 실패"),
    "failedToLoadCoursesWithHelp": MessageLookupByLibrary.simpleMessage(
      "코스를 로드하지 못했습니다.\n인터넷 연결을 확인하고 다시 시도하세요.",
    ),
    "failedToLoadData": MessageLookupByLibrary.simpleMessage("데이터 검색 실패"),
    "failedToPickImage": m25,
    "failedToSaveAttendance": m26,
    "firstYear": MessageLookupByLibrary.simpleMessage("첫 번째 년도"),
    "fiveStars": MessageLookupByLibrary.simpleMessage("5점"),
    "fourStars": MessageLookupByLibrary.simpleMessage("4점"),
    "fourthYear": MessageLookupByLibrary.simpleMessage("네 개 년도"),
    "genderLabel": MessageLookupByLibrary.simpleMessage("성별"),
    "goalHint": m27,
    "goalLabel": m28,
    "graduationYear": MessageLookupByLibrary.simpleMessage("졸업년도"),
    "graduationYearHint": MessageLookupByLibrary.simpleMessage(
      "예상 졸업년도를 입력하세요",
    ),
    "graduationYearIncorrect": MessageLookupByLibrary.simpleMessage(
      "졸업년도가 올바르지 않습니다",
    ),
    "graduationYearLabel": MessageLookupByLibrary.simpleMessage("졸업년도"),
    "home": MessageLookupByLibrary.simpleMessage("홈"),
    "imageSizeLimit": MessageLookupByLibrary.simpleMessage(
      "이미지 크기 제한은 10MB입니다",
    ),
    "inProgress": MessageLookupByLibrary.simpleMessage("진행 중"),
    "informationTechnology": MessageLookupByLibrary.simpleMessage("정보기술"),
    "instructor": MessageLookupByLibrary.simpleMessage("강사"),
    "instructorAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "강사가 성공적으로 추가되었습니다",
    ),
    "instructorCreatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "강사가 성공적으로 생성되었습니다",
    ),
    "instructorDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "강사가 성공적으로 삭제되었습니다",
    ),
    "instructorEmailHint": MessageLookupByLibrary.simpleMessage(
      "강사 이메일을 입력하세요",
    ),
    "instructorEmailLabel": MessageLookupByLibrary.simpleMessage("강사 이메일"),
    "instructorLabel": m29,
    "instructorNameHint": MessageLookupByLibrary.simpleMessage("강사 이름을 입력하세요"),
    "instructorNameLabel": MessageLookupByLibrary.simpleMessage("강사 이름"),
    "instructorPasswordHint": MessageLookupByLibrary.simpleMessage(
      "강사 비밀번호 입력",
    ),
    "instructorPasswordLabel": MessageLookupByLibrary.simpleMessage("강사 비밀번호"),
    "instructorRating": MessageLookupByLibrary.simpleMessage("강사"),
    "instructorTitle": MessageLookupByLibrary.simpleMessage("강사"),
    "instructorUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "강사가 성공적으로 업데이트되었습니다",
    ),
    "instructors": MessageLookupByLibrary.simpleMessage("강사들"),
    "instructorsLabel": MessageLookupByLibrary.simpleMessage("강사들"),
    "interview": MessageLookupByLibrary.simpleMessage("인터뷰"),
    "interviewBeforeCourse": MessageLookupByLibrary.simpleMessage(
      "면접 날짜는 과정 날짜보다 먼저여야 합니다",
    ),
    "interviewButtonSemanticLabel": m30,
    "interviewButtonTitle": MessageLookupByLibrary.simpleMessage("인터뷰"),
    "interviewButtonTooltip": MessageLookupByLibrary.simpleMessage(
      "과정 인터뷰 및 지원서 관리",
    ),
    "interviewDatesBeforeCourseDates": MessageLookupByLibrary.simpleMessage(
      "인터뷰 날짜는 코스 날짜보다 이전이어야 합니다",
    ),
    "interviewEndDate": MessageLookupByLibrary.simpleMessage("인터뷰 종료 날짜"),
    "interviewEndDateAfterStartDate": MessageLookupByLibrary.simpleMessage(
      "인터뷰 종료 날짜는 시작 날짜보다 이후여야 합니다",
    ),
    "interviewEndDateBeforeCourses": MessageLookupByLibrary.simpleMessage(
      "인터뷰 종료 날짜는 코스보다 이전이어야 합니다",
    ),
    "interviewPeriodLabel": m31,
    "interviewPeriodSubtitle": m32,
    "interviewPeriodTitle": MessageLookupByLibrary.simpleMessage("면접 기간"),
    "interviewStartDate": MessageLookupByLibrary.simpleMessage("인터뷰 시작 날짜"),
    "interviewStartDateBeforeCourses": MessageLookupByLibrary.simpleMessage(
      "인터뷰 시작 날짜는 코스보다 이전이어야 합니다",
    ),
    "interviewStartDateBeforeEndDate": MessageLookupByLibrary.simpleMessage(
      "인터뷰 시작 날짜는 종료 날짜보다 이전이어야 합니다",
    ),
    "invalidCourseDates": MessageLookupByLibrary.simpleMessage("유효하지 않은 코스 날짜"),
    "invalidEmail": MessageLookupByLibrary.simpleMessage("유효한 이메일 주소를 입력하세요"),
    "invalidInterviewDates": MessageLookupByLibrary.simpleMessage(
      "유효하지 않은 인터뷰 날짜",
    ),
    "invalidPhoneNumber": MessageLookupByLibrary.simpleMessage("유효하지 않은 전화번호"),
    "itDepartment": MessageLookupByLibrary.simpleMessage("정보기술"),
    "korean": MessageLookupByLibrary.simpleMessage("한국어"),
    "language": MessageLookupByLibrary.simpleMessage("언어"),
    "likeButtonLabel": MessageLookupByLibrary.simpleMessage("좋아요"),
    "likesCount": m33,
    "loadingComment": MessageLookupByLibrary.simpleMessage(
      "실제 내용으로 대체될 댓글 텍스트를 로딩 중...",
    ),
    "loadingText": MessageLookupByLibrary.simpleMessage("로딩 중"),
    "loadingUserName": MessageLookupByLibrary.simpleMessage("사용자 이름 로딩 중"),
    "loginButton": MessageLookupByLibrary.simpleMessage("로그인"),
    "logout": MessageLookupByLibrary.simpleMessage("로그아웃"),
    "logoutButtonText": MessageLookupByLibrary.simpleMessage("로그아웃"),
    "logoutConfirmation": MessageLookupByLibrary.simpleMessage("로그아웃하시겠습니까"),
    "logoutDialogTitle": MessageLookupByLibrary.simpleMessage("로그아웃"),
    "logs": MessageLookupByLibrary.simpleMessage("로그"),
    "manageCategories": MessageLookupByLibrary.simpleMessage("카테고리 관리"),
    "manageCategoriesEfficiently": MessageLookupByLibrary.simpleMessage(
      "카테고리를 효율적으로 관리하세요",
    ),
    "maxAcceptedStudents": MessageLookupByLibrary.simpleMessage("최대 승인 학생 수"),
    "mechaDepartment": MessageLookupByLibrary.simpleMessage("메카트로닉스"),
    "mechatronics": MessageLookupByLibrary.simpleMessage("메카트로닉스"),
    "monthApr": MessageLookupByLibrary.simpleMessage("4월"),
    "monthAug": MessageLookupByLibrary.simpleMessage("8월"),
    "monthDec": MessageLookupByLibrary.simpleMessage("12월"),
    "monthFeb": MessageLookupByLibrary.simpleMessage("2월"),
    "monthJan": MessageLookupByLibrary.simpleMessage("1월"),
    "monthJul": MessageLookupByLibrary.simpleMessage("7월"),
    "monthJun": MessageLookupByLibrary.simpleMessage("6월"),
    "monthMar": MessageLookupByLibrary.simpleMessage("3월"),
    "monthMay": MessageLookupByLibrary.simpleMessage("5월"),
    "monthNov": MessageLookupByLibrary.simpleMessage("11월"),
    "monthOct": MessageLookupByLibrary.simpleMessage("10월"),
    "monthSep": MessageLookupByLibrary.simpleMessage("9월"),
    "multipleCheck": MessageLookupByLibrary.simpleMessage("다중 체크"),
    "myCourses": MessageLookupByLibrary.simpleMessage("내 과정"),
    "myCoursesTitle": MessageLookupByLibrary.simpleMessage("내 과정"),
    "nameRequired": MessageLookupByLibrary.simpleMessage("이름이 필요합니다"),
    "nationalIdHint": MessageLookupByLibrary.simpleMessage("주민등록번호를 입력하세요"),
    "nationalIdLabel": MessageLookupByLibrary.simpleMessage("주민등록번호"),
    "nationalIdLengthError": MessageLookupByLibrary.simpleMessage(
      "주민등록번호는 14자리여야 합니다",
    ),
    "nationalIdRequired": MessageLookupByLibrary.simpleMessage("주민등록번호 필수"),
    "newInstructor": MessageLookupByLibrary.simpleMessage("새 강사"),
    "noAcceptedStudents": MessageLookupByLibrary.simpleMessage("승인된 학생이 없습니다"),
    "noCategoriesRegistered": MessageLookupByLibrary.simpleMessage(
      "등록된 카테고리가 없습니다",
    ),
    "noCommentsYet": MessageLookupByLibrary.simpleMessage("아직 댓글이 없습니다"),
    "noCoursesAssignedYet": MessageLookupByLibrary.simpleMessage(
      "아직 할당된 과정이 없습니다",
    ),
    "noCoursesAvailable": MessageLookupByLibrary.simpleMessage(
      "사용 가능한 과정이 없습니다",
    ),
    "noCoursesFound": MessageLookupByLibrary.simpleMessage("코스를 찾을 수 없습니다"),
    "noCoursesInProgress": MessageLookupByLibrary.simpleMessage(
      "진행 중인 과정이 없습니다",
    ),
    "noEnrolledCourses": MessageLookupByLibrary.simpleMessage("등록된 과정이 없습니다"),
    "noFilteredReviews": m34,
    "noGoalsProvided": MessageLookupByLibrary.simpleMessage("제공된 목표가 없습니다"),
    "noInstructorsRegistered": MessageLookupByLibrary.simpleMessage(
      "등록된 강사가 없습니다",
    ),
    "noInternetConnection": MessageLookupByLibrary.simpleMessage(
      "인터넷 연결이 없습니다",
    ),
    "noLogsInThisDay": MessageLookupByLibrary.simpleMessage("이 날에는 로그가 없습니다"),
    "noPostsYet": MessageLookupByLibrary.simpleMessage("아직 게시물이 없습니다"),
    "noRatingsMessage": MessageLookupByLibrary.simpleMessage(
      "이 과정은 아직 평점을 받지 못했습니다.",
    ),
    "noRatingsYet": MessageLookupByLibrary.simpleMessage("아직 평점이 없습니다"),
    "noRegisteredCategories": MessageLookupByLibrary.simpleMessage(
      "등록된 카테고리가 없습니다",
    ),
    "noReviewsYet": MessageLookupByLibrary.simpleMessage("아직 리뷰가 없습니다"),
    "noStudentsEnrolled": MessageLookupByLibrary.simpleMessage("등록된 학생 없음"),
    "noStudentsToInterview": MessageLookupByLibrary.simpleMessage(
      "인터뷰할 학생이 없습니다",
    ),
    "noSuchEmailFound": MessageLookupByLibrary.simpleMessage(
      "해당 이메일을 찾을 수 없습니다",
    ),
    "noUser": MessageLookupByLibrary.simpleMessage("사용자 없음"),
    "noUserFoundContactSupport": MessageLookupByLibrary.simpleMessage(
      "사용자를 찾을 수 없습니다\n지원팀에 문의하세요",
    ),
    "notificationSentSuccessfully": MessageLookupByLibrary.simpleMessage(
      "알림이 성공적으로 전송되었습니다",
    ),
    "onTerms": MessageLookupByLibrary.simpleMessage("UCCD 센터 이용 약관에 관하여"),
    "oneStar": MessageLookupByLibrary.simpleMessage("1점"),
    "onlyBtuEmail": MessageLookupByLibrary.simpleMessage(
      "BTU 대학 이메일(@btu.edu.eg)만 허용됩니다",
    ),
    "opDepartment": MessageLookupByLibrary.simpleMessage("의지보조기"),
    "orDivider": MessageLookupByLibrary.simpleMessage("또는"),
    "orthoticsProsthetics": MessageLookupByLibrary.simpleMessage("보조기구 및 의지학"),
    "otpVerification": MessageLookupByLibrary.simpleMessage("오티피"),
    "overallRating": MessageLookupByLibrary.simpleMessage("전체"),
    "password": MessageLookupByLibrary.simpleMessage("비밀번호"),
    "passwordHint": MessageLookupByLibrary.simpleMessage("비밀번호를 입력하세요"),
    "passwordLengthError": MessageLookupByLibrary.simpleMessage(
      "비밀번호는 최소 8자 이상이어야 합니다",
    ),
    "passwordRequired": MessageLookupByLibrary.simpleMessage("비밀번호 필수"),
    "pending": MessageLookupByLibrary.simpleMessage("대기 중"),
    "phoneNumber": MessageLookupByLibrary.simpleMessage("전화번호"),
    "phoneNumberHint": MessageLookupByLibrary.simpleMessage("전화번호를 입력하세요"),
    "phoneNumberLabel": MessageLookupByLibrary.simpleMessage("전화번호"),
    "phoneNumberTooShort": MessageLookupByLibrary.simpleMessage(
      "전화번호가 11자리보다 적습니다",
    ),
    "pickImageTooltip": MessageLookupByLibrary.simpleMessage("이미지 선택"),
    "postAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "게시물이 성공적으로 추가되었습니다",
    ),
    "postButtonLabel": MessageLookupByLibrary.simpleMessage("게시"),
    "postContentEmpty": MessageLookupByLibrary.simpleMessage(
      "게시물 내용이 비어있을 수 없습니다",
    ),
    "postContentHint": MessageLookupByLibrary.simpleMessage("무슨 생각을 하고 계신가요?"),
    "postDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "게시물이 성공적으로 삭제되었습니다",
    ),
    "postUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "게시물이 성공적으로 업데이트되었습니다",
    ),
    "prerequisiteFieldRequired": MessageLookupByLibrary.simpleMessage(
      "이 필드는 비워둘 수 없습니다",
    ),
    "prerequisiteSkillHint": MessageLookupByLibrary.simpleMessage(
      "이 전제 조건/기술에 대해 말해보세요",
    ),
    "prerequisiteSkillLabel": m35,
    "prerequisitesNoneNote": MessageLookupByLibrary.simpleMessage(
      "참고: 기술이나 전제 조건이 없는 경우 아래 필드에 \"없음\"이라고 쓸 수 있습니다",
    ),
    "prerequisitesNote": MessageLookupByLibrary.simpleMessage(
      "참고: 최소 하나의 기술 또는 전제 조건을 정의하세요",
    ),
    "presentCount": m36,
    "profile": MessageLookupByLibrary.simpleMessage("프로필"),
    "quickActions": MessageLookupByLibrary.simpleMessage("빠른 작업"),
    "rateCourse": MessageLookupByLibrary.simpleMessage("과정 평가"),
    "ratingOverview": MessageLookupByLibrary.simpleMessage("평점 개요"),
    "ratings": MessageLookupByLibrary.simpleMessage("평점"),
    "ratingsTitle": MessageLookupByLibrary.simpleMessage("평점"),
    "reDepartment": MessageLookupByLibrary.simpleMessage("재생에너지"),
    "readTerms": MessageLookupByLibrary.simpleMessage(
      "진행하기 전에 이용 약관을 주의 깊게 읽어주세요.",
    ),
    "recentCourses": MessageLookupByLibrary.simpleMessage("최근 과정"),
    "registerStudent": MessageLookupByLibrary.simpleMessage("학생 등록"),
    "registrationFailed": MessageLookupByLibrary.simpleMessage("등록 실패"),
    "reject": MessageLookupByLibrary.simpleMessage("거부"),
    "rejected": MessageLookupByLibrary.simpleMessage("거부됨"),
    "relatedCoursesTitle": MessageLookupByLibrary.simpleMessage("관련 과정"),
    "removeImageTooltip": MessageLookupByLibrary.simpleMessage("이미지 제거"),
    "renewableEnergy": MessageLookupByLibrary.simpleMessage("재생에너지"),
    "rensendCode": MessageLookupByLibrary.simpleMessage("렌센드코드"),
    "requiredField": MessageLookupByLibrary.simpleMessage("필수 필드"),
    "retry": MessageLookupByLibrary.simpleMessage("재시도"),
    "reviewsCount": m37,
    "roleAdmin": MessageLookupByLibrary.simpleMessage("관리자"),
    "roleInstructor": MessageLookupByLibrary.simpleMessage("강사"),
    "roleStudent": MessageLookupByLibrary.simpleMessage("학생"),
    "roleSuperAdmin": MessageLookupByLibrary.simpleMessage("수퍼 관리자"),
    "room": MessageLookupByLibrary.simpleMessage("강의실"),
    "roomNumberHint": MessageLookupByLibrary.simpleMessage("강의실 번호 입력"),
    "roomNumberLabel": MessageLookupByLibrary.simpleMessage("강의실 번호"),
    "searchCourses": MessageLookupByLibrary.simpleMessage("코스 검색..."),
    "secondYear": MessageLookupByLibrary.simpleMessage("둘 년도"),
    "selectCategory": MessageLookupByLibrary.simpleMessage("카테고리 선택"),
    "selectDateAttendance": MessageLookupByLibrary.simpleMessage("출석 날짜 선택"),
    "selectDepartment": MessageLookupByLibrary.simpleMessage("학과 선택"),
    "selectOneInstructor": MessageLookupByLibrary.simpleMessage("강사 한 명 선택"),
    "selectTodayDateAttendance": MessageLookupByLibrary.simpleMessage(
      "출석을 보려면 오늘 날짜를 선택하세요",
    ),
    "selectYear": MessageLookupByLibrary.simpleMessage("학년 선택"),
    "selectedDate": m38,
    "sendAll": MessageLookupByLibrary.simpleMessage("모두 보내기"),
    "sendNotification": MessageLookupByLibrary.simpleMessage("알림 보내기"),
    "settings": MessageLookupByLibrary.simpleMessage("설정"),
    "showAllCourses": MessageLookupByLibrary.simpleMessage("모든 과정 보기"),
    "showingMultipleFilteredReviews": m39,
    "showingMultipleReviews": m40,
    "showingOneFilteredReview": m41,
    "showingOneReview": MessageLookupByLibrary.simpleMessage("1개 리뷰 표시"),
    "skillsAndPrerequisitesDescription": MessageLookupByLibrary.simpleMessage(
      "학생에게 필요한 기술과 전제 조건은 무엇입니까",
    ),
    "splashLoading": MessageLookupByLibrary.simpleMessage("로딩중..."),
    "splashText": MessageLookupByLibrary.simpleMessage("대학 경력 개발 센터"),
    "startDateRequired": MessageLookupByLibrary.simpleMessage("시작 날짜 필수"),
    "starts": MessageLookupByLibrary.simpleMessage("시작"),
    "statistics": MessageLookupByLibrary.simpleMessage("통계"),
    "statisticsButtonSemanticLabel": m42,
    "statisticsButtonTitle": MessageLookupByLibrary.simpleMessage("통계"),
    "statisticsButtonTooltip": MessageLookupByLibrary.simpleMessage(
      "과정 통계 및 분석 보기",
    ),
    "studentAcceptedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "학생이 성공적으로 승인되었습니다",
    ),
    "studentAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "학생이 성공적으로 추가되었습니다",
    ),
    "studentAttendanceUnmarked": MessageLookupByLibrary.simpleMessage(
      "학생 출석이 표시 해제됨",
    ),
    "studentEmailHint": MessageLookupByLibrary.simpleMessage("학생 이메일을 입력하세요"),
    "studentEmailLabel": MessageLookupByLibrary.simpleMessage("학생 이메일"),
    "studentEmailRequired": MessageLookupByLibrary.simpleMessage("학생 이메일 필수"),
    "studentInfo": MessageLookupByLibrary.simpleMessage("학생 정보"),
    "studentInfoDescription": MessageLookupByLibrary.simpleMessage(
      "몇 가지 정보를 제공하는 것부터 시작하겠습니다",
    ),
    "studentInterests": MessageLookupByLibrary.simpleMessage("학생 관심사"),
    "studentInterestsDescription": MessageLookupByLibrary.simpleMessage(
      "관심 있는 과정 또는 분야 카테고리는 무엇입니까",
    ),
    "studentMarkedAbsent": MessageLookupByLibrary.simpleMessage("학생이 결석으로 표시됨"),
    "studentMarkedPresent": MessageLookupByLibrary.simpleMessage(
      "학생이 출석으로 표시됨",
    ),
    "studentNameHint": MessageLookupByLibrary.simpleMessage("학생 이름을 입력하세요"),
    "studentNameLabel": MessageLookupByLibrary.simpleMessage("학생 이름"),
    "studentNameRequired": MessageLookupByLibrary.simpleMessage("학생 이름 필수"),
    "studentPasswordHint": MessageLookupByLibrary.simpleMessage("학생 비밀번호 입력"),
    "studentPasswordLabel": MessageLookupByLibrary.simpleMessage("학생 비밀번호"),
    "studentUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "학생이 성공적으로 업데이트되었습니다",
    ),
    "students": MessageLookupByLibrary.simpleMessage("학생들"),
    "studentsByDepartmentAndYear": MessageLookupByLibrary.simpleMessage(
      "부서 및 연도별 학생",
    ),
    "studentsByDepartments": MessageLookupByLibrary.simpleMessage("부서별 학생"),
    "studentsByYear": MessageLookupByLibrary.simpleMessage("연도별 학생"),
    "studentsCount": m43,
    "studentsWillAppearEnrolled": MessageLookupByLibrary.simpleMessage(
      "학생들이 과정에 등록되면 여기에 표시됩니다",
    ),
    "success": MessageLookupByLibrary.simpleMessage("성공"),
    "tapToAddImage": MessageLookupByLibrary.simpleMessage("탭하여 이미지 추가"),
    "thirdYear": MessageLookupByLibrary.simpleMessage("삼 년도"),
    "threeStars": MessageLookupByLibrary.simpleMessage("3점"),
    "totalCourses": MessageLookupByLibrary.simpleMessage("총 과정 수"),
    "totalDays": m44,
    "totalStudents": MessageLookupByLibrary.simpleMessage("총 학생 수"),
    "trackEnrolledCourses": MessageLookupByLibrary.simpleMessage(
      "등록된 과정과 진도를 추적하세요",
    ),
    "tryAgain": MessageLookupByLibrary.simpleMessage("다시 시도"),
    "tryAgainLater": MessageLookupByLibrary.simpleMessage("나중에 다시 시도하세요"),
    "tryChangingFilters": MessageLookupByLibrary.simpleMessage(
      "필터나 검색어를 변경해 보세요",
    ),
    "twoStars": MessageLookupByLibrary.simpleMessage("2점"),
    "uccdMobileApp": MessageLookupByLibrary.simpleMessage("UCCD 모바일 앱"),
    "universityEmail": MessageLookupByLibrary.simpleMessage("대학 이메일"),
    "universityEmailHint": MessageLookupByLibrary.simpleMessage(
      "대학 이메일을 입력하세요",
    ),
    "universityEmailsOnly": MessageLookupByLibrary.simpleMessage("대학 이메일만"),
    "universityIdHint": MessageLookupByLibrary.simpleMessage("학생 학번을 입력하세요"),
    "universityIdLabel": MessageLookupByLibrary.simpleMessage("학번"),
    "universityIdLengthError": MessageLookupByLibrary.simpleMessage(
      "학번은 9자리여야 합니다",
    ),
    "universityIdRequired": MessageLookupByLibrary.simpleMessage("학번 필수"),
    "unknownError": MessageLookupByLibrary.simpleMessage("알 수 없는 오류"),
    "unmarkedCount": m45,
    "updateButtonLabel": MessageLookupByLibrary.simpleMessage("업데이트"),
    "uploadCourseMaterials": MessageLookupByLibrary.simpleMessage("과정 자료 업로드"),
    "userAccountDisabled": MessageLookupByLibrary.simpleMessage(
      "사용자 계정이 비활성화됨, 지원팀에 문의하세요",
    ),
    "userCreatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "사용자가 성공적으로 생성되었습니다",
    ),
    "userDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "사용자가 성공적으로 삭제되었습니다",
    ),
    "userUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "사용자가 성공적으로 업데이트되었습니다",
    ),
    "usernameRequired": MessageLookupByLibrary.simpleMessage("사용자명을 입력하세요"),
    "users": MessageLookupByLibrary.simpleMessage("사용자"),
    "verificationEmailInbox": MessageLookupByLibrary.simpleMessage(
      " 오티피 번호와 함께, 받은 편지함을 확인하세요",
    ),
    "verificationEmailSent": MessageLookupByLibrary.simpleMessage(
      "인증 이메일을 다음 주소로 보냈습니다 ",
    ),
    "versionNumber": MessageLookupByLibrary.simpleMessage("버전 1.0.0"),
    "viewAll": MessageLookupByLibrary.simpleMessage("모두 보기"),
    "viewCourseButton": MessageLookupByLibrary.simpleMessage("과정 보기"),
    "welcomeBack": MessageLookupByLibrary.simpleMessage("환영합니다,"),
    "welcomeBackComma": MessageLookupByLibrary.simpleMessage("환영합니다, "),
    "welcomeTo": MessageLookupByLibrary.simpleMessage("환영합니다"),
    "wrongPassword": MessageLookupByLibrary.simpleMessage("잘못된 비밀번호"),
    "yearHint": MessageLookupByLibrary.simpleMessage("학년"),
    "yearLabel": MessageLookupByLibrary.simpleMessage("학년"),
    "yes": MessageLookupByLibrary.simpleMessage("예"),
    "yourProgress": MessageLookupByLibrary.simpleMessage("당신의 진도"),
  };
}
