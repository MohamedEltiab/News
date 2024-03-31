import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/network/api_manager.dart';
import 'package:untitled2/pages/home/viewModel/CategoryCupit/CategoryStates.dart';

class categoryCubit extends Cubit<categoryStates> {
  categoryCubit() : super(LoadingCategoryStates());

  getNewsDataSources(String categoryId) async {
    emit(LoadingCategoryStates());
    try {
      var sourcesList = await ApiManager.fetchDataSource(categoryId);
      emit(SucessCategoryStates(sourcesList));
    } catch (error) {
      emit(ErrorCategoryStates(error.toString()));
    }
  }
}
