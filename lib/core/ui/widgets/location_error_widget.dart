import 'package:flutter/material.dart';

class LocationErrorWidget extends StatelessWidget {
  final String error;
  final Function callback;

  const LocationErrorWidget({Key? key, required this.error, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Icon(
            Icons.location_off,
            size: 150,
            color: Color(0xffb00020),
          ),
          const SizedBox(height: 32),
          Text(
            error,
            style: const TextStyle(color: Color(0xffb00020), fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            child: Text("Retry"),
            onPressed: () {
              if (callback != null) callback();
            },
          )
        ],
      ),
    );
  }
}
