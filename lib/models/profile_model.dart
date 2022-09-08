class ProfileModel {
  double? userId;
  String? studentIdNumber;
  String? instructorIdNumber;
  String? username;
  String? currentLastName;
  String? currentFirstName;
  String? currentMiddleName;
  String? currentPhone;
  String? currentEmail;
  String? currentAddress;
  String? currentCity;
  String? currentCountry;
  String? currentDistrict;
  String? currentGender;
  String? currentState;
  String? currentWard;
  String? birthDate;
  String? birthPlace;
  String? birthPlaceWard;
  String? birthPlaceDistrict;
  String? birthPlaceCity;
  String? peopleIdNumber;
  String? currentPersonalEmail;
  String? picture;
  String? contactLastName;
  String? contactFirstName;
  String? contactMiddleName;
  String? contactRelationship;
  String? contactPhone;
  String? contactEmail;
  String? contactAddress;
  String? contactWard;
  String? contactDistrict;
  String? contactCity;
  String? contactState;
  String? contactCountry;
  ProfileModel({
    this.userId,
    this.studentIdNumber,
    this.instructorIdNumber,
    this.username,
    this.currentLastName,
    this.currentFirstName,
    this.currentMiddleName,
    this.currentPhone,
    this.currentEmail,
    this.currentAddress,
    this.currentCity,
    this.currentCountry,
    this.currentDistrict,
    this.currentGender,
    this.currentState,
    this.currentWard,
    this.birthDate,
    this.birthPlace,
    this.birthPlaceWard,
    this.birthPlaceDistrict,
    this.birthPlaceCity,
    this.peopleIdNumber,
    this.currentPersonalEmail,
    this.picture,
    this.contactLastName,
    this.contactFirstName,
    this.contactMiddleName,
    this.contactRelationship,
    this.contactPhone,
    this.contactEmail,
    this.contactAddress,
    this.contactWard,
    this.contactDistrict,
    this.contactCity,
    this.contactState,
    this.contactCountry,
  });
  ProfileModel.fromJson(dynamic json) {
    userId = json['USER_ID'] ?? 0;
    studentIdNumber = json['STUDENT_ID_NUMBER'] ?? '';
    instructorIdNumber = json['INSTRUCTOR_ID_NUMBER'] ?? '';
    username = json['UserName'] ?? '';
    currentLastName = json['CURRENT_LAST_NAME'] ?? '';
    currentFirstName = json['CURRENT_FIRST_NAME'] ?? '';
    currentMiddleName = json['CURRENT_MIDDLE_NAME'] ?? '';
    currentPhone = json['CURRENT_PHONE'] ?? '';
    currentEmail = json['CURRENT_EMAIL'] ?? '';
    currentAddress = json['CURRENT_ADDRESS'] ?? '';
    currentCity = json['CURRENT_CITY'] ?? '';
    currentCountry = json['CURRENT_COUNTRY'] ?? '';
    currentDistrict = json['CURRENT_DISTRICT'] ?? '';
    currentGender = json['CURRENT_GENDER'] ?? '';
    currentState = json['CURRENT_STATE'] ?? '';
    currentWard = json['CURRENT_WARD'] ?? '';
    birthDate = json['BIRTH_DATE'] ?? '';
    birthPlace = json['BIRTH_PLACE'] ?? '';
    birthPlaceWard = json['BIRTH_PLACE_WARD'] ?? '';
    birthPlaceDistrict = json['BIRTH_PLACE_DISTRICT'] ?? '';
    birthPlaceCity = json['BIRTH_PLACE_CITY'] ?? '';
    peopleIdNumber = json['PEOPLE_ID_NUMBER'] ?? '';
    currentPersonalEmail = json['CURRENT_PERSONAL_EMAIL'] ?? '';
    picture = json['PICTURE'] ?? '';
    contactLastName = json['CONTACT_LAST_NAME'] ?? '';
    contactFirstName = json['CONTACT_FIRST_NAME'] ?? '';
    contactMiddleName = json['CONTACT_MIDDLE_NAME'] ?? '';
    contactRelationship = json['CONTACT_RELATIONSHIP'] ?? '';
    contactPhone = json['CONTACT_PHONE'] ?? '';
    contactEmail = json['CONTACT_EMAIL'] ?? '';
    contactAddress = json['CONTACT_ADDRESS'] ?? '';
    contactWard = json['CONTACT_WARD'] ?? '';
    contactDistrict = json['CONTACT_DISTRICT'] ?? '';
    contactCity = json['CONTACT_CITY'] ?? '';
    contactState = json['CONTACT_STATE'] ?? '';
    contactCountry = json['CONTACT_COUNTRY'] ?? '';
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['USER_ID'] = userId;
    map['STUDENT_ID_NUMBER'] = studentIdNumber;
    map['INSTRUCTOR_ID_NUMBER'] = instructorIdNumber;
    map['UserName'] = username;
    map['CURRENT_LAST_NAME'] = currentLastName;
    map['CURRENT_FIRST_NAME'] = currentFirstName;
    map['CURRENT_MIDDLE_NAME'] = currentMiddleName;
    map['CURRENT_PHONE'] = currentPhone;
    map['CURRENT_EMAIL'] = currentEmail;
    map['CURRENT_ADDRESS'] = currentAddress;
    map['CURRENT_CITY'] = currentCity;
    map['CURRENT_COUNTRY'] = currentCountry;
    map['CURRENT_DISTRICT'] = currentDistrict;
    map['CURRENT_GENDER'] = currentGender;
    map['CURRENT_STATE'] = currentState;
    map['CURRENT_WARD'] = currentWard;
    map['BIRTH_DATE'] = birthDate;
    map['BIRTH_PLACE'] = birthPlace;
    map['BIRTH_PLACE_WARD'] = birthPlaceWard;
    map['BIRTH_PLACE_DISTRICT'] = birthPlaceDistrict;
    map['BIRTH_PLACE_CITY'] = birthPlaceCity;
    map['PEOPLE_ID_NUMBER'] = peopleIdNumber;
    map['CURRENT_PERSONAL_EMAIL'] = currentPersonalEmail;
    map['PICTURE'] = picture;
    map['CONTACT_LAST_NAME'] = contactLastName;
    map['CONTACT_FIRST_NAME'] = contactFirstName;
    map['CONTACT_MIDDLE_NAME'] = contactMiddleName;
    map['CONTACT_RELATIONSHIP'] = contactRelationship;
    map['CONTACT_PHONE'] = contactPhone;
    map['CONTACT_EMAIL'] = contactEmail;
    map['CONTACT_ADDRESS'] = contactAddress;
    map['CONTACT_WARD'] = contactWard;
    map['CONTACT_DISTRICT'] = contactDistrict;
    map['CONTACT_CITY'] = contactCity;
    map['CONTACT_STATE'] = contactState;
    map['CONTACT_COUNTRY'] = contactCountry;
    return map;
  }
}
