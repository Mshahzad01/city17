class AdvertOfferModel {
  final String advertiserName;
  final String imageUrl;
  final String displayLocation;
  final String address;
  final int hoursPerDay;
  final DateTime startDate;
  final DateTime endDate;
  final double minRate;
  final double maxRate;

  AdvertOfferModel({
    required this.advertiserName,
    required this.imageUrl,
    required this.displayLocation,
    required this.address,
    required this.hoursPerDay,
    required this.startDate,
    required this.endDate,
    required this.minRate,
    required this.maxRate,
  });
}

List<AdvertOfferModel> offerList = [
  AdvertOfferModel(
    advertiserName: 'James Wilson',
    imageUrl: 'https://example.com/ad-image.jpg',
    displayLocation: 'Hilton Hotel',
    address: 'Hilton 488 George St, Sydney NSW 2000',
    hoursPerDay: 4,
    startDate: DateTime(2025, 4, 1),
    endDate: DateTime(2025, 6, 1),
    minRate: 10.0,
    maxRate: 14.0,
  ),
];
