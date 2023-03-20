class RegPatient {
  String? id;
  String patientName;
  String biodata;
  String? groupType;
  String medRecord;
  String principalDesignation;
  String principalWorkDetails;
  String acctTier;
  String contactDetails;
  String phone;
  String? date;

  RegPatient({
    this.id,
    required this.phone,
    this.groupType,
    required this.acctTier,
    required this.biodata,
    required this.contactDetails,
    required this.medRecord,
    required this.patientName,
    required this.principalDesignation,
    required this.principalWorkDetails,
    this.date,
  });

  factory RegPatient.fromJson(Map json) {
    return RegPatient(
      id: json['id'],
      phone: json['phone'],
      groupType: json['groupTyope'],
      acctTier: json['accountTier'],
      biodata: json['bioData'],
      contactDetails: json['contactDetails'],
      medRecord: json['medRecord'],
      patientName: json['patientName'],
      principalDesignation: json['principalDes'],
      principalWorkDetails: json['principalWorkDetails'],
      date: json['date'],
    );
  }

  static Map<String, dynamic> toJson(RegPatient patient){
    return {
      'patientName': patient.patientName,
      'id': patient.id,
      'date': patient.date,
      'groupType': patient.groupType,
      'phone': patient.phone,
      'accountTier': patient.acctTier,
      'bioData': patient.biodata,
      'contactDetails': patient.contactDetails,
      'medRecord': patient.medRecord,
      'principalDes': patient.principalDesignation,
      'principalWorkDetails': patient.principalWorkDetails,
    };
  }
}
