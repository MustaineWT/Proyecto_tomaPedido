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
  final int mo;
  @HiveField(6)
  final int tu;
  @HiveField(7)
  final int we;
  @HiveField(8)
  final int th;
  @HiveField(9)
  final int fr;
  @HiveField(10)
  final int sa;
  @HiveField(11)
  final int su;
  @HiveField(12)
  final int ffvv;
  @HiveField(13)
  final String state;

  Routes({
    required this.companyId,
    required this.branchOfficeId,
    required this.route,
    required this.description,
    required this.zone,
    required this.mo,
    required this.tu,
    required this.we,
    required this.th,
    required this.fr,
    required this.sa,
    required this.su,
    required this.ffvv,
    required this.state,
  });

  factory Routes.fromJson(Map<String, dynamic> json) => Routes(
        companyId: json["CompanyId"],
        branchOfficeId: json["BranchOfficeId"],
        route: json["Route"],
        description: json["Description"],
        zone: json["Zone"],
        mo: json["Mo"],
        tu: json["Tu"],
        we: json["We"],
        th: json["Th"],
        fr: json["Fr"],
        sa: json["Sa"],
        su: json["Su"],
        ffvv: json["FFVV"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "CompanyId": companyId,
        "BranchOfficeId": branchOfficeId,
        "Route": route,
        "Description": description,
        "Zone": zone,
        "Mo": mo,
        "Tu": tu,
        "We": we,
        "Th": th,
        "Fr": fr,
        "Sa": sa,
        "Su": su,
        "FFVV": ffvv,
        "state": state,
      };
}
