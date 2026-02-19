import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Components/filter_chips.dart';
import 'package:uccd/Core/Models/category_model.dart';
import 'package:uccd/Features/User/Home/Presentation/Views%20Model/User%20Home%20Cubit/user_home_cubit.dart';
import 'package:uccd/Features/User/Home/Presentation/Views%20Model/User%20Home%20Cubit/user_home_states.dart';

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
                BlocProvider.of<UserHomeCubit>(context).filter(
                  option,
                );
              },
              options: createList(state),
            ),
          ),
        );
      },
    );
  }

  List<String> createList(List<CategoryModel> model) {
    List<String> cats = ['All'];

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
