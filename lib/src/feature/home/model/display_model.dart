enum DisplayStatus {
  online,
  offline,
  draft;

  String get title => switch (this) {
    online => "Online",
    offline => "Ofline",
    draft => "Drafts",
  };

  int get value => switch (this) {
    online => 13,
    offline => 03,
    draft => 01,
  };
}

class DisplayStatusData {

  final DisplayStatus status;
  final double uptime;
  final double revenue;
  final double growth;
  final int totaldisply;
    final String time;

  DisplayStatusData({
    required this.uptime,
    required this.revenue,
    required this.growth,
    required this.status,
    required this.totaldisply,
    required this.time,
  });
}

class DisplayModel {
  final String title;
  final String address;
  final double uptime;
  final double revenue;
  final double growth;

 
  final bool isSetupCompleted;

  final int display;
  final String type;
  final DisplayStatusData displayOnline;
  final DisplayStatusData displayOffline;
  final DisplayStatusData displaydrat;
  



  DisplayModel({
    required this.title,
    required this.address,
    required this.uptime,
    required this.revenue,
    required this.growth,

 
    this.isSetupCompleted = true,
    required this.display,
    required this.type,
 required this.displayOnline,  required this.displayOffline, required this.displaydrat, 
  
  });
}

List<DisplayModel> dummyDisplays = [
  DisplayModel(
    title: "Restaurant Family Hall",
    address: "Hilton 488 Georage St, Sydeny",
    uptime: 99.9,
    revenue: 23.00,
    growth: 7.1,
   

    display: 13,
    type: "Hotel", 
      displayOnline: DisplayStatusData(
        uptime: 99.9,
        revenue: 23.00,
         growth: 7.1,
          status: DisplayStatus.online,
           time: 'This week',
          totaldisply: 13), 
          displayOffline:  DisplayStatusData(
        uptime: 99.9,
          time: 'This week',
        revenue: 23.00,
         growth: 7.1,
          status: DisplayStatus.offline,
          totaldisply: 03),
           displaydrat:  DisplayStatusData(
        uptime: 99.9,
        revenue: 23.00,
         growth: 7.1,
          time: 'This week',
          status: DisplayStatus.draft,
          totaldisply: 1)
  ),


    DisplayModel(
    title: "Restaurant Family Hall",
    address: "Hilton 488 Georage St, Sydeny",
    uptime: 99.9,
    revenue: 23.00,
    growth: 7.1,
   
   
    display: 13,
    type: "Hotel", 
      displayOnline: DisplayStatusData(
        uptime: 99.9,
        revenue: 23.00,
         growth: 7.1,
           time: 'This week',
          status: DisplayStatus.online,
          totaldisply: 13), 
          displayOffline:  DisplayStatusData(
        uptime: 99.9,
        revenue: 23.00,
         growth: 7.1,
           time: 'This week',
          status: DisplayStatus.offline,
          totaldisply: 03),
           displaydrat:  DisplayStatusData(
        uptime: 99.9,
        revenue: 23.00,
         growth: 7.1,
           time: 'This week',
          status: DisplayStatus.draft,
          totaldisply: 1)
  ),
    

];
