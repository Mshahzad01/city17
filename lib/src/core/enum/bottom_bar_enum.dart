

enum BottomBarEnum {

  home,offer,finance,setting;


  String get title => switch(this){
     
     home => 'Home',
     offer=> 'Offer',
     finance=> 'Finance',
     setting=> 'Setting',

  };



 

  int get indexx{
    switch (this) {
      case BottomBarEnum.home:
        return 0;
      case BottomBarEnum.offer:
        return 1;
      case BottomBarEnum.finance:
        return 2;
      case BottomBarEnum.setting:
        return 3;
    }
  }
}




  