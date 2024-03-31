import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/pages/home/viewModel/articleCubit/categoryCubit.dart';
import 'package:untitled2/pages/home/widget/tab_bar_item.dart';

import '../../models/source_model.dart';
import 'artical_list_widget.dart';

class NewsListView extends StatefulWidget {
  final List<SourceModel> sourcesList;

  const NewsListView({
    super.key,
    required this.sourcesList,
  });

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  int selectedIndex = 0;
  var CubitViewModel = ArticlesCubit();

  @override
  void initState() {
    CubitViewModel.getNewsArticles(widget.sourcesList[selectedIndex].id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CubitViewModel,
        // bloc:CubitViewModel ,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DefaultTabController(
              length: widget.sourcesList.length,
              initialIndex: selectedIndex,
              child: TabBar(
                padding: const EdgeInsets.symmetric(vertical: 15),
                isScrollable: true,
                indicator: const BoxDecoration(),
                labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                dividerColor: Colors.transparent,
                //  dividerHeight: 0,
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                    CubitViewModel.getNewsArticles(
                        widget.sourcesList[selectedIndex].id);
                  });
                },
                tabs: widget.sourcesList
                    .map(
                      (e) => TabItem(
                        sourceModel: e,
                        isSelected:
                            selectedIndex == widget.sourcesList.indexOf(e),
                      ),
                    )
                    .toList(),
              ),
            ),
            ArticleListWidget(
              sourceId: widget.sourcesList[selectedIndex].id,
            ),
          ],
        ));
  }
}
