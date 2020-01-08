@AbapCatalog.sqlViewName: 'ZVDM_VIEW_VBAP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Item data( Basic View , Fact table)'
@VDM.viewType: #BASIC
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: true
@ObjectModel.representativeKey: [ 'SalesDocument']
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #B
@ObjectModel.usageType.sizeCategory: #XL
define view ZVDM_I_VBAP
  as select from vbap
  association[1..1]  to ZVDM_I_VBAK                    as _vbak         on  $projection.SalesDocument     = _vbak.SalesDocument
  
{
  key vbap.vbeln                                                   as  SalesDocument,
  key vbap.posnr                                                   as  SalesDocumentItem,
      vbap.matnr                                                   as  Material,
      
      vbap.arktx                                                   as  SalesDocumentItemText,
      vbap.posex                                                   as  UnderlyingPurchaseOrderItem,
    
      vbap.kwmeng                                                  as  OrderQuantity,
      vbap.vrkme                                                   as  OrderQuantityUnit,
     
      vbap.zmeng                                                   as  TargetQuantity,
      vbap.zieme                                                   as  TargetQuantityUnit,
     
      //Pricing
      vbap.netwr                                                   as  NetAmount,
      vbap.waerk                                                   as  TransactionCurrency,
      vbap.netpr                                                   as  NetPriceAmount,
      
      //Shipping 
      vbap.vstel                                                   as  ShippingPoint,
      vbap.werks                                                   as  Plant,
      vbap.lgort                                                   as  StorageLocation,
      vbap.route                                                   as  Route,
      
      //Reference Dosument
      vbap.vbelv                                                   as  OriginSDDocument,
      vbap.posnv                                                   as  OriginSDDocumentItem,
      vbap.vgbel                                                   as  ReferenceSDDocument,
      vbap.vgpos                                                   as  ReferenceSDDocumentItem,
      vbap.vgtyp                                                   as  ReferenceSDDocumentCategory,
      vbap.uepos                                                   as  HigherLevelItem,
      
      //Status
      vbap.gbsta                                                   as  SDProcessStatus,
      vbap.absta                                                   as  SDDocumentRejectionStatus,
  
  //Make Association
    _vbak
}

