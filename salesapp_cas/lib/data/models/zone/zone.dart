import 'package:hive/hive.dart';

part 'zone.g.dart';

@HiveType(typeId: 4)
class Zone {
  @HiveField(0)
  final int companyId;
  @HiveField(1)
  final int branchOfficeId;
  @HiveField(2)
  final String zone;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final int ffvv;
  @HiveField(5)
  final String state;

  Zone({
    required this.companyId,
    required this.branchOfficeId,
    required this.zone,
    required this.description,
    required this.ffvv,
    required this.state,
  });

  factory Zone.fromJson(Map<String, dynamic> json) => Zone(
        companyId: json["CompanyId"],
        branchOfficeId: json["BranchOfficeId"],
        zone: json["Zone"],
        description: json["Description"],
        ffvv: json["FFVV"],
        state: json["State"],
      );

  Map<String, dynamic> toJson() => {
        "CompanyId": companyId,
        "BranchOfficeId": branchOfficeId,
        "Zone": zone,
        "Description": description,
        "FFVV": ffvv,
        "State": state,
      };
}
