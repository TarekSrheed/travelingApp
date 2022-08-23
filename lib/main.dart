import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:traveling_app/app_data.dart';
import 'package:traveling_app/models/trip.dart';
import 'package:traveling_app/screens/category_trips_screen.dart';
import 'package:traveling_app/screens/filter_screen.dart';
import 'package:traveling_app/screens/tabs_screen.dart';
import 'package:traveling_app/screens/trip_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };

  void _changeFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableTrips = Trips_data.where((trip) {
        if (_filters['summer'] == true && trip.isInSummer != true) {
          return false;
        }
        if (_filters['winter'] == true && trip.isInWinter != true) {
          return false;
        }
        if (_filters['winter'] == true && trip.isInWinter != true) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  List<Trip> _availableTrips = Trips_data;
  List<Trip> _favoratesTrips = [];
  void _manageFavorite(String tripId) {
    final existingIndex =
        _favoratesTrips.indexWhere((trip) => tripId == trip.id);

    if (existingIndex >= 0) {
      setState(() {
        _favoratesTrips.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoratesTrips.add(Trips_data.firstWhere((trip) => tripId == trip.id));
      });
    }
  }

  bool _isFovarite(String id) {
    return _favoratesTrips.any((trip) => id == trip.id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'), // English, no country code
      ],
      title: 'Travel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.amber,
        fontFamily: 'cairo',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline5: const TextStyle(
                  fontSize: 24,
                  fontFamily: 'Cairo',
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
              headline6: const TextStyle(
                  fontSize: 26,
                  fontFamily: 'Cairo',
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favoratesTrips),
        CategoryTripsScreen.screenRouds: (ctx) =>
            CategoryTripsScreen(_availableTrips),
        TripDetailScreen.screenRouds: (ctx) =>
            TripDetailScreen(_manageFavorite, _isFovarite),
        FilterScreen.screenRouds: (ctx) =>
            FilterScreen(_changeFilters, _filters),
      },
    );
  }
}
