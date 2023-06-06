import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:file_picker/file_picker.dart';
import 'package:multiselect_dropdown_flutter/multiselect_dropdown_flutter.dart';
import 'package:chewie/chewie.dart';
import 'package:geolocator/geolocator.dart';

// import '../SCREENS/Chatbox.dart';

class NchatPage extends StatefulWidget {
  const NchatPage({super.key});

  @override
  State<NchatPage> createState() => _NchatPageState();
}

class _NchatPageState extends State<NchatPage> {
  @override
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
        title: Text('COMPOSE MESSAGE'),
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
                      'To : ',
                      style: TextStyle(fontSize: 20),
                    ),
                    Expanded(
                      child: Container(
                        child: MultiSelectDropdown.simpleList(
                          list: const [
                            'ALl RCD',
                            'All CCD',
                            'RCD',
                            'CCD',
                          ],
                          initiallySelected: const [],
                          onChange: (newList) {
                            // your logic
                          },
                          includeSearch: true,
                          includeSelectAll: true,
                          isLarge: true, // Modal size will be a little large
                          // Give a definite width when rendering this widget in a row
                          width: 150, // Must be a definite number
                          boxDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   width: 20,
                    // ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    Expanded(
                      child: Container(
                        child: MultiSelectDropdown.simpleList(
                          list: const [
                            'W.Region',
                            'U.West',
                            'N.Region',
                            'E.region',
                          ],
                          initiallySelected: const [],
                          onChange: (newList) {
                            // your logic
                          },
                          includeSearch: true,
                          includeSelectAll: true,
                          isLarge: true, // Modal size will be a little large
                          // Give a definite width when rendering this widget in a row
                          width: 150, // Must be a definite number
                          boxDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                  ],
                ),
              ),
              // Text('Message Type'),
              // MultiSelectDropdown(
              //     options: ['Internal', 'External'],
              //     selectedValues: selectedValues,
              //     onChanged: onChanged),
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

              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Message Type',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                items: [
                  DropdownMenuItem(
                    value: 'Type 1',
                    child: Text('Internal'),
                  ),
                  DropdownMenuItem(
                    value: 'Type 2',
                    child: Text('External'),
                  ),
                ],
                onChanged: (String? value) {
                  // Handle the selected value here
                },

                // value: null, // Set the initial selected value here if needed
                // isDense: true, // Adjust the dropdown's size if desired
                // isExpanded: true, // Expand the dropdown to fit its parent
                // multiple: true, // Enable multi-select
              ),

              // TextFormField(
              //   decoration: InputDecoration(
              //     labelText: 'Message Type ',
              //     border: OutlineInputBorder(
              //       borderSide: BorderSide(color: Colors.blue),
              //     ),
              //   ),
              // ),
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

                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => NchatPage()),
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
