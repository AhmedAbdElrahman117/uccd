import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/option_tile.dart';
import 'package:uccd/Core/app_text.dart';

class LanguageTile extends StatefulWidget {
  const LanguageTile({
    super.key,
  });

  @override
  State<LanguageTile> createState() => _LanguageTileState();
}

class _LanguageTileState extends State<LanguageTile> {
  Map<String, String> languages = {
    'Arabic': 'ar',
    'English': 'en',
    'Korean': 'kr',
  };

  String current = 'ar';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ExpansionTile(
        title: Text(
          'Language',
          style: AppText.style14Bold(context),
        ),
        leading: Icon(
          Icons.language_rounded,
          size: 24,
          color: Theme.of(context).iconTheme.color,
        ),
        iconColor: Theme.of(context).iconTheme.color,
        collapsedIconColor: Theme.of(context).iconTheme.color,
        children: languages.entries.indexed
            .map(
              (e) => OptionTile(
                value: e.$2.value,
                currentValue: current,
                title: e.$2.key,
                onChanged: (value) {
                  setState(() {
                    current = value!;
                  });
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
