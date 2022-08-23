import 'package:flutter/material.dart';
import 'package:traveling_app/models/trip.dart';
import 'package:traveling_app/screens/trip_detail_screen.dart';

class TripItem extends StatelessWidget {
  const TripItem(
      {Key? key,
      required this.duration,
      required this.imageUrl,
      required this.title,
      required this.tripType,
      required this.season,
      required this.id,
      //  required this.removeItem,
      required this.activities})
      : super(key: key);
  final String id;
  final int duration;
  final String imageUrl;
  final String title;
  final TripType tripType;
  final Season season;
  final List activities;
  // final Function removeItem;

  String get seasonText {
    switch (season) {
      case Season.Autumn:
        return 'خريف';
        break;
      case Season.Spring:
        return 'ربيع';
        break;
      case Season.Winter:
        return 'شتاء';
        break;
      case Season.Summer:
        return 'صيف';
        break;
      default:
        return 'غير معروف';
    }
  }

  String get tripTypeText {
    switch (tripType) {
      case TripType.Activities:
        return 'انشطة';
        break;
      case TripType.Exploration:
        return 'اشتكشاف';
        break;
      case TripType.Recovery:
        return 'نقاهة';
        break;
      case TripType.Therapy:
        return 'معالجة';
        break;
      default:
        return 'غير معروف';
    }
  }

  void selectTrip(BuildContext context) {
    Navigator.of(context)
        .pushNamed(TripDetailScreen.screenRouds, arguments: id)
        .then((result) {
      if (result != null) {
        //      removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 7,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 250,
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.8),
                      ],
                      stops: const [0.6, 1],
                    ),
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.today,
                        color: Theme.of(context).accentColor,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        '$duration ايام',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.wb_sunny,
                        color: Theme.of(context).accentColor,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        seasonText,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.family_restroom,
                        color: Theme.of(context).accentColor,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        tripTypeText,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
