import 'package:hive/hive.dart';

part 'routes.g.dart';

@HiveType(typeId: 2)
class Routes {
  @HiveField(0)
  final int companyId;
  @HiveField(1)
  final int branchOfficeId;
  @HiveField(2)
  final String route;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String zone;
  @HiveField(5)
  final int ffvv;
  @HiveField(6)
  final String state;

  Routes({
    required this.companyId,
    required this.branchOfficeId,
    required this.route,
    required this.description,
    required this.zone,
    required this.ffvv,
    required this.state,
  });

  factory Routes.fromJson(Map<String, dynamic> json) => Routes(
        companyId: json["CompanyId"],
        branchOfficeId: json["BranchOfficeId"],
        route: json["Route"],
        description: json["Description"],
        zone: json["Zone"],
        ffvv: json["FFVV"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "CompanyId": companyId,
        "BranchOfficeId": branchOfficeId,
        "Route": route,
        "Description": description,
        "Zone": zone,
        "FFVV": ffvv,
        "state": state,
      };
}
