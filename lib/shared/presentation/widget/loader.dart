import 'package:flutter/material.dart';

Widget loader(context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child: const Center(
      child: CircularProgressIndicator(),
    ),
  );
}
