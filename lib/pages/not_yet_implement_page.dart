import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web3chanel_flutter_app/navigation/feed_tab_controller.dart';


class NotImplementedPage extends StatefulWidget {
  const NotImplementedPage({super.key});

  @override
  State<NotImplementedPage> createState() => _NotImplementedPageState();
}

class _NotImplementedPageState extends State<NotImplementedPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          Text(
            'Feature coming soon...',
            style: GoogleFonts.inconsolata(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
          ),
        ]
      )
    );
  }
}
