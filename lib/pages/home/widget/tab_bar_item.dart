import 'package:flutter/material.dart';

import '../../../core/config/constants.dart';
import '../../models/source_model.dart';

class TabItem extends StatelessWidget {
  final SourceModel sourceModel;
  bool isSelected;

  TabItem({
    super.key,
    required this.sourceModel,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? Constant.theme.primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(
          color: Constant.theme.primaryColor,
          width: 2,
        ),
      ),
      child: Text(
        sourceModel.name,
        style: Constant.theme.textTheme.bodyMedium?.copyWith(
          color: isSelected ? Colors.white : Constant.theme.primaryColor,
        ),
      ),
    );
  }
}
/*
 CategoryModel(id: "sports",
          title: "Sports",
          image: ("assets/image/sports_icn.png"),
          backgroundColor: const Color(0xFFC91C22) ),
      CategoryModel(id: "general",
          title: "Politics",
          image: ("assets/image/business.png"),
          backgroundColor: const Color(0xFF003E90) ),
      CategoryModel(id: "healthy",
          title: "Health",
          image: ("assets/image/health.png"),
          backgroundColor: const Color(0xFFED1E79) ),
      CategoryModel(id: "business",
          title: "Business",
          image: ("assets/image/business.png"),
          backgroundColor: const Color(0xFFCF7E48)),
      CategoryModel(id: "environment",
          title: "Environment",
          image: ("assets/image/environment.png"),
          backgroundColor: const Color(0xFF4882CF) ),
      CategoryModel(id: "science",
          title: "Science",
          image: ("assets/image/science.png"),
          backgroundColor: const Color(0xFFF2D352) ),
    ];
*/