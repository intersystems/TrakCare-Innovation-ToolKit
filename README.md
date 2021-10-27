# TrakCare Innovation ToolKit

## Prerequisites 

	1-Docker & Docker Compose (This needed if you will use Docker Option ) .
	2-TrakCare T2019+  .
	3-Health Care Messaging Framework (HMF) installed and Running .
	4-Good knowledge about IRIS for Health and FHIR .
	
** Innovation toolkit works with Intel CPU only  . 
	
## Install with Docker 

docker-compose up --build

** check the end of the guide if you want to install without docker 

## How to Configure

Go to Innovation Toolkit Home Page\
https://localhost/csp/healthshare/trakitkit/TCITK.UI.Home.cls 

Login : SuperUser/password

Goto FHIR Configurations Page \
https://localhost/csp/healthshare/trakitkit/TCITK.UI.Welcome.cls

* you will need to have a valid access to health care message framework servers so you can do this step , you can contact ISC team to check if your servers support health care messaging framwork 

Click on HMF Conigure HMF Web services , add all details required (below a sample config you can follow same ) and save \
Click on Configure TrakCare API Access , enter TrakCare API user and save 

all done !!!!

## HMF Configurations

you will need to have Healthcare Medssaging Framework (HMF) and TrakCare API to use the toolkit , below is just dummy sample , you need to enter valid details so the toolkit can acccess trakcare and work as expected 

Sample HMF Configuration \
	Protocol			: HTTP \
	Server Name(full server dns)	: 172.27.97.15 \
	Port 	(IRIS SMP web port )	: 57772 \
	Web App  (HMF Web App Location)	: /csp/healthshare/trak-hmf/services/ \
	IRIS User Name 			: superuser \
	IRIS User Password		: ********	


## TrakCareC API Configurations

Sample API User  (trakcare user got api enabled in user settings) \
	TrakCare User Name 	: isc \
	TrakCare User Password	: ***** 




## How to Use

Go to Innovation Toolkit Home Page\
https://localhost/csp/healthshare/trakitkit/TCITK.UI.Home.cls 

To test the smart on FHIR app 
https://localhost/csp/healthshare/trakitkit/TCITK.UI.SmartOnFHirApps.cls

To run FHIR Query and FHIR read use 
https://localhost/csp/healthshare/trakitkit/TCITK.UI.SmartOnFHirAppsTest.cls

To try the API demo 
https://localhost/csp/healthshare/trakitkit/TCITK.UI.TCAPITest.cls


## SMP Access

To access SMP page 
https://localhost/csp/sys/%25CSP.Portal.Home.zen
Login : SuperUser/password


## Install without Docker

*you will need to have IRIS for Health 2020.2+ and valid license \
**you will need to enabled HTTPS in your server so Oauth2 and smart apps can work 

    1- login in terminal 

    2- run zn "hslib" 
    
    3- run do ##class(HS.HC.Util.Installer).InstallFoundation("TRAKITKIT") // add landing namespace 

    4- run zn "TRAKITKIT"   // goto the new namespace 

    5- run w $system.OBJ.ImportDir("C:\source\","*.cls;*.inc;*.mac;*.xml","cubk",.errors,1) // import teh code 

    6- run do ##class(TC.hmf.FHIR.Installer.FHIR).InstallDemo("C:\source\") // add DSTU2 & R4 

## FAQ

## Contact US

send email to eslam.farahat@intersystems.com or use https://client.intersystems.com/home 


## Credit 

https://github.com/grongierisc/IRIS-Oauth2-Server-Client 
Built By Guillaume Rongier guillaume.rongier@intersystems.com


