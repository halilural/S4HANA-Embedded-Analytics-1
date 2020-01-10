# S4HANA-Embedded-Analytics-1
S4HANA embedded analytics using cds virtual data model

<b>Prerequisite</b>
  * Basic CDS Knowledge
  * CDS Annotations
  * CDS Associations
  * Sap Web Ide usage
  * Sap Odata Service Activation (using <b>/n/iwfnd/maint_service</b>)
  
This working is designed for VDM (Virtual Data Model) explanation in CDS View.

There is a Sap Fiori List report and CDS View in Project.

For trying to do this, You need a Sap S4HANA server and Sap WebIde Full Stack.

You can create CDS Views with Eclipse ADT and create a Sap Fiori List Report Application wtih Sap Web IDE Full Stack.

Below images is showed for understanding the Cds and Vdm.

<b>1.Interface Views</b>
  * Basic View (Core Entity Views, Text View and Hierarchy Views) are built directly on top of DDIC tables or views and hence interact with database tables for fetching data. In short, if you are selecting data directly from a database table, you create Basic Views.
  
  * Composite View  are built on top of one or more Basic Views. Multiple basic views can be joined and calculation done (using expressions and functions) to make a composite view. Composite views can either be consumption specific or re-usable.
  
<b>2.Consumption Views</b>

  * Consumption Views are built on top of Composite Views and hence do not interact either with Basic Views or DDIC tables.
  
  * Consumption Views are the ones which are exposed to the front-end tools like Fiori Apps, Analysis for office, BEX Queries, SAP Analytics Cloud etc.

<a href="https://imgbb.com/"><img src="https://i.ibb.co/NmB3RZH/Screenshot-3.png" alt="Screenshot-3" border="0"></a>

I_ is for Composite & Basic Views while C_ for Consumption Views

<a href="https://ibb.co/cYZQjQG"><img src="https://i.ibb.co/y4Zqrqw/Screenshot-4.png" alt="Screenshot-4" border="0"></a>

Some commonly used Annotations in VDM

* @VDM.viewType: # BASIC , COMPOSITE,CONSUMPTION
* @Analytics.DataCategory: #DIMENSION , FACT,CUBE
* @Analytics.Query: # TRUE,FALSE
* @Analytics.dataExtraction.enabled: #TRUE, FALSE
* @ObjectModel.dataCategory: #TEXT, HIERARCHY
* @Odata.Publish: TRUE

For clearly understanding, you need to research CDS and VDM in Sap blog.

Activate odata service which is created in Odata Service using <b>@OData.publish: true annotations</b>

Let’s see, how we activate the OData Service.

Open the t-code /n/iwfnd/maint_service and press the Add Service button. 

<a href="https://ibb.co/CJ9vknB"><img src="https://i.ibb.co/LQg6LCS/Screenshot-5.png" alt="Screenshot-5" border="0"></a>

In the Add Selected Services screen provide a System Alias, and then press the Get Services button.  The Technical Service Name field, ZVDM_C_SALES, can be provided to filter the results if necessary. 

<a href="https://ibb.co/61nfSnh"><img src="https://i.ibb.co/ww0xq0H/Screenshot-6.png" alt="Screenshot-6" border="0"></a>

Selecting the service should result in the Add Service dialog appearing.  Here you can assign it a package and choose the enter button to complete the process.

<a href="https://ibb.co/QKKKKYz"><img src="https://i.ibb.co/z4444Pj/Screenshot-7.png" alt="Screenshot-7" border="0"></a>

The above steps would activate the OData Service and Add it to the Service Catalog. Once it is in the Service Catalog, it is ready to be consumed in the WebIDE while developing Fiori Apps.

If you go back to /N/IWFND/MAINT_SERVICE t-code, you should see your OData Service in the Service Catalog.

<a href="https://ibb.co/zGgjJ9b"><img src="https://i.ibb.co/72D84MV/Screenshot-8.png" alt="Screenshot-8" border="0"></a>

Choose your OData and click on SAP Gateway Client (or go to t-code /N/IWFND/GW_CLIENT) to test your OData Service. If it returns status code 200, you are all set. Your OData is working correctly.

<a href="https://ibb.co/19WZPyv"><img src="https://i.ibb.co/sFYjNxm/Screenshot-9.png" alt="Screenshot-9" border="0"></a>
<a href="https://ibb.co/QkdB9xW"><img src="https://i.ibb.co/DYpX4jB/Screenshot-10.png" alt="Screenshot-10" border="0"></a>
<a href="https://ibb.co/GJzs8Fg"><img src="https://i.ibb.co/YWHD1bv/Screenshot-11.png" alt="Screenshot-11" border="0"></a>

<b>Fiori Apps using List Report Template</b>

Create Fiori App from Standard Template using SAP WebIDE Full-Stack. This SAP WebIDE Full-Stack will open from SAP Cloud Platform Cockpit.

We connected Cloud Connector and SAP Cloud Platform Cockpit.

Once you are in the WebIDE, select Project from Template in the SAP WebIDE Full-Stack and select the List Report Application.

<a href="https://ibb.co/XSmsv3K"><img src="https://i.ibb.co/m6QqMX2/Screenshot-12.png" alt="Screenshot-12" border="0"></a>
<a href="https://ibb.co/WxQ8DDf"><img src="https://i.ibb.co/TvZjKKt/Screenshot-13.png" alt="Screenshot-13" border="0"></a>

Select the SAP Backend System and OData Service and click on finish button.

<a href="https://ibb.co/cXTDGF1"><img src="https://i.ibb.co/fG04hp2/Screenshot-14.png" alt="Screenshot-14" border="0"></a>
<a href="https://ibb.co/rKB16wf"><img src="https://i.ibb.co/7x36W1N/Screenshot-15.png" alt="Screenshot-15" border="0"></a>

Once, finished, you may Deploy the App to your ABAP repository. You need to do this step, only if you are planning to move your App to your next SAP environment say Quality and then to Production using Transport. For testing, you may skip this step.

<a href="https://ibb.co/h9ZzzC9"><img src="https://i.ibb.co/3dMZZkd/Screenshot-16.png" alt="Screenshot-16" border="0"></a>

Select SAP System and give application name and description. Select the transport request and confirm it so your application is deployed to the backend SAP System.

Now, let’s test our App.

Click on Run-> Run as Web Application

<a href="https://ibb.co/yhCqTqx"><img src="https://i.ibb.co/GsDRwRr/Screenshot-17.png" alt="Screenshot-17" border="0"></a>

Select the flpSandbox.html file

<a href="https://ibb.co/t8HJzFd"><img src="https://i.ibb.co/gzrRdhn/Screenshot-18.png" alt="Screenshot-18" border="0"></a>

Our Fiori App is ready. Click on our app (ZSALES_REPORT).

<a href="https://ibb.co/ky3D1yz"><img src="https://i.ibb.co/g7vWV7Q/Screenshot-19.png" alt="Screenshot-19" border="0"></a>

It will show a blank output.

<a href="https://ibb.co/BNdXXZN"><img src="https://i.ibb.co/sHk00wH/Screenshot-20.png" alt="Screenshot-20" border="0"></a>

You need to click on Go button to see the report.

<a href="https://ibb.co/2t0xCpL"><img src="https://i.ibb.co/pz6cMks/Screenshot-21.png" alt="Screenshot-21" border="0"></a>

Fiori App  display will change based on the Semantics annotations, UI Annotations, Text Annotations.

<a href="https://ibb.co/TqS30kJ"><img src="https://i.ibb.co/7N5mpXB/Screenshot-22.png" alt="Screenshot-22" border="0"></a>
<a href="https://ibb.co/tMzy17y"><img src="https://i.ibb.co/fY9mThm/Screenshot-23.png" alt="Screenshot-23" border="0"></a>


I hope I've been useful.
Thank you for reading.


