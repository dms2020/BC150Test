page 50123 "Purchase QC Document"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Purchase QC Header";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("QC Test Certification No."; "QC Test Certificate No.")
                {
                    ApplicationArea = All;
                    trigger OnAssistEdit()
                    begin
                        if AssistEdit(xRec) then
                            CurrPage.Update;
                    end;


                }
                field("GRN No."; "GRN No.")
                {
                    ApplicationArea = all;
                }
                field("vendor No."; "Vendor No.")
                {
                    ApplicationArea = all;
                }
                field("POsting Date"; "Posting Date")
                {
                    ApplicationArea = all;
                }
                field("QC Creation Date"; "QC Creation Date")
                {
                    ApplicationArea = all;
                }
                field("vendor Name"; "Vendor Name")
                {
                    ApplicationArea = all;
                }
                field("No. of Lines"; "No. of Lines")
                {
                    ApplicationArea = all;
                }
                field("QC tested Lines"; "QC Tested Lines")
                {
                    ApplicationArea = all;

                }
                field("Location Code"; "Location Code")
                {
                    ApplicationArea = all;
                }
                field("Vendor Shipment No."; "Vendor Shipment No.")
                {
                    ApplicationArea = all;

                }
                field(Status; Status)
                {
                    ApplicationArea = all;

                }
                field("Created By"; UserId)
                {
                    ApplicationArea = all;
                }
            }


            part(MyPart; "QC Line Subpage")
            {
                ApplicationArea = All;
                SubPageView = SORTING("QC Test Certification NO.", "Line No. ");
                SubPageLink = "GRN No." = field("GRN No.");
            }
            systempart(Links; Links)
            {
                ApplicationArea = All;
            }
            systempart(Notes; Notes)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}