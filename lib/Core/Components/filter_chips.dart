import 'package:flutter/material.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';

class FilterChips extends StatefulWidget {
  const FilterChips({
    super.key,
    required this.onChange,
    required this.options,
    this.avatar,
    this.initialSelection,
  });

  final void Function(String option) onChange;
  final List<String> options;
  final Widget? avatar;
  final String? initialSelection;

  @override
  State<FilterChips> createState() => _FilterChipsState();
}

class _FilterChipsState extends State<FilterChips> {
  int current = 0;

  @override
  void initState() {
    super.initState();
    // Set initial selection if provided
    if (widget.initialSelection != null) {
      final index = widget.options.indexOf(widget.initialSelection!);
      if (index != -1) {
        current = index;
      }
    }
  }

  @override
  void didUpdateWidget(FilterChips oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update current index if initialSelection changes
    if (widget.initialSelection != null &&
        widget.initialSelection != oldWidget.initialSelection) {
      final index = widget.options.indexOf(widget.initialSelection!);
      if (index != -1 && index != current) {
        setState(() {
          current = index;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.options.length,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: RawChip(
                label: Text(
                  widget.options[index],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                showCheckmark: true,
                selected: index == current,
                selectedColor: AppColor.primary,
                backgroundColor: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey.shade900
                    : Colors.grey.shade200,
                labelStyle: AppText.style14Regular(context),
                onSelected: (value) {
                  current = index;
                  setState(() {});
                  widget.onChange(widget.options[current]);
                },
                avatar: index == current ? null : widget.avatar,
              ),
            );
          },
        ),
      ),
    );
  }
}
