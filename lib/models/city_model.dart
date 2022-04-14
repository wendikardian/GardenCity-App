import 'package:garden_city_app/models/activity_model.dart';

class CityModel {
  String imageUrl;
  String city;
  String country;
  String description;
  List<Activity> activities;

  CityModel({
    this.imageUrl,
    this.city,
    this.country,
    this.description,
    this.activities,
  });
}

List<Activity> activities = [
  Activity(
    imageUrl: 'assets/images/activities1.jpg',
    name: 'Glasses Garden',
    type: 'Garden Tour',
    startTimes: ['9:00 am', '11:00 am'],
    rating: 5,
    price: 10,
  ),
  Activity(
    imageUrl: 'assets/images/activities2.jpg',
    name: 'Home Visit Garden',
    type: 'Home Visit',
    startTimes: ['11:00 pm', '1:00 pm'],
    rating: 4,
    price: 4,
  ),
  Activity(
    imageUrl: 'assets/images/activities3.jpg',
    name: 'Plan a Tree',
    type: 'Practice to seeding',
    startTimes: ['12:30 pm', '2:00 pm'],
    rating: 3,
    price: 8,
  ),
];

List<CityModel> cities = [
  CityModel(
    imageUrl: 'assets/images/chuttersnap-kNlPgoneOxA-unsplash.jpg',
    city: 'New York',
    country: 'United State',
    description: 'Visit the unforgettable moment at the modern city',
    activities: activities,
  ),
  CityModel(
    imageUrl: 'assets/images/leandro-peixoto-UcoKEoFbt_8-unsplash.jpg',
    city: 'Paris',
    country: 'France',
    description: 'Visit the unforgettable moment at the modern city.',
    activities: activities,
  ),
  CityModel(
    imageUrl: 'assets/images/sido-lee-5AT-vaVUABA-unsplash.jpg',
    city: 'Tokyo',
    country: 'Japan',
    description: 'Visit New Delhi for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  CityModel(
    imageUrl: 'assets/images/laurentiu-morariu-8Ol21Ngs9g8-unsplash.jpg',
    city: 'Kuala Lumpur',
    country: 'Malaysia',
    description: 'Visit Sao Paulo for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  CityModel(
    imageUrl: 'assets/images/markus-winkler-HeqXGxnsnX4-unsplash.jpg',
    city: 'Jakarta',
    country: 'Indonesia',
    description: 'Visit New York for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  CityModel(
    imageUrl: 'assets/images/piotr-musiol-ht0JnTjMdpw-unsplash.jpg',
    city: 'Pakistan',
    country: 'Saudi Arabia',
    description: 'Visit New York for an amazing and unforgettable adventure.',
    activities: activities,
  ),
];
