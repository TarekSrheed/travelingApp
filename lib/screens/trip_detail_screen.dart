import 'package:flutter/material.dart';
import 'package:traveling_app/app_data.dart';

class TripDetailScreen extends StatelessWidget {
  // const TripDetailScreen({Key? key}) : super(key: key);
  static const screenRouds = '/trip-details';
  final Function manageFavorite;
  final Function isfavorites;
  TripDetailScreen(this.manageFavorite, this.isfavorites);

  Widget buildsectionTitle(BuildContext context, String titleText) {
    return Container(
      alignment: Alignment.topRight,
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Widget buildListViweContainer(Widget child) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      height: 200,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    //TripItem tripItem = tripItem;
    final tripId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedTrip = Trips_data.firstWhere((trip) => trip.id == tripId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedTrip.title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedTrip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildsectionTitle(context, 'الانشطة'),
            buildListViweContainer(
              ListView.builder(
                itemCount: selectedTrip.activities.length,
                itemBuilder: (ctx, index) => Card(
                  elevation: 0.3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Text(selectedTrip.activities[index]),
                  ),
                ),
              ),
            ),
            buildsectionTitle(context, 'البرنامج اليومي'),
            buildListViweContainer(
              ListView.builder(
                itemCount: selectedTrip.program.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('يوم ${index + 1}'),
                      ),
                      title: Text(selectedTrip.program[index]),
                    ),
                    const Divider()
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isfavorites(tripId) ? Icons.star : Icons.star_border,
          size: 33,
        ),
        onPressed: () => manageFavorite(tripId),
      ),
    );
  }
}
