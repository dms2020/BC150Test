page 50122 "QC Master Page"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "QC Master";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Item No."; "Item No.")
                {
                    ApplicationArea = All;

                }
                field("Parameter Code"; "Parameter Code")
                {
                    ApplicationArea = all;

                }
                field("Test Method"; "Test Method")
                {
                    ApplicationArea = all;
                }
                field(Specification;Specification)
                {
                    ApplicationArea = all;
                }
                field("Parameter description";"Parameter description")
                {
                    ApplicationArea=all;
                }
                field("Test Method Description";"Test Method Description")
                {
                    ApplicationArea=all;
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