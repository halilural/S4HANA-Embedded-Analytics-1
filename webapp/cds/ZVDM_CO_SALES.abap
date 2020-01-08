@AbapCatalog.sqlViewName: 'ZVDM_VIEW_SALES'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Composite View(Composite View ,CUBE)'
@VDM.viewType: #COMPOSITE
@Analytics.dataCategory: #CUBE
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #B
@ObjectModel.usageType.sizeCategory: #XL
@Search.searchable: true
define view ZVDM_CO_SALES 

  as select from  ZVDM_I_VBAP as VBAP 
  association[0..*]  to ZVDM_I_LIPS                    as _LIPS         on  $projection.SalesDocument        = _LIPS.ReferenceSDDocument and
                                                                            $projection.SalesDocumentItem    = _LIPS.ReferenceSDDocumentItem
  association[1..1]  to I_Material                     as _Material     on  $projection.materialNumber       = _Material.Material
  association[0..*]  to I_MaterialText                 as _MaterialText on  $projection.materialNumber       = _MaterialText.Material
  association[0..*]  to I_SalesDocumentItemPartner     as _Partneritem  on  $projection.SalesDocument        = _Partneritem.SalesDocument  and
                                                                            $projection.SalesDocumentItem    = _Partneritem .SalesDocumentItem                                                
{
  //VBAP
  //@ObjectModel.foreignKey.association: '_vbak'
  @Search.defaultSearchElement: true 
  key VBAP.SalesDocument,
  
  key VBAP.SalesDocumentItem,
  
  _vbak.SalesOrganization as SalesOrganization,
  
  Material as materialNumber,
  
  @EndUserText.label: 'Material Descrption'
  @EndUserText.quickInfo: 'Material Desc'
  @Semantics.text: true
  _MaterialText[ 1:Language = $session.system_language ].MaterialName as MaterialDescrption, 
  
  
  SalesDocumentItemText,
  UnderlyingPurchaseOrderItem,
  case
       when (_LIPS.DeliveryDocument is null ) then 'No Follow ON Document Created'                                           
       else _LIPS.DeliveryDocument
       end as Status,
  _LIPS.DeliveryDocument,
  _LIPS.DeliveryDocumentItem,
  
  @Semantics.unitOfMeasure: true
  OrderQuantityUnit,
  
  @Semantics.unitOfMeasure: true
  TargetQuantityUnit,
  
  @Semantics.currencyCode: true
  TransactionCurrency,
  
  ShippingPoint,
  Plant,
  StorageLocation,
  Route,
  OriginSDDocument,
  OriginSDDocumentItem,
//  ReferenceSDDocument  as SalesDocument NU,
//  ReferenceSDDocumentItem as SalesDocumentItem,
  ReferenceSDDocumentCategory,
  HigherLevelItem,
  SDProcessStatus,
  SDDocumentRejectionStatus,

//  _LIPS.Material,
  _LIPS.DeliveryDocumentItemCategory,
//  _LIPS.StorageLocation,
  _LIPS.StorageBin,
  _LIPS.StorageType,
  _LIPS.DeliveryDocumentItemText,
   
   @Semantics.unitOfMeasure: true
  _LIPS.DeliveryQuantityUnit as DELIVERYQUNATITYUNIT,
  
  @Semantics.quantity.unitOfMeasure: 'DELIVERYQUNATITYUNIT'
  _LIPS.OriginalDeliveryQuantity,
  
  _LIPS.BaseUnit,
//  _LIPS.ReferenceSDDocument,
//  _LIPS.ReferenceSDDocumentItem,
//  _LIPS.ReferenceSDDocumentCategory,
  _LIPS.SDProcessStatus as DeliveryStatus,
  _LIPS.DeliveryRelatedBillingStatus,
//  _LIPS.OriginSDDocument,
//  _LIPS.SDDocumentItem,
  _LIPS.SalesSDDocumentCategory,
  
   //Aggregations 
   @DefaultAggregation:#SUM
   @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
   OrderQuantity,
   
   @Semantics.quantity.unitOfMeasure: 'TargetQuantityUnit'
   @DefaultAggregation:#SUM
   TargetQuantity,
   
   @Semantics.amount.currencyCode: 'TransactionCurrency'
   @DefaultAggregation:#SUM
   NetAmount,
   
   @Semantics.amount.currencyCode: 'TransactionCurrency'
   @DefaultAggregation:#SUM
   NetPriceAmount,
   
   @Semantics.quantity.unitOfMeasure: 'DELIVERYQUNATITYUNIT'
   @DefaultAggregation:#SUM
   _LIPS.ActualDeliveryQuantity,        
   
  /* Associations */
  _vbak,
  _LIPS,
  _Material,
  _MaterialText,
  _Partneritem 

}
