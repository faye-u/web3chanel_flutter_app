import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web3chanel_flutter_app/navigation/feed_tab_controller.dart';
import 'package:web3chanel_flutter_app/globals.dart' as globals;
import 'package:url_launcher/url_launcher_string.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';


class NotImplementedPage extends StatefulWidget {
  const NotImplementedPage({super.key});

  @override
  State<NotImplementedPage> createState() => _NotImplementedPageState();
}

// init wallet and connector
var connector = globals.connector;
test1(BuildContext context) async {
  // connector.killSession();
  print(connector.connected);
    if (connector.connected) {
      try {
        // sign not await, await for launch app
        var provider = EthereumWalletConnectProvider(connector);
        var hash = provider.sign(address: globals.connector.session.accounts[0], message:"0xed6c11b0b5b808960df26f5bfc471d04c1995b0ffd2055925ad1be28d6baadfd");
        await launchUrlString(connector.session.toUri(), mode: LaunchMode.externalApplication);
        print(await hash);
        
      } catch (exp) {
        print('sign with MetaMask failed due to: $exp');
      }
    } else {
      print("connection to MetaMask broken!");
    }

  }

  test2(BuildContext context) async{
    print("test2");
    var provider = EthereumWalletConnectProvider(connector);
    provider.sendTransaction(from: '0xE9477a3682a71230d1a17e580A3f16aC90222a25', to:'0x350bF1b724ce1eFFAb57959Bae9cEf657882ddF9');
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
          ElevatedButton(
              onPressed: () => {
                test1(context),
                // test2(context),
                },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.pink),
              ), 
              child: const Text("test Metamask")
          )
        ]
      )
    );
  }
}
