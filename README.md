# TrakCare Innovation ToolKit

## Prerequisites 

	1-Docker
	2-Docker Compose
	3-TrakCare T2019+ and IRIS For Health 2020.2+
	4-Health Care Messaging Farmwork 
	5-good knowledge about IRIS for Health and FHIR 
	
## Install with Docker 

docker-compose up --build


## Install without Docker

*you will need to have IRIS for Health 2020.2+ and valid license \
**you will need to enabled HTTPS in your server so Oauth2 and smart apps can work 

    1- login in terminal 

    2- run zn "hslib" 
    
    3- run do ##class(HS.HC.Util.Installer).InstallFoundation("TRAKITKIT") // add landing namespace 

    4- run zn "TRAKITKIT"   // goto the new namespace 

    5- run w $system.OBJ.ImportDir("C:\source\","*.cls;*.inc;*.mac;*.xml","cubk",.errors,1) // import teh code 

    6- run do ##class(TC.hmf.FHIR.Installer.FHIR).InstallDemo("C:\source\") // add DSTU2 & R4 


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

## Sample Configurations

you will need to have Healthcare Medssaging Framework (HMF) and TrakCare API to use the toolkit , below is just dummy sample , you need to enter valid details so the toolkit can acccess trakcare and work as expected 

Sample HMF Configuration \
	Protocol	: HTTP \
	Server 		: 172.27.97.15 \
	Port 		: 57772 \
	Web App 	: /csp/healthshare/trak-hmf/services/ \
	User 		: superuser \
	Password	: ********	
	
Sample API User 
	User Name 	: isc \
	Password	: ***** 




## How to Use

Go to Innovation Toolkit Home Page\
https://localhost/csp/healthshare/trakitkit/TCITK.UI.Home.cls 

To test the smart on FHIR app 
https://localhost/csp/healthshare/trakitkit/TCITK.UI.SmartOnFHirApps.cls

To run FHIR Query and FHIR read use 
https://localhost/csp/healthshare/trakitkit/TCITK.UI.SmartOnFHirAppsTest.cls

To try the API demo 
https://localhost/csp/healthshare/trakitkit/TCITK.UI.TCAPITest.cls


## FAQ


## Advanced

To access SMP page 
https://localhost/csp/sys/%25CSP.Portal.Home.zen
Login : SuperUser/password

## Contact US

send email to eslam.farahat@intersystems.com
