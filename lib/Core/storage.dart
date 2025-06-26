import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Storage {
  static final SupabaseStorageClient _storage =
      Supabase.instance.client.storage;

  static Future<String?> uploadImage({
    XFile? image,
    required String folderName,
    required String from,
  }) async {
    try {
      String? imageLink;

      log(image?.name ?? 'no name');
      if (image != null) {
        File imageFile = File(image.path);

        String x = await _storage.from(from).upload(
              '$folderName/${image.name}',
              imageFile,
              fileOptions: const FileOptions(
                upsert: false,
                cacheControl: '3600',
              ),
            );

        log(x);
        imageLink = getImageURL(
          imageName: image.name,
          folderName: folderName,
          from: from,
        );
      }

      log(imageLink ?? 'no link');
      return imageLink;
    } on TimeoutException {
      rethrow;
    } on SocketException {
      rethrow;
    } on StorageException {
      rethrow;
    } on Exception {
      rethrow;
    }
  }

  static void remove({
    required String from,
    required List<String> paths,
  }) async {
    try {
      await _storage
          .from(from)
          .remove(
            paths,
          )
          .timeout(
            const Duration(seconds: 30),
          );
    } on SocketException {
      rethrow;
    } on TimeoutException {
      rethrow;
    } on StorageException {
      rethrow;
    } on Exception {
      rethrow;
    }
  }

  static String getImageURL({
    required String imageName,
    required String folderName,
    required String from,
  }) {
    try {
      String url = _storage.from(from).getPublicUrl(
            '$folderName/$imageName',
          );
      return url;
    } on SocketException {
      rethrow;
    } on StorageException {
      rethrow;
    } on Exception {
      rethrow;
    }
  }
}
