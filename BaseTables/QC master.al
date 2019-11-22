table 50123 "QC Master"

{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Item No."; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item;

        }
        field(2; "Parameter code"; code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Parameter Master";
        }
        field(3; "Test Method"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Test Method";

        }
        field(4; specification; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Parameter description"; Text[50])
        {
            //DataClassification=ToBeClassified;
            FieldClass = FlowField;
            CalcFormula = Lookup ("Parameter Master".Description WHERE(Code = FIELD("Parameter code")));
        }
        field(6; "Test Method Description"; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup ("Test Method".Description where(Code = Field("Test Method")));
        }

    }

    keys
    {
        key(pk; "Item No.")
        {
            Clustered = true;
        }
        /*
        key(sec1;"Parameter code")
        {
            Clustered=false;
        }
        key(sec2;"Test Method")
        {
            Clustered=false;
        }
        */
    }

    var
        ItemRec: Record 27;

    trigger OnInsert()
    begin
        ItemRec.GET("Item No.");
        ItemRec.TestField("Quality Certified");
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