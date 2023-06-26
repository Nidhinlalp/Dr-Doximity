class BookingPatient {
  final DateTime? date;
  final String name;
  final String age;
  final String phone;
  final String time;
  final String descrption;
  final String userUid;
  final bool acept;
  final bool decline;
  final bool completed;

  BookingPatient(
      {required this.age,
      required this.name,
      required this.date,
      required this.phone,
      required this.time,
      required this.descrption,
      required this.userUid,
      required this.acept,
      required this.decline,
      required this.completed});

  factory BookingPatient.fromJson(Map<String, dynamic> json) {
    return BookingPatient(
        age: json['patientAge'],
        name: json['patientName'],
        date: DateTime.tryParse(json['date']),
        phone: json['patientPhomeNumber'],
        time: json['time'],
        descrption: json['descrption'],
        userUid: json['userUid'],
        acept: json['acept'],
        decline: json['decline'],
        completed: json['completed']);
  }
}
