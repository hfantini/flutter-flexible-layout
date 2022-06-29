import 'package:flutter/material.dart';
import 'package:flutter_flexible_layout/widget/flexible_element.dart';
import 'package:flutter_flexible_layout/widget/flexible_layout.dart';

import '../../structures/enumerations/width_classification.dart';

class Home extends StatelessWidget
{
  	const Home({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) 
	{
		return Scaffold
		(
			body: SafeArea
			(
				child: FlexibleLayout
				(
					 children: const 
					 {
						WidthClassification.XS: FlexibleElement(text: "XS"),
						//WidthClassification.SM: FlexibleElement(text: "SM"),
						//WidthClassification.MD: FlexibleElement(text: "MD"),
						WidthClassification.LG: FlexibleElement(text: "LG"),
						//WidthClassification.XL: FlexibleElement(text: "XL"),
						//WidthClassification.XXL: FlexibleElement(text: "XXL"),
						WidthClassification.XXXL: FlexibleElement(text: "XXXL"),
					 }
				)
			)
		);
	}
}