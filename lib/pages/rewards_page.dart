import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';

class RewardsPage extends StatefulWidget {
  const RewardsPage({Key? key}) : super(key: key);

  @override
  State<RewardsPage> createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  late CountdownTimerController controller;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;

  @override
  void initState() {
    super.initState();
    controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
  }

  void onEnd() {
    print('onEnd');
  }

  // global variables
  var _session, _uri;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(height: 100),
        Text('POT!',
            style:
                DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0)),
        CountdownTimer(
          controller: controller,
          onEnd: onEnd,
          endTime: endTime,
        ),
        SizedBox(height: 100),
        Text('Address: 0x12343224234234234',
            style:
                DefaultTextStyle.of(context).style.apply(fontSizeFactor: 0.4)),
        SizedBox(height: 100),
        FloatingActionButton(
          child: Icon(Icons.stop),
          onPressed: () {
            onEnd();
            controller.disposeTimer();
          },
        ),
      ],
    ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
