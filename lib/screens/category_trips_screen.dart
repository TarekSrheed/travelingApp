import 'package:flutter/material.dart';
import 'package:traveling_app/app_data.dart';
import 'package:traveling_app/models/trip.dart';
import 'package:traveling_app/widgets/trip_item.dart';

class CategoryTripsScreen extends StatefulWidget {
  // // const CategoryTripsScreen({
  // //   Key? key,
  // }) : super(key: key);
  static const screenRouds = 'category_trips';

  CategoryTripsScreen(this.availabeTrips);

  List<Trip> availabeTrips;
  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  late String? categoryTitle;
  late List<Trip> displayTrip;
  @override
  // void initState() {
  //   //....
  //   super.initState();
  // }

  @override
  void didChangeDependencies() {
    final routeArgument =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArgument['id'];
    categoryTitle = routeArgument['title'];
    displayTrip = widget.availabeTrips.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removetrip(String tripId) {
    setState(() {
      displayTrip.removeWhere((trip) => tripId == trip.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TripItem(
            id: displayTrip[index].id,
            imageUrl: displayTrip[index].imageUrl,
            title: displayTrip[index].title,
            season: displayTrip[index].season,
            tripType: displayTrip[index].tripType,
            duration: displayTrip[index].duration,
            activities: [displayTrip[index].activities],
            //      removeItem: _removetrip,
          );
        },
        itemCount: displayTrip.length,
      ),
    );
  }
}
