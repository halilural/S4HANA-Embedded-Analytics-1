@AbapCatalog.sqlViewName: 'ZVDM_VIEW_LIPS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Delivery Item data( Basic View , Fact table)'
@VDM.viewType: #BASIC
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: true
@ObjectModel.representativeKey: [ 'ReferenceSDDocument' ]
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #B
@ObjectModel.usageType.sizeCategory: #XL
define view ZVDM_I_LIPS 

as select from lips 
  //Associations
  association[1..1] to likp       as _likp      on $projection.DeliveryDocument    = _likp.vbeln
  
{
  //Keys  
  key vbeln                                                          as DeliveryDocument,
  key posnr                                                          as DeliveryDocumentItem,
  key vgbel                                                          as ReferenceSDDocument,
      matnr                                                          as Material,
      pstyv                                                          as DeliveryDocumentItemCategory,
      lgort                                                          as StorageLocation,
      lgpla                                                          as StorageBin,
      lgtyp                                                          as StorageType,
      
      //delivery
      arktx                                                          as DeliveryDocumentItemText,
      
      @Semantics.unitOfMeasure: true
      vrkme                                                          as DeliveryQuantityUnit,
      
      @DefaultAggregation: #SUM
      @Semantics.quantity.unitOfMeasure: 'DeliveryQuantityUnit'
      lfimg                                                           as ActualDeliveryQuantity,
      
      @DefaultAggregation: #SUM
      @Semantics.quantity.unitOfMeasure: 'DeliveryQuantityUnit'
      ormng                                                           as OriginalDeliveryQuantity,
      
      @Semantics.unitOfMeasure: true
      meins as BaseUnit,
      
      //reference  
      
      vgpos                                                           as ReferenceSDDocumentItem,
      vgtyp                                                           as ReferenceSDDocumentCategory,
      
      //Status
      gbsta                                                           as SDProcessStatus,
      fksta                                                           as DeliveryRelatedBillingStatus,
      
      // Pricing
      vbelv                                                           as OriginSDDocument,
      posnv                                                           as SDDocumentItem,
      vbtyv                                                           as SalesSDDocumentCategory,
      ematn                                                           as BaseUnit1,
      werks                                                           as DelPlant,
//      _likp.kunag                                                     as ShipToParty,
  
   // Make Associations
   _likp
    
}
