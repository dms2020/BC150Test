table 50121 "Test Method"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Description"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}