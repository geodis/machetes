================
EC2:
================

EC2: Renting virtual machines
EBS: Storing data on virtual drives
ELB: Distribuiting load across machines
ASG: Scaling the services using an auto-scaling group


1. Debo seleccionar el AMI: Amazon Machine Image
---
	SO que va a correr en el EC2. En el examen usar AMI: Amazon Linux 2 AMI


2. Debo seleccionar el tipo de hardware
---
subnet: Significa en que AZ quiero que este

3. Storage: EBS Volume
---

4. Tags: Key/Value: 
---
	Usados para identificar y clasificar la instancia.
	Name: My first EC2

5: Security Groups:
---
Regulate:
 - access to ports
 - authorised ip ranges (ipv4/6)
 - control inbound/outbound network

Good to Know:
 - Can be attached to multiple instances
 - Locked down to a region / VPC combination
 - Live outside the EC2
   
Tips:
 - If your app is not accessible (timeout) --> security group issue
 - if your app gives a connection refused --> its app error
 - default: all inbound traffic block, outbound: allow

Reference SG from other SG: Common pattern para LB
---
Es una forma de taggear EC2 instances attacheandoles un SG y definiendo
un SG que permita el trafico inbound de las instancias que tengan attacheando
un SG definido. Entonces no baso las reglas de firewall en ips. Y asi las 
instancias EC2 se pueden comunicar entre ellas

ElasticIP
---
 - Cuando paro y arranco una EC2, cambia su ip publica
 - Si necesito una ip fija para una instancia entonces necesito ElasticIP

 Overall try to avoid using ElasticIP
  - They often reflect poor architectural decisions
  - Instead use a random public IP and register a DNS name to it
  

UserData
--------

Run a script in bootstrap. One time at first start
Run as root

