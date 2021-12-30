class UserRequest {
  String? deviceId;
  String? deviceType;
  int? latitude;
  int? longitude;
  String? password;
  String? username;

  UserRequest(
      {this.deviceId,
        this.deviceType,
        this.latitude,
        this.longitude,
        this.password,
        this.username});

  UserRequest.fromJson(Map<String, dynamic> json) {
    deviceId = json['device_id'];
    deviceType = json['device_type'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    password = json['password'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['device_id'] = this.deviceId;
    data['device_type'] = this.deviceType;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['password'] = this.password;
    data['username'] = this.username;
    return data;
  }
}