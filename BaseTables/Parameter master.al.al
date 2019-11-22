table 50120 "Parameter Master"
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;"Code"; code[10])
        {
            DataClassification = ToBeClassified;
            
        }
        field(2; Description; Text[50])
        {
            DataClassification = ToBeClassified;
            //FieldPropertyName = FieldPropertyValue;
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