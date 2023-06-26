import 'dart:convert';

class PatientDetails {
  final String? userUid;
  final String? profilePic;
  final String? userName;

  PatientDetails({
    required this.userUid,
    required this.profilePic,
    required this.userName,
  });

  PatientDetails copyWith({
    String? userUid,
    String? profilePic,
    String? userName,
  }) {
    return PatientDetails(
      userUid: userUid ?? this.userUid,
      profilePic: profilePic ?? this.profilePic,
      userName: userName ?? this.userName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userUid': userUid,
      'profilePic': profilePic,
      'userName': userName,
    };
  }

  factory PatientDetails.fromMap(Map<String, dynamic> map) {
    return PatientDetails(
      userUid: map['userUid'],
      profilePic: map['profilePic'],
      userName: map['userName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PatientDetails.fromJson(String source) =>
      PatientDetails.fromMap(json.decode(source));

  @override
  String toString() =>
      'PatientDetails(userUid: $userUid, profilePic: $profilePic, userName: $userName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PatientDetails &&
        other.userUid == userUid &&
        other.profilePic == profilePic &&
        other.userName == userName;
  }

  @override
  int get hashCode =>
      userUid.hashCode ^ profilePic.hashCode ^ userName.hashCode;
}
