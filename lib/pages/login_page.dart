import 'package:flutter/material.dart';
import '../navigation/bottom_navigation.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slider_button/slider_button.dart';

import '../navigation/main_route.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // global variables
  var _session, _uri;

  var connector = WalletConnect(
    bridge: 'https://bridge.walletconnect.org',
    clientMeta: const PeerMeta(
      name: 'My App',
      description: 'An dapp for socialFi NFT',
      url: 'https://walletconnect.org',
      icons: [
        'https://files.gitbook.com/v0/b/gitbook-legacy-files/o/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
  ]));
  
  // may change here to include more wallets with walletconnect support
  loginUsingMetamask(BuildContext context) async {
    if (!connector.connected) {
      try {
        var session = await connector.createSession(onDisplayUri: (uri) async {
          _uri = uri;
          await launchUrlString(uri, mode: LaunchMode.externalApplication);
        });
        setState(() {
          _session = session;
          print(_session);
        });
      } catch (exp) {
        print('Login with MetaMask failed due to: $exp');
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {

    // main login page logic
    // listen to connection
    connector.on(
      'connect',
      (session) => setState(
        () {
          _session = session;
        },
    ));
    
    // listen to seesion update
    connector.on(
      'session_update',
      (payload) => setState(() {
        _session = payload;
    }));

    // listen to disconnect
    connector.on(
      'disconnect',
      (payload) => setState(() {
        _session = null;
    }));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 0,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/login_logo.jpeg',
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(height: 16),
            // Tap the wallet log in button
            (_session == null) ?
            ElevatedButton(
              onPressed: () => {
                loginUsingMetamask(context),
                },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.pink),
              ), 
              child: const Text("Connect with Metamask"))
            :
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                Text(
                  'Connceting to account ...',
                  style: GoogleFonts.inconsolata(
                    fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                ),
                Text(
                  '${_session.accounts[0]}',
                  style: GoogleFonts.inconsolata(fontSize: 16, color: Colors.white),
                ),
                const SizedBox(height: 16),
              ]
            ),
          // slide to login
            (_session != null) ?
            Container(
              alignment: Alignment.center,
              child: SliderButton(
                action: () {
                  Navigator.pushNamed(context, MainRoutes.homeRoute);
                },
                label: const Text('Slide to connect'),
                icon: const Icon(Icons.double_arrow),
              ),
            )
            :
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [],
            )
          ],
        ),
      ),
    );
  }
}