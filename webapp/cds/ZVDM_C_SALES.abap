@AbapCatalog.sqlViewName: 'ZVDM_V_SALES'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption(Sales Information)'
@VDM.viewType: #CONSUMPTION
@OData.publish: true
@Search.searchable: true
define view ZVDM_C_SALES 
//with parameters 
//@EndUserText.label: 'Sales Orgnization'
//@Consumption.defaultValue: 'US01'
//p_salesorg: vkorg
  as select from ZVDM_CO_SALES
 {
    //ZVDM_CO_SALES
    @EndUserText.label: 'Sales Order Number'
    @EndUserText.quickInfo: 'Sales Order NO'
    @UI.lineItem: [{position:10 ,importance: #HIGH}]
    @UI.selectionField: [{position: 10}]
    @ObjectModel.foreignKey.association: '_VBAK'
    @Search.defaultSearchElement: true
    key SalesDocument,
    
    @EndUserText.label: 'Sales Order Item Number'
    @EndUserText.quickInfo: 'Sales Order Item NO'
    @UI.lineItem: [{position:20 }]
    key SalesDocumentItem,
    
    @EndUserText.label: 'Follow On Document'
    @EndUserText.quickInfo: 'Delivery Document'
    @UI.lineItem: [{position:30, importance: #HIGH}]
    Status,
    
    @EndUserText.label: 'Material Number'
    @EndUserText.quickInfo: 'Material NO'
    @UI.lineItem: [{position: 30}]
    materialNumber,
    
    @EndUserText.label: 'Material Dec'
    @EndUserText.quickInfo: 'Material Descrption'
    @UI.lineItem: [{position: 40}]
    MaterialDescrption,
    
    @EndUserText.label: 'Sales Orgnization'
    @EndUserText.quickInfo: 'Sales Org'
    @UI.lineItem: [{position: 50}]
    SalesOrganization   as SalesOrganization,

    @EndUserText.label: 'Sales Doc Type'
    @UI.lineItem: [{position: 60}]
    _vbak.SalesDocumentType as SalesDocType,
    
    @UI.lineItem: [{position: 70}]
    _vbak.DistributionChannel                                       as DChannel,
    
    @UI.hidden: true
    SalesDocumentItemText,
    
    @UI.hidden: true
    UnderlyingPurchaseOrderItem,
    
    @UI.lineItem: [{position: 80}]
    DeliveryDocument,
    
    @UI.lineItem: [{position: 90}]
    DeliveryDocumentItem,
  
    @UI.lineItem: [{position: 110}]
    @Semantics.unitOfMeasure: true
    OrderQuantityUnit,
    
    @UI.lineItem: [{position: 130}]
    @Semantics.unitOfMeasure: true
    TargetQuantityUnit,
    
    @UI.lineItem: [{position: 150}]
    @Semantics.currencyCode: true
    TransactionCurrency,
    
    NetPriceAmount,
    ShippingPoint,
    Plant,
    StorageLocation,
    Route,
    OriginSDDocument,
    OriginSDDocumentItem,
    ReferenceSDDocumentCategory,
    HigherLevelItem,
    SDProcessStatus,
    SDDocumentRejectionStatus,
    DeliveryDocumentItemCategory,
    StorageBin,
    StorageType,
    DeliveryDocumentItemText,
    DELIVERYQUNATITYUNIT,
    ActualDeliveryQuantity,
    OriginalDeliveryQuantity,
    BaseUnit,
    DeliveryStatus,
    DeliveryRelatedBillingStatus,
    SalesSDDocumentCategory,

    
    
    //Aggregations
    @Semantics.quantity.unitOfMeasure: 'ORDERQUANTITYUNIT'
    @DefaultAggregation:#SUM
    @UI.lineItem: [{position: 100}]
    OrderQuantity,
    
    @Semantics.quantity.unitOfMeasure: 'TARGETQUANTITYUNIT'
    @DefaultAggregation:#SUM     
    @UI.lineItem: [{position: 120}]
    TargetQuantity,
    
    @Semantics.amount.currencyCode: 'TRANSACTIONCURRENCY'
    @DefaultAggregation:#SUM
    @UI.lineItem: [{position: 140}]
    NetAmount,
        
    /* Associations */
    //ZVDM_CO_SALES
    _vbak,
    _LIPS,
    _Material,
    _MaterialText,
    _Partneritem
}
