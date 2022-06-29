// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

class Request_playlist_data extends StatefulWidget {
  const Request_playlist_data({Key? key}) : super(key: key);

  @override
  _Request_playlist_dataState createState() => _Request_playlist_dataState();
}

class _Request_playlist_dataState extends State<Request_playlist_data> {
  @override
  var res;
  var uuid = Uuid();

  bool pre = false;
  TextEditingController Course_name = new TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;
  TextEditingController course_playlist = new TextEditingController();
  TextEditingController course_category = new TextEditingController();
  final formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          tooltip: 'Back',
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
        ),
centerTitle: true,
        title: Text(
          "Add PlayList",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 28, right: 28),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Course Name',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    hintText: 'Enter Course Name',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  controller: Course_name,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Course Name is Required';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 28, right: 28),
                child: TextFormField(
  
                  decoration: InputDecoration(
                    labelText: 'Course Playlist',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    hintText: 'Enter Course Playlist Link',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  controller: course_playlist,
                  validator: (String? value) {
                    // Pattern pattern = r'^(https|http):\/\/(?:www\.)?youtube\.com\/watch\?(?:&.*)*((?:v=([a-zA-Z0-9_\-]{11})(?:&.**list=([a-zA-Z0-9_\-]{18})(?:&.*)*&v=([a-zA-Z0-9_\-]{11}))(?:&.*)*(?:\#.*)*$';
    // RegExp regex = value!.contains(RegExp(pattern.toString()));
    
                  if (value!.isEmpty) {
          return 'Youtube Link is Required';
        } else if (!value.contains(RegExp(r'^https?:\/\/(www.youtube.com|youtube.com)\/playlist(.*)$'))){
          return 'Enter Valid url';
        }
                  }
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 28, right: 28),
                child: TextFormField(
  
                  decoration: InputDecoration(
                    labelText: 'Course Category',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    hintText: 'Enter Course Category',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  controller: course_category,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Course Category is Required';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: () async {
                  res != null ? pre = false : pre = true;
                  if (formKey.currentState!.validate()) {
                    var v1 = uuid.v1();
                    setState(() {
                      pre = true;
                      FirebaseFirestore.instance
                          .collection("Courses")
                          .doc(v1)
                          .set({
                            "CourseName": Course_name.text,
                            "coursePlaylist": course_playlist.text,
                            "CourseCatogery": course_category.text,
                            "user": user.email,
                            "id": v1,
                          })
                          .then((value) => print("Course added"))
                          .catchError((error) =>
                              print("Failed to add document: $error"));
                    });
                    // Navigator.pushReplacement(context,
                    //     MaterialPageRoute(builder: (context) => homePage()));
                    formKey.currentState!.reset();
                  await Future.delayed(Duration(seconds: 1));
                  }

                },
                child: AnimatedContainer(
                  height: 40,
                  duration: Duration(seconds: 1),
                  width: pre ? 55 : 110,
                  alignment: Alignment.center,
                  child: pre
                      ? Icon(
                          Icons.check,
                          color: Colors.white,
                        )
                      : Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(pre ? 40 : 15)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}