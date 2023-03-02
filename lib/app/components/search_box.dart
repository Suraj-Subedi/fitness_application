import 'package:fitness_app/app/components/custom_textfield.dart';
import 'package:fitness_app/app/modules/main/controllers/main_controller.dart';
import 'package:fitness_app/app/modules/search/controllers/search_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBox extends StatelessWidget {
  final bool ishome;
  final bool isSearch;
  const SearchBox({super.key, this.ishome = false, this.isSearch = false});

  @override
  Widget build(BuildContext context) {
    var searchController = Get.put(SearchController());
    var mainController = Get.find<MainController>();
    return GestureDetector(
      onTap: () {
        if (ishome) {
          mainController.persistentTabController.jumpToTab(1);
        }
      },
      child: CustomTextField(
        // autofocus: isSearch ? true : false,
        title: '',
        isEnabled: ishome ? false : true,
        hintText: 'Search for workout',
        controller: searchController.searchController,
        suffix: const Icon(
          Icons.search,
          color: Colors.black,
        ),
      ),
    );
  }
}
