// ignore_for_file: public_member_api_docs, sort_constructors_first

final DateTime _dateTime = DateTime.now();

class AdvertismentModel {
  final String advertiserName;
  final String adImage;
  final String displayLocation;
  final String locationAddress;
  final String clientName;
  final bool autoApprove;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime startTime;
  final DateTime endTime;
  final int hoursPerDay;
  final List<timeSlot> scheduledTimes;
  final int minimumprice;
  final int maximumprice;

  AdvertismentModel({
    required this.advertiserName,
    required this.adImage,
    required this.displayLocation,
    required this.locationAddress,
    required this.clientName,
    required this.autoApprove,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required this.hoursPerDay,
    required this.scheduledTimes,
    required this.minimumprice,
    required this.maximumprice,
  });
}

class timeSlot {
  final DateTime time;
  bool isasepted;

  timeSlot({required this.time, required this.isasepted});
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
    dateTime: DateTime(2025, 4, 2),
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
        startDate: DateTime(2025, 4, 2),
        endDate: DateTime(2025, 4, 4),
        hoursPerDay: 04,
        minimumprice: 12,
        maximumprice: 14,
        startTime: DateTime(2025, 04, 1, 14),
        endTime: DateTime(2025, 04, 1, 15),

        scheduledTimes: [
          timeSlot(
            time: DateTime.now().add(const Duration(hours: 1)),
            isasepted: true,
          ),
          timeSlot(
            time: DateTime.now().add(const Duration(hours: 2)),
            isasepted: false,
          ),
          timeSlot(
            time: DateTime.now().add(const Duration(hours: 3)),
            isasepted: true,
          ),

          timeSlot(
            time: DateTime.now().add(const Duration(hours: 1)),
            isasepted: true,
          ),
          timeSlot(
            time: DateTime.now().add(const Duration(hours: 2)),
            isasepted: false,
          ),
          timeSlot(
            time: DateTime.now().add(const Duration(hours: 3)),
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
        startDate: DateTime(2025, 4, 6),
        endDate: DateTime(2025, 4, 8),
        hoursPerDay: 05,
        minimumprice: 10,
        maximumprice: 16,
        startTime: DateTime(2025, 04, 1, 15),
        endTime: DateTime(2025, 04, 1, 16),
        scheduledTimes: [
          timeSlot(
            time: DateTime.now().add(const Duration(hours: 4)),
            isasepted: true,
          ),
          timeSlot(
            time: DateTime.now().add(const Duration(hours: 5)),
            isasepted: false,
          ),
        ],
      ),
    ],
  ),

  Alladervertisment(
    dateTime: DateTime(2025, 4, 4),
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
        startDate: DateTime(2025, 4, 2),
        endDate: DateTime(2025, 4, 4),
        hoursPerDay: 04,
        minimumprice: 12,
        maximumprice: 14,
        startTime: DateTime(2025, 04, 1, 16),
        endTime: DateTime(2025, 04, 1, 18),

        scheduledTimes: [
          timeSlot(
            time: DateTime.now().add(const Duration(hours: 1)),
            isasepted: true,
          ),
          timeSlot(
            time: DateTime.now().add(const Duration(hours: 2)),
            isasepted: false,
          ),
          timeSlot(
            time: DateTime.now().add(const Duration(hours: 3)),
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
        startDate: DateTime(2025, 4, 6),
        endDate: DateTime(2025, 4, 8),
        hoursPerDay: 05,
        minimumprice: 10,
        maximumprice: 16,
        startTime: DateTime(2025, 04, 1, 19),
        endTime: DateTime(2025, 04, 1, 10),
        scheduledTimes: [
          timeSlot(
            time: DateTime.now().add(const Duration(hours: 4)),
            isasepted: true,
          ),
          timeSlot(
            time: DateTime.now().add(const Duration(hours: 5)),
            isasepted: false,
          ),
        ],
      ),
    ],
  ),
];
