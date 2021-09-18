class CreateUserResponse {
  String? message;
  Data? data;

  CreateUserResponse({this.message, this.data});

  factory CreateUserResponse.fromJson(Map<String, dynamic> json) =>
      CreateUserResponse(
          message: json['message'], data: Data.fromJson(json['data']));

  Map<String, dynamic> toJson() => {'message': message, 'data': data!.toJson()};
}

class Data {
  Data({
    this.latitude,
    this.longitude,
    this.name,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String? latitude;
  String? longitude;
  String? name;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        latitude: json["latitude"],
        longitude: json["longitude"],
        name: json["name"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "name": name,
        "updated_at": updatedAt!.toIso8601String(),
        "created_at": createdAt!.toIso8601String(),
        "id": id,
      };
}
