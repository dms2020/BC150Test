tableextension 50121 "QC Needed Ext" extends "Purch. Rcpt. Line"
{
    fields
    {
        field(50000; "QC Needed"; Boolean)
        {
            DataClassification = ToBeClassified;
            InitValue = true;
        }
        field(50001; "QC Tested"; Boolean)
        {
            DataClassification = ToBeClassified;
            InitValue = false;
        }

    }

    var
        myInt: Integer;
}