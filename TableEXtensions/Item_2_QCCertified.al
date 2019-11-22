tableextension 50120 "Quality_Certified_Ext" extends Item
{
    fields
    {
        field(50000; "Self Certified"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Quality Certified"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
    var
        myInt: Integer;
}