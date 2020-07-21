class People {
  int code;
  List<Data> data;
  String message;

  People({this.code, this.data, this.message});

  People.fromJson(Map<dynamic, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String duties;
  String emailAddress;
  String employeeAge;
  String employeeCode;
  String firstName;
  bool isTeamLead;
  String jobTitleName;
  String lastName;
  String phoneNumber;
  String preferredFullName;
  String profileImage;
  String region;
  String userId;

  Data(
      {this.duties,
      this.emailAddress,
      this.employeeAge,
      this.employeeCode,
      this.firstName,
      this.isTeamLead,
      this.jobTitleName,
      this.lastName,
      this.phoneNumber,
      this.preferredFullName,
      this.profileImage,
      this.region,
      this.userId});

  Data.fromJson(Map<dynamic, dynamic> json) {
    duties = json['duties'];
    emailAddress = json['emailAddress'];
    employeeAge = json['employeeAge'];
    employeeCode = json['employeeCode'];
    firstName = json['firstName'];
    isTeamLead = json['isTeamLead'];
    jobTitleName = json['jobTitleName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    preferredFullName = json['preferredFullName'];
    profileImage = json['profileImage'];
    region = json['region'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['duties'] = this.duties;
    data['emailAddress'] = this.emailAddress;
    data['employeeAge'] = this.employeeAge;
    data['employeeCode'] = this.employeeCode;
    data['firstName'] = this.firstName;
    data['isTeamLead'] = this.isTeamLead;
    data['jobTitleName'] = this.jobTitleName;
    data['lastName'] = this.lastName;
    data['phoneNumber'] = this.phoneNumber;
    data['preferredFullName'] = this.preferredFullName;
    data['profileImage'] = this.profileImage;
    data['region'] = this.region;
    data['userId'] = this.userId;
    return data;
  }
}
