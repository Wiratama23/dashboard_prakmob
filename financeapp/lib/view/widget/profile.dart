import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;

  //munculin bottomsheet
  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                icon: Icon(Icons.camera),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                  Navigator.pop(context);
                },
                label: Text("Camera"),
              ),
              SizedBox(width: 20),
              TextButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                  Navigator.pop(context);
                },
                label: Text("Gallery"),
              ),
              SizedBox(width: 20),
              TextButton.icon(
                  icon: Icon(Icons.restart_alt),
                  onPressed: () {
                    setState(() {
                      _imageFile = null;
                    });
                    Navigator.pop(context);
                    showSnackBar("Reset Successfully");
                  },
                  label: Text("Reset"))
            ],
          ),
        ],
      ),
    );
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.only(left: 50, bottom: 25, top: 25),
        content: Text(
          message,
          style: TextStyle(color: CupertinoColors.black),
        ),
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {},
        ),
        duration: Duration(seconds: 3),
        backgroundColor: Color.fromARGB(255, 181, 221, 218),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
      ),
    );
  }

  //ambil gambar lewat camera atau gallery
  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
    );
    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
      showSnackBar("Profile picture changed successfully!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: _imageFile == null
                ? AssetImage("lib/assets/images/profile.jpg") as ImageProvider
                : FileImage(File(_imageFile!.path)),
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: ((builder) => bottomSheet()),
                    backgroundColor: Color.fromARGB(255, 181, 221, 218),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15)),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
