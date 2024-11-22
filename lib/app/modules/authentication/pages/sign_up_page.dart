import 'package:example_financy/app/modules/authentication/_export_authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../core/_export_core.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with ValidationMixin {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  final String _helperText =
      "Must have at least 8 characters, 1 capital letter and 1 number";
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
              controller: _nameController,
              labelText: "Your name",
              hintText: "JOHN DOE",
              textInputType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
              formatters: [UpperCaseTextFormatted()],
              validator: (value) => validationList([
                () => isNotEmpty(value),
                () => validateName(value),
                // () => hasNumber(value),
              ]),
            ),
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
              helperText: _helperText,
              validator: (value) => validationList(
                [
                  () => isNotEmpty(value),
                  () => isPasswordValid(
                        value,
                        _helperText,
                      ),
                ],
              ),
            ),
            _textFormField(
              controller: _confirmPasswordController,
              labelText: "Confirm your password",
              isPassword: true,
              validator: (value) => validationList(
                [
                  () => isNotEmpty(value),
                  () => validateConfirmPassword(value, _passwordController.text)
                ],
              ),
            ),
            Observer(
              builder: (context) {
                if (_authenticationStoreState.isLoading) {
                  return const CircularProgressIndicator();
                }
                return ButtonComponent(
                  text: "Sign Up",
                  onTap: () async {
                    await _validate(context);
                  },
                );
              },
            ),
            RichTextComponent(
              textStyle: AppTextStyleConstant.smallText.copyWith(
                color: AppColorConstant.greyColor,
              ),
              textStyleAction: AppTextStyleConstant.smallText.copyWith(),
              text: "Already have account? ",
              textAction: "Sign in",
              onTap: () => Modular.to.pushNamed("signIn"),
            ),
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
    _authenticationStoreState = Modular.get<AuthenticationStoreState>();
    _authenticationStoreAction = Modular.get<AuthenticationStoreAction>();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                textStyle: AppTextStyleConstant.onBoardingTextStyle,
              ),
              _text(
                title: "Save More",
                textStyle: AppTextStyleConstant.onBoardingTextStyle,
              ),
              Image.asset("assets/images/sign_up.png"),
              _form(),
              _padding(top: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _validate(context) async {
    if (_formKey.currentState!.validate()) {
      await _authenticationStoreAction.signUp(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      );
      debugPrint("USER IS NULL: ${_authenticationStoreState.userModel}");
      //     .then((onValue) {
      //   if (onValue) {
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       const SnackBar(
      //         content: Text("Sucesso ao se logar"),
      //       ),
      //     );
      //   }
      // });
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
