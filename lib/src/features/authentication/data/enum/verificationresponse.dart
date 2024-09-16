enum VerificationResponse {
  successful(
      buttonTitle: 'Continue',
      title: 'Verification successful',
      imageSrc: 'images/check.png',
      message:
          'Your account has now been verified, now you can\n Send and Receive funds'),
  unsuccessful(
      buttonTitle: 'Try Again',
      title: 'Verification Unsuccessful',
      imageSrc: 'images/close.png',
      message:
          'We are unable to verify your identity, try again using a\n valid means of identification.');

  const VerificationResponse(
      {required this.imageSrc,
      required this.buttonTitle,
      required this.title,
      required this.message});
  final String message;
  final String title;
  final String imageSrc;
  final String buttonTitle;
}
