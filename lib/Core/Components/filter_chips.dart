import 'package:flutter/material.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';

class FilterChips extends StatefulWidget {
  const FilterChips({
    super.key,
    required this.onChange,
    required this.options,
    this.avatar,
  });

  final void Function(String option) onChange;
  final List<String> options;
  final Widget? avatar;

  @override
  State<FilterChips> createState() => _FilterChipsState();
}

class _FilterChipsState extends State<FilterChips> {
  int current = 0;
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
