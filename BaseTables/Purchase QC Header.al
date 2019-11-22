table 50124 "Purchase QC Header"
{
    DataClassification = ToBeClassified;
    LookupPageId = 50122;

    fields
    {
        field(1; "GRN No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purch. Rcpt. Line";
            trigger OnValidate()

            begin
                Message('hello1');
                TestField("QC Tested Lines", 0);
                Message('hello2');
                PurchRecptHeader.Get("GRN No.");
                Message('hello3');
                varGRNNo := PurchRecptHeader."No.";
                Message('hello4');
                "Vendor No." := PurchRecptHeader."Buy-from Vendor No.";
                Message('hello5');
                "Vendor Name" := PurchRecptHeader."Buy-from Vendor Name";
                Message('hello6');
                "Location Code" := PurchRecptHeader."Location Code";
                Message('hello7');
                "Posting Date" := PurchRecptHeader."Posting Date";
                Message('hello8');
                "Vendor Shipment No." := PurchRecptHeader."Vendor Shipment No.";
                Message('hello9');
                "QC Creation Date" := WORKDATE;
                Message('hello10');


                PurchRecptLine.RESET;
                Message('hello11');
                //PurchRecptLine.SETRANGE(PurchRecptLine."Document No.","GRN No.");
                PurchRecptLine.SETRANGE(PurchRecptLine."Document No.", varGRNNo);
                Message('hello12');
                PurchRecptLine.SETRANGE(PurchRecptLine.Type, PurchRecptLine.Type::Item);
                Message('hello13');
                PurchRecptLine.SETFILTER(PurchRecptLine.Quantity, '>0', 0);
                Message('hello14');
                PurchRecptLine.SETRANGE(PurchRecptLine."QC Needed", TRUE);
                Message('hello15');
                PurchRecptLine.SETRANGE(PurchRecptLine."QC Tested", FALSE);
                Message('hello16');
                IF PurchRecptLine.FINDSET THEN BEGIN
                    Message('hello17');
                    REPEAT
                        Message('hello18');
                        PurchaseQCLine.INIT;
                        PurchaseQCLine."QC Test Certification NO." := "QC Test Certificate No.";
                        PurchaseQCLine."GRN No." := "GRN No.";
                        PurchaseQCLine."Line No. " := PurchRecptLine."Line No.";
                        PurchaseQCLine."Item No." := PurchRecptLine."No.";
                        PurchaseQCLine.Description := PurchRecptLine.Description;
                        PurchaseQCLine.Quantity := PurchRecptLine.Quantity;
                        PurchaseQCLine."QC Accepted Quantity" := PurchRecptLine.Quantity;
                        PurchaseQCLine."Location Code" := PurchRecptLine."Location Code";
                        PurchaseQCLine.INSERT;
                    UNTIL PurchRecptLine.NEXT = 0;
                END
                ELSE
                    ERROR('There are no QC result to be tested');
            end;


        }

        field(2; "Vendor No."; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purch. Rcpt. Line"."Buy-from Vendor No." WHERE("Document No." = FIELD("GRN No."));
            Editable = false;

        }
        field(3; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(4; "QC Creation Date"; Date)
        {

        }
        field(5; "Vendor Name"; Text[50])
        {
            Editable = false;
        }
        field(6; "No. of Lines"; Integer)
        {

            FieldClass = FlowField;
            CalcFormula = Count ("Purch. Rcpt. Line" WHERE("QC Needed" = FILTER(true),
            "Document No." = FIELD("GRN No."),
            Quantity = FILTER(> 0)));
            Editable = false;
        }
        field(7; "QC Tested Lines"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count ("Purch. Rcpt. Line" WHERE("QC Tested" = FILTER(true),
            "Document No." = FIELD("GRN No.")));
            Editable = false;
        }
        field(8; "QC Test Certificate No."; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            BEGIN
                IF "QC Test Certificate No." <> xRec."QC Test Certificate No." THEN BEGIN
                    InventorySetup.GET;
                    NoSeriesMgt.TestManual(InventorySetup."QC Test Certification No.");
                    "No. Series" := '';
                END;
            END;
        }
        field(9; "Location Code"; Code[10])
        {
            TableRelation = location;
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(10; "No. Series"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Status"; Option)
        {
            OptionMembers = Open,Finished;
            Editable = false;
        }
        field(12; "Vendor Shipment No."; text[20])
        {
            DataClassification = TobeClassified;
        }


    }

    keys
    {
        key(PK; "QC Test Certificate No.")
        {
            Clustered = true;
        }
        key(sec1; "Vendor No.")
        {
            Clustered = false;
        }
        key(sec2; "GRN No.")
        {
            Clustered = false;
        }
        key(sec3; "Posting Date")
        {
            Clustered = false;
        }
    }

    var
        InventorySetup: Record "Inventory Setup";
        PurchRecptLine: Record "Purch. Rcpt. Line";
        PurchRecptHeader: Record "Purch. Rcpt. Header";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        PurchaseQCHeader: Record "Purchase QC Header";
        PurchaseQCLine: Record "Purchase QC Line";
        varGRNNo: Code[20];

    procedure AssistEdit(OldPurchaseQCHeader: Record "Purchase QC Header"): Boolean
    var
        myInt: Integer;
    begin
        WITH OldPurchaseQCHeader DO BEGIN
            PurchaseQCHeader := Rec;
            InventorySetup.GET;
            InventorySetup.TESTFIELD("QC Test Certification No.");
            IF NoSeriesMgt.SelectSeries(InventorySetup."QC Test Certification No.", OldPurchaseQCHeader."No. Series", "No. Series") THEN BEGIN
                NoSeriesMgt.SetSeries("QC Test Certificate No.");
                Rec := OldPurchaseQCHeader;
                EXIT(TRUE);
            END;
        END;
    end;









    trigger OnInsert()
    BEGIN
        InventorySetup.Get;
        InventorySetup.TestField(InventorySetup."QC Test Certification No.");
        NoSeriesMgt.InitSeries(InventorySetup."QC Test Certification No.", xRec."No. Series", TODAY, "QC Test Certificate No.", "No. Series");
        //exit(true)
    END;

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