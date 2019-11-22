table 50125 "Purchase QC Line"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "GRN No."; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purch. Rcpt. Line";
            Editable = false;
        }
        field(2; "Line No. "; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "Item No."; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item;
            Editable = false;
        }
        field(4; "QC Test Certification NO."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Location Code"; code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location;
            Editable = false;
        }
        field(6; Description; Text[50])
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(7; "Quantity"; Decimal)
        {
            Editable = false;
        }
        field(8; "QC Accepted Quantity"; Decimal)
        {
            Editable = true;
            trigger OnValidate()
            begin
                TestField("QC testing Done", false);
                "QC Rejected Quantity" := Quantity - "QC Accepted Quantity";
            end;

        }
        field(9; "QC Rejected Quantity"; Decimal)
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(10; "QC testing Done"; Boolean)
        {
            Editable = true;
            DataClassification = ToBeClassified;
        }
        field(11; "Remark"; Text[100])
        {
            DataClassification = ToBeClassified;
        }



    }

    keys
    {
        key(PK; "QC Test Certification NO.")
        {
            Clustered = true;
        }
        key(sec1; "Line No. ")
        {
            Clustered = false;
        }
    }

    var
        PurchaseQCTestResult: Record 50126;
        QCTestResutl: Record "QC Master";
        ItemRec: Record Item;

        PurchaseQCForm: page 1212;

    local procedure CreateQC()
    var
        myInt: Integer;
    begin
        IF "QC Testing Done" THEN
            EXIT;
        PurchaseQCTestResult.RESET;
        PurchaseQCTestResult.SETRANGE(PurchaseQCTestResult."Test Certificate No.", "QC Test Certification NO.");
        PurchaseQCTestResult.SETRANGE(PurchaseQCTestResult."Line No.", "Line No. ");
        IF PurchaseQCTestResult.FINDFIRST THEN
            ShowQC
        ELSE BEGIN
            ItemRec.GET("Item No.");
            ItemRec.TESTFIELD(ItemRec."Quality Certified");

            QCTestResutl.RESET;
            QCTestResutl.SETRANGE(QCTestResutl."Item No.", "Item No.");
            IF QCTestResutl.FINDSET THEN BEGIN
                REPEAT
                    QCTestResutl.CALCFIELDS(QCTestResutl."Parameter Description", QCTestResutl."Test Method Description");
                    PurchaseQCTestResult.RESET;
                    PurchaseQCTestResult.INIT;
                    PurchaseQCTestResult."Test Certificate No." := "QC Test Certification No.";
                    PurchaseQCTestResult."GRN No." := "GRN No.";
                    PurchaseQCTestResult."Line No." := "Line No. ";
                    PurchaseQCTestResult."Item No." := "Item No.";
                    PurchaseQCTestResult."Parameter Code" := QCTestResutl."Parameter Code";
                    PurchaseQCTestResult."Test Method Code" := QCTestResutl."Test Method";
                    PurchaseQCTestResult."Parameter Name" := QCTestResutl."Parameter Description";
                    PurchaseQCTestResult."Test Method Name" := QCTestResutl."Test Method Description";
                    PurchaseQCTestResult.Specification := QCTestResutl.Specification;
                    PurchaseQCTestResult.INSERT;
                UNTIL QCTestResutl.NEXT = 0;
            END
            ELSE
                ERROR('QC Specification has not been defined for the Item No. %1', "Item No.");
            ShowQC;
        end;
    end;

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

    procedure ShowQC()
    var
        myInt: Integer;
    begin
        PurchaseQCTestResult.RESET;
        PurchaseQCTestResult.SETRANGE(PurchaseQCTestResult."Test Certificate No.", "QC Test Certification NO.");
        PurchaseQCTestResult.SETRANGE(PurchaseQCTestResult."GRN No.", "GRN No.");
        PurchaseQCTestResult.SETRANGE(PurchaseQCTestResult."Line No.", "Line No. ");
        PurchaseQCForm.SETTABLEVIEW(PurchaseQCTestResult);
        PurchaseQCForm.RUN;
    end;


}