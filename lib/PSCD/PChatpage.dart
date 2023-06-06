import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:file_picker/file_picker.dart';

import 'package:chewie/chewie.dart';
import 'package:geolocator/geolocator.dart';

import '../SCREENS/Chatbox.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
        title: Text('Compose Message'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Row(
                  children: [
                    Text(
                      'To : CCD',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChatBox()),
                        );
                      },
                      child: Text(
                        'ChatBox',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
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
                              children: <Widget>[
                                SimpleDialogOption(
                                    onPressed: () {},
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
                                    onPressed: () {},
                                    child: Row(
                                      children: [
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
                                  onPressed: () {},
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
                                    onPressed: () {},
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
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ChatPage()),
                                      );
                                    },
                                    child: Text(
                                      'close',
                                      style: TextStyle(fontSize: 20),
                                    ))
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
