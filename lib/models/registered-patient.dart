class RegPatient {
  String patientName;
  String biodata;
  String medRecord;
  String principalDesignation;
  String principalWorkDetails;
  String acctTier;
  String contactDetails;
  String phone;

  RegPatient({
    required this.phone,
    required this.acctTier,
    required this.biodata,
    required this.contactDetails,
    required this.medRecord,
    required this.patientName,
    required this.principalDesignation,
    required this.principalWorkDetails,
  });
}
