class GardenModel {
  String imageUrl;
  String name;
  String address;
  int price;

  GardenModel({
    this.imageUrl,
    this.name,
    this.address,
    this.price,
  });
}

final List<GardenModel>gardens = [
  GardenModel(
    imageUrl: 'assets/images/garden1.jpg',
    name: 'St Vincent Gd',
    address: '404 Great St',
    price: 5,
  ),
  GardenModel(
    imageUrl: 'assets/images/garden2.jpg',
    name: 'SF Garden',
    address: '404 Great St',
    price: 3,
  ),
  GardenModel(
    imageUrl: 'assets/images/garden3.jpg',
    name: 'Roman Garden',
    address: '404 Great St',
    price: 9,
  ),
];
