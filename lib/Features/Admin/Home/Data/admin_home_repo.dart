import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminHomeRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<int> getTotalStudents() {
    return _firestore
        .collection('users')
        .where(
          'role',
          isEqualTo: 'Student',
        )
        .where(
          'isFirstRegister',
          isEqualTo: false,
        )
        .snapshots()
        .handleError(
      (error) {
        if (error is SocketException) {
          throw ('noInternetConnection');
        } else if (error is FirebaseException) {
          throw (error.message ?? error.code);
        } else {
          throw (error.toString());
        }
      },
    ).map(
      (snapshot) {
        return snapshot.docs.length;
      },
    );
  }

  Stream<int> getTotalAdmins() {
    return _firestore
        .collection('users')
        .where(
          'role',
          isEqualTo: 'Admin',
        )
        .snapshots()
        .handleError(
      (error) {
        if (error is SocketException) {
          throw ('noInternetConnection');
        } else if (error is FirebaseException) {
          throw (error.message ?? error.code);
        } else {
          throw (error.toString());
        }
      },
    ).map(
      (snapshot) {
        return snapshot.docs.length;
      },
    );
  }

  Stream<int> getTotalInstructors() {
    return _firestore
        .collection('users')
        .where(
          'role',
          isEqualTo: 'Instructor',
        )
        .snapshots()
        .handleError(
      (error) {
        if (error is SocketException) {
          throw ('noInternetConnection');
        } else if (error is FirebaseException) {
          throw (error.message ?? error.code);
        } else {
          throw (error.toString());
        }
      },
    ).map(
      (snapshot) {
        return snapshot.docs.length;
      },
    );
  }

  Stream<int> getTotalCategories() {
    return _firestore.collection('category').snapshots().handleError(
      (error) {
        if (error is SocketException) {
          throw ('noInternetConnection');
        } else if (error is FirebaseException) {
          throw (error.message ?? error.code);
        } else {
          throw (error.toString());
        }
      },
    ).map(
      (snapshot) {
        return snapshot.docs.length;
      },
    );
  }

  Stream<int> getTotalCourses() {
    return _firestore.collection('courses').snapshots().handleError(
      (error) {
        if (error is SocketException) {
          throw ('noInternetConnection');
        } else if (error is FirebaseException) {
          throw (error.message ?? error.code);
        } else {
          throw (error.toString());
        }
      },
    ).map(
      (snapshot) {
        return snapshot.docs.length;
      },
    );
  }
}
