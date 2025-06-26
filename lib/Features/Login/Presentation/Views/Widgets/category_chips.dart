import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Models/category_model.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/Login/Presentation/Views%20Model/Register%20Form%20Cubit/register_form_cubit.dart';
import 'package:uccd/Features/Login/Presentation/Views%20Model/Register%20Form%20Cubit/register_form_states.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({
    super.key,
    required this.categories,
  });

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: categories
          .asMap()
          .entries
          .map(
            (e) => BlocBuilder<RegisterFormCubit, RegisterFormStates>(
              buildWhen: (previous, current) => current is TriggerSelection,
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: RawChip(
                    selected: BlocProvider.of<RegisterFormCubit>(context)
                        .isSelected(e.value.id!),
                    selectedColor: AppColor.primary,
                    checkmarkColor: Theme.of(context).iconTheme.color,
                    label: Text(
                      e.value.name,
                      style: AppText.style14Bold(context),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    onPressed: () {
                      BlocProvider.of<RegisterFormCubit>(context)
                          .triggerSelection(
                        e.value.id!,
                      );
                    },
                  ),
                );
              },
            ),
          )
          .toList(),
    );
  }
}
