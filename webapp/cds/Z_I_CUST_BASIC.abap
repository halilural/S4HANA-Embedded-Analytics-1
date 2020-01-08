@AbapCatalog.sqlViewName: 'Z_DDL_CUST_BASIC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@VDM.viewType: #BASIC
@EndUserText.label: 'Basic View for Customer Rejection'
define view Z_I_CUST_BASIC
  as select from    vbak
    inner join      vbap  on  vbak.vbeln = vbap.vbeln
                          and vbap.abgru != ''
    left outer join tvagt on  vbap.abgru = tvagt.abgru
                          and spras      = $session.system_language
{

      @EndUserText.label: 'Sales Document No'
  key vbak.vbeln,
      @EndUserText.label: 'Line Item No'
      vbap.posnr,
      @EndUserText.label: 'Material'
      vbap.matnr,
      @EndUserText.label: 'Description'
      vbap.arktx,
      @EndUserText.label: 'Customer number'
      vbak.kunnr,
      @EndUserText.label: 'Reason for Rejection'
      vbap.abgru,
      @EndUserText.label: 'Description'
      tvagt.bezei,
      @EndUserText.label: 'Document No Date'
      vbak.audat,
      @EndUserText.label: 'Month'
      substring(vbak.audat, 5, 2) as MON,
      @EndUserText.label: 'Year'
      substring(vbak.audat, 1, 4) as YYEAR
}
