import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:web3chanel_flutter_app/navigation/profile_tab_controller.dart';
import 'package:web3chanel_flutter_app/globals.dart' as globals;
// import '../abi/contracts/mocks/Currency.sol/Currency.json' as currency;


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

const currency_address = '0xc4905364b78a742ccce7B890A89514061E47068D';
// const contract = new ethers.Contract(tokenContractAddress, genericErc20Abi, provider);
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
            // TODO: Add Address
            Text(
              'Address\n${globals.connector.session.accounts}',
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
            onPressed: () { _handleImageSelection(); },
            child: const Icon(Icons.add),
          ),
        ]
      )
    );
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      // TODO: upload image here
      //
      print("image");
      
    }
  }

}
