table 50126 "Purchase QC Test Result"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Test Certificate No."; code[20])
        {
            DataClassification = ToBeClassified;
            NotBlank = true;
            Editable = false;
        }
        field(2; "GRN No."; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purch. Rcpt. Header";
            NotBlank = true;
            Editable = false;
        }
        field(3; "Line No."; Integer)
        {
            MinValue = 10000;
            Editable = false;
            NotBlank = true;
        }
        field(4; "Item No."; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = item;
            Editable = false;
            NotBlank = true;
        }
        field(5; "Parameter Code"; code[10])
        {
            TableRelation = "Parameter Master";
            DataClassification = ToBeClassified;
            Editable = false;
            NotBlank = true;
        }
        field(6; "Test Method Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Test Method";
            Editable = false;
            NotBlank = true;
        }
        field(7; "Parameter Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Test Method Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Specification"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "Result"; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(11; "Approved"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(12; "Rejected"; Boolean)
        {
            DataClassification = ToBeClassified;
            editable = false;
        }



    }

    keys
    {
        key(PK; "Test Certificate No.")
        {
            Clustered = true;
        }
        key(sec1; "Line No.")
        {
            Clustered = false;
        }
        key(sec2; "Parameter Code")
        {
            Clustered = false;
        }
        key(sec3; "Test Method Code")
        {
            Clustered = false;
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