import 'package:flutter/material.dart';
import 'package:food_delivery_app_restaurant/constanints.dart';

class SignUpScrean extends StatelessWidget {
  SignUpScrean({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Spacer(
            flex: 1,
          ),
          Text(
            'SignUp',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Spacer(
            flex: 1,
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.02,
            right: MediaQuery.of(context).size.width * 0.03,
            top: MediaQuery.of(context).size.height * 0.05,
            bottom: MediaQuery.of(context).size.height * 0.1,
          ),
          child: Column(
            children: [
              const Spacer(
                flex: 1,
              ),
              const Text(
                'Email',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const Spacer(
                flex: 1,
              ),
              TextFormField(
                decoration: const InputDecoration(border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter your email";
                  }
                  return null;
                },
              ),
              const Spacer(
                flex: 1,
              ),
              const Text(
                'Password',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const Spacer(
                flex: 1,
              ),
              TextFormField(
                decoration: const InputDecoration(border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter your password";
                  }
                  return null;
                },
              ),
              const Spacer(
                flex: 2,
              ),
              ElevatedButton(
                style:
                    const ButtonStyle(elevation: MaterialStatePropertyAll(15)),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, ksignInScrean);
                  } else {
                    AutovalidateMode;
                  }
                },
                child: const Text('Submit', style: TextStyle(fontSize: 25)),
              ),
              const Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
