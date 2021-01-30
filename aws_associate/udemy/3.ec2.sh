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



EC2 Instance Launch Types
-----

- On demand: short workload, predictable price
----
	* Pay for what you use (billing per second after the first minute)
	* highest cost
	* no long term commitment
	* recommended for short-term and un-interrupted workloads

- Reserved: (minimun 1 year)
----
	* up to 75% discount compared to On-demand
	* pay upfront -> long term commitment
	* reservation period can be 1 o 3 years
	* reserve a specific instance Type
	* ej: Database
	- Reserved instances: long workloads
	--------------------
	- convertible Reserved instances: long workloads with flexible instances( puedo modificar el hard)
	---------------------------------
		* can change the EC2 instance Type
		* up to 54% discount compared to On-demand
	- scheduled Reserved instances: ej; every thursday between 3 and 6pm
	------------------------------

- Spot instances: short workloads, cheap, you can lose instances (less reliable)
----
	* discount up to 90%. We define a max_spot_price that we will pay, and get the instance while current_spot_price < max_spot_price
	* yo can lose the instance at any time if your max price is less than the current spot price (2 minutes grace period to stop or terminate) 
	  It is your resposability to terminate the instance.
	* useful for workloads that are resilient to faulure:
		- batch jobs
		- data analysis
		- image processing
	- Spot Block: "block" spot instance during a time frame (1 to 6 hours) without interruptions.
		* in rare situations the instance may be reclaimed

	- Spot Fleets: set of Spot instances + (optional) On-demand instances. 
		Spot Fleets allow us to automatically request Spot Instances with the lowest price
		* will try to meet the target capacity with price constraints
		* you define possible launch pools: instance type, OS, AZ
		* the fleet can choose the better of the above
		* spot fleet stops launching instances when reaching capacity or max cost
	
		- Strategies to allocate Spot Instances: 
			- lowestPrice: The Spot Fleet will launch from the pool with the lowest price
			- diversified: the spot instances will be  distribuited across all the pools you defined.
			  Great for availability and long workloads. If one pool goes away, the other still active.
			- capacityOptimized: pool with the optiml capacity for the number of instances

- Dedicated Instances: no other customers will share your hardware
----
	* Instances running on hardware thats dedicated to you
	* May share hard with other instances in same account
	* No control over instance placement, you can move hard after stop/start

- Dedicated Hosts: book an entire physical server
----
	* physical dedicated EC2 server for your use
	* full control of EC2 instance placement
	* visibility into the underlying sockets / physical cores of the hardware
	* 3 year period reservation
	* more expensive
	* Useful for soft that have complicated licensing model (BYOL - Bring Your Own Licence). 
	Some licence build based on the number of cores or sockets
	* Or for companies that have strong regulatory or compliance needs


Instance Types
--------------

R: applications that needs a lot of RAM – in-memory caches
C: applications that needs good CPU – compute / databases
M: applications that are balanced (think “medium”) – general / web app
I: applications that need good local I/O (instance storage) – databases
G: applications that need a GPU – video rendering / machine learning

• T2 / T3: burstable instances (up to a capacity). Good performance for a burst, for a short while,
but if you over abuse that burst you loose your burst and capacity
• T2 / T3 - unlimited: unlimited burst
• Real-world tip: use https://www.ec2instances.info

Burstable Instances (T2/T3)
---------------------------

• AWS has the concept of burstable instances (T2/T3 machines)
• Burst means that overall, the instance has OK CPU performance.
• When the machine needs to process something unexpected (a spike in load for example), it can burst, and CPU can be VERY good.
• If the machine bursts, it utilizes “burst credits”
• If all the credits are gone, the CPU becomes BAD
• If the machine stops bursting, credits are accumulated over time

• Burstable instances can be amazing to handle unexpected traffic and getting the insurance that it will be handled correctly
• If your instance consistently runs low on credit, you need to move to a different kind of non-burstable instance (C or M)
-- En cloudwatch se puede ver el "Credit Usage" y "Credit Balance" (se deben monitorear)

CPU Credits --> cuadro comparativo pagina 55


================
AMI:
================

AWS comes with base images such as:
• Ubuntu
• Fedora
• RedHat
• Windows

• These images can be customised at runtime using EC2 User data
• But what if we could create our own image, ready to go? --> • That’s an AMI – an image to use to create our instances
															  • AMIs can be built for Linux or Windows machines

• AMI are built for a specific AWS region (!)

Using Public AMIs
--- 
You can leverage AMIs from other people
• You can also pay for other people’s AMI by the hour
Warning:
• Do not use an AMI you don’t trust!
• Some AMIs might come with malware or may not be secure for your enterprise


AMI Storage
--- 

They live in Amazon S3, but you won’t see them in the S3 console
By default, your AMIs are private, and locked for your account / region
You can also make your AMIs public and share them with other AWS
accounts or sell them on the AMI Marketplace

