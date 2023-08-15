import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DataInput extends StatefulWidget {
  const DataInput({super.key});

  _DataInputState createState() => _DataInputState();
}

class _DataInputState extends State<DataInput> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _phone = '';
  String _gender = '';
  String _country = '';
  String _state = '';
  String _city = '';
  List<String> _genders = ['Male', 'Female', 'Other'];
  List<String> _countries = ['USA', 'Canada', 'UK', 'Australia', 'India'];
  List<String> _statesData = [];
  List<String> _citiesData = [];

  List<String> getStatesForCountry(String country) {
    // Implement your logic here to fetch the states data for the selected country.
    // For simplicity, we'll return dummy data for now.
    return ['State 1', 'State 2', 'State 3', 'State 4'];
  }

  List<String> getCitiesForState(String state) {
    // Implement your logic here to fetch the cities data for the selected state.
    // For simplicity, we'll return dummy data for now.
    return ['City 1', 'City 2', 'City 3', 'City 4'];
  }

  void _submitForm() {
    _formKey.currentState!.save();

    print('Name: $_name');
    print('Email: $_email');
    print('Phone: $_phone');
    print('Gender: $_gender');
    print('Country: $_country');
    print('State: $_state');
    print('City: $_city');

    validate();

    /* if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      print('Name: $_name');
      print('Email: $_email');
      print('Phone: $_phone');
      print('Gender: $_gender');
      print('Country: $_country');
      print('State: $_state');
      print('City: $_city');
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Form')),
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      labelText: 'Name', border: OutlineInputBorder()),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      labelText: 'Email', border: OutlineInputBorder()),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an email';
                    } else if (!value!.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Phone', border: OutlineInputBorder()),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a phone number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _phone = value!;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      labelText: 'Gender', border: OutlineInputBorder()),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your gender';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _gender = value!;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      labelText: 'Country', border: OutlineInputBorder()),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your country';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _country = value!;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'State', border: OutlineInputBorder()),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your state';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _state = value!;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'City', border: OutlineInputBorder()),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your city';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _city = value!;
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    _submitForm();
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validate() {
    var name = _name;
    var email = _email;
    var phone = _phone;
    var gender = _gender;
    var country = _country;
    var state = _state;
    var city = _city;

    var msg = "";

    if (name.isEmpty) {
      msg = "Please enter name";
    } else if (msg.toString().isEmpty &&
        (name.toString().isNotEmpty && name.toString().length < 3)) {
      msg = "Please enter valid name";
    }
    if (msg.toString().isEmpty && email.toString().isEmpty) {
      msg = "Please enter email";
    } else if (msg.toString().isEmpty &&
        (email.toString().isNotEmpty && !email.toString().contains("@"))) {
      msg = "Please enter valid email";
    }
    if (msg.toString().isEmpty && phone.toString().isEmpty) {
      msg = "Please enter phone number";
    } else if (msg.toString().isEmpty &&
        (phone.toString().isNotEmpty && phone.toString().length != 10)) {
      msg = "Please enter valid phone number";
    }
    if (msg.toString().isEmpty && gender.toString().isEmpty) {
      msg = "Please enter gender";
    }
    if (msg.toString().isEmpty && country.toString().isEmpty) {
      msg = "Please enter country";
    } else if (msg.toString().isEmpty &&
        (country.toString().isNotEmpty && country.toString().length < 3)) {
      msg = "Please enter valid country";
    }
    if (msg.toString().isEmpty && state.toString().isEmpty) {
      msg = "Please enter State";
    } else if (msg.toString().isEmpty &&
        (state.toString().isNotEmpty && state.toString().length < 3)) {
      msg = "Please enter valid state";
    }
    if (msg.toString().isEmpty && city.toString().isEmpty) {
      msg = "Please enter City";
    } else if (msg.toString().isEmpty &&
        (city.toString().isNotEmpty && city.toString().length < 3)) {
      msg = "Please enter valid city";
    }

    _showToast(msg);
  }

  void _showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT, // Duration of the toast
      gravity: ToastGravity.BOTTOM, // Position of the toast
      timeInSecForIosWeb: 1, // Time for iOS/Web to show the toast
      backgroundColor: Colors.grey[600], // Background color of the toast
      textColor: Colors.white, // Text color of the toast
      fontSize: 16.0, // Font size of the toast message
    );
  }
}
