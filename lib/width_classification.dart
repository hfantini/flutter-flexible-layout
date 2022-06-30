enum WidthClassification
{
    XS,
    SM,
    MD,
    LG,
    XL,
    XXL,
    XXXL;
}

class WidthClassificationHelper
{
    static WidthClassification getClassificationByValue(double value)
    {
        if(value <= 576)
        {
            return WidthClassification.XS;
        }
        else if(value > 576 && value <= 768)
        {
            return WidthClassification.SM;
        }
        else if(value > 768 && value <= 992)
        {
            return WidthClassification.MD;
        }
        else if(value > 992 && value <= 1200)
        {
            return WidthClassification.LG;
        }        
        else if(value > 1200 && value <= 1600)
        {
            return WidthClassification.XL;
        }
        else if(value > 1600 && value <= 1980)
        {
            return WidthClassification.XXL;
        }
        else
        {
            return WidthClassification.XXXL;
        }
    }
}