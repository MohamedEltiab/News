import '../../../models/source_model.dart';

sealed class categoryStates {}

class ErrorCategoryStates extends categoryStates {
  String? errorMassage;

  ErrorCategoryStates(this.errorMassage);
}

class SucessCategoryStates extends categoryStates {
  List<SourceModel> sourcesList;

  SucessCategoryStates(this.sourcesList);
}

class LoadingCategoryStates extends categoryStates {}
