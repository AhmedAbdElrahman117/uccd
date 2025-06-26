import 'package:flutter/material.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/main.dart';

class UserData extends StatelessWidget {
  const UserData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListTile(
        title: Text(
          'Hello, ${InternalStorage.getString('name').split(' ').first}',
          style: AppText.style20Bold(context),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          'Welcome to UCCD',
          style: AppText.style16Bold(context).copyWith(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
