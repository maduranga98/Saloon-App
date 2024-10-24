// import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';

// // Employee Model
// class Employee {
//   final String id;
//   final String name;
//   final String email;
//   final String role;
//   final String? profilePicture;
//   final Map<String, dynamic> additionalDetails;

//   Employee({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.role,
//     this.profilePicture,
//     this.additionalDetails = const {},
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'email': email,
//       'role': role,
//       'profilePicture': profilePicture,
//       'additionalDetails': additionalDetails,
//     };
//   }

//   factory Employee.fromJson(Map<String, dynamic> json) {
//     return Employee(
//       id: json['id'],
//       name: json['name'],
//       email: json['email'],
//       role: json['role'],
//       profilePicture: json['profilePicture'],
//       additionalDetails: json['additionalDetails'] ?? {},
//     );
//   }
// }

// // QR Generator Screen
// class EmployeeQRScreen extends StatelessWidget {
//   final Employee employee;

//   const EmployeeQRScreen({Key? key, required this.employee}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final String loginUrl = 'yourapp://login/${employee.id}';

//     return Scaffold(
//       appBar: AppBar(title: Text('Employee QR Code')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             QrImageView(
//               data: loginUrl,
//               version: QrVersions.auto,
//               size: 200.0,
//             ),
//             SizedBox(height: 20),
//             Text('Scan to access profile'),
//             Text('Employee: ${employee.name}'),
//             Text('Role: ${employee.role}'),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Registration Form
// class EmployeeRegistrationForm extends StatefulWidget {
//   @override
//   _EmployeeRegistrationFormState createState() =>
//       _EmployeeRegistrationFormState();
// }

// class _EmployeeRegistrationFormState extends State<EmployeeRegistrationForm> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   String _selectedRole = 'staff';

//   final List<String> roles = [
//     'manager',
//     'branch_manager',
//     'social_media_manager',
//     'staff'
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Add Employee')),
//       body: SingleChildScrollView(
//         // Added to prevent overflow issues
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: InputDecoration(labelText: 'Name'),
//                 validator: (value) {
//                   if (value?.isEmpty ?? true) {
//                     return 'Please enter name';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16), // Added spacing
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(labelText: 'Email'),
//                 validator: (value) {
//                   if (value?.isEmpty ?? true || !value!.contains('@')) {
//                     return 'Please enter valid email';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16), // Added spacing
//               DropdownButtonFormField<String>(
//                 value: _selectedRole,
//                 decoration: InputDecoration(labelText: 'Role'),
//                 items: roles.map((String role) {
//                   return DropdownMenuItem(
//                     value: role,
//                     child: Text(role.replaceAll('_', ' ').toUpperCase()),
//                   );
//                 }).toList(),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     _selectedRole = newValue!;
//                   });
//                 },
//               ),
//               SizedBox(height: 24), // Added spacing
//               ElevatedButton(
//                 onPressed: _submitForm,
//                 child: Text('Add Employee'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       final employee = Employee(
//         id: DateTime.now().millisecondsSinceEpoch.toString(),
//         name: _nameController.text,
//         email: _emailController.text,
//         role: _selectedRole,
//       );

//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => EmployeeQRScreen(employee: employee),
//         ),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     super.dispose();
//   }
// }

import 'package:flutter/material.dart';

class EmployeeRegistrationForm extends StatefulWidget {
  const EmployeeRegistrationForm({super.key});

  @override
  State<EmployeeRegistrationForm> createState() =>
      _EmployeeRegistrationFormState();
}

class _EmployeeRegistrationFormState extends State<EmployeeRegistrationForm> {
  final List<String> items = [
    'Manager',
    'Branch Manager',
    'Social Media Manager',
    'Staff',
    'HR',
    'IT Support',
    'Manager',
    'Branch Manager',
    'Social Media Manager',
    'Staff',
    'HR',
    'IT Support',
    'Manager',
    'Branch Manager',
    'Social Media Manager',
    'Staff',
    'HR',
    'IT Support',
  ];

  final _formKey = GlobalKey<FormState>();
  final List<String> roles = [
    'Manager',
    'Branch Manager',
    'Social Media Manager',
    'Staff',
    'HR',
    'IT Support',
  ];

  String? _selectedRole;
  String? _name;
  String? _details;

  // Function to show the dialog for adding employees
  void _showAddEmployeeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Employee'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Employee Name Text Field
                TextFormField(
                  decoration: InputDecoration(labelText: 'Employee Name'),
                  onSaved: (value) {
                    _name = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),

                // Role Selection Dropdown
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Select Role'),
                  value: _selectedRole,
                  items: roles.map((role) {
                    return DropdownMenuItem<String>(
                      value: role,
                      child: Text(role),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedRole = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a role';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),

                // Additional Details Text Field
                TextFormField(
                  decoration: InputDecoration(labelText: 'Additional Details'),
                  onSaved: (value) {
                    _details = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please provide additional details';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Add employee logic here, like sending data to backend or adding to list
                  print('Employee Name: $_name');
                  print('Role: $_selectedRole');
                  print('Details: $_details');
                  Navigator.of(context).pop(); // Close dialog after saving
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 30.0),
        child: Column(
          children: [
            Center(
              child: ElevatedButton.icon(
                onPressed: () => _showAddEmployeeDialog(context),
                label: Text("Add Employees"),
                icon: Icon(Icons.person_add_alt_1),
              ),
            ),
            Expanded(
              // Wrap the ListView with Expanded
              child: Container(
                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.all(15.0),
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        items[index],
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
