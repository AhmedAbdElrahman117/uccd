import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Components/Fields/alpha_numeric_field.dart';
import 'package:uccd/Core/Components/Fields/email_field.dart';
import 'package:uccd/Core/Components/Fields/password_field.dart';
import 'package:uccd/Core/Components/custom_button.dart';
import 'package:uccd/Core/Components/custom_loading_indicator.dart';
import 'package:uccd/Core/Components/overlay_background.dart';
import 'package:uccd/Core/Components/section_title.dart';
import 'package:uccd/Core/Models/user_model.dart';
import 'package:uccd/Core/app_banners.dart'; // Make sure to add this import
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Add%20Admin%20Cubit/add_admin_cubit.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Add%20Admin%20Cubit/add_admin_state.dart';
import 'package:uccd/generated/l10n.dart';

class AddAdminView extends StatefulWidget {
  const AddAdminView({super.key, this.user});

  final UserModel? user;

  @override
  State<AddAdminView> createState() => _AddAdminViewState();
}

class _AddAdminViewState extends State<AddAdminView> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _usernameController = TextEditingController(
      text: widget.user?.name,
    );
    _passwordController = TextEditingController(
      text: widget.user?.password,
    );
    _emailController = TextEditingController(
      text: widget.user?.email,
    );
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddAdminCubit(),
      child: BlocConsumer<AddAdminCubit, AddAdminState>(
        listener: (context, state) {
          if (state is AddAdminSuccess) {
            AppBanners.showSuccess(
              message: widget.user == null
                  ? S.of(context).adminAddedSuccessfully
                  : S.of(context).adminUpdatedSuccessfully,
            );
            context.pop();
          } else if (state is AddAdminFailed) {
            AppBanners.showFailed(
              message: state.errorMessage,
            );
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              OverlayBackground(
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SectionTitle(
                          title: widget.user == null
                              ? S.of(context).addAdminTitle
                              : S.of(context).editAdminTitle,
                        ),
                        const SizedBox(height: 16),
                        AlphaNumericField(
                          controller: _usernameController,
                          label: S.of(context).adminNameLabel,
                          hint: S.of(context).adminNameHint,
                          icon: Icons.person,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return S.of(context).usernameRequired;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        EmailField(
                          emailController: _emailController,
                          label: S.of(context).adminEmailLabel,
                          hint: S.of(context).adminEmailHint,
                        ),
                        const SizedBox(height: 16),
                        PasswordField(
                          passwordController: _passwordController,
                          label: S.of(context).password,
                          hint: S.of(context).passwordHint,
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            title: widget.user == null
                                ? S.of(context).addButtonLabel
                                : S.of(context).editButtonLabel,
                            onPressed: state is AddAdminLoading
                                ? null
                                : () {
                                    if (_formKey.currentState!.validate()) {
                                      context.read<AddAdminCubit>().add(
                                            isAdd: widget.user == null,
                                            name: _usernameController.text,
                                            email: _emailController.text,
                                            password: _passwordController.text,
                                            currentUser: widget.user,
                                          );
                                    }
                                  },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Loading indicator
              CustomLoadingIndicator(
                isLoading: state is AddAdminLoading,
                child: const SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
