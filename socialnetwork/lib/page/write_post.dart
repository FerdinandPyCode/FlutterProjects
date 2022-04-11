import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialnetwork/custom_widget/my_gradient.dart';
import 'package:socialnetwork/custom_widget/my_textfield.dart';
import 'package:socialnetwork/custom_widget/padding_with.dart';
import 'package:socialnetwork/model/color_theme.dart';
import 'package:socialnetwork/util/constants.dart';

class WritePost extends StatefulWidget {
  const WritePost({Key? key}) : super(key: key);

  @override
  _WritePostState createState() => _WritePostState();
}

class _WritePostState extends State<WritePost> {
  TextEditingController _controller = TextEditingController();
  File? imageFile = null;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, //ColorTheme.base(),
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width,
      child: PaddingWith(
        bottom: 0,
        child: Container(
          decoration: BoxDecoration(
            color: ColorTheme.accent(),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          ),
          child: InkWell(
            onTap: (() => FocusScope.of(context).requestFocus(FocusNode())),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  PaddingWith(child: const Text("Ecrivez quelque chose")),
                  PaddingWith(
                      child: MyTextField(
                    controller: _controller,
                    hint: "Exprimez vous",
                    icon: writePost,
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            pickImage(ImageSource.camera);
                          },
                          icon: cameraIcon),
                      IconButton(
                          onPressed: () {
                            pickImage(ImageSource.gallery);
                          },
                          icon: libraryIcon)
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: (imageFile == null)
                        ? const Text("Aucune image")
                        : Image.file(imageFile!),
                  ),
                  Card(
                    elevation: 7.5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: MyGradient(
                        startColor: ColorTheme.base(),
                        endColor: ColorTheme.pointer(),
                        horizontal: true,
                        radius: 25,
                      ),
                      child: TextButton(
                        child: const Text("Envoyer"),
                        onPressed: () {
                          //Envoyer à firebase
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image =
        await _picker.pickImage(source: source, maxHeight: 500, maxWidth: 500);
    if (image != null) {
      imageFile = File(image.path);
    }
  }
}
