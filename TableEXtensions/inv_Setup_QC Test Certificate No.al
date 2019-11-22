tableextension 50122 "QC Test Certificate No. Ext." extends 313
{
    fields
    {
        field(50000; "QC Test Certification No."; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "No. Series"; code[20])
        {
            DataClassification = ToBeClassified;
        }

    }

    var
        myInt: Integer;
}