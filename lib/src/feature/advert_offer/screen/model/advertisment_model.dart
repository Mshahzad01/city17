final DateTime _dateTime = DateTime.now();

class AdvertismentModel {
  final String advertiserName;
  final String adImage;
  final String displayLocation;
  final String locationAddress;
  final String clientName;
  final bool autoApprove;
  final String startDate;
  final String endDate;
  final int hoursPerDay;
  final List<timesolot> scheduledTimes;

  AdvertismentModel({
    required this.advertiserName,
    required this.adImage,
    required this.displayLocation,
    required this.locationAddress,
    required this.clientName,
    required this.autoApprove,
    required this.startDate,
    required this.endDate,
    required this.hoursPerDay,
    required this.scheduledTimes,
  });
}

class timesolot {
  final DateTime time;
  bool isasepted;

  timesolot({required this.time, required this.isasepted});
}

class Alladervertisment {
  final DateTime dateTime;

  final String alert;
  List<AdvertismentModel> addata;

  Alladervertisment({
    required this.dateTime,
    required this.addata,
    required this.alert,
  });
}

// Dumy Data Adverisments
final List<Alladervertisment> dummyAdvertismentData = [
  Alladervertisment(
    dateTime: DateTime.now(),
    alert:
        'Bidding allows multiple offers per hour — the highest bid wins. Earnings vary per hour based on accepted bids.',

    addata: [
      AdvertismentModel(
        advertiserName: 'James Wilson',
        adImage: 'assets/image/adpitcher.png',
        displayLocation: 'Hilton Hotel',
        locationAddress: 'Hilton 483 George St, Sydney',
        clientName: 'James Wilson',
        autoApprove: true,
        startDate: '01-04-2025',
        endDate: '01-06-2025',
        hoursPerDay: 04,
        scheduledTimes: [
          timesolot(
            time: DateTime.now().add(Duration(hours: 1)),
            isasepted: true,
          ),
          timesolot(
            time: DateTime.now().add(Duration(hours: 2)),
            isasepted: false,
          ),
          timesolot(
            time: DateTime.now().add(Duration(hours: 3)),
            isasepted: true,
          ),
        ],
      ),

      AdvertismentModel(
        advertiserName: 'Sarah Taylor',
        adImage: 'assets/image/adpitcher.png',
        displayLocation: 'Mall of Emirates',
        locationAddress: 'Sheikh Zayed Rd - Dubai',
        clientName: 'Sarah Taylor',
        autoApprove: false,
        startDate: '15-04-2025',
        endDate: '15-06-2025',
        hoursPerDay: 05,
        scheduledTimes: [
          timesolot(
            time: DateTime.now().add(Duration(hours: 4)),
            isasepted: true,
          ),
          timesolot(
            time: DateTime.now().add(Duration(hours: 5)),
            isasepted: false,
          ),
        ],
      ),
    ],
  ),
];
