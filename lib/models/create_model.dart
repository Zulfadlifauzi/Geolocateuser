class CreateUserResponse {
  String? name,latitude,longitude,id,createdAt;

  CreateUserResponse({this.name,this.latitude,this.longitude,this.id,this.createdAt});

  factory CreateUserResponse.fromjson(Map<String, dynamic> json) {
    return CreateUserResponse(
      name: json['name'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      id: json['id'],
      createdAt: json['createdAt']
    );
  }
}
