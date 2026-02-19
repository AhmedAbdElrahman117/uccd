import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uccd/Core/Components/option_tile.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Core/utils_provider.dart';
import 'package:uccd/generated/l10n.dart';

class LanguageTile extends StatefulWidget {
  const LanguageTile({
    super.key,
  });

  @override
  State<LanguageTile> createState() => _LanguageTileState();
}

class _LanguageTileState extends State<LanguageTile> {
  Map<String, String> getLanguages(BuildContext context) => {
        'en': S.of(context).english,
        'ar': S.of(context).arabic,
        'ko': S.of(context).korean,
      };

  String current = '';

  @override
  void initState() {
    current = context.read<UtilsProvider>().getLocale.languageCode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final tileColor = isDarkMode ? const Color(0xFF2A2A2A) : Colors.white;
    final borderColor =
        isDarkMode ? const Color(0xFF3D3D3D) : const Color(0xFFEAEAEA);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          color: tileColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor),
          boxShadow: [
            BoxShadow(
              color: isDarkMode
                  ? Colors.black.withValues(alpha: 0.1)
                  : Colors.black.withValues(alpha: 0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: ExpansionTile(
            title: Text(
              S.of(context).language,
              style: AppText.style14Bold(context),
            ),
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color:
                    Theme.of(context).iconTheme.color?.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.language_rounded,
                size: 20,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
            iconColor: Theme.of(context).iconTheme.color,
            collapsedIconColor: Theme.of(context).iconTheme.color,
            backgroundColor: Colors.transparent,
            collapsedBackgroundColor: Colors.transparent,
            shape: const RoundedRectangleBorder(),
            collapsedShape: const RoundedRectangleBorder(),
            tilePadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            childrenPadding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 8),
            children: getLanguages(context)
                .entries
                .indexed
                .map(
                  (e) => OptionTile(
                    value: e.$2.key,
                    currentValue: current,
                    title: e.$2.value,
                    onChanged: (value) {
                      context.read<UtilsProvider>().changeLocale(value!);
                      setState(() {
                        current = value;
                      });
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
