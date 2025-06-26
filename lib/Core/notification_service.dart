import 'dart:developer';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() => _instance;

  NotificationService._internal();

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  void init() async {
    await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.subscribeToTopic('basic');

    NotificationSystem.notificationController.initNotificationPackage();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('firebase onMessage');
      NotificationSystem.notificationController.createNotification(
        title: message.notification?.title ?? 'No Title',
        body: message.notification?.body ?? 'No Body',
      );
      log('Received message: ${message.notification?.title} - ${message.notification?.body}');
    });

    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) {
        log('firebase onMessageOpenedApp');
        NotificationSystem.notificationController.createNotification(
          title: message.notification?.title ?? 'No Title',
          body: message.notification?.body ?? 'No Body',
        );
        log('Message opened app: ${message.notification?.title} - ${message.notification?.body}');
      },
    );
  }
}

class NotificationSystem {
  NotificationSystem._();

  static NotificationSystem notificationController = NotificationSystem._();

  void initNotificationPackage() async {
    await AwesomeNotifications().initialize(
      //change to null
      'resource://drawable/ic_notification',
      [
        NotificationChannel(
          channelKey: 'basic',
          channelName: 'basic_channel',
          channelDescription: 'Notification Channel',
          defaultRingtoneType: DefaultRingtoneType.Notification,
          defaultColor: Colors.white,
          playSound: true,
          criticalAlerts: true,
          enableVibration: true,
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          enableLights: true,
        ),
      ],
      debug: true,
    );
  }

  void setPackageListeners(BuildContext context) async {
    await AwesomeNotifications().setListeners(
      onNotificationCreatedMethod: (receivedNotification) async {
        if (receivedNotification.title != null ||
            receivedNotification.body != null) {
          createNotification(
            title: receivedNotification.title!,
            body: receivedNotification.body!,
          );
        }
      },
      onNotificationDisplayedMethod: (receivedNotification) async {
        if (receivedNotification.title != null ||
            receivedNotification.body != null) {
          createNotification(
            title: receivedNotification.title!,
            body: receivedNotification.body!,
          );
        }
      },
      onActionReceivedMethod: (receivedAction) async {},
    );
  }

  void createNotification({required String title, required String body}) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: Timestamp.now().toString().hashCode,
        //change to notification channel key set
        channelKey: 'basic',
        title: title,
        body: body,
        duration: const Duration(seconds: 2),
        actionType: ActionType.Default,
        roundedBigPicture: true,
        displayOnBackground: true,
        fullScreenIntent: true,
        notificationLayout: NotificationLayout.BigPicture,
        wakeUpScreen: true,
      ),
    );
  }
}
