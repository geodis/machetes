================================
Scalability & High Availability
================================

Vertical Scalability
--------------------

• Vertically scalability means increasing the size of the instance
• For example, your application runs on a t2.micro
• Scaling that application vertically means running it on a t2.large
• vertically scale -> (hardware limit)

Horizontal Scalability
----------------------

• Horizontal Scalability means increasing the number of instances / systems for your application

High Availability
-----------------

• The goal of high availability is to survive a data center loss
• The high availability can be passive (for RDS Multi AZ for example)
• The high availability can be active (for horizontal scaling)

• Horizontal Scaling: Increase number of instances (= scale out / in)
	• Auto Scaling Group
	• Load Balancer
• High Availability: Run instances for the same application across multi AZ
	• Auto Scaling Group multi AZ
	• Load Balancer multi AZ


Types of load balancer on AWS
-----------------------------
