import 'package:flutter/material.dart';
import 'package:flutter_onboarding_with_scopedmodel/assets/strings/strings.dart';
import 'package:flutter_onboarding_with_scopedmodel/helper/input_validators.dart';
import 'package:flutter_onboarding_with_scopedmodel/model/input_validation_model.dart';
import 'package:scoped_model/scoped_model.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  
  final _formHintTextStyle = const TextStyle(
    fontSize: 16, 
    color: Colors.blueGrey, 
    fontWeight: FontWeight.bold,
  );
  final _formInputTextStyle = const TextStyle(
    fontSize: 18, 
    color: Colors.black87, 
    fontWeight: FontWeight.bold,
  );
  final _forgotPasswordTextStyle = const TextStyle(
    fontSize: 14,
    color: Colors.lightBlueAccent,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
  );
  final _signupQuestionTextStyle = const TextStyle(
    color: Colors.blueGrey,
    fontSize: 14, 
  );

  final _signupButtonTextStyle = const TextStyle(
    fontSize: 14,
    color: Colors.blueAccent,
    fontWeight: FontWeight.bold
  );

  @override
  Widget build(BuildContext context) {
    return ScopedModel<InputValidationModel>(
      model: InputValidationModel(),
      child: _buildLoginPage(),
    );
  }

  Widget _buildLoginPage() {
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            physics: PageScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: (viewportConstraints.maxHeight),
              ),
              child: SafeArea(
                minimum: EdgeInsets.only(top: 70.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Build the Title Text
                          Container(
                            height: 60,
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(Strings.loginTitle1, style: Theme.of(context).textTheme.display2),
                          ),
                          Container(
                            height: 60,
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Text(Strings.loginTitle2, style: Theme.of(context).textTheme.display2),
                          ),
                          // Build the Form and Login Button
                          Container(
                            height: 410.0,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              children: <Widget>[
                                _buildFormUI(context),
                                const SizedBox(height: 15.0),
                                Container(
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.only(top: 15.0, right: 9.0),
                                  child: InkWell(
                                    child: Text(Strings.forgotPasswordButtonText, style: _forgotPasswordTextStyle)
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                _buildLoginButton(context),
                                const SizedBox(height: 10.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(Strings.signupQuestion, style: _signupQuestionTextStyle),
                                    InkWell(
                                      onTap: (){Navigator.of(context).pushNamed('/signup');},
                                      child: Text(Strings.signupButtonText, style: _signupButtonTextStyle)
                                    ),
                                  ]
                                )
                              ],
                            )  
                          ),
                        ],
                      ),
                    ),
                  ]
                ),
              )
            )
          ); 
        }
      )
    );
  }

  Widget _buildFormUI(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidate: ScopedModel.of<InputValidationModel>(context).validationSetting,
      child: Column(
        children: <Widget>[
          _buildEmailField(),
          const SizedBox(height: 10.0),
          _buildPasswordField(),            
        ],
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      validator: InputValidators.validateEmail,
      onSaved: (value) => _email = value,
      style: _formInputTextStyle,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: Strings.emailFieldLabel,
        labelStyle: _formHintTextStyle,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueGrey,
            width: 1.0,
          ) 
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.lightBlueAccent,
            width: 2.0,
          ) 
        )
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      style: _formInputTextStyle,
      validator: InputValidators.validatePassword,
      onSaved: (value) => _password = value,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: Strings.passwordFieldLabel,
        labelStyle: _formHintTextStyle,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueGrey,
            width: 1.0,
          ) 
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.lightBlueAccent,
            width: 2.0,
          )
        )
      ),
      obscureText: true,
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return Container(
      child: Material(
        borderRadius: BorderRadius.circular(45),
        shadowColor: Colors.lightBlueAccent,
        color: Colors.blueAccent,
        elevation: 2,
        child: ButtonTheme(
          height: 45.0,
          minWidth: 450.0,
          child: FlatButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // If the form is valid, redirect to home.
                Navigator.of(context).pushNamed('/home');
              } else {
                ScopedModel.of<InputValidationModel>(context, rebuildOnChange: false).changeValidationOption();
              }
            },
            child: Text(Strings.loginButtonText, style: Theme.of(context).textTheme.button),
          ),
        ),
      ),
    );
  } 
  
}