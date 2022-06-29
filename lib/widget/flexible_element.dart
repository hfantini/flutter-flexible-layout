import 'package:flutter/cupertino.dart';

class FlexibleElement extends StatelessWidget
{
	final String text;

  	const FlexibleElement({Key? key, required this.text}) : super(key: key);

	@override
	Widget build(BuildContext context)
	{
		return Center
		(
			child: Text(text, style: const TextStyle(fontSize: 72)),
		);
	}
}