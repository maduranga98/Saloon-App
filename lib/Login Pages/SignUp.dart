import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saloon_app/Common/InputDecoration.dart';
import 'package:saloon_app/Employee/E_Registration.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();

  // Initialize controllers
  late final TextEditingController _about;
  late final TextEditingController _business_name;
  late final TextEditingController _business_adress;
  late final TextEditingController _country;
  late final TextEditingController _mobile;
  late final TextEditingController _state;
  late final TextEditingController _brn;
  late final TextEditingController _webLink;
  late final TextEditingController _fbLink;
  late final TextEditingController _instaLink;
  late final TextEditingController _googleLink;

  XFile? _image;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _about = TextEditingController();
    _business_name = TextEditingController();
    _business_adress = TextEditingController();
    _country = TextEditingController();
    _mobile = TextEditingController();
    _state = TextEditingController();
    _brn = TextEditingController();
    _webLink = TextEditingController();
    _fbLink = TextEditingController();
    _instaLink = TextEditingController();
    _googleLink = TextEditingController();
  }

  @override
  void dispose() {
    _about.dispose();
    _business_name.dispose();
    _business_adress.dispose();
    _country.dispose();
    _mobile.dispose();
    _state.dispose();
    _brn.dispose();
    _webLink.dispose();
    _fbLink.dispose();
    _instaLink.dispose();
    _googleLink.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    try {
      setState(() {
        _isLoading = true;
      });

      final ImagePicker picker = ImagePicker();
      final XFile? selectedImage = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
        maxWidth: 1024,
        maxHeight: 1024,
      );

      if (selectedImage != null) {
        // Verify the file exists and is readable
        final File file = File(selectedImage.path);
        if (await file.exists()) {
          try {
            // Test if the image can be read
            await decodeImageFromList(await file.readAsBytes());
            setState(() {
              _image = selectedImage;
            });
          } catch (e) {
            _showErrorDialog(
                'Selected image could not be processed. Please try another image.');
          }
        } else {
          _showErrorDialog('Selected image file not found. Please try again.');
        }
      }
    } catch (e) {
      _showErrorDialog('Error picking image: Please try again');
      debugPrint('Error picking image: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Image Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      children: [
        const Expanded(
          child: Divider(thickness: 1.5, color: Colors.grey),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(title, style: const TextStyle(fontSize: 16)),
        ),
        const Expanded(
          child: Divider(thickness: 1.5, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildImagePreview() {
    if (_isLoading) {
      return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_image == null) {
      return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text('No image selected'),
        ),
      );
    }

    return FutureBuilder<File>(
      future: Future.value(File(_image!.path)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.file(
                snapshot.data!,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  debugPrint('Error loading image: $error');
                  return Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey[200],
                    child: const Center(
                      child: Text(
                        'Error loading image',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }
        return Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Future<void> _handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        setState(() {
          _isLoading = true;
        });
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EmployeeRegistrationForm()));
        // Add your form submission logic here
        // Example:
        // await submitFormData({
        //   'businessName': _business_name.text,
        //   'mobile': _mobile.text,
        //   ...
        // });
      } catch (e) {
        _showErrorDialog('Error submitting form: ${e.toString()}');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 30.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Business Registration Form",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    _buildSectionHeader("Common Details"),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _business_name,
                      decoration:
                          commonInputDecoration('Enter your business name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your business name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _mobile,
                      decoration: commonInputDecoration('Enter your contact'),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your contact';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _business_adress,
                      decoration: commonInputDecoration('Enter address'),
                      maxLines: 2,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _brn,
                      decoration: commonInputDecoration('Enter BRN'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your BRN';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _country,
                      decoration: commonInputDecoration('Enter country'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter country';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _state,
                      decoration: commonInputDecoration('Enter state'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter state';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    _buildSectionHeader("Business Details"),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _about,
                      maxLines: 5,
                      decoration: commonInputDecoration('Enter About'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter about';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: _isLoading ? null : _pickImage,
                      icon: const Icon(Icons.image),
                      label: const Text('Select Logo'),
                    ),
                    const SizedBox(height: 20),
                    _buildImagePreview(),
                    const SizedBox(height: 20),
                    _buildSectionHeader("Media Links"),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _webLink,
                      decoration: commonInputDecoration('Paste Website Link'),
                      keyboardType: TextInputType.url,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _fbLink,
                      decoration: commonInputDecoration('Paste Facebook Link'),
                      keyboardType: TextInputType.url,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _instaLink,
                      decoration: commonInputDecoration('Paste Instagram Link'),
                      keyboardType: TextInputType.url,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _googleLink,
                      decoration:
                          commonInputDecoration('Paste Google Profile Link'),
                      keyboardType: TextInputType.url,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _handleSubmit,
                        child: _isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              )
                            : const Text('Create'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
