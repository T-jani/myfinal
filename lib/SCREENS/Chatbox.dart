import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:file_picker/file_picker.dart';

import 'package:chewie/chewie.dart';
import 'package:geolocator/geolocator.dart';

import 'package:multiselect_dropdown_flutter/multiselect_dropdown_flutter.dart';

class ChatBox extends StatefulWidget {
  const ChatBox({super.key});

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  File? _image;
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> _openCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future<void> _openVideoGallery() async {
    final pickedVideo =
        await _imagePicker.pickVideo(source: ImageSource.gallery);

    if (pickedVideo != null) {
      setState(() {});
    }
  }

  List<String> selectedValues = [];

  void onChanged(List<String> newSelectedValues) {
    setState(() {
      selectedValues = newSelectedValues;
    });
  }

  // void _openFileManager() async {
  //   await OpenFile.open('/path/to/initial/directory');
  // }
  Future<void> _openDocumentPicker() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {});
    }
  }

  Future<void> _addLocation() async {
    Position? position;

    try {
      position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      print('Error getting current location: $e');
    }

    if (position != null) {
      // Handle the obtained position as per your requirement
      print('Latitude: ${position.latitude}');
      print('Longitude: ${position.longitude}');
    } else {
      print('Failed to get current location.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatBox'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // TextFormField(
              //   decoration: InputDecoration(
              //       labelText: 'To : Constituency Communication Directorate '),
              // ),

              SizedBox(
                height: 10,
              ),

              Container(
                child: Row(
                  children: [
                    Text(
                      'To : ',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MultiSelectDropdown(
                      list: const [
                        {'id': 'PT1', 'label': 'PT1'},
                        {'id': 'PT2', 'label': 'PT2'},
                        {'id': 'PT3', 'label': 'PT3'},
                        {'id': 'PT4', 'label': 'PT4'},
                      ],
                      initiallySelected: const [],
                      onChange: (newList) {
                        // your logic
                        // typically setting state
                      },
                      numberOfItemsLabelToShow:
                          2, // label to be shown for 2 items
                      whenEmpty:
                          'Select Senders', // text to show when selected list is empty
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Message Title ',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Message Type ',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              // TextField(
              //   onTap: () {
              //     setState(() {
              //       MultiSelectDropdown(
              //           options: ['Internal', 'External'],
              //           selectedValues: [''],
              //           onChanged: onChanged);
              //     });
              //   },
              //   decoration: InputDecoration(labelText: 'Message Type:'),
              // ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SimpleDialog(
                              // title: const Text('Upload'),
                              children: <Widget>[
                                SimpleDialogOption(
                                    onPressed: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => M4b(),
                                      //   ),
                                      // );
                                    },
                                    child: Row(
                                      children: [
                                        if (_image != null) Image.file(_image!),
                                        IconButton(
                                            onPressed: _openCamera,
                                            icon: Icon(
                                              Icons.camera_alt_outlined,
                                              size: 25,
                                            )),
                                        TextButton(
                                            onPressed: _openCamera,
                                            child: Text(
                                              ' Camera',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black),
                                            ))
                                      ],
                                    )),
                                SimpleDialogOption(
                                    onPressed: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => M4b(),
                                      //   ),
                                      // );
                                    },
                                    child: Row(
                                      children: [
                                        // if (_image != null)
                                        //   Image.file(
                                        //     _image,
                                        //     height: 200,
                                        //   ),
                                        // if (_video != null)
                                        //   VideoPlayerWidget(
                                        //     videoFile: _video,
                                        //   ),
                                        IconButton(
                                            onPressed: _openVideoGallery,
                                            icon: Icon(
                                              Icons.picture_in_picture,
                                              size: 25,
                                            )),
                                        TextButton(
                                            onPressed: _openVideoGallery,
                                            child: Text(
                                              ' Photos & Video Library',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black),
                                            ))
                                      ],
                                    )),
                                SimpleDialogOption(
                                  onPressed: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => M4b(),
                                    //   ),
                                    // );
                                  },
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: _openDocumentPicker,
                                        icon: Icon(
                                          Icons.file_open,
                                          size: 25,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: _openDocumentPicker,
                                        child: Text(
                                          ' Document',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SimpleDialogOption(
                                    onPressed: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => M4b(),
                                      //   ),
                                      // );
                                    },
                                    child: Row(
                                      children: [
                                        IconButton(
                                            onPressed: _addLocation,
                                            icon: Icon(
                                              Icons.location_on,
                                              size: 25,
                                            )),
                                        TextButton(
                                            onPressed: _addLocation,
                                            child: Text(
                                              ' Location',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black),
                                            ))
                                      ],
                                    )),
                                // SimpleDialogOption(
                                //     onPressed: () {
                                //       // Navigator.push(
                                //       //   context,
                                //       //   MaterialPageRoute(
                                //       //     builder: (context) => M4b(),
                                //       //   ),
                                //       // );
                                //     },
                                //     child: Row(
                                //       children: [
                                //         IconButton(
                                //             onPressed: () {},
                                //             icon: Icon(
                                //               Icons.camera_alt_outlined,
                                //               size: 25,
                                //             )),
                                //         TextButton(
                                //             onPressed: () {},
                                //             child: Text(
                                //               ' Contact',
                                //               style: TextStyle(
                                //                   fontSize: 20,
                                //                   color: Colors.black),
                                //             ))
                                //       ],
                                //     )),
                              ],
                            );
                          },
                        );
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.blue,
                      )),
                  labelText: 'Message Box',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              OutlinedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {},
                child: Text(
                  'Send',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final File? videoFile;

  const VideoPlayerWidget({required this.videoFile});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    if (widget.videoFile != null) {
      _videoPlayerController = VideoPlayerController.file(widget.videoFile!);
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        looping: true,
      );
    }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.videoFile != null
        ? Chewie(
            controller: _chewieController,
          )
        : Container(); // Return an empty container if videoFile is null
  }
}
