import 'package:fitness_app/app/components/custom_textfield.dart';
import 'package:fitness_app/app/modules/search/controllers/search_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = Get.put(SearchController());
    return CustomTextField(
      title: '',
      hintText: 'Search for workout',
      controller: searchController.searchController,
      suffix: Icon(
        Icons.search,
        color: Colors.black,
      ),
    );
  }
}
