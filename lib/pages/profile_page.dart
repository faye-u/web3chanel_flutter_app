import 'dart:io';

import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web3chanel_flutter_app/navigation/profile_tab_controller.dart';
import 'package:web3chanel_flutter_app/globals.dart' as globals;
// import '../abi/contracts/mocks/Currency.sol/Currency.json' as currency;
import 'package:walletconnect_dart/walletconnect_dart.dart';
import '/src/service/image_picker.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}


testTx(BuildContext context) async {
  const currency_address = '0xc4905364b78a742ccce7B890A89514061E47068D';
  // const contract = new ethers.Contract(tokenContractAddress, genericErc20Abi, provider);
  // var provider = EthereumWalletConnectProvider(connector);
  var provider = EthereumWalletConnectProvider(globals.connector);
  var hash = provider.sendTransaction(
      from:"0x90F79bf6EB2c4f870365E785982E1f101E93b906",
      to:"0xa513E6E4b8f2a923D98304ec87F64353C4D5C853",
      data:"0x963ff1410000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000c0000000000000000000000000a51c1fc2f0d1a1b8494ed1fe312d7c3a78ed91c0000000000000000000000000000000000000000000000000000000000000014000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000300000000000000000000000000000000000000000000000000000000000000004368747470733a2f2f697066732e696f2f697066732f516d627938516f6355553273505a4c3436725a654d6374417546356e7243633765523150506b6f6f437a7457507a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001a000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000de0b6b3a764000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008a791620dd6260079bf849dc5567adc3f2fdc31800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e000000000000000000000000000000000000000000000000000000000000000020000000000000000000000003c44cdddb6a900fa2b585dd299e03d12fa4293bc0000000000000000000000000000000000000000000000000000000000001f40000000000000000000000000610178da211fef7d417bc0e6fed39f05609ad78800000000000000000000000000000000000000000000000000000000000007d00000000000000000000000000000000000000000000000000000000000000000",
      gas:327391,
    );
  print(await hash);
}



class _ProfilePageState extends State<ProfilePage> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children:  <Widget>[
          const SizedBox(height: 56),
          Row (children: [
            const SizedBox(width: 24),
            Avatar(
              placeholderColors: [Colors.pink],
              shape: AvatarShape.circle(36),
              name:
                  'Undefyned', // Fallback if no image source is available
              ),
              const SizedBox(width: 48),
              // TODO: Add Address and balance
            Text(
              'Undefyned',
              style: GoogleFonts.inconsolata(
                fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
            ),
            ],
          ),
          const SizedBox(height: 12),
          Row (children: [
            const SizedBox(width: 24),
            Text(
              'Address\n${globals.connector.session.accounts[0]}',
              style: GoogleFonts.inconsolata(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
            ),
            ],
          ),
          const SizedBox(height: 12),
          Row (children: [
            const SizedBox(width: 24),
            // TODO: Add Address
            Text(
              '0 token',
              style: GoogleFonts.inconsolata(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
            ),
            ],
          ),
          const Expanded( child: ProfileTabController()),
          FloatingActionButton.small(
            backgroundColor: Colors.pink,
            onPressed: () { 
              testTx(context);
              _handleImageSelection(context); },
            child: const Icon(Icons.add),
          ),
        ]
      )
    );
  }

  void _handleImageSelection(BuildContext context) async {
    final result = await ImagePickerService.pickImage(context);

    if (result != null) {
      XFile xFile = result.image;

      final bytes = await xFile.readAsBytes();
      final image = await decodeImageFromList(bytes);

      String cid = result.cid;

      debugPrint('ciddddd ${cid}');
      // TODO: upload image here

      var url = Uri.http('localhost:3000', '/post', {'q': '{http}'});
      var response = await http.post(
        Uri.parse('http://localhost:3000/post'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
        },
        body: convert.jsonEncode({
          'url': 'https://ipfs.io/ipfs/${cid}',
        }),
      );
      if (response.statusCode == 200) {
        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;
        var data = jsonResponse['data'];
        var to = jsonResponse['to'];
        var from = jsonResponse['from'];
        debugPrint('data: $data.');
        debugPrint('to: $to.');
        debugPrint('to: $from.');
      } else {
        debugPrint('Request failed with status: ${response.statusCode}.');
      }
    }
  }

}
