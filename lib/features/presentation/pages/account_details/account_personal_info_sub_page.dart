import 'package:flutter/material.dart';
import 'package:second_app/features/presentation/components/account_details_sliver_app_bar.dart';
// import 'package:tuple/tuple.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:intl/intl.dart';

//The main dart for AccountDetailsPage is named "account_page.dart"

class AccountPersonalInfoSubPage extends StatelessWidget {
  AccountPersonalInfoSubPage({Key key}) : super(key: key);

  String _name;
  String _email;
  String _password;
  String _url;
  String _phoneNumber;

  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('🤔🤔🤔🤔   Details   🤔🤔🤔🤔'),
        // ),
        body: FormBuilder(
            key: _fbKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(15.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: Text(
                            '🤔🤔🤔 Information Details 🤔🤔🤔',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        _buildName(),
                        _buildEmail(),
                        _buildPassword(),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Confirm Password'),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Click the "Forgot Login?" button for help!';
                            }
                          },
                          onSaved: (String value) {
                            _password = value; // set the state
                          },
                        ),
                        _buildUrl(),
                        _buildPhoneNumber(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          child: Text('Save'),
                          onPressed: () {
                            if (_fbKey.currentState.validate()) {
                              print(_fbKey.currentState.value);
                              return;
                            }
                            _fbKey.currentState.save();
                            // print(_name);
                            // print(_email);
                            // print(_password);
                            // print(_url);
                            // print(_phoneNumber);
                          },
                        ),
                        RaisedButton(
                          child: Text('Reset'),
                          onPressed: () {
                            _fbKey.currentState.reset();
                            print(_fbKey.currentState.value);
                            print(_name);
                            print(_email);
                            print(_password);
                            print(_url);
                            print(_phoneNumber);
                          },
                        ),
                        RaisedButton(
                          child: Text('Forgot Login?'),
                          onPressed: () {
                            _fbKey.currentState.reset();
                            print(_fbKey.currentState.value);
                            print(_name);
                            print(_email);
                            print(_password);
                            print(_url);
                            print(_phoneNumber);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )));
  }

  _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      keyboardType: TextInputType.name,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is required';
        }
      },
      onSaved: (String value) {
        _name = value; // set the state
      },
    );
  }

  _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is required';
        }
      },
      onSaved: (String value) {
        _email = value; // set the state
      },
    );
  }

  _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Password'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Click the "Forgot Login?" button for help!';
        }
      },
      onSaved: (String value) {
        _password = value; // set the state
      },
    );
  }

  _buildUrl() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'URL'),
      keyboardType: TextInputType.url,
      validator: (String value) {
        if (value.isEmpty) {
          return 'This field is optional';
        }
      },
      onSaved: (String value) {
        _url = value; // set the state
      },
    );
  }

  _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'This field is optional';
        }
      },
      onSaved: (String value) {
        _phoneNumber = value; // set the state
      },
    );
  }
}
