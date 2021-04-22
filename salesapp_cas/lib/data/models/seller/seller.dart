import 'package:hive/hive.dart';

part 'seller.g.dart';

@HiveType(typeId: 1)
class Seller {
  @HiveField(0)
  final int companyId;
  @HiveField(1)
  final int branchOfficeId;
  @HiveField(2)
  final int personId;
  @HiveField(3)
  final String name;
  @HiveField(4)
  final String lastName;
  @HiveField(5)
  final String dni;
  @HiveField(6)
  final String phone;
  @HiveField(7)
  final String description;
  @HiveField(8)
  final String email;
  @HiveField(9)
  final String direction;
  @HiveField(10)
  final String city;
  @HiveField(11)
  final String country;
  @HiveField(12)
  final String state;

  Seller({
    required this.companyId,
    required this.branchOfficeId,
    required this.personId,
    required this.name,
    required this.lastName,
    required this.dni,
    required this.phone,
    required this.description,
    required this.email,
    required this.direction,
    required this.city,
    required this.country,
    required this.state,
  });

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
        companyId: json["CompanyId"],
        branchOfficeId: json["BranchOfficeId"],
        personId: json["PersonId"],
        name: json["Name"],
        lastName: json["LastName"],
        dni: json["Dni"],
        phone: json["Phone"],
        description: json["Description"],
        email: json["Email"],
        direction: json["Direction"],
        city: json["City"],
        country: json["Country"],
        state: json["State"],
      );

  Map<String, dynamic> toJson() => {
        "CompanyId": companyId,
        "BranchOfficeId": branchOfficeId,
        "PersonId": personId,
        "Name": name,
        "LastName": lastName,
        "Dni": dni,
        "Phone": phone,
        "Description": description,
        "Email": email,
        "Direction": direction,
        "City": city,
        "Country": country,
        "State": state,
      };
}
