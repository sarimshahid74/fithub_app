import 'package:flutter/material.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fitness Tracker'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ActivitySection(),
            HeartRateSection(),
            NutritionSection(),
            WaterSection(),
            RecipesSection(),
            HomeSection(),
            TogetherSection(),
            ElevatedButton(
              onPressed: () {
                // Navigate to the StepCounter screen if needed
              },
              child: Text('View Step Counter'),
            ),
          ],
        ),
      ),
    );
  }
}

class ActivitySection extends StatelessWidget {
  const ActivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Activity',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Steps: 0'),
            Text('Distance: 0.00 km'),
            Text('Walking: 76%'),
            Text('Running: 24%'),
          ],
        ),
      ),
    );
  }
}

class HeartRateSection extends StatelessWidget {
  const HeartRateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Heart Rate',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('107 bpm'),
          ],
        ),
      ),
    );
  }
}

class NutritionSection extends StatelessWidget {
  const NutritionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nutrition',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Calories: 0.0 Kcal'),
            Text('Carbs: 0.0g'),
            Text('Fat: 0.0g'),
            Text('Protein: 0.0g'),
          ],
        ),
      ),
    );
  }
}

class WaterSection extends StatelessWidget {
  const WaterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Water',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Sleep'),
          ],
        ),
      ),
    );
  }
}

class RecipesSection extends StatelessWidget {
  const RecipesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Recipes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Plans'),
          ],
        ),
      ),
    );
  }
}

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Home',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Diary'),
          ],
        ),
      ),
    );
  }
}

class TogetherSection extends StatelessWidget {
  const TogetherSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Together',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
