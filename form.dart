import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // Load initial data when the widget is first created
    // sendDataToServer();
  }

  final TextEditingController batchController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController cellPhoneController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController workController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  String _selectedGender = 'Select Gender';

  File? _selectedImage;

  Future<void> _openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        _selectedImage = File(result.files.single.path!);
        imageController.text = _selectedImage!.path;
      });
    }
  }

  Future<void> sendDataToServer() async {
    setState(() {
      isLoading = true;
    });

    try {
      final Uri apiUrl =
          Uri.parse("http://192.168.114.44:80/capstone/members_data.php");

      final batch = batchController.text;
      final name = nameController.text;
      final age = ageController.text;
      final cellPhone = cellPhoneController.text;
      final image = imageController.text;
      final location = locationController.text;
      final work = workController.text;

      // Validate input fields
      if (batch.isEmpty ||
          name.isEmpty ||
          age.isEmpty ||
          _selectedGender == 'Select Gender' ||
          cellPhone.isEmpty ||
          image.isEmpty ||
          location.isEmpty ||
          work.isEmpty) {
        String errorMessage = "Please input data in the following field(s):";
        if (batch.isEmpty) errorMessage += "\n- Batch Code";
        if (name.isEmpty) errorMessage += "\n- Full Name";
        if (age.isEmpty) errorMessage += "\n- Age";
        if (_selectedGender == 'Select Gender') errorMessage += "\n- Gender";
        if (cellPhone.isEmpty) errorMessage += "\n- Cellphone Number";
        if (image.isEmpty) errorMessage += "\n- Upload ID";
        if (location.isEmpty) errorMessage += "\n- Address";
        if (work.isEmpty) errorMessage += "\n- Work / Business";

        // Show alert for missing fields
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Missing Information'),
              content: Text(errorMessage),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );

        return; // Stop the function if validation fails
      }
      final Map<String, String> data = {
        'batch': batch,
        'name': name,
        'age': age,
        'cellphone': cellPhone,
        'image': image,
        'location': location,
        'work': work,
      };

      final response = await http.post(apiUrl, body: data);
      // Function to clear form fields
      void clearForm() {
        batchController.clear();
        nameController.clear();
        ageController.clear();
        cellPhoneController.clear();
        imageController.clear();
        locationController.clear();
        workController.clear();
        setState(() {
          _selectedGender = 'Select Gender';
        });
      }

      if (response.statusCode == 200) {
        print("Data posted successfully");
        // Clear form fields after successful post
        clearForm();

        // Show alert for successful submission
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text('Data Successfully Submitted!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        print("Failed to post data");
        // Show alert for failed submission
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Failed to submit data. Please try again.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (error) {
      print("Error in postData: $error");
      // Handle error as needed
    } finally {
      setState(() {
        isLoading = false;
      });
    } // Stop the function if validation fails
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 80, bottom: 80),
                child: Text(
                  ("Form"),
                  style: TextStyle(
                      fontSize: 50,
                      color: Color.fromARGB(255, 70, 113, 71),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                        255, 70, 113, 71), // Background color
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ), // Border radius
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30, left: 50, bottom: 10),
                        child: Text("Batch Code",
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 50, right: 50, bottom: 10),
                        child: TextField(
                          controller: batchController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Batch Code",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                color: Colors.blue,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 50, bottom: 10),
                            child: Text("Full Name",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 50, right: 50, top: 0),
                            child: TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Full Name",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                      color: Colors.blue,
                                      style: BorderStyle.solid),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 50, bottom: 10),
                            child: Text("Age",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 50, right: 50, top: 0),
                            child: TextField(
                              controller: ageController,
                              decoration: const InputDecoration(
                                // suffixIcon: Icon(Icons.numbers),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Age",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                      color: Colors.blue,
                                      style: BorderStyle.solid),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 50, right: 50, top: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Text(
                                "Gender",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            DropdownButtonFormField<String>(
                              value: _selectedGender,
                              onChanged: (newValue) {
                                if (newValue != 'Select Gender') {
                                  setState(() {
                                    _selectedGender = newValue!;
                                  });
                                }
                              },
                              items: <String>['Select Gender', 'Male', 'Female']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Gender",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                    color: Colors.blue,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 50, right: 50, top: 10, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Upload ID",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: TextFormField(
                                    controller: imageController,
                                    readOnly: true, // Set to read-only
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: 'Select Image',
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      suffixIcon: IconButton(
                                        icon: const Icon(Icons.folder_open),
                                        onPressed: _openFilePicker,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            _selectedImage != null
                                ? Image.file(
                                    _selectedImage!,
                                    height: 200.0,
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 50, bottom: 10),
                            child: Text("CellPhone Number",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 50, right: 50, top: 0),
                            child: TextField(
                              controller: cellPhoneController,
                              decoration: const InputDecoration(
                                // suffixIcon: Icon(Icons.numbers),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Cellphone Number",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                      color: Colors.blue,
                                      style: BorderStyle.solid),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 50, bottom: 10),
                            child: Text("Address",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 50, right: 50, top: 0),
                            child: TextField(
                              controller: locationController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Address",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                      color: Colors.blue,
                                      style: BorderStyle.solid),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 50, bottom: 10),
                            child: Text("Work/Business",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 50, right: 50, top: 0),
                            child: TextField(
                              controller: workController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Work / Business",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                      color: Colors.blue,
                                      style: BorderStyle.solid),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 50, right: 50, top: 30, bottom: 30),
                        child: MaterialButton(
                          minWidth: 500,
                          height: 55,
                          onPressed: () {
                            sendDataToServer();
                          },
                          child: Text("SUBMIT",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 70, 113, 71),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: Color.fromARGB(255, 248, 251, 252),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // Floating Action Button
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 110, 108, 104),
        onPressed: () {
          _showAlertDialog(context);
        },
        child: Icon(Icons.question_mark),
      ),
    );
  }

  // Function to show the AlertDialog
  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Form Tips : '),
          content: Text(
              'Please input all the requirments needed from the Form. If your not complying the needed information. Handler will automatically delete your information from the Members Details.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
