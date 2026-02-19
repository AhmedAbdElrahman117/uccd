import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uccd/Core/Models/log_model.dart';

class AdminLogsRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<LogModel>> getLogs(Timestamp timestamp) {
    Timestamp startDate = Timestamp.fromDate(
      DateTime(
        timestamp.toDate().year,
        timestamp.toDate().month,
        timestamp.toDate().day,
      ),
    );

    Timestamp endDate = Timestamp.fromDate(
      DateTime(
        timestamp.toDate().year,
        timestamp.toDate().month,
        timestamp.toDate().day,
        23,
        59,
        59,
        999,
      ),
    );

    try {
      return _firestore
          .collection('logs')
          .where(
            'createdAt',
            isGreaterThanOrEqualTo: startDate,
          )
          .where(
            'createdAt',
            isLessThanOrEqualTo: endDate,
          )
          .orderBy(
            'createdAt',
            descending: true,
          )
          .withConverter(
            fromFirestore: (snapshot, options) =>
                LogModel.fromJson(snapshot.data()!),
            toFirestore: (value, options) => value.toMap(),
          )
          .get()
          .then(
            (snapshot) => snapshot.docs
                .map(
                  (log) => log.data(),
                )
                .toList(),
          );
    } on SocketException {
      throw ('noInternetConnection');
    } on FirebaseException catch (e) {
      throw (e.message ?? e.code);
    } on TimeoutException {
      throw ('connectionTimeout');
    } on Exception catch (e) {
      throw (e.toString());
    }
  }
}
