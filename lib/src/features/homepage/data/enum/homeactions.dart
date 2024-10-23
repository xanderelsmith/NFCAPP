enum HomeActionKeys {
  addmoney('images/bank.png', 'Add money'),
  receive('images/add.png', 'Receive'),
  send('images/send.png', 'Send');

  const HomeActionKeys(this.imagesrc, this.text);
  final String imagesrc;
  final String text;
}
