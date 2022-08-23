import 'package:flutter/material.dart';
import 'package:traveling_app/screens/category_trips_screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);
  final String id;
  final String title;
  final String imageUrl;

  void selectGategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryTripsScreen.screenRouds,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectGategory(context),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.network(
              imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black.withOpacity(0.4),
            ),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ],
      ),
    );
  }
}
