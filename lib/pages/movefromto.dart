
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:demo/pages/payment.dart';

class EnterAddressPage extends StatefulWidget {
  @override
  _EnterAddressPageState createState() => _EnterAddressPageState();
}

class _EnterAddressPageState extends State<EnterAddressPage> {
  final _formKey = GlobalKey<FormState>();

  String? _senderState;
  String? _senderCity;
  String? _senderBuildingName;
  String? _senderAreaLocality;
  String? _senderPincode;

  String? _receiverState;
  String? _receiverCity;
  String? _receiverBuildingName;
  String? _receiverAreaLocality;
  String? _receiverPincode;

  void _submitForm() {
    // var cuser = FirebaseAuth.instance.currentUser;
    // FirebaseFirestore.instance.collection('Address').doc(cuser!.uid).set({
    //   'S_State': _senderState,
    //   'S_City': _senderCity,
    //   'S_BulName': _senderBuildingName,
    //   'S_AName': _senderAreaLocality,
    //   'S_Pincode': _senderPincode,
    //   'A_State': _receiverState,
    //   'A_City': _receiverCity,
    //   'A_BulName': _receiverBuildingName,
    //   'A_AName': _receiverAreaLocality,
    //   'A_Pincode': _receiverPincode,
    // });
    final form = _formKey.currentState;
    if (form!.validate()) {
      // Do something with the form data, like saving to a database
      print('Sender State: $_senderState');
      print('Sender City: $_senderCity');
      print('Sender Building Name: $_senderBuildingName');
      print('Sender Area Locality: $_senderAreaLocality');
      print('Sender Pincode: $_senderPincode');
      print('Receiver State: $_receiverState');
      print('Receiver City: $_receiverCity');
      print('Receiver Building Name: $_receiverBuildingName');
      print('Receiver Area Locality: $_receiverAreaLocality');
      print('Receiver Pincode: $_receiverPincode');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PaymentPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(133, 198, 66, 66),
        title: Text(
          'Enter Address',
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/address.jpg"),
            opacity: 0.2,
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sender Address',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'State'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a state';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _senderState = value;
                  },
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'City'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a city';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _senderCity = value;
                  },
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Building Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a building name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _senderBuildingName = value;
                  },
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Area Locality'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an area locality';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _senderAreaLocality = value;
                  },
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Pincode'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a pincode';
                    }
                    if (value.length != 6) {
                      return 'Pincode must be 6 digits long';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _senderPincode = value;
                  },
                ),
                SizedBox(height: 16.0),
                Text(
                  'Receiver Address',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'State'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a state';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _receiverState = value;
                  },
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'City'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a city';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _receiverCity = value;
                  },
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Building Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a building name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _receiverBuildingName = value;
                  },
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Area Locality'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an area locality';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _receiverAreaLocality = value;
                  },
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Pincode'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a pincode';
                    }
                    if (value.length != 6) {
                      return 'Pincode must be 6 digits long';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _receiverPincode = value;
                  },
                ),
                SizedBox(height: 16.0),
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
