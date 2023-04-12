import 'dart:io';
import 'dart:async';
import 'package:crud_with_softic/src/features/authentication/view/login_screen.dart';
import 'package:crud_with_softic/src/services/domain/localstorage/hive_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> onWillPopLogout(BuildContext context) async {
  return (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 0,
            title: Center(
              child: Text('${"logout".tr}?'),
            ),
            content: Text(
              "want_to_logout".tr,
              textAlign: TextAlign.center,
            ),
            actions: [
              Column(
                children: [
                  const Divider(
                    height: 1.0,
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("cancel".tr),
                        ),
                        const VerticalDivider(
                          width: 1.0,
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                        TextButton(
                          onPressed: () async {
                            HiveConfig().dispose();
                            Get.offAll(() => const LoginScreen());
                          },
                          child: Text(
                            "logout".tr,
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      )) ??
      true;
}

Future<bool> onWillPopExit(BuildContext context) async {
  return (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 0,
            title: const Center(
              child: Text(
                "Exit !!",
              ),
            ),
            content: const Text(
              "Want to exit",
              textAlign: TextAlign.center,
            ),
            actions: [
              Column(
                children: [
                  const Divider(
                    height: 1.0,
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("No"),
                        ),
                        const VerticalDivider(
                          width: 1.0,
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                        TextButton(
                          onPressed: () {
                            exit(0);
                          },
                          child: const Text(
                            "Yes",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      )) ??
      false;
}
