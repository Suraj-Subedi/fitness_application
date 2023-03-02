import 'package:fitness_app/app/components/search_box.dart';
import 'package:fitness_app/app/utils/assets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 5.w,
            vertical: 5.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchBox(
                isSearch: true,
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 3.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent Searches',
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Clear all',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 3.w,
                ),
                child: Column(
                  children: [
                    RecentSearch(
                      title: 'Workout for belly',
                    ),
                    RecentSearch(title: 'best workout'),
                    RecentSearch(title: 'build abs'),
                    RecentSearch(title: 'pushups'),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text('Trending Workouts',
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 40.w,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return TrendingCard();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecentSearch extends StatelessWidget {
  final String title;
  const RecentSearch({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 11.sp,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.close,
              size: 12.sp,
            ),
          )
        ],
      ),
    );
  }
}

class TrendingCard extends StatelessWidget {
  const TrendingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1.20,
          child: Container(
            width: 40.w,
            margin: EdgeInsets.only(
              right: 3.w,
            ),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(Assets.runningImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          height: 40.w,
          width: 45.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.1),
                Colors.black.withOpacity(0.5),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 2.w,
          left: 3.w,
          child: Text(
            'Running',
            style: TextStyle(
              color: Colors.white,
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
