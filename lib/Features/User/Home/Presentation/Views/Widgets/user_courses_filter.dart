import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Components/filter_chips.dart';
import 'package:uccd/Core/Models/category_model.dart';
import 'package:uccd/Features/User/Home/Presentation/Views%20Model/User%20Home%20Cubit/user_home_cubit.dart';
import 'package:uccd/Features/User/Home/Presentation/Views%20Model/User%20Home%20Cubit/user_home_states.dart';
import 'package:uccd/generated/l10n.dart';

class UserCoursesFilter extends StatelessWidget {
  const UserCoursesFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<UserHomeCubit, UserHomeStates, List<CategoryModel>>(
      selector: (state) {
        if (state is DataLoaded) {
          return state.categories;
        } else if (state is DataEmpty) {
          return BlocProvider.of<UserHomeCubit>(context).categories;
        }
        return [];
      },
      builder: (context, state) {
        return SliverToBoxAdapter(
          child: Visibility(
            visible: state.isNotEmpty,
            child: FilterChips(
              onChange: (option) {
                // Convert localized option back to English for the cubit
                String categoryToFilter;
                if (option == S.of(context).all) {
                  categoryToFilter = 'All';
                } else {
                  categoryToFilter =
                      option; // Category names are already in English
                }
                BlocProvider.of<UserHomeCubit>(context)
                    .filter(categoryToFilter);
              },
              options: createList(context, state),
            ),
          ),
        );
      },
    );
  }

  List<String> createList(BuildContext context, List<CategoryModel> model) {
    List<String> cats = [S.of(context).all];

    cats.addAll(
      model
          .map(
            (e) => e.name,
          )
          .toList(),
    );

    return cats;
  }
}
