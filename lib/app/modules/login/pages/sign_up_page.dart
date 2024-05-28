import 'package:flutter/material.dart';
import '../../core/_export_core.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  Widget _text({
    required String title,
    TextStyle? textStyle,
  }) =>
      Text(
        title,
        style: textStyle,
      );

  Widget _padding({required double top}) =>
      Padding(padding: EdgeInsets.only(top: top));

  Widget _textFormField({
    required TextEditingController controller,
    required String labelText,
    TextInputType? textInputType,
    String? hintText,
    TextCapitalization? textCapitalization,
    bool isPassword = false,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14.0,
          vertical: 12.0,
        ),
        child: TextFormFieldComponent(
          controller: controller,
          labelText: labelText,
          textInputType: textInputType,
          hintText: hintText,
          textCapitalization: textCapitalization,
          isPassword: isPassword,
        ),
      );

  Widget _form() => Form(
        key: _formKey,
        child: Column(
          children: [
            _textFormField(
              controller: _nameController,
              labelText: "Your name",
              hintText: "Jonas Felipe",
              textInputType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
            ),
            _textFormField(
              controller: _emailController,
              labelText: "Email",
              hintText: "teste@gmail.com.br",
              textInputType: TextInputType.emailAddress,
            ),
            _textFormField(
              controller: _passwordController,
              labelText: "Your password",
              isPassword: true,
            ),
            _textFormField(
              controller: _confirmPasswordController,
              labelText: "Confirm your password",
              isPassword: true,
            ),
            const ButtonComponent(text: "Sign Up")
          ],
        ),
      );

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              _text(
                  title: "Spend Smarter",
                  textStyle: AppTextStyleConstant.onBoardingTextStyle),
              _text(
                  title: "Save More",
                  textStyle: AppTextStyleConstant.onBoardingTextStyle),
              Image.asset("assets/images/sign_up.png"),
              _form(),
              _padding(top: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}