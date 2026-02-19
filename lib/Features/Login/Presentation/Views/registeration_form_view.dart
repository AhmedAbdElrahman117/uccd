import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Components/page_indicator.dart';
import 'package:uccd/Core/Models/user_model.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Add%20Course/next_page_button.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Add%20Course/previous_page_button.dart';
import 'package:uccd/Features/Login/Presentation/Views%20Model/Register%20Form%20Cubit/register_form_cubit.dart';
import 'package:uccd/Features/Login/Presentation/Views%20Model/Register%20Form%20Cubit/register_form_states.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/register_category_page.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/register_info_page.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/submit_register_form.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/terms_register_page.dart';
import 'package:uccd/Features/Login/Presentation/Views/register_confirmation_view.dart';

class RegisterationFormView extends StatefulWidget {
  const RegisterationFormView({super.key, required this.user});

  static String id = '/RegisterationFormView';
  final UserModel user;

  @override
  State<RegisterationFormView> createState() => _RegisterationFormViewState();
}

class _RegisterationFormViewState extends State<RegisterationFormView> {
  PageController pageController = PageController();
  int current = 0;

  List<String> selected = [];

  GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController graduationYearController =
      TextEditingController();
  final TextEditingController disabilityController = TextEditingController();

  late RegisterFormCubit cubit;

  @override
  void initState() {
    cubit = RegisterFormCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              spacing: 20,
              children: [
                Expanded(
                  child: PageView(
                    controller: pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      RegisterInfoPage(
                        formKey: formKey,
                        disabilityController: disabilityController,
                        graduationYearController: graduationYearController,
                        phoneNumberController: phoneNumberController,
                      ),
                      const RegisterCategoryPage(),
                      const TermsRegisterPage(),
                    ],
                  ),
                ),
                PageIndicator(
                  pageController: pageController,
                  pagesCount: 3,
                ),
                BlocConsumer<RegisterFormCubit, RegisterFormStates>(
                  listener: (context, state) {
                    if (state is RegisterLoading) {
                      context.push(
                        RegisterConfirmationView.id,
                        extra: cubit,
                      );
                    }
                  },
                  buildWhen: (previous, current) {
                    return current is ChangePage;
                  },
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PreviousPageButton(
                          isZero: BlocProvider.of<RegisterFormCubit>(context)
                                  .current ==
                              0,
                          onPressed: () {
                            BlocProvider.of<RegisterFormCubit>(context)
                                .previousPage(
                              pageController,
                            );
                          },
                        ),
                        Visibility(
                          visible: BlocProvider.of<RegisterFormCubit>(context)
                                  .current !=
                              2,
                          replacement: SubmitRegisterForm(
                            isEnabled: context.select<RegisterFormCubit, bool>(
                              (value) => value.isAgree,
                            ),
                            onPressed: () {
                              BlocProvider.of<RegisterFormCubit>(context)
                                  .register(
                                id: widget.user.id!,
                                phone: phoneNumberController.text,
                                graduationYear: AppDates.stringToTimeStamp(
                                  graduationYearController.text,
                                ),
                                disability: disabilityController.text,
                              );
                            },
                          ),
                          child: NextPageButton(
                            onPressed: () {
                              BlocProvider.of<RegisterFormCubit>(context)
                                  .nextPage(
                                pageController,
                                formKey,
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
