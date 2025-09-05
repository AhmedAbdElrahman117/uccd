import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uccd/Core/Models/student_model.dart';

class StatisticsRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> getStatistics({required String courseID}) async {
    int pending = 0;
    int accepted = 0;
    int rejected = 0;
    int it = 0;
    int mecha = 0;
    int auto = 0;
    int re = 0;
    int op = 0;
    int first = 0;
    int second = 0;
    int third = 0;
    int fourth = 0;

    double it1 = 0, it2 = 0, it3 = 0, it4 = 0;
    double mecha1 = 0, mecha2 = 0, mecha3 = 0, mecha4 = 0;
    double auto1 = 0, auto2 = 0, auto3 = 0, auto4 = 0;
    double re1 = 0, re2 = 0, re3 = 0, re4 = 0;
    double op1 = 0, op2 = 0, op3 = 0, op4 = 0;

    var query =
        _firestore.collection('courses').doc(courseID).collection('students');

    var students = await query
        .withConverter(
          fromFirestore: (snapshot, options) =>
              StudentModel.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toMap(),
        )
        .get();

    for (int i = 0; i < students.docs.length; i++) {
      if (students.docs[i].data().isAccepted == null) {
        pending++;
      } else if (students.docs[i].data().isAccepted == true) {
        accepted++;
      } else if (students.docs[i].data().isAccepted == false) {
        rejected++;
      }
      if (students.docs[i].data().department == 'Information Technology') {
        it++;
      } else if (students.docs[i].data().department == 'Mechatronics') {
        mecha++;
      } else if (students.docs[i].data().department == 'Autotronics') {
        auto++;
      } else if (students.docs[i].data().department == 'Renewable Energy') {
        re++;
      } else if (students.docs[i].data().department == 'O&P') {
        op++;
      }
      if (students.docs[i].data().year == '1st year') {
        first++;
      } else if (students.docs[i].data().year == '2nd year') {
        second++;
      } else if (students.docs[i].data().year == '3rd year') {
        third++;
      } else if (students.docs[i].data().year == '4th year') {
        fourth++;
      }
      if (students.docs[i].data().department == 'Information Technology' &&
          students.docs[i].data().year == '1st year') {
        it1++;
      } else if (students.docs[i].data().department ==
              'Information Technology' &&
          students.docs[i].data().year == '2nd year') {
        it2++;
      } else if (students.docs[i].data().department ==
              'Information Technology' &&
          students.docs[i].data().year == '3rd year') {
        it3++;
      } else if (students.docs[i].data().department ==
              'Information Technology' &&
          students.docs[i].data().year == '4th year') {
        it4++;
      } else if (students.docs[i].data().department == 'Mechatronics' &&
          students.docs[i].data().year == '1st year') {
        mecha1++;
      } else if (students.docs[i].data().department == 'Mechatronics' &&
          students.docs[i].data().year == '2nd year') {
        mecha2++;
      } else if (students.docs[i].data().department == 'Mechatronics' &&
          students.docs[i].data().year == '3rd year') {
        mecha3++;
      } else if (students.docs[i].data().department == 'Mechatronics' &&
          students.docs[i].data().year == '4th year') {
        mecha4++;
      } else if (students.docs[i].data().department == 'Autotronics' &&
          students.docs[i].data().year == '1st year') {
        auto1++;
      } else if (students.docs[i].data().department == 'Autotronics' &&
          students.docs[i].data().year == '2nd year') {
        auto2++;
      } else if (students.docs[i].data().department == 'Autotronics' &&
          students.docs[i].data().year == '3rd year') {
        auto3++;
      } else if (students.docs[i].data().department == 'Autotronics' &&
          students.docs[i].data().year == '4th year') {
        auto4++;
      } else if (students.docs[i].data().department == 'Renewable Energy' &&
          students.docs[i].data().year == '1st year') {
        re1++;
      } else if (students.docs[i].data().department == 'Renewable Energy' &&
          students.docs[i].data().year == '2nd year') {
        re2++;
      } else if (students.docs[i].data().department == 'Renewable Energy' &&
          students.docs[i].data().year == '3rd year') {
        re3++;
      } else if (students.docs[i].data().department == 'Renewable Energy' &&
          students.docs[i].data().year == '4th year') {
        re4++;
      } else if (students.docs[i].data().department == 'O&P' &&
          students.docs[i].data().year == '1st year') {
        op1++;
      } else if (students.docs[i].data().department == 'O&P' &&
          students.docs[i].data().year == '2nd year') {
        op2++;
      } else if (students.docs[i].data().department == 'O&P' &&
          students.docs[i].data().year == '3rd year') {
        op3++;
      } else if (students.docs[i].data().department == 'O&P' &&
          students.docs[i].data().year == '4th year') {
        op4++;
      }
    }

    return {
      'Total': students.docs.length,
      'Pending': pending,
      'Accepted': accepted,
      'Rejected': rejected,
      'It': it,
      'Mecha': mecha,
      'Auto': auto,
      'RE': re,
      'O&P': op,
      'First': first,
      'Second': second,
      'Third': third,
      'Fourth': fourth,
      'ITByYear': [it1, it2, it3, it4],
      'MechaByYear': [mecha1, mecha2, mecha3, mecha4],
      'AutoByYear': [auto1, auto2, auto3, auto4],
      'REByYear': [re1, re2, re3, re4],
      'OPByYear': [op1, op2, op3, op4],
    };
  }
}
