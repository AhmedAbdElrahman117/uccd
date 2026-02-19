class DashboardModel {
  int? activeStudents;
  int? totalCourses;
  int? totalAdmins;
  int? totalInstructors;
  int? totalCategories;

  DashboardModel({
    this.activeStudents,
    this.totalCourses,
    this.totalAdmins,
    this.totalInstructors,
    this.totalCategories,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      activeStudents: json['activeStudents'] ?? 0,
      totalCourses: json['totalCourses'] ?? 0,
      totalAdmins: json['totalAdmins'] ?? 0,
      totalInstructors: json['totalInstructors'] ?? 0,
      totalCategories: json['totalCategories'] ?? 0,
    );
  }
}
