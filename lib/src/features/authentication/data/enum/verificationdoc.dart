enum VerificationDoc {
  bvn('Banking Verification Number(BVN)'),
  nin('National Identification Number (NIN)'),
  driverlicense('Driver’s license'),
  nationalidcard('National ID card'),
  passport('Passport');

  const VerificationDoc(this.title);
  final String title;
}
