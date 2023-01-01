import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/feature/login/login_view_model.dart';
import 'package:provider_learn/product/constants/image_constants.dart';
import 'package:kartal/kartal.dart';
import 'package:provider_learn/product/padding/page_padding.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final String name = "Name";

  final String login = "Login";

  final String rememberMe = "Remember Me";

  final String hintHello = "Hello";

  late final LoginViewModel _loginViewModel;
  @override
  void initState() {
    _loginViewModel = LoginViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _loginViewModel,
      builder: (context, child) {
        return _buildBody(context);
      },
    );
  }

  Scaffold _buildBody(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: PagePadding.allLow(),
          child: Column(
            children: [
              SizedBox(
                height: context.dynamicHeight(0.2),
                width: context.dynamicWidth(0.3),
                child: Image.asset(ImageEnums.appicon.toPath),
              ),
              Text(
                login,
                style: context.textTheme.headline3,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: hintHello,
                ),
              ),
              ElevatedButton(
                onPressed: context.watch<LoginViewModel>().isLoading
                    ? null
                    : () {
                        context.read<LoginViewModel>().controlTextValue();
                      },
                child: Center(
                  child: Text(login),
                ),
              ),
              CheckboxListTile(
                value: context.watch<LoginViewModel>().isCheckBoxOpen,
                onChanged: (value) {
                  context.read<LoginViewModel>().checkBoxChange(value ?? false);
                },
                title: Text(rememberMe),
              )
            ],
          ),
        ),
      ),
    );
  }
}
