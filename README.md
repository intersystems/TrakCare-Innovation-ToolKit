# TrakCare Innovation KIT
# Prequists 

	1-Docker
	2-Docker Compose
	3- TrakCare V2019+
## Run

docker-compose up --build

##Sample Configurations

you will need to have access to Healthcare Medssaging Framework (HMF) and TrakCare API to use the toolkit 

Sample HMF Configuration \
	Protocol	: HTTP \
	Server 		: 172.27.97.15 \
	Port 		: 57772 \
	Web App 	: /csp/healthshare/trak-hmf/services/ \
	User 		: superuser \
	Password	: ********	\
Sample API User :
	User Name 	: isc\
	Password	: *****\

## How to configure

Go to Innovation Toolkit Home Page\
https://localhost/csp/healthshare/trakitkit/TCITK.UI.Home.cls \
Login : SuperUser/password

Goto FHIR Configurations Page 

https://localhost/csp/healthshare/trakitkit/TCITK.UI.Welcome.cls

Click on HMF Conigure HMF Web services , add all details required and save 
Click on Configure TrakCare API Access , enter TrakCare API user and save 

all done !!!!






## Advanced

To access SMP page 
https://localhost/csp/sys/%25CSP.Portal.Home.zen
Login : SuperUser/password