Cross Account AMI Copy (FAQ + Exam Tip)
--------------------------------------
You can share an AMI with another AWS account.
• Sharing an AMI does not affect the ownership of the AMI.
• If you copy an AMI that has been shared with your account, you are the owner of the target AMI in
your account.
• To copy an AMI that was shared with you from another account, the owner of the source AMI must
grant you read permissions for the storage that backs the AMI, either the associated EBS snapshot
(for an Amazon EBS-backed AMI) or an associated S3 bucket (for an instance store-backed AMI).
• Limits:
• You can't copy an encrypted AMI that was shared with you from another account. Instead, if the
underlying snapshot and encryption key were shared with you, you can copy the snapshot while re-
encrypting it with a key of your own. You own the copied snapshot, and can register it as a new AMI.
• You can't copy an AMI with an associated billingProduct code that was shared with you from another
account. This includes Windows AMIs and AMIs from the AWS Marketplace. To copy a shared AMI
with a billingProduct code, launch an EC2 instance in your account using the shared AMI and then
create an AMI from the instance.


Placement Group (64)
---------------

los usamos cuando queremos tener mas control de como nuestras instancias EC2 se van a ubicar
en la infra de aws. No tenemos interaccion directa con el hard, pero le indicamos a AWS
como queremos que nuestra instancia sea ubicada comparada con otras.

strategies for the group:
----
	• Cluster—clusters instances into a low-latency group in a single Availability Zone. Estan en el mismo hardware
		- Pros: Great network (10 Gbps bandwidth between instances)
		- Cons: If the rack fails, all instances fails at the same time
		- Use case:
			- Big Data job that needs to complete fast
			- Application that needs extremely low latency and high network throughput

	• Spread—spreads instances across underlying hardware (max 7 instances per
	group per AZ)
		- Pros: 
			- Can span across Availability Zones (AZ)
			- Reduced risk is simultaneous failure
			- EC2 Instances are on different physical hardware
		- Cons:
			- Limited to 7 instances per AZ per placement group 
		- Use case:
			- Application that needs to maximize high availability
			- Critical Applications where each instance must be isolated from failure from each other


	• Partition—spreads instances across many different partitions (which rely on
	different sets of racks) within an AZ. Scales to 100s of EC2 instances per group
	(Hadoop, Cassandra, Kafka)

		• Up to 7 partitions per AZ
		• Up to 100s of EC2 instances
		• The instances in a partition do not share racks with the instances in the other partitions
		• A partition failure can affect many EC2 but won’t affect other partitions
		• EC2 instances get access to the partition information as metadata 
		• Use cases: HDFS, HBase, Cassandra, Kafka


================
ENI: (67)
================

• Logical component in a VPC that represents a
virtual network card
• The ENI can have the following attributes:
	- Primary private IPv4, one or more secondary IPv4
	- One Elastic IP (IPv4) per private IPv4
	- One Public IPv4
	- One or more security groups
	- A MAC address
• You can create ENI independently and attach them on the fly (move them) on EC2 instances for failover
• Bound to a specific availability zone (AZ)


Puedo mover una eni atthached a una EC2 a otra EC2 lo que significa que la ip asociada a esa ENI pasa
a la nueva EC2. Sirve para propositos  de failover.



==================
EC2 Hibernate (68)
==================

Lo normal de hibernacion. La RAM se guarda enn EBS encriptada.

• Supported instance families - C3, C4, C5, M3, M4, M5, R3, R4, and R5.
• Instance RAM size - must be less than 150 GB.
• Instance size - not supported for bare metal instances.
• AMI: Amazon Linux 2, Linux AMI, Ubuntu & Windows...
• Root Volume: must be EBS, encrypted, not instance store, and large. Se guarda en el Root volume, con lo cual debe quedar
espacio libre suficiente para el dump de la RAM
• Available for On-Demand and Reserved Instances
• An instance cannot be hibernated more than 60 days


Resumen para el examen:
-----------------------

• EC2 instances are billed by the second, t2.micro is free tier
• On Linux / Mac we use SSH, on Windows we use Putty
• SSH is on port 22, lock down the security group to your IP
• Timeout issues => Security groups issues
• Permission issues on the SSH key => run “chmod 0400”
• Security Groups can reference other Security Groups instead of IP
ranges (very popular exam question)
• Know the difference between Private, Public and Elastic IP
• You can customize an EC2 instance at boot time using EC2 User Data

• Know the 4 EC2 launch modes:
	• On demand
	• Reserved
	• Spot instances
	• Dedicated Hosts
• Know the basic instance types: R,C,M,I,G, T2/T3
• You can create AMIs to pre-install software on your EC2 => faster boot
• AMI can be copied across regions and accounts
• EC2 instances can be started in placement groups:
	• Cluster
	• Spread