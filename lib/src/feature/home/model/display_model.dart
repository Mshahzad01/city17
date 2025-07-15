enum DisplayStatus {
  online,
  offline,
  draft;

  String get title => switch (this) {
    online => "Online",
    offline => "Ofline",
    draft => "Drafts",
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
  final String type;
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
    type: 'Hotel',
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
    type: 'Hotel',
    address: 'Multan Shalimar Calony',
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

// List<DisplayLocationModel
//> dummyDisplays = [
//   DisplayLocationModel(

//     display: 13,
//     type: "Hotel",
//     status: Display(
//       uptime: 99.9,
//       revenue: 23.00,
//       growth: 7.1,
//       status: DisplayStatus.online,
//       time: 'This week',
//       totaldisply: 10,
//       warning: 'These display currently Offline and not generate revenue',
//     ),
//     displayOffline: Display(
//       uptime: 99.9,
//       time: 'This week',
//       revenue: 23.00,
//       growth: 7.1,
//       status: DisplayStatus.offline,
//       totaldisply: 03,
//       warning: 'These display currently Offline and not generate revenue',
//     ),
//     displaydrat: Display(
//       uptime: 99.9,
//       revenue: 23.00,
//       growth: 7.1,
//       time: 'This week',
//       status: DisplayStatus.draft,
//       totaldisply: 1,
//       warning: 'These display currently Offline and not generate revenue',
//     ),
//   ),

//   DisplayLocationModel(

//     display: 13,
//     type: "Hotel",
//     displayOnline: Display(
//       uptime: 99.9,
//       revenue: 23.00,
//       growth: 7.1,
//       time: 'This week',
//       status: DisplayStatus.online,
//       totaldisply: 13,
//       warning: 'These display currently Offline and not generate revenue',
//     ),
//     displayOffline: Display(
//       uptime: 99.9,
//       revenue: 23.00,
//       growth: 7.1,
//       time: 'This week',
//       status: DisplayStatus.offline,
//       totaldisply: 03,
//       warning: 'These display currently Offline and not generate revenue',
//     ),
//     displaydrat: Display(
//       uptime: 99.9,
//       revenue: 23.00,
//       growth: 7.1,
//       time: 'This week',
//       status: DisplayStatus.draft,
//       totaldisply: 01,
//       warning: 'These display currently Offline and not generate revenue',
//     ),
//   ),
// ];
