import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:web3chanel_flutter_app/navigation/profile_tab_controller.dart';

import '../widgets/avatar_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children:  <Widget>[
          const SizedBox(height: 36),
          const AvatarWidget(),
          const Expanded( child: ProfileTabController()),
          FloatingActionButton(
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
      
    }
  }

}
