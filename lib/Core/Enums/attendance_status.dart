enum AttendanceStatus {
  present,
  absent,
  unmarked,
}

extension AttendanceStatusExtension on AttendanceStatus {
  bool get isPresent => this == AttendanceStatus.present;
  bool get isAbsent => this == AttendanceStatus.absent;
  bool get isUnmarked => this == AttendanceStatus.unmarked;
}
