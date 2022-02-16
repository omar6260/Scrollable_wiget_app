import 'package:flutter/material.dart';

import '../api/mock_foodlich_service.dart';
import '../component/components.dart';
import '../model/models.dart';

class RecipesScreen extends StatelessWidget {
  final exploreService = MockFoodlichService();

  RecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: exploreService.getRecipes(),
      builder: (context, AsyncSnapshot<List<SimpleRecipe>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return RecipesGridView(recipes: snapshot.data ?? []);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
