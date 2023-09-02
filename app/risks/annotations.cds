using RiskService from '../../srv/risk-service';

 // Risk List Report Page
 annotate RiskService.Risks with @(UI : {
    HeaderInfo : {
       TypeName : 'Risk',
       TypeNamePlural : 'Risks',
       Title : {
          $Type : 'UI.DataField',
          Value : title 
}, 
Description : {
 $Type : 'UI.DataField',
 Value : descr
 }
 },
 SelectionFields : [prio],
 Identification : [{Value : title}],
 // Define the table columns
     LineItem : [
        {Value : title},
        {Value : miti_ID},
        {Value : owner},
         {Value : bp_BusinessPartner},
        { 
            Value : prio,
            Criticality : criticitat
        },
        { 
            Value : impact,
            Criticality : criticitat
        },
    ],
 });

// Risk Object Page
 annotate RiskService.Risks with @(UI : {
    Facets : [{ 
       $Type : 'UI.ReferenceFacet',
       Label : 'Main',
       Target : '@UI.FieldGroup#Main',
    }],
    FieldGroup #Main : {Data : [
      {Value : miti_ID},
       {Value : bp_BusinessPartner},
      {Value : owner},
      {
          Value : prio, 
          Criticality : criticitat
      },
      { 
          Value : impact,
          Criticality : criticitat
      } 
   ]},
 });

annotate RiskService.Risks with {
    miti @(Common : {
    //show text, not id for mitigation in the context of risks
    Text : miti.descr,
    TextArrangement : #TextOnly, 
    ValueList : {
       Label : 'Mitigations',
       CollectionPath : 'Mitigations',
       Parameters : [
         { 
            $Type : 'Common.ValueListParameterInOut',
            LocalDataProperty : miti_ID,
            ValueListProperty : 'ID'
         },
         {
            $Type : 'Common.ValueListParameterDisplayOnly',
            ValueListProperty : 'descr'
         }
      ]
    }
  }); 
}

