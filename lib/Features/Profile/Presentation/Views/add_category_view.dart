import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Components/custom_loading_indicator.dart';
import 'package:uccd/Core/Components/overlay_background.dart';
import 'package:uccd/Core/Components/section_title.dart';
import 'package:uccd/Core/Models/category_model.dart';
import 'package:uccd/Core/app_banners.dart';
import 'package:uccd/Core/app_exception.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Add%20Category%20Cubit/add_category_cubit.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Add%20Category%20Cubit/add_category_states.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Categories/add_category_button.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Categories/category_name_field.dart';
import 'package:uccd/generated/l10n.dart';

class AddCategoryView extends StatefulWidget {
  const AddCategoryView({
    super.key,
    this.category,
  });

  final CategoryModel? category;

  @override
  State<AddCategoryView> createState() => _AddCategoryViewState();
}

class _AddCategoryViewState extends State<AddCategoryView> {
  final GlobalKey<FormState> categoryFormKey = GlobalKey();
  late TextEditingController categoryName;

  @override
  void initState() {
    categoryName = TextEditingController(
      text: widget.category?.name,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCategoryCubit(),
      child: BlocListener<AddCategoryCubit, AddCategoryStates>(
        listener: _listener,
        child: Stack(
          children: [
            OverlayBackground(
              child: Form(
                key: categoryFormKey,
                child: Column(
                  spacing: 30,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SectionTitle(
                      title: widget.category == null
                          ? S.of(context).addCategoryTitle
                          : S.of(context).editCategoryTitle,
                    ),
                    CategoryNameField(
                      categoryName: categoryName,
                    ),
                    AddCategoryButton(
                      categoryFormKey: categoryFormKey,
                      categoryName: categoryName,
                      category: widget.category,
                    ),
                  ],
                ),
              ),
            ),
            BlocSelector<AddCategoryCubit, AddCategoryStates, bool>(
              selector: (state) {
                if (state is AddUpdateLoading) {
                  return true;
                }
                return false;
              },
              builder: (context, state) {
                return CustomLoadingIndicator(
                  isLoading: state,
                  child: const SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _listener(BuildContext context, AddCategoryStates state) {
    if (state is AddUpdateSuccess) {
      AppBanners.showSuccess(
        message: AppException.getLocalizedMessage(
          state.successMessage,
          context,
        ),
      );
      context.pop();
    } else if (state is AddUpdateFailed) {
      AppBanners.showFailed(
        message: AppException.getLocalizedMessage(
          state.errorMessage,
          context,
        ),
      );
    }
  }
}
