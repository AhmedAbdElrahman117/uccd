import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uccd/Core/Models/post_model.dart';
import 'package:uccd/Features/Community/Data/commnuity_repo.dart';
import 'package:uccd/Features/Community/Presentation/Views%20Model/Add%20Post%20Cubit/add_post_states.dart';

class AddPostCubit extends Cubit<AddPostStates> {
  AddPostCubit() : super(InitialState());

  final CommnuityRepo repo = CommnuityRepo();

  void addPost({required PostModel post, XFile? image}) async {
    emit(AddUpdateLoading());
    try {
      String message = await repo.addPost(
        post: post,
        image: image,
      );
      emit(
        AddUpdateSuccess(successMessage: message),
      );
    } catch (e) {
      emit(
        AddUpdateFailed(errormessage: e.toString()),
      );
    }
  }

  void updatePost({
    required PostModel post,
    required String newDescription,
    required XFile? image,
  }) async {
    emit(AddUpdateLoading());
    try {
      String message = await repo.updatePost(
        post: post,
        newDescription: newDescription,
        image: image,
      );
      emit(
        AddUpdateSuccess(successMessage: message),
      );
    } catch (e) {
      emit(
        AddUpdateFailed(errormessage: e.toString()),
      );
    }
  }
}
