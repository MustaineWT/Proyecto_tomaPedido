import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final int companyId;
  @HiveField(1)
  final String bussinesName;
  @HiveField(2)
  final int branchOfficeId;
  @HiveField(3)
  final String cityBranch;
  @HiveField(4)
  final String lastName;
  @HiveField(5)
  final String name;
  @HiveField(6)
  final String description;
  @HiveField(7)
  final String dni;
  @HiveField(8)
  final String phone;
  @HiveField(9)
  final String email;
  @HiveField(10)
  final String direction;
  @HiveField(11)
  final String city;
  @HiveField(12)
  final String country;
  @HiveField(13)
  final DateTime fecha;
  @HiveField(14)
  final String route;

  User({
    required this.companyId,
    required this.bussinesName,
    required this.branchOfficeId,
    required this.cityBranch,
    required this.lastName,
    required this.name,
    required this.description,
    required this.dni,
    required this.phone,
    required this.email,
    required this.direction,
    required this.city,
    required this.country,
    required this.fecha,
    required this.route,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        companyId: json["CompanyId"],
        bussinesName: json["BussinesName"],
        branchOfficeId: json["BranchOfficeId"],
        cityBranch: json["cityBranch"],
        lastName: json["LastName"],
        name: json["Name"],
        description: json["Description"],
        dni: json["Dni"],
        phone: json["Phone"],
        email: json["Email"],
        direction: json["Direction"],
        city: json["City"],
        country: json["Country"],
        fecha: DateTime.parse(json["fecha"]),
        route: json["Route"],
      );

  Map<String, dynamic> toJson() => {
        "CompanyId": companyId,
        "BussinesName": bussinesName,
        "BranchOfficeId": branchOfficeId,
        "cityBranch": cityBranch,
        "LastName": lastName,
        "Name": name,
        "Description": description,
        "Dni": dni,
        "Phone": phone,
        "Email": email,
        "Direction": direction,
        "City": city,
        "Country": country,
        "fecha": fecha.toIso8601String(),
        "Route": route,
      };
}
