import 'dart:convert';

import 'package:city17/src/feature/advert_offer/model/advertisment_model.dart';

class AuthResponse {
  final UserModel user;
  final String token;

  AuthResponse({required this.user, required this.token});

  factory AuthResponse.fromMap(Map<String, dynamic> map) {
    return AuthResponse(
      token: map['token'],
      user: UserModel.fromMap(map['user']),
    );
  }

  factory AuthResponse.fromJson(String source) =>
      AuthResponse.fromMap(json.decode(source));

  AuthResponse copyWith({String? token, UserModel? user}) {
    return AuthResponse(token: token ?? this.token, user: user ?? this.user);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'token': token, 'user': user.toMap()};
  }

  String toJson() => json.encode(toMap());
}

// user Model
class UserModel {
  final String id;
  final String email;
  final String name;
  final String? phoneNumber;
  final String profilePic;
  final String googleId;
  final bool outBidNotifications;
  final bool advertApprovalNotifications;
  final String createdAt;
  final String updatedAt;
  final DeviceInfo? deviceInfo;
  final Wallet? wallet;
  final VerifyCredentials? verifyCredentials;
  final Preferences? preferences;
  final PaymentMethods? paymentMethods;
  final int v;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.phoneNumber,
    required this.profilePic,
    required this.googleId,
    required this.outBidNotifications,
    required this.advertApprovalNotifications,
    required this.createdAt,
    required this.updatedAt,
    this.deviceInfo,
    this.wallet,
    this.verifyCredentials,
    this.preferences,
    this.paymentMethods,
    required this.v,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['_id'],
      email: map['email'],
      name: map['name'],
      phoneNumber: map['phoneNumber'],
      profilePic: map['profilePic'],
      googleId: map['googleId'],
      outBidNotifications: map['outBidNotifications'],
      advertApprovalNotifications: map['advertApprovalNotifications'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      deviceInfo: map['deviceInfo'] != null
          ? DeviceInfo.fromMap(map['deviceInfo'])
          : null,
      wallet: map['wallet'] != null ? Wallet.fromMap(map['wallet']) : null,
      verifyCredentials: map['verifyCredentials'] != null
          ? VerifyCredentials.fromMap(map['verifyCredentials'])
          : null,
      preferences: map['preferences'] != null
          ? Preferences.fromMap(map['preferences'])
          : null,
      paymentMethods: map['paymentMethods'] != null
          ? PaymentMethods.fromMap(map['paymentMethods'])
          : null,
      v: map['__v'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
      'profilePic': profilePic,
      'googleId': googleId,
      'outBidNotifications': outBidNotifications,
      'advertApprovalNotifications': advertApprovalNotifications,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deviceInfo': deviceInfo?.toMap(),
      'wallet': wallet?.toMap(),
      'verifyCredentials': verifyCredentials?.toMap(),
      'preferences': preferences?.toMap(),
      'paymentMethods': paymentMethods?.toMap(),
      '__v': v,
    };
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());

  UserModel copyWith({
    String? id,
    String? email,
    String? name,
    String? phoneNumber,
    String? profilePic,
    String? googleId,
    bool? outBidNotifications,
    bool? advertApprovalNotifications,
    String? createdAt,
    String? updatedAt,
    DeviceInfo? deviceInfo,
    Wallet? wallet,
    VerifyCredentials? verifyCredentials,
    Preferences? preferences,
    PaymentMethods? paymentMethods,
    int? v,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profilePic: profilePic ?? this.profilePic,
      googleId: googleId ?? this.googleId,
      outBidNotifications: outBidNotifications ?? this.outBidNotifications,
      advertApprovalNotifications:
          advertApprovalNotifications ?? this.advertApprovalNotifications,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deviceInfo: deviceInfo ?? this.deviceInfo,
      wallet: wallet ?? this.wallet,
      verifyCredentials: verifyCredentials ?? this.verifyCredentials,
      preferences: preferences ?? this.preferences,
      paymentMethods: paymentMethods ?? this.paymentMethods,
      v: v ?? this.v,
    );
  }
}

class DeviceInfo {
  final String? fcm;

  DeviceInfo({this.fcm});

  factory DeviceInfo.fromMap(Map<String, dynamic> map) {
    return DeviceInfo(fcm: map['fcm']);
  }

  Map<String, dynamic> toMap() {
    return {'fcm': fcm};
  }

  factory DeviceInfo.fromJson(String source) =>
      DeviceInfo.fromMap(json.decode(source));
  String toJson() => json.encode(toMap());
}

class Wallet {
  final IAmount balance;

  Wallet({required this.balance});

  factory Wallet.fromMap(Map<String, dynamic> map) {
    return Wallet(
      balance: map['balance'] == null
          ? IAmount(amount: 0, currency: 'USD')
          : IAmount.fromMap(map['balance']),
    );
  }

  Map<String, dynamic> toMap() {
    return {'balance': balance.toMap()};
  }

  factory Wallet.fromJson(String source) => Wallet.fromMap(json.decode(source));
  String toJson() => json.encode(toMap());
}

class VerifyCredentials {
  final bool verifyStatus;

  VerifyCredentials({required this.verifyStatus});

  factory VerifyCredentials.fromMap(Map<String, dynamic> map) {
    return VerifyCredentials(verifyStatus: map['verifyStatus']);
  }

  Map<String, dynamic> toMap() => {'verifyStatus': verifyStatus};
  factory VerifyCredentials.fromJson(String source) =>
      VerifyCredentials.fromMap(json.decode(source));
  String toJson() => json.encode(toMap());
}

class Preferences {
  final String currency;

  Preferences({required this.currency});

  factory Preferences.fromMap(Map<String, dynamic> map) {
    return Preferences(currency: map['currency']);
  }

  Map<String, dynamic> toMap() => {'currency': currency};
  factory Preferences.fromJson(String source) =>
      Preferences.fromMap(json.decode(source));
  String toJson() => json.encode(toMap());
}

class PaymentMethods {
  final bool bank;
  final bool cash;
  final bool custom;

  PaymentMethods({
    required this.bank,
    required this.cash,
    required this.custom,
  });

  factory PaymentMethods.fromMap(Map<String, dynamic> map) {
    return PaymentMethods(
      bank: map['bank'],
      cash: map['cash'],
      custom: map['custom'],
    );
  }

  Map<String, dynamic> toMap() => {
    'bank': bank,
    'cash': cash,
    'custom': custom,
  };

  factory PaymentMethods.fromJson(String source) =>
      PaymentMethods.fromMap(json.decode(source));
  String toJson() => json.encode(toMap());
}

// {
//   "success": true,
//   "user": {
//     "deviceInfo": { "fcm": "" },
//     "wallet": { "balance": { "amount": 0, "currency": "AUD" } },
//     "verifyCredentials": { "verifyStatus": true },
//     "preferences": { "currency": "AUD" },
//     "paymentMethods": { "bank": false, "cash": false, "custom": false },
//     "_id": "68870ff25b35d0d398827a4f",
//     "email": "03098646766bhai@gmail.com",
//     "__v": 0,
//     "advertApprovalNotifications": false,
//     "createdAt": "2025-07-28T05:51:46.286Z",
//     "googleId": "SUrA5Ze6NQQXW8k5AT12Z9ADEjr1",
//     "name": "Shahzad Khan",
//     "outBidNotifications": false,
//     "phoneNumber": "",
//     "profilePic": "https://lh3.googleusercontent.com/a/...",
//     "updatedAt": "2025-07-29T06:40:37.455Z"
//   },
//   "token": "eyJhbGciOi..."
// }
