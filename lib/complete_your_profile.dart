import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ev_point/add_vehicle.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'constant/vars.dart';

class ProfilePage extends StatefulWidget {
  final String? mobileNumber;
  final bool? isFromSetting;

  const ProfilePage({super.key, this.mobileNumber, this.isFromSetting});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController fullName;
  late TextEditingController mobileNo;
  late TextEditingController email;
  late TextEditingController dob;
  late TextEditingController gender;
  late TextEditingController streetAddress;
  late TextEditingController country;
  final ImagePicker picker = ImagePicker();
  XFile? image;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fullName = TextEditingController(text: userInfo['name']);
    if (widget.mobileNumber == null) {
      mobileNo = TextEditingController(text: userInfo['mobileNumber']);
    } else {
      mobileNo = TextEditingController(text: widget.mobileNumber);
    }

    dob = TextEditingController(text: userInfo['dob']);
    if(userInfo['gender']=="" || userInfo['gender']==null){
      gender = TextEditingController(text: userInfo['gender']??"MALE");
    }else{
      gender = TextEditingController(text: userInfo['gender']);
    }

    email = TextEditingController(text: userInfo['email']);
    streetAddress = TextEditingController(text: userInfo['address']);
    country = TextEditingController(text: userInfo['country']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Visibility(
            visible: widget.isFromSetting == null ? true : false,
            child: Column(
              children: [
                Row(
                  children: [
                    const Text("Complete your profile",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: Colors.black)),
                    const SizedBox(width: 6),
                    Image.asset("assets/icons/ic_clipboard.png", height: 25)
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Don't worry, only you can see your personal\n data. No one else will be able to see it.",
                  style:
                      TextStyle(color: Colors.black, height: 1.3, fontSize: 16),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
          Center(
              child: SizedBox(
            height: 100,
            width: 100,
            child: Stack(
              children: [
                image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.file(
                          File(image!.path),
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      )
                    : userInfo['profile'] != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              userInfo['profile'],
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade200),
                            child: const Icon(Icons.person,
                                color: Colors.grey, size: 60),
                          ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () async {
                        image =
                            await picker.pickImage(source: ImageSource.gallery);
                        setState(() {});

                        // final XFile? photo = await picker.pickImage(source: ImageSource.camera);
                      },
                      child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.green.shade500),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          )),
                    ))
              ],
            ),
          )),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Full Name",
                  style: TextStyle(
                      fontWeight: FontWeight.w900, color: Colors.black),
                ),
                TextFormField(
                  controller: fullName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    // fullName.text = fullName.toString();
                  },
                  decoration: const InputDecoration(
                    hintText: "Full Name",
                    hintStyle: TextStyle(fontWeight: FontWeight.w900),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Phone Number",
                  style: TextStyle(
                      fontWeight: FontWeight.w900, color: Colors.black),
                ),
                TextFormField(
                  controller: mobileNo,
                  keyboardType: TextInputType.phone,
                  maxLength: 13,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Your Phone Number';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Phone Number",
                    hintStyle: TextStyle(fontWeight: FontWeight.w900),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Email",
                  style: TextStyle(
                      fontWeight: FontWeight.w900, color: Colors.black),
                ),
                TextFormField(
                  controller: email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    // email.text = email.toString();
                  },
                  decoration: const InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(fontWeight: FontWeight.w900),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Gender",
                  style: TextStyle(
                      fontWeight: FontWeight.w900, color: Colors.black),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: DropdownButtonFormField(
                    icon: const Icon(Icons.keyboard_arrow_down_sharp),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select Option';
                      }
                      return null;
                    },
                    onChanged: (v) {
                      gender.text = v.toString();
                      debugPrint(v.toString());
                    },
                    value: gender.text,
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green, width: 1.5)),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: "MALE",
                        child: Text(
                          "Male",
                        ),
                      ),
                      DropdownMenuItem(
                        value: "FEMALE",
                        child: Text(
                          "Female",
                        ),
                      ),
                      // DropdownMenuItem(
                      //   value: "OTHERS",
                      //   child: Text(
                      //     "Others",
                      //   ),
                      // ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Date of Birth",
                  style: TextStyle(
                      fontWeight: FontWeight.w900, color: Colors.black),
                ),
                InkWell(
                  onTap: () {
                        openDatePicker(context);
                  },
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select date';
                      }
                      return null;
                    },
                    enabled: false,
                    controller: dob,
                    decoration: const InputDecoration(
                      hintText: "DD/MM/YYYY",
                      suffixIcon: Icon(Icons.calendar_month_rounded),
                      hintStyle: TextStyle(fontWeight: FontWeight.w900),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Visibility(
                  visible: widget.isFromSetting == null ? false : true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Street Address",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, color: Colors.black),
                      ),
                      TextFormField(
                        controller: streetAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Your Information';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          streetAddress.text = value;
                        },
                        decoration: const InputDecoration(
                          hintText: "Street Address",
                          hintStyle: TextStyle(fontWeight: FontWeight.w900),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: widget.isFromSetting == null ? false : true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Country",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, color: Colors.black),
                      ),
                      TextFormField(
                        controller: country,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Your Information';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          country.text = value;
                        },
                        decoration: const InputDecoration(
                          hintText: "Country",
                          hintStyle: TextStyle(fontWeight: FontWeight.w900),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(25)),
            height: 50,
            width: 320,
            child: TextButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    var user = {
                      'name': fullName.text,
                      'email': email.text,
                      'gender': gender.text,
                      'dob': dob.text,
                      'mobileNumber': mobileNo.text,

                    };

                    if (image != null) {
                      final storageRef = FirebaseStorage.instance.ref();
                      //File Name
                      final mountainsRef = storageRef.child(getRandomName());

                      await mountainsRef.putFile(File(image!.path));
                      //Get uploaded file url
                      String imageURL = await mountainsRef.getDownloadURL();
                      user['profile'] = imageURL;
                    } else {
                      user['profile'] = userInfo['profile'];
                    }

                    var result = await FirebaseFirestore.instance
                        .collection("users")
                        .where("mobileNumber", isEqualTo: widget.isFromSetting==null? widget.mobileNumber:userInfo['mobileNumber'])
                        .get();

                    if (result.docs.isEmpty) {
                      await FirebaseFirestore.instance
                          .collection('users')
                          .add(user)
                          .then((value) async {
                        var result = await FirebaseFirestore.instance
                            .collection("users")
                            .where("mobileNumber",
                                isEqualTo: widget.mobileNumber)
                            .get();
                        String userId = result.docs[0].id;
                        userInfo = result.docs[0].data();
                        userInfo['id'] = userId;

                        GetStorage().write('isLogin', true);
                        GetStorage().write('userInfo', userInfo);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddVehicle(),
                            ));
                      }).catchError((error) {
                        debugPrint("Please try again");
                        debugPrint(error.toString());
                      });
                    } else {

                        user['address'] = streetAddress.text;
                        user['country'] = country.text;
                        user['mobileNumber'] = mobileNo.text;

                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(userInfo['id'])
                            .update(user)
                            .then((value) async {
                          var result = await FirebaseFirestore.instance
                              .collection("users")
                              .where("mobileNumber",
                                  isEqualTo:  mobileNo.text)
                              .get();
                          String userId = result.docs[0].id;
                          userInfo = result.docs[0].data();
                          userInfo['id'] = userId;

                          GetStorage().write('userInfo', userInfo);


                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Update Successfull")));
                          setState(() {});
                        }).catchError((error) {
                          debugPrint("Please try again");
                          debugPrint(error.toString());
                        });
                      }


                    // ignore: use_build_context_synchronously
                  }
                },
                child: Text("Continue",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16))),
          ),
        ],
      ),
    );
  }

  String getRandomName() {
    DateTime dateTime = DateTime.now();
    return "$dateTime.jpg";
  }

  DateTime selectedDate = DateTime.now();

  TextEditingController txtDate = TextEditingController();

  Future<void> openDatePicker(context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      selectedDate = picked;
      dob.text = selectedDate.toString();
      debugPrint(dob.toString());
      String formattedDate = DateFormat.yMMMEd().format(selectedDate);
      dob.text = formattedDate;
      setState(() {});
    }
  }

  // final picker = ImagePicker();

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {}
    });
  }
}
