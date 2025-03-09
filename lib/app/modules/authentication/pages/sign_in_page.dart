import 'package:example_financy/app/modules/authentication/_export_authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../core/_export_core.dart';

class SigInPage extends StatefulWidget {
  const SigInPage({super.key});

  @override
  State<SigInPage> createState() => _SigInPageState();
}

class _SigInPageState extends State<SigInPage> with ValidationMixin {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final AuthenticationStoreState _authenticationStoreState;
  late final AuthenticationStoreAction _authenticationStoreAction;

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
    List<TextInputFormatter>? formatters,
    FormFieldValidator? validator,
    String? helperText,
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
          inputFormatters: formatters,
          validator: validator,
          helperText: helperText,
        ),
      );

  Widget _form() => Form(
        key: _formKey,
        child: Column(
          children: [
            _textFormField(
              controller: _emailController,
              labelText: "Email",
              hintText: "teste@gmail.com.br",
              textInputType: TextInputType.emailAddress,
              validator: (value) => validationList([
                () => isNotEmpty(value),
                () => isEmailValid(value),
              ]),
            ),
            _textFormField(
              controller: _passwordController,
              labelText: "Your password",
              isPassword: true,
              // helperText: _helperText,
              validator: (value) => validationList(
                [
                  () => isNotEmpty(value),
                  () => isPasswordValid(
                        value,
                        "",
                        // _helperText,
                      ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: _text(
                title: "Forgot Password?",
              ),
            ),
            ButtonComponent(
              text: "Sign In",
              onTap: () => _validate(context),
            )
          ],
        ),
      );

  @override
  void initState() {
    super.initState();
    _authenticationStoreState = Modular.get<AuthenticationStoreState>();
    _authenticationStoreAction = Modular.get<AuthenticationStoreAction>();
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                title: "Welcome Back",
                textStyle: AppTextStyleConstant.onBoardingTextStyle,
              ),
              Image.asset(AssetConstant.signInImage),
              _form(),
              RichTextComponent(
                textStyle: AppTextStyleConstant.smallText.copyWith(
                  color: AppColorConstant.greyColor,
                ),
                textStyleAction: AppTextStyleConstant.smallText.copyWith(),
                text: "Don't have account? ",
                textAction: "Sign Up",
                onTap: () => Modular.to.pushReplacementNamed("signUp"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _validate(context) async {
    if (_formKey.currentState!.validate()) {
      await _authenticationStoreAction.signIn(
        email: _emailController.text,
        password: _passwordController.text,
      );
    }
    // else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       backgroundColor: Colors.red,
    //       content: Text("ERROR FORM"),
    //     ),
    //   );
    //   debugPrint("ERROR FORM");
    // }
  }
}
