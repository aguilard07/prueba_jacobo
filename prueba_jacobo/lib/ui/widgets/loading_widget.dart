import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
	final spinkit = SpinKitCircle(
		color: Colors.cyan,
		size: 50.0,
	);

	@override
	Widget build(BuildContext context) {
    return Container(
		  	height: MediaQuery.of(context).size.height,
		  	width: MediaQuery.of(context).size.width,
			color: Colors.white,
			child: Center(
				child: spinkit,
		),

    );
  }
}