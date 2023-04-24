# TrakCare Innovation ToolKit

## Walkthrough Video

https://client.intersystems.com/viewdocument/enabling-innovation


## Prerequisites

	1-Docker & Docker Compose (This needed if you will use Docker Option ) .
	2-TrakCare T2020+
	3-IRIS For Health 2021+ .
	4-Health Care Messaging Framework (HMF) installed and Running .
	5-Good knowledge about IRIS for Health and FHIR .

* Innovation toolkit can be installed without docker , check the end of the guide if you want to install without docker

## Install with Docker

docker-compose up --build




## How to Configure

Go to

Innovation Toolkit HTTPS Home Page\
https://localhost/csp/healthshare/trakitkit/TCITK.UI.Home.cls

Or

Innovation Toolkit HTTP Home Page (use if you have issues with self signed certificate )\
http://localhost:52773/csp/healthshare/trakitkit/TCITK.UI.Home.cls

Login : SuperUser/password

Goto FHIR Configurations Page \
https://localhost/csp/healthshare/trakitkit/TCITK.UI.Welcome.cls

* you will need to have a valid access to health care message framework servers so you can do this step , you can contact ISC team to check if your servers support health care messaging framwork

Click on HMF Conigure HMF Web services , add all details required (below a sample config you can follow same ) and save \
Click on Configure TrakCare API Access , enter TrakCare API user and save

all done !!!!

## HMF Configurations

you will need to have Healthcare Messaging Framework (HMF) and TrakCare API to use the toolkit  , you need to enter valid details so the toolkit can acccess trakcare and work as expected

To configure that you will need to have the URL of one of HMF web services , as example the web service used to query HMF

http://172.27.97.15:57772/csp/healthshare/trak-hmf/services/TC.hmf.System.Service.Inbound.Query.cls

Setp 1: try access same from URL from browser and make sure you can access to make sure URL is valid , the URL will ask for IRIS user name and password once added you should get html page show invalid action , if you got that it means you have valid HMF web service URL

Step 2: enter same server name in the URL in server name inside HMF config page , make sure you use full DNS name include domain name , and if you have only IP address you can use , as per above URL it should be 172.27.97.15

Step 3: take the web path and put in HMF IRIS web app text field , as in above example it should be /csp/healthshare/trak-hmf/services/ , make sure you have start and end forward slash

setp 4: put the port you have in the URL in the port field , in above example it's 57772

setp 5: put the IRIS user name and password you used in step 1 , this a must so HMF accpt the web service call and send a response


Sample HMF Configuration \
	Protocol			: HTTP \
	Server Name(full server dns)	: 172.27.97.15 \
	Port 	(IRIS SMP web port )	: 57772 \
	Web App  (HMF Web App Location)	: /csp/healthshare/trak-hmf/services/ \
	IRIS User Name 			: superuser \
	IRIS User Password		: ********



<img src="https://github.com/intersystems/TrakCare-Innovation-ToolKit/blob/main/images/HMFConfig.png" alt="drawing" style="width:700px;height:400px"/>

## TrakCare API Configurations

You will need API User  (trakcare user got api enabled in user settings) \

Sample API Configuration \
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


## System Managment Portal Access

To access SMP page
https://localhost/csp/sys/%25CSP.Portal.Home.zen
Login : SuperUser/password


## Install without Docker

* you will need to have IRIS for Health 2020.2+ and valid license \
** you will need to enabled HTTPS in your server so Oauth2 and smart apps can work
*** make HSLIB database writable by mounting it as read-write.

    1- login in terminal

    2- run zn "hslib"

    3- run do ##class(HS.HC.Util.Installer).InstallFoundation("TRAKITKIT") // add landing namespace

    4- run zn "TRAKITKIT"   // goto the new namespace

    5- run w $system.OBJ.ImportDir("C:\source\","*.cls;*.inc;*.mac;*.xml","cubk",.errors,1) // import teh code

    6- run do ##class(TC.hmf.FHIR.Installer.FHIR).InstallDemo("C:\source\") // add DSTU2 & R4



## Share TrakCare Innovation ToolKit

<img src="https://github.com/intersystems/TrakCare-Innovation-ToolKit/blob/main/images/repo-qr-code.png" alt="drawing" style="width:200px;height:200px"/>

## Contact US

send email to eslam.farahat@intersystems.com or use https://client.intersystems.com/home


## Credit


Innovation Toolkit project docker built on top of

https://github.com/grongierisc/IRIS-Oauth2-Server-Client
Built By Guillaume Rongier guillaume.rongier@intersystems.com
