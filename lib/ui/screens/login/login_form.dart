import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motobuy/bloc/login_bloc/login_bloc.dart';
import 'package:motobuy/ui/screens/home/home_view.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key key,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
   Size _size ;

  bool get isPopulated => _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isButtonEnabled(LoginState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onEmailChange);
    _passwordController.addListener(_onPasswordChange);
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isFailure) {
          Scaffold.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Login Failure'),
                    Icon(Icons.error),
                  ],
                ),
                backgroundColor: Color(0xffffae88),
              ),
            );
        }

        if (state.isSubmitting) {
          Scaffold.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Logging In...'),
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  ],
                ),
                backgroundColor: Color(0xffffae88),
              ),
            );
        }

        if (state.isSuccess) {
          Scaffold.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Login success'),
                    Icon(Icons.error),
                  ],
                ),
                backgroundColor: Color(0xffffae88),
              ),
            );
          debugPrint("state isSuccess");
          Future.delayed(Duration(seconds: 1),(){
            Navigator.pushReplacementNamed(
              context,
              HomeView.routeName,
            );
          });


          // BlocProvider.of<AuthenticationBloc>(context).add(
          //   AuthenticationLoggedIn(),
          // );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state.isSubmitting|| state.isSuccess) {
            return Container();
          }else {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                child: Column(

                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,),
                      width: _size.width*0.8,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: TextFormField(
                        controller: _emailController,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          labelText: "Account",
                          labelStyle: TextStyle(color: Colors.white, fontSize: 15),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.white, fontSize: 15),
                        // keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        validator: (_) {
                          return !state.isEmailValid ? 'Invalid Email' : null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,),
                      width: _size.width*0.8,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child:TextFormField(
                        controller: _passwordController,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          icon: Icon(Icons.lock,color: Colors.white,
                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.white, fontSize: 15),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.white, fontSize: 15),
                        obscureText: true,
                        autocorrect: false,
                        validator: (_) {
                          return !state.isPasswordValid ? 'Invalid Password' : null;
                        },
                      ),
                    ),

//                  TextFormField(
//                    controller: _passwordController,
//                    decoration: InputDecoration(
//                      icon: Icon(Icons.lock),
//                      labelText: "Password",
//                    ),
//                    obscureText: true,
//                    autocorrect: false,
//                    validator: (_) {
//                      return !state.isPasswordValid ? 'Invalid Password' : null;
//                    },
//                  ),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0), ),
                      color: Colors.black,
                      highlightColor: Colors.red,
                      child: Text("Login",style: TextStyle(color: Colors.white, fontSize: 15),),
                      onPressed: () {
//                      if (isButtonEnabled(state)) 判斷是否空白
                        _onFormSubmitted();
                      },
                    ),
                  ],
                ),
              ),
            );
          }

//          return Padding(
//            padding: const EdgeInsets.all(20.0),
//            child: Form(
//              child: Column(
//
//                children: <Widget>[
//                  Container(
//                    padding: EdgeInsets.symmetric(horizontal: 20,),
//                    width: _size.width*0.8,
//                    decoration: BoxDecoration(
//                      color: Colors.black,
//                      borderRadius: BorderRadius.circular(29),
//                    ),
//                    child: TextFormField(
//                      controller: _emailController,
//                      cursorColor: Colors.white,
//                      decoration: InputDecoration(
//                        icon: Icon(
//                          Icons.email,
//                          color: Colors.white,
//                        ),
//                        labelText: "Account",
//                        labelStyle: TextStyle(color: Colors.white, fontSize: 15),
//                        border: InputBorder.none,
//                      ),
//                      style: TextStyle(color: Colors.white, fontSize: 15),
//                      // keyboardType: TextInputType.emailAddress,
//                      autocorrect: false,
//                      validator: (_) {
//                        return !state.isEmailValid ? 'Invalid Email' : null;
//                      },
//                    ),
//                  ),
//                  SizedBox(
//                    height: 10,
//                  ),
//                  Container(
//                    padding: EdgeInsets.symmetric(horizontal: 20,),
//                    width: _size.width*0.8,
//                    decoration: BoxDecoration(
//                      color: Colors.black,
//                      borderRadius: BorderRadius.circular(29),
//                    ),
//                    child:TextFormField(
//                      controller: _passwordController,
//                      cursorColor: Colors.white,
//                      decoration: InputDecoration(
//                        icon: Icon(Icons.lock,color: Colors.white,
//                        ),
//                        labelText: "Password",
//                        labelStyle: TextStyle(color: Colors.white, fontSize: 15),
//                        border: InputBorder.none,
//                      ),
//                      style: TextStyle(color: Colors.white, fontSize: 15),
//                      obscureText: true,
//                      autocorrect: false,
//                      validator: (_) {
//                        return !state.isPasswordValid ? 'Invalid Password' : null;
//                      },
//                    ),
//                  ),
//
////                  TextFormField(
////                    controller: _passwordController,
////                    decoration: InputDecoration(
////                      icon: Icon(Icons.lock),
////                      labelText: "Password",
////                    ),
////                    obscureText: true,
////                    autocorrect: false,
////                    validator: (_) {
////                      return !state.isPasswordValid ? 'Invalid Password' : null;
////                    },
////                  ),
//                  SizedBox(
//                    height: 10,
//                  ),
//                  RaisedButton(
//                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(18.0), ),
//                    color: Colors.black,
//                    highlightColor: Colors.red,
//                    child: Text("Login",style: TextStyle(color: Colors.white, fontSize: 15),),
//                    onPressed: () {
////                      if (isButtonEnabled(state)) 判斷是否空白
//                      _onFormSubmitted();
//                    },
//                  ),
//                ],
//              ),
//            ),
//          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEmailChange() {
    _loginBloc.add(LoginEmailChange(email: _emailController.text));
  }

  void _onPasswordChange() {
    _loginBloc.add(LoginPasswordChanged(password: _passwordController.text));
  }

  void _onFormSubmitted() {
    _loginBloc.add(LoginWithCredentialsPressed(email: _emailController.text, password: _passwordController.text));
  }
}
