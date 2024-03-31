import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/constants.dart';
import '../../models/category.dart';
import '../viewModel/CategoryCupit/CategoryStates.dart';
import '../viewModel/CategoryCupit/categoryCubit.dart';
import '../widget/news_list_view.dart';

class CategoryView extends StatefulWidget {
  final CategoryModel categoryModel;

  const CategoryView({
    super.key,
    required this.categoryModel,
  });

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  var cubitViewModel = categoryCubit();

  @override
  void initState() {
    cubitViewModel.getNewsDataSources(widget.categoryModel.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<categoryCubit, categoryStates>(
        bloc: cubitViewModel,
        builder: (context, state) {
          switch (state) {
            case LoadingCategoryStates():
              {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            case ErrorCategoryStates():
              {
                return Center(
                  child: Text(
                    "Something went wrong",
                    style: Constant.theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.black,
                    ),
                  ),
                );
              }
            case SucessCategoryStates():
              {
                return NewsListView(sourcesList: state.sourcesList);
              }
          }

          // return widget here based on BlocA's state
        });
  }
}
/*
 child: FutureBuilder(
        future: ApiManager.fetchDataSource(widget.categoryModel.id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Something went wrong",
                style: Constant.theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List<SourceModel> sourcesList = snapshot.data ?? [];

          return NewsListView(sourcesList: sourcesList);
        },
      ),
*/

/*

return BlocBuilder<CategoryCubit, CategoryStates>(
        bloc:cubitViewModel,

        builder: (context, state)
        {
          switch(state)
              {
            case LoadingCategoryStates():
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ErrorCategoryStates():
              return Center(
                child: Text(
                  "Something went wrong",
                  style: Constant.theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.black,
                  ),
                ),
              );
            case SucessCategoryStates():
              return NewsListView(sourcesList: sourcesList);

          }

          // return widget here based on BlocA's state
        }
    );
 */