import 'package:flutter/material.dart';

import '../api/mock_foodlich_service.dart';
import '../component/components.dart';
import '../model/explore_data.dart';

class ExploreScreen extends StatelessWidget {
  final mockService = MockFoodlichService();

  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            scrollDirection: Axis.vertical,
            children: [
              TodayRecipeListView(recipes: snapshot.data?.todayRecipes ?? []),
              const SizedBox(height: 16),
              FriendPostListView(
                friendPosts: snapshot.data?.friendPosts ?? [],
              )
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
