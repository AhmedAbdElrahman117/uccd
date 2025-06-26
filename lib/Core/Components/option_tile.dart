import 'package:flutter/material.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';

class OptionTile extends StatelessWidget {
  const OptionTile({
    super.key,
    required this.title,
    this.onChanged,
    required this.value,
    required this.currentValue,
    this.subtitle,
  });

  final String title;
  final String value;
  final String currentValue;
  final Widget? subtitle;
  final void Function(String? value)? onChanged;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final isSelected = value == currentValue;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onChanged?.call(value),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColor.primary.withValues(alpha: 0.1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: isSelected
                  ? Border.all(color: AppColor.primary.withValues(alpha: 0.3))
                  : null,
            ),
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected
                          ? AppColor.primary
                          : (isDarkMode ? Colors.white54 : Colors.black54),
                      width: 2,
                    ),
                    color: isSelected ? AppColor.primary : Colors.transparent,
                  ),
                  child: isSelected
                      ? const Icon(
                          Icons.check,
                          size: 12,
                          color: Colors.white,
                        )
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: AppText.style14Bold(context).copyWith(
                      color: isSelected
                          ? AppColor.primary
                          : Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                ),
                if (subtitle != null) subtitle!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
