# NITI_Hack_Aug_2018

Dwell time is the time a cargo container has to sit idle on the port.
In the port, the cargo containers are stacked in a storage area. The containers are placed one top of the other containers because of limited space.
A Rehandle happens when a cargo container is moved because a container placed below it has to be loaded on the ship.
The purpose of this project is to reduce the total number of rehandles by estimating the dwell time of each container and placing them appropriately in order to reduce their individual rehandles.

Model was built for outbound containers for export at JNPT port

Methodology:
There are two data sets:
1. Train arrival and unloading data of containers from Railways
2. Container Outgoing data for export from JNPT.

Using the above dataset a Naive Bayes model was built to predict the dwell time of an incoming containers. The independent variables are Size, weight of the container, status of the container (Full or Empty), source of origin. Etc.

Assumptions were made about the layout of the storage space of the containers.
A simulation was done based on the arrival and outgoing times of the containers in the month of June.
The dwell time was predicted for each containers using the above model.
First the containers were placed stacked in the storage area in the same order that they arrived without considering the dwell time. Every time a container had to be taken out of the storage, the number of containers above the container were counted as rehandles. In this way, the total number of rehandles for the month were counted.
Then the containers were segregated based on the predicted dwell time. The containers with shorter predicted dwell time were put in a smaller stack and the ones with longer predicted dwell time were put in a larger stack. The rehandles were counted in the same way as before.

The number of rehandles after using the segregation strategy was 8% lower than the unsegregated method. With further improvement in the dwell time prediction model and better segregation strategy, rehandles can be reduced further. This will reduce the cost of operation.




Team - Aditi Tiwari, Apoorva Singh, Karthick Raja, Soham, Anurag.
