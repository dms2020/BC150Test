page 50125 "Purchase QC test Result"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Purchase QC Test Result";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Test Certificate No."; "Test Certificate No.")
                {
                    ApplicationArea = All;

                }
                field("GRN No."; "GRN No.")
                {
                    ApplicationArea = all;
                }
                field("Line No."; "Line No.")
                {
                    ApplicationArea = all;
                }
                field("Item No."; "Item No.")
                {
                    ApplicationArea = all;
                }
                field("Parameter Code"; "Parameter Code")
                {
                    ApplicationArea = all;
                }
                field("Test Method Code"; "Test Method Code")
                {
                    ApplicationArea = all;
                }
                field("Parameter Name"; "Parameter Name")
                {
                    ApplicationArea = all;
                }
                field("Test Method Name"; "Test Method Name")
                {
                    ApplicationArea = all;
                }
                field(Specification; Specification)
                {
                    ApplicationArea = all;
                }
                field(Result; Result)
                {
                    ApplicationArea = all;
                }
                field(Approved; Approved)
                {
                    ApplicationArea = all;
                }
                field(Rejected; Rejected)
                {
                    ApplicationArea = all;
                }

            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}