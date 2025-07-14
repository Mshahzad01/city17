enum DisplayStatus { online, offline, draft;



String  get title => switch(this){

  
 online => "Online",
 offline => "Ofline",
 draft => "Drafts",
}; 
 
 

 int get value => switch(this){


  online => 13,
  offline => 03,
  draft => 01,
 };

 

}






class DisplayModel {
  final String title;
  final String address;
  final double uptime;
  final double revenue;
  final double growth;
  final DisplayStatus status;
  final bool isSetupCompleted;


      
  final int display;
  final String type;

  DisplayModel({
    required this.title,
    required this.address,
    required this.uptime,
    required this.revenue,
    required this.growth,
    required this.status,
    this.isSetupCompleted = true,
    required this.display,
    required this.type,

  });
}

List<DisplayModel> dummyDisplays = [

  DisplayModel(
    title: "Restaurant Family Hall",
    address: "Hilton 488 Georage St, Sydeny",
    uptime: 99.9,
    revenue: 23.00,
    growth: 7.01,
    status: DisplayStatus.offline,
    display: 13,
    type: "Hotel",

  ),
  DisplayModel(
    title: "Restaurant Family Hall",
    address: "Hilton 488 Georage St, Sydeny",
    uptime: 99.9,
    revenue: 23.00,
    growth: 7.01,
    status: DisplayStatus.online,
    display: 13,
      type: "Hotel", 
    //  value: DisplayStatus
  ),
  DisplayModel(
    title: "Restaurant Family Hall",
    address: "Hilton 488 Georage St, Sydeny",
    uptime: 99.9,
    revenue: 23.00,
    growth: 7.01,
    status: DisplayStatus.offline,
    display: 13,
      type: "Hotel",
    //   value: null
  ),


  DisplayModel(
    title: "Restaurant Family Hall",
    address: "Hilton 488 Georage St, Sydeny",
    uptime: 99.9,
    revenue: 23.00,
    growth: 7.01,
    status: DisplayStatus.online,
    display: 13,
      type: "Hotel",
    
  ),
  DisplayModel(
    title: "Entrance Standee",
    address: "Hilton 488 Georage St, Sydeny",
    uptime: 99.9,
    revenue: 23.00,
    growth: 7.01,
    status: DisplayStatus.online,
    display: 13,
      type: "Hotel", 
  
  ),
  DisplayModel(
    title: "Restaurant Family Hall",
    address: "Hilton 488 Georage St, Sydeny",
    uptime: 99.9,
    revenue: 23.00,
    growth: 7.01,
    status: DisplayStatus.online,
    display: 13,
      type: "Hotel", 
     // value: null
  ),
  DisplayModel(
    title: "Entrance Standee",
    address: "Hilton 488 Georage St, Sydeny       ",
    uptime: 99.9,
    revenue: 23.00,
    growth: 7.01,
    status: DisplayStatus.online,
    display: 13,
      type: "Hotel",
      // value: 
  ),

 
];
