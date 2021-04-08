class User {
  final int? companyId;
  final int? branchOfficeId;
  final String? name;
  final String? lastName;
  final String? description;
  final String? dni;
  final String? phone;
  final String? email;
  final String? direction;
  final String? city;
  final String? country;

  User({
    this.companyId,
    this.branchOfficeId,
    this.name,
    this.lastName,
    this.description,
    this.dni,
    this.phone,
    this.email,
    this.direction,
    this.city,
    this.country,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        companyId: json["CompanyId"],
        branchOfficeId: json["BranchOfficeId"],
        name: json["Name"],
        lastName: json["LastName"],
        description: json["Description"],
        dni: json["Dni"],
        phone: json["Phone"],
        email: json["Email"],
        direction: json["Direction"],
        city: json["City"],
        country: json["Country"],
      );

  Map<String, dynamic> toJson() => {
        "CompanyId": companyId,
        "BranchOfficeId": branchOfficeId,
        "Name": name,
        "LastName": lastName,
        "Description": description,
        "Dni": dni,
        "Phone": phone,
        "Email": email,
        "Direction": direction,
        "City": city,
        "Country": country,
      };
}
