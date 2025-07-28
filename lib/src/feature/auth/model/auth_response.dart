import 'dart:convert';

import 'package:city17/src/core/enum/enum_method.dart';
import 'package:city17/src/core/enum/gender_enum.dart';

class AuthResponse {
  AuthResponse({required this.token, this.user});

  factory AuthResponse.fromMap(Map<String, dynamic> map) {
    return AuthResponse(
      token: map['token'],
      user: UserModel.fromMap(map['user']),
    );
  }

  factory AuthResponse.fromJson(String source) =>
      AuthResponse.fromMap(json.decode(source));
  final String token;
  final UserModel? user;

  AuthResponse copyWith({String? token, UserModel? user}) {
    return AuthResponse(token: token ?? this.token, user: user ?? this.user);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'token': token, 'user': user?.toMap()};
  }

  String get firstName => user?.personalInformation.name ?? 'Unknown';

  String toJson() => json.encode(toMap());
}

class UserModel {
  UserModel({
    required this.id,
    required this.personalInformation,
    required this.credentialDetails,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['_id'],
      personalInformation: PersonalInformation.fromMap(
        map['personalInformation'],
      ),
      credentialDetails: CredentialDetails.fromMap(map['credentialDetails']),
    );
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  final String id;
  final PersonalInformation personalInformation;
  final CredentialDetails credentialDetails;

  UserModel copyWith({
    String? id,
    PersonalInformation? personalInformation,
    CredentialDetails? credentialDetails,
  }) {
    return UserModel(
      id: id ?? this.id,
      personalInformation: personalInformation ?? this.personalInformation,
      credentialDetails: credentialDetails ?? this.credentialDetails,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'personalInformation': personalInformation.toMap(),
      'credentialDetails': credentialDetails.toMap(),
    };
  }

  String toJson() => json.encode(toMap());
}

class PersonalInformation {
  PersonalInformation({
    required this.name,
    required this.profilePic,
    required this.phoneNumber,
    required this.gender,
    required this.dob,
    required this.personalAddress,
  });

  factory PersonalInformation.fromMap(map) {
    return PersonalInformation(
      name: map['name'] ?? 'No name',
      profilePic: map['profilePic'],
      phoneNumber: map['phoneNumber'],
      gender: enumFromString(map['gender'], Gender.values) ?? Gender.notDefined,
      dob: map['dob'] != null ? DateTime.tryParse(map['dob']) : null,
      personalAddress: map['personalAddress'] != null
          ? AddressModel.fromMap(map['personalAddress'])
          : null,
    );
  }

  factory PersonalInformation.fromJson(String source) =>
      PersonalInformation.fromMap(json.decode(source));
  final String name;
  final String profilePic;
  final String? phoneNumber;
  final Gender gender;
  final DateTime? dob;
  final AddressModel? personalAddress;

  PersonalInformation copyWith({
    String? name,
    String? profilePic,
    String? phoneNumber,
    Gender? gender,
    DateTime? dob,
    AddressModel? personalAddress,
  }) {
    return PersonalInformation(
      name: name ?? this.name,
      profilePic: profilePic ?? this.profilePic,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      personalAddress: personalAddress ?? this.personalAddress,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'profilePic': profilePic,
      'phoneNumber': phoneNumber,
      'gender': enumToString(gender),
      'dob': dob.toString(),
      'personalAddress': personalAddress?.toMap(),
    };
  }

  String toJson() => json.encode(toMap());
}

class CredentialDetails {
  CredentialDetails({required this.email});

  factory CredentialDetails.fromMap(Map<String, dynamic> map) {
    return CredentialDetails(email: map['email']);
  }

  factory CredentialDetails.fromJson(String source) =>
      CredentialDetails.fromMap(json.decode(source));
  final String email;

  CredentialDetails copyWith({String? email}) {
    return CredentialDetails(email: email ?? this.email);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'email': email};
  }

  String toJson() => json.encode(toMap());
}

class AddressModel {
  AddressModel({
    required this.formattedAddress,
    required this.city,
    required this.state,
    required this.country,
  });

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      formattedAddress: map['formattedAddress'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      country: map['country'] as String,
    );
  }

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);
  final String formattedAddress;
  final String city;
  final String state;
  final String country;

  AddressModel copyWith({
    String? formattedAddress,
    String? city,
    String? state,
    String? country,
  }) {
    return AddressModel(
      formattedAddress: formattedAddress ?? this.formattedAddress,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'formattedAddress': formattedAddress,
      'city': city,
      'state': state,
      'country': country,
    };
  }

  String toJson() => json.encode(toMap());
}

// {
//   "token": "eyAbC123xyZ...JWT...",
//   "user": {
//     "_id": "user_001",
//     "personalInformation": {
//       "name": "Shahzad",
//       "profilePic": "https://xyz.com/profile.jpg",
//       "phoneNumber": "03001234567",
//       "gender": "male",
//       "dob": "1998-06-20T00:00:00Z",
//       "personalAddress": {
//         "formattedAddress": "123 Main Street",
//         "city": "Lahore",
//         "state": "Punjab",
//         "country": "Pakistan"
//       }
//     },
//     "credentialDetails": {
//       "email": "shahzad@gmail.com"
//     }
//   }
// }
