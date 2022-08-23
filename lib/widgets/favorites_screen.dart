import 'package:flutter/material.dart';
import 'package:traveling_app/models/trip.dart';
import 'package:traveling_app/widgets/trip_item.dart';

class FaveritesScreen extends StatelessWidget {
  // const FaveritesScreen(favoritesTrips, {Key? key}) : super(key: key);

  List<Trip> favoritesTrips;
  FaveritesScreen(this.favoritesTrips);
  @override
  Widget build(BuildContext context) {
    if (favoritesTrips.isEmpty) {
      return const Center(
        child: Text(
          'ليس لديك أي رحلة في قائمة المفضلة',
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return TripItem(
            id: favoritesTrips[index].id,
            imageUrl: favoritesTrips[index].imageUrl,
            title: favoritesTrips[index].title,
            season: favoritesTrips[index].season,
            tripType: favoritesTrips[index].tripType,
            duration: favoritesTrips[index].duration,
            activities: [favoritesTrips[index].activities],
            // removeItem: _removetrip,
          );
        },
        itemCount: favoritesTrips.length,
      );
    }
  }
}
