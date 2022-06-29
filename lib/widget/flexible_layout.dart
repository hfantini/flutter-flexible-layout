import 'package:flutter/material.dart';
import 'package:flutter_flexible_layout/structures/enumerations/width_classification.dart';

class FlexibleLayout extends StatefulWidget
{
    final Map<WidthClassification, Widget> children;
    final List<WidthClassification> widthClassificationList = 
    [
        WidthClassification.XS,
        WidthClassification.SM,
        WidthClassification.MD,
        WidthClassification.LG,
        WidthClassification.XL,
        WidthClassification.XXL,
        WidthClassification.XXXL
    ];

    FlexibleLayout({Key? key, required this.children}) : super(key: key)
    {
        if ( children.isEmpty )
        {
            throw Exception("Children must have at last one element.");
        }
    }

    @override
    State<StatefulWidget> createState() 
	{
        return FlexibleLayoutState();
    }
}

class FlexibleLayoutState extends State<FlexibleLayout>
{
    Widget getWidgetBasedOnClassification(WidthClassification classification)
    {
        if(widget.children.length == 1)
        {
            return widget.children.values.elementAt(0);
        }
        else
        {
            if( widget.children.containsKey(classification) )
            {
                return widget.children[classification]!;
            }
            else
            {
                Widget? retValue;
                int index = widget.widthClassificationList.indexOf(classification);

                // SEARCHES FOR SUITABLE WIDGET IN DESCENDING WAY

                for(var count = (index - 1) ; count >= 0 ; count--)
                {
                    WidthClassification prevClassification = widget.widthClassificationList[count];

                    if( widget.children.containsKey(prevClassification) )
                    {
                        retValue = widget.children[prevClassification]!;
                        break;
                    }
                }

                if(retValue == null)
                {
                    // SEARCHES FOR SUITABLE WIDGET IN ASCENDING WAY

                    for(var count = (index + 1) ; count < widget.widthClassificationList.length ; count--)
                    {
                        WidthClassification nextClassification = widget.widthClassificationList[count];

                        if( widget.children.containsKey(nextClassification) )
                        {
                            retValue = widget.children[nextClassification]!;
                            break;
                        }
                    }
                }

                retValue ??= const Text("NOT FOUND");
                return retValue;
            }
        }
    }

	@override
	Widget build(BuildContext context) 
	{
        return OrientationBuilder
        (
            builder: (context, orientation)
            {
                return LayoutBuilder
                (
                    builder: (context, constraints)
                    {
                        WidthClassification deviceWidthClassification = WidthClassificationHelper.getClassificationByValue(constraints.maxWidth);                  

                        print("DEVICE CLASSIFICATION: $deviceWidthClassification");
                        return getWidgetBasedOnClassification(deviceWidthClassification); // create function here to adapt to the parent widget's constraints
                    },
                );
            }
        );
	}
}