import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uccd/Core/Components/data_error_widget.dart';
import 'package:uccd/Core/Components/loading_indicator.dart';
import 'package:uccd/Core/Components/no_data_widget.dart';
import 'package:uccd/Core/Components/section_title.dart';
import 'package:uccd/Core/app_assets.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/admin_course_button.dart';
import 'package:uccd/Features/Login/Presentation/Views%20Model/Register%20Form%20Cubit/register_form_cubit.dart';
import 'package:uccd/Features/Login/Presentation/Views%20Model/Register%20Form%20Cubit/register_form_states.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/category_chips.dart';
import 'package:uccd/generated/l10n.dart';

class RegisterCategoryPage extends StatefulWidget {
  const RegisterCategoryPage({super.key});

  @override
  State<RegisterCategoryPage> createState() => _RegisterCategoryPageState();
}

class _RegisterCategoryPageState extends State<RegisterCategoryPage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    BlocProvider.of<RegisterFormCubit>(context).getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView(
      children: [
        const SizedBox(height: 30),
        SvgPicture.asset(
          AppAssets.imagesInterests2,
          height: MediaQuery.sizeOf(context).height * 0.2,
        ),
        const SizedBox(height: 30),
        Center(
          child: SectionTitle(
            title: S.of(context).studentInterests,
          ),
        ),
        const SizedBox(height: 30),
        Center(
          child: Text(
            S.of(context).studentInterestsDescription,
            style: AppText.style16Regular(context),
          ),
        ),
        const SizedBox(height: 30),
        BlocBuilder<RegisterFormCubit, RegisterFormStates>(
          buildWhen: (previous, current) =>
              current is RegisterFormInitialState ||
              current is DataLoading ||
              current is DataEmpty ||
              current is DataFailed ||
              current is DataLoaded,
          builder: (context, state) {
            switch (state) {
              case DataLoading():
                return const LoadingIndicator();
              case DataEmpty():
                return Column(
                  spacing: 30,
                  children: [
                    const NoDataWidget(
                      message: 'No Categories Created yet',
                    ),
                    AdminCourseButton(
                      title: 'Try Again',
                      backgroundColor: Colors.green,
                      icon: Icons.restart_alt_outlined,
                      onPressed: () {
                        BlocProvider.of<RegisterFormCubit>(context)
                            .getCategories();
                      },
                    ),
                  ],
                );
              case DataFailed():
                return Column(
                  spacing: 30,
                  children: [
                    DataErrorWidget(
                      message: state.errorMessage,
                    ),
                    AdminCourseButton(
                      title: 'Try Again',
                      backgroundColor: Colors.green,
                      icon: Icons.restart_alt_outlined,
                      onPressed: () {
                        BlocProvider.of<RegisterFormCubit>(context)
                            .getCategories();
                      },
                    ),
                  ],
                );
              case DataLoaded():
                return CategoryChips(
                  categories: state.categories,
                );
              default:
                return const SizedBox();
            }
          },
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
