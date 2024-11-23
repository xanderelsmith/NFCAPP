import 'package:flutter/material.dart';
import 'package:nfcapp/extension/textstyleextensions.dart';
import 'package:nfcapp/style/color.dart';
import 'package:nfcapp/style/textstyles.dart';

import '../../../homepage/presentation/pages/homepage.dart';

class SendMoneyPreviewScreen extends StatefulWidget {
  const SendMoneyPreviewScreen({
    super.key,
    required this.value,
  });
  final String value;

  @override
  State<SendMoneyPreviewScreen> createState() => _SendMoneyPreviewScreenState();
}

class _SendMoneyPreviewScreenState extends State<SendMoneyPreviewScreen> {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
        ),
        child: Column(children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text('Send money', style: AppTextStyles.medium20.w600)),
          const Expanded(child: SizedBox()),
          const Text(
            'Amount to send ',
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.only(bottom: 38.0),
            child: Text(
              '${formatNumberWithCommas(int.parse(widget.value))} NGN',
              textAlign: TextAlign.center,
              style: AppTextStyles.high48.w600,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                top: 101.0,
                bottom: 49,
              ),
              child: Image.asset('images/tap-to-pay.png', height: 198))
        ]),
      ),
      bottomNavigationBar: SizedBox(
        height: 150,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AnimatedPayingPage(
                            value: widget.value,
                          ),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.black,
                  ),
                  child: Text('Pay with card',
                      style: AppTextStyles.tiny10.w600.copyWith(
                        color: AppColors.white,
                      ))),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AnimatedPayingPage(
                            value: widget.value,
                          ),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.black,
                  ),
                  child: Text('Pay with phone',
                      style: AppTextStyles.tiny10.w600.copyWith(
                        color: AppColors.white,
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedPayingPage extends StatefulWidget {
  const AnimatedPayingPage({super.key, required this.value});
  final String value;
  @override
  State<AnimatedPayingPage> createState() => _AnimatedPayingPageState();
}

class _AnimatedPayingPageState extends State<AnimatedPayingPage>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final AnimationController dotAnimContrlle;
  late final Animation<double> _sizeAnimation;
  late final Animation<double> countAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    dotAnimContrlle =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    countAnimation = Tween<double>(begin: 0, end: 3).animate(dotAnimContrlle)
      ..addListener(() {
        setState(() {
          currentindex = countAnimation.value.toInt();
        });
      });

    dotAnimContrlle.repeat();

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
    dotAnimContrlle.dispose();

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
        Align(
            alignment: const Alignment(1, -0.1),
            child: Image.asset('images/phoneleft.png')),
        Align(
            alignment: const Alignment(-1, -0.1),
            child: Image.asset('images/phoneright.png')),
        Align(
            alignment: const Alignment(0.4, -0.1),
            child: Image.asset('images/trans.png')),
        Align(
          alignment: const Alignment(0, -0.1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => Padding(
                padding: EdgeInsets.only(
                    left: 8.0,
                    right: 8,
                    bottom: index == currentindex ? 8.0 : 4),
                child: CircleAvatar(
                  backgroundColor: const Color(0xff838383),
                  radius: index == currentindex ? 10 : 5,
                ),
              ),
            ),
          ),
        ),
        Align(
            alignment: const Alignment(-0.4, -0.1),
            child: Transform.flip(
                flipX: true, child: Image.asset('images/trans.png'))),
        Align(
          alignment: const Alignment(0, -0.8),
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 53.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              textBaseline: TextBaseline.ideographic,
              children: [
                Text('Amount to send'),
                Text(
                  '${widget.value}.00 NGN',
                  style: AppTextStyles.normal36.w700,
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
