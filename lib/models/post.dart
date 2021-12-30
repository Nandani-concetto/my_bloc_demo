class Details {
  bool? error;
  int? statusCode;
  String? message;
  Result? result;
  static _isSuccess(int value) {
    return value == 200;
  }

  bool get isSuccess => _isSuccess(statusCode ?? 0);

  Details({this.error, this.statusCode, this.message, this.result});

  Details.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    statusCode = json['status'];
    message = json['message'];
    result =
    json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['status'] = statusCode;
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  String? userId;
  String? entityId;
  String? email;
  String? entityTypeId;
  String? username;
  String? deviceType;
  String? deviceId;
  String? apiToken;
  String? active;
  String? lastLoginDate;
  String? profilePic;
  Null oneTimePass;
  String? isAppadmin;
  String? firstName;
  String? lastName;
  String? fullName;
  String? dob;
  String? phoneNo;
  String? age;
  String? licenceNumber;
  String? resume;
  String? smartserve;
  String? whimis;
  String? firstAidCpr;
  String? securityLicense;
  String? licenseExpDate;
  String? cityName;
  String? stateName;
  String? countryName;
  String? postcode;
  String? address;
  String? cityId;
  String? stateId;
  String? countryId;
  Null locality;
  int? isUpload;
  int? otpVerified;

  Result(
      {this.userId,
        this.entityId,
        this.email,
        this.entityTypeId,
        this.username,
        this.deviceType,
        this.deviceId,
        this.apiToken,
        this.active,
        this.lastLoginDate,
        this.profilePic,
        this.oneTimePass,
        this.isAppadmin,
        this.firstName,
        this.lastName,
        this.fullName,
        this.dob,
        this.phoneNo,
        this.age,
        this.licenceNumber,
        this.resume,
        this.smartserve,
        this.whimis,
        this.firstAidCpr,
        this.securityLicense,
        this.licenseExpDate,
        this.cityName,
        this.stateName,
        this.countryName,
        this.postcode,
        this.address,
        this.cityId,
        this.stateId,
        this.countryId,
        this.locality,
        this.isUpload,
        this.otpVerified});

  Result.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    entityId = json['entity_id'];
    email = json['email'];
    entityTypeId = json['entity_type_id'];
    username = json['username'];
    deviceType = json['device_type'];
    deviceId = json['device_id'];
    apiToken = json['api_token'];
    active = json['active'];
    lastLoginDate = json['last_login_date'];
    profilePic = json['profile_pic'];
    oneTimePass = json['one_time_pass'];
    isAppadmin = json['is_appadmin'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fullName = json['fullName'];
    dob = json['dob'];
    phoneNo = json['phone_no'];
    age = json['age'];
    licenceNumber = json['licence_number'];
    resume = json['resume'];
    smartserve = json['smartserve'];
    whimis = json['whimis'];
    firstAidCpr = json['first_aid_cpr'];
    securityLicense = json['security_license'];
    licenseExpDate = json['license_exp_date'];
    cityName = json['city_name'];
    stateName = json['state_name'];
    countryName = json['country_name'];
    postcode = json['postcode'];
    address = json['address'];
    cityId = json['city_id'];
    stateId = json['state_id'];
    countryId = json['country_id'];
    locality = json['locality'];
    isUpload = json['isUpload'];
    otpVerified = json['otp_verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['entity_id'] = entityId;
    data['email'] = email;
    data['entity_type_id'] = entityTypeId;
    data['username'] = username;
    data['device_type'] = deviceType;
    data['device_id'] = deviceId;
    data['api_token'] = apiToken;
    data['active'] = active;
    data['last_login_date'] = lastLoginDate;
    data['profile_pic'] = profilePic;
    data['one_time_pass'] = oneTimePass;
    data['is_appadmin'] = isAppadmin;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['fullName'] = fullName;
    data['dob'] = dob;
    data['phone_no'] = phoneNo;
    data['age'] = age;
    data['licence_number'] = licenceNumber;
    data['resume'] = resume;
    data['smartserve'] = smartserve;
    data['whimis'] = whimis;
    data['first_aid_cpr'] = firstAidCpr;
    data['security_license'] = securityLicense;
    data['license_exp_date'] = licenseExpDate;
    data['city_name'] = cityName;
    data['state_name'] = stateName;
    data['country_name'] = countryName;
    data['postcode'] = postcode;
    data['address'] = address;
    data['city_id'] = cityId;
    data['state_id'] = stateId;
    data['country_id'] = countryId;
    data['locality'] = locality;
    data['isUpload'] = isUpload;
    data['otp_verified'] = otpVerified;
    return data;
  }
}
