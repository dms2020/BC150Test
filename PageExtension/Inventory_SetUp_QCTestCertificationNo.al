pageextension 50121 "QC Test Cert No. PageExt" extends "Inventory Setup"
{
    layout
    {
        // Add changes to page layout here
        addlast(General)
        {
            field("QC Test Certification No."; "QC Test Certification No.")
            {
                ApplicationArea = all;
                TableRelation = "No. Series";
            }
            field("No. Series"; "No. Series")
            {
                ApplicationArea = all;
            }

        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}