page 50124 "QC Line Subpage"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Purchase QC Line";

    layout
    {
        area(Content)
        {
            group("repeater")
            {
                field("GRN No."; "GRN No.")
                {
                    ApplicationArea = All;

                }
                field("Line No."; "Line No. ")
                {
                    ApplicationArea = all;
                }
                field("Item no."; "Item No.")
                {
                    ApplicationArea = all;
                }
                field("QC Test Certification No."; "QC Test Certification NO.")
                {
                    ApplicationArea = all;
                }
                field("Location Code"; "Location Code")
                {
                    ApplicationArea = all;
                }
                field(Description; Description)
                {
                    ApplicationArea = all;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = all;
                }
                field("QC Accepted Quantity"; "QC Accepted Quantity")
                {
                    ApplicationArea = all;
                }
                field("QC Rejected Quantity"; "QC Rejected Quantity")
                {
                    ApplicationArea = all;
                }
                field("QC testing Done"; "QC testing Done")
                {
                    ApplicationArea = all;
                }
                field(Remark; Remark)
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Test QC")
            {
                ApplicationArea = All;


                trigger OnAction()
                begin
                    ShowQC();
                end;
            }
        }
    }

    var
        myInt: Integer;
}