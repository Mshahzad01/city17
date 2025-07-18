import 'package:city17/src/feature/location_setting/enum/business_category_enum.dart';
import 'package:flutter/material.dart';

enum DisplayStatus {
  online,
  offline,
  draft;

  String get title => switch (this) {
    online => "Online",
    offline => "Ofline",
    draft => "Drafts",
  };

  Color get color => switch (this) {
    online => Colors.green,
    offline => Colors.redAccent,
    draft => Colors.grey,
  };
}

class Display {
  final String name;
  final DisplayStatus status;
  final double uptime;
  final double revenue;
  final double growth;
  final int totaldisply;
  final String time;
  final String warning;

  Display({
    required this.name,
    required this.uptime,
    required this.revenue,
    required this.growth,
    required this.status,
    required this.totaldisply,
    required this.time,
    required this.warning,
  });
}

class DisplayLocationModel {
  final String name;
 final BusinessCategoryEnum type;
  final String address;

  List<Display> displaydumydata;
  DisplayLocationModel({
    required this.type,
    required this.address,
    required this.name,

    required this.displaydumydata,
  });
}

List<DisplayLocationModel> dumyDisplays = [
  DisplayLocationModel(
    name: 'Resturant Family Hall',
    type: BusinessCategoryEnum.hotel,
    address: 'Hilton 488 Georage St, Sydeny',
    displaydumydata: [
      Display(
        name: 'Display 1',
        uptime: 99.9,
        time: 'This week',
        revenue: 23.00,
        growth: 7.1,
        status: DisplayStatus.online,
        totaldisply: 03,
        warning: 'These display currently Offline and not generate revenue',
      ),

      Display(
        name: 'Display 1',
        uptime: 99.9,
        time: 'This week',
        revenue: 23.00,
        growth: 7.1,
        status: DisplayStatus.online,
        totaldisply: 03,
        warning: 'These display currently Offline and not generate revenue',
      ),
      Display(
        name: 'Display 1',
        uptime: 99.9,
        time: 'This week',
        revenue: 23.00,
        growth: 7.1,
        status: DisplayStatus.online,
        totaldisply: 03,
        warning: 'These display currently Offline and not generate revenue',
      ),
      Display(
        name: 'Display 1',
        uptime: 99.9,
        time: 'This week',
        revenue: 23.00,
        growth: 7.1,
        status: DisplayStatus.offline,
        totaldisply: 03,
        warning: 'These display currently Offline and not generate revenue',
      ),
      Display(
        name: 'Display 1',
        uptime: 99.9,
        time: 'This week',
        revenue: 23.00,
        growth: 7.1,
        status: DisplayStatus.offline,
        totaldisply: 03,
        warning: 'These display currently Offline and not generate revenue',
      ),

      Display(
        name: 'Display 1',
        uptime: 0,
        time: 'This week',
        revenue: 0,
        growth: 0,
        status: DisplayStatus.draft,
        totaldisply: 0,
        warning: 'These display currently Offline and not generate revenue',
      ),
    ],
  ),

  DisplayLocationModel(
    name: 'Hilton Hotel',
    type: BusinessCategoryEnum.hotel,
    address: 'Multan Shalimar Calony fdada',
    displaydumydata: [
      Display(
        name: 'Display 1',
        uptime: 99.9,
        time: 'This week',
        revenue: 23.00,
        growth: 7.1,
        status: DisplayStatus.online,
        totaldisply: 03,
        warning: 'These display currently Offline and not generate revenue',
      ),

      Display(
        name: 'Display 1',
        uptime: 99.9,
        time: 'This week',
        revenue: 23.00,
        growth: 7.1,
        status: DisplayStatus.online,
        totaldisply: 03,
        warning: 'These display currently Offline and not generate revenue',
      ),
      Display(
        name: 'Display 1',
        uptime: 99.9,
        time: 'This week',
        revenue: 23.00,
        growth: 7.1,
        status: DisplayStatus.offline,
        totaldisply: 03,
        warning: 'These display currently Offline and not generate revenue',
      ),
      Display(
        name: 'Display 1',
        uptime: 99.9,
        time: 'This week',
        revenue: 23.00,
        growth: 7.1,
        status: DisplayStatus.offline,
        totaldisply: 03,
        warning: 'These display currently Offline and not generate revenue',
      ),
      Display(
        name: 'Display 1',
        uptime: 99.9,
        time: 'This week',
        revenue: 23.00,
        growth: 7.1,
        status: DisplayStatus.offline,
        totaldisply: 03,
        warning: 'These display currently Offline and not generate revenue',
      ),

      Display(
        name: 'Display 1',
        uptime: 0,
        time: 'This week',
        revenue: 0,
        growth: 0,
        status: DisplayStatus.draft,
        totaldisply: 0,
        warning: 'These display currently Offline and not generate revenue',
      ),
    ],
  ),
];
