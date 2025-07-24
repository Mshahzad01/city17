import 'package:city17/src/feature/advert_offer/enum/payment_frequency_enum.dart';
import 'package:city17/src/feature/advert_offer/enum/status_enum.dart';
import 'package:city17/src/feature/home/model/income_model.dart';
import 'package:intl/intl.dart';

class AdvertismentModel {
  final String advertiserName;
  final int advertiserPhoneNumber;
  final String advertiserImage;
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
  final List<TimeSlot> scheduledTimes;
  final int minimumprice;
  final int maximumprice;
  final IAmount amount;
  bool isAproval;
  final StatusEnum status;
  final PaymentFrequencyEnum paymentFrequency;

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
    required this.amount,
    required this.isAproval,
    required this.advertiserPhoneNumber,
    required this.status,
    required this.advertiserImage,
    required this.paymentFrequency,
  });

  static List<AdvertismentModel> dummyAds = List.generate(10, (index) {
    return AdvertismentModel(
      advertiserName: 'Elon Mask',
      advertiserPhoneNumber: 03298069581,
      adImage: 'https://picsum.photos/200/300?index=$index',
      displayLocation: 'Main Street Billboard $index',
      locationAddress: '1234 Street $index, City',
      clientName: 'Client $index',
      autoApprove: index % 2 == 0,
      startDate: DateTime.now().add(Duration(days: index)),
      endDate: DateTime.now().add(Duration(days: index + 7)),
      startTime: DateTime(2025, 7, 22, 9),
      endTime: DateTime(2025, 7, 22, 17),
      hoursPerDay: 8,
      scheduledTimes: List.generate(23, (i) {
        return TimeSlot(
          time: DateTime(2025, 7, 22, 9 + i * 3),
          isasepted: i % 5 == 0,
        );
      }),
      minimumprice: 50 + index + 1,
      maximumprice: 10 + index + 1,
      amount: IAmount(currency: 'US', amount: 10 + index * 1),
      isAproval: false,
      status: StatusEnum.running,
      paymentFrequency: PaymentFrequencyEnum.weekly,
      advertiserImage: 'https://randomuser.me/api/portraits/men/$index.jpg',
    );
  });

  static Map<DateTime, List<AdvertismentModel>> getDateMappedData() {
    final Map<DateTime, List<AdvertismentModel>> map = {};

    for (final element in dummyAds) {
      final dateWithouTime = DateTime(
        element.startDate.year,
        element.startDate.month,
        element.startDate.day,
      );

      map.putIfAbsent(dateWithouTime, () => []).add(element);
    }

    return map;
  }
}

class TimeSlot {
  final DateTime time;
  bool isasepted;

  TimeSlot({required this.time, required this.isasepted});
}

class IAmount {
  final num amount;
  final String currency;
  IAmount({required this.amount, required this.currency});

  String show() {
    final formattedAmount = NumberFormat.currency(
      name: currency,
      symbol: '\$',
      decimalDigits: 1,
    ).format(amount);

    return formattedAmount;
  }
}
