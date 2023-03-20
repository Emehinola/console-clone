class RegPatient {
  String id;
  String patientName;
  String biodata;
  String medRecord;
  String principalDesignation;
  String principalWorkDetails;
  String acctTier;
  String contactDetails;
  String phone;

  RegPatient({
    required this.id,
    required this.phone,
    required this.acctTier,
    required this.biodata,
    required this.contactDetails,
    required this.medRecord,
    required this.patientName,
    required this.principalDesignation,
    required this.principalWorkDetails,
  });

  factory RegPatient.fromJson(Map json) {
    return RegPatient(
      id: json['id'],
      phone: json['phone'],
      acctTier: json['accountTier'],
      biodata: json['bioData'],
      contactDetails: json['contactDetails'],
      medRecord: json['medRecord'],
      patientName: json['patientName'],
      principalDesignation: json['principalDes'],
      principalWorkDetails: json['principalWorkDetails'],
    );
  }

  static Map<String, dynamic> toJson(RegPatient patient){
    return {
      'patientName': patient.patientName,
      'id': patient.id,
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
