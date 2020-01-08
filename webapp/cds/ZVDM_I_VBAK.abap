@AbapCatalog.sqlViewName: 'ZVDM_VIEW_VBAK'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sales header data ( Basic View , Fact table)'
@VDM.viewType: #BASIC
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: true
@ObjectModel.representativeKey: [ 'SalesDocument' ]
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #B
@ObjectModel.usageType.sizeCategory: #L
define view ZVDM_I_VBAK as select from vbak {

    //Key
  key vbeln as SalesDocument,
      
      //Category
      vbak.vbtyp                                           as SDDocumentCategory,
      vbak.auart                                           as SalesDocumentType,
      
      // Created By , Date and Time
      vbak.ernam                                           as CreatedByUser,
      vbak.erdat                                           as CreationDate,
      cast( vbak.erzet as creation_time preserving type )  as CreationTime,
      
      //Organization
      vbak.vkorg                                           as SalesOrganization,
      vbak.vtweg                                           as DistributionChannel,
      vbak.spart                                           as OrganizationDivision,
      vbak.vkgrp                                           as SalesGroup,
      vbak.vkbur                                           as SalesOffice,
      
      //Sales Customer
      vbak.kunnr                                           as SoldToParty,
      
      //Amount
      vbak.netwr                                           as TotalNetAmount,
      vbak.waerk                                           as TransactionCurrency, 
       
      vbak.vdatu                                           as RequestedDeliveryDate, 
      vbak.vsbed                                           as ShippingCondition,
      vbak.autlf                                           as CompleteDeliveryIsDefined,
      vbak.lifsk                                           as DeliveryBlockReason,
      //Reference
      vbak.vgbel                                           as ReferenceSDDocument,
      vbak.vgtyp                                           as ReferenceSDDocumentCategory,
      
      //Status
      vbak.gbstk                                           as OverallSDProcessStatus,
      vbak.abstk                                           as OverallSDDocumentRejectionSts
          
}
