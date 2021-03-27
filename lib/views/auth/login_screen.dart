import 'package:flutter/material.dart';
import 'package:homewardtest/providers/auth_state.dart';
import 'package:homewardtest/utils/v_style.dart';
import 'package:homewardtest/widgets/v_text.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: VText("Homeward"),
      ),
      body: ChangeNotifierProvider<AuthState>(
        create: (_) => AuthState(context),
        child: Consumer(
          builder: (BuildContext context, AuthState state, Widget child) {
            return _body(state);
          },
        ),
      ),
    );
  }

  Widget _body(AuthState state) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: Form(
              key: state.formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: "Email"),
                    validator: (v) => v.isEmpty ? "Must not be empty" : null,
                    onSaved: (v) => state.body["email"] = v,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Password",
                      suffixIcon: IconButton(
                        icon: Icon(state.obscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () => state.toggleObscure(),
                      ),
                    ),
                    obscureText: state.obscure,
                    validator: (v) => v.isEmpty ? "Must not be empty" : null,
                    onSaved: (v) => state.body["password"] = v,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () => state.submit(),
            child: Container(
              decoration: VStyle.corner(color: Colors.blue),
              width: double.infinity,
              height: 44.0,
              alignment: Alignment.center,
              child: VText(
                "LOGIN",
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
