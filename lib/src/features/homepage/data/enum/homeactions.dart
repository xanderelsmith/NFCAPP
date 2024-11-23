import 'package:flutter/material.dart';
import 'package:nfcapp/extension/textstyleextensions.dart';
import 'package:nfcapp/src/features/homepage/presentation/pages/sendmoneyscreen.dart';
import 'package:nfcapp/src/features/recievepayment/presentation/pages/addmoney.dart';
import 'package:nfcapp/style/textstyles.dart';

enum HomeActionKeys {
  addmoney('images/bank.png', 'Add money'),
  receive('images/add.png', 'Receive'),
  send('images/send.png', 'Send');

  const HomeActionKeys(this.imagesrc, this.text);
  final String imagesrc;
  final String text;
}

Widget getHomeActionScreen(HomeActionKeys homeActionKeys) {
  switch (homeActionKeys) {
    case HomeActionKeys.addmoney:
      return const AddMoneyScreen();
    case HomeActionKeys.receive:
      return const RecieveScreen();
    case HomeActionKeys.send:
      return const SendMoneyScreen();

    default:
      return const AddMoneyScreen();
  }
}

class RecieveScreen extends StatefulWidget {
  const RecieveScreen({super.key});

  @override
  State<RecieveScreen> createState() => _RecieveScreenState();
}

class _RecieveScreenState extends State<RecieveScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _sizeAnimation =
        Tween<double>(begin: 1.5, end: 2).animate(_animationController)
          ..addListener(() {
            setState(() {});

            if (_animationController.isCompleted) {
              _animationController.repeat();
            }
          });

    _animationController.forward(from: 0.0);
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 15,
          ),
        ),
        title: const Text('Back'),
      ),
      body: Stack(children: [
        ...List.generate(
            10,
            (index) => Center(
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) => Transform.scale(
                      scale: _sizeAnimation.value,
                      child: Container(
                        height: (40 * (index)) *
                            _sizeAnimation.value, // Animate height too
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffDCDCDC),
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                )),
        Center(
          child: Image.asset(
            'images/checkers.png',
            height: 56,
          ),
        ),
        const Align(
            alignment: Alignment(
              0,
              0.15,
            ),
            child: Text('Searching for nearby phone')),
      ]),
    );
  }
}
