Bills
------
Se puede discriminar por mes y ver los detalles por c/servicio y region


AWS Regions: Datacenters alrededor del mundo
------------
https://aws.amazon.com/about-aws/global-infrastructure

Region: Cluster de Datacenters

Availability Zones (AZ): Usualmente 3 (2 a 6) zonas x region
Ej: eu-west-1{a,b,c}

Cada AZ es uno o mas Datacenter discreto con:
    - energia redundante
    - networking
    - conectividad
Cada AZ esta separada una de otra para estar aislada (geograficamente) de desastres
Aun asi estan conectadas entre ellas (a,b,c...)
con 
    - High bandwith, ultra-low latency network

Regional services: Servicios que son propios de c/region. EC2, si tengo una instancia en una
region, no la tengo en otra

- IAM: Es un servicio global
- Billing: Es un servicio global


================
IAM:
================

- Users, Groups, Roles

Roles: Internal usage aws resources. Es lo que le damos a maquinas
Policies: Definen que puede y no hacer (user, group, role)

Trae "managed policies" predefinidas

- One IAM User per physiscal person
- One IAM Role per Application
- IAM credentials should never be shared
- Never use ROOT IAM credentials, except for initial setup