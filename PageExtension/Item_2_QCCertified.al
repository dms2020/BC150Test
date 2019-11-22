pageextension 50120 "Quality Certified Page Ext" extends "Item Card"
{
    layout
    {
        addafter("Lead Time Calculation")
        {
            field("Self Certified"; "Self Certified")
            {
                ApplicationArea = all;
            }

        }
        addafter("Self Certified")
        {
            field("Quality Certified"; "Quality Certified")
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {

        addafter(Item)
        {

            action("QC Details")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                Image = Start;
                PromotedIsBig = true;
                RunObject = page "QC Master Page";
                RunPageLink = "Item No." = field("No.");
                trigger OnAction()
                begin
                    Message('Opening QC Mater Page as QC Details ');
                end;

            }
        }
    }

    var
        myInt: Integer;
}