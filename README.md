# The-Statistical-Quantum Evolutionary Algorithm
This project is the Statistical version of Quantum Evolutionary Algorithm (QEA) which finds a solution for "Knapsack" problem.
- Team members:
1. Majid Beheshti Mohtasham
2. Jamshid Sabet Navokh
3. Mohammad Mobasher Kashani
4. Mohammad.H Tayarani

This algorithm is employed by statitistical idea on QEA latform which improves the performance of *Basic QEA*. Generally, the statistical idea comes from point of view which says that *"update individuals, for each global migration, using the knowledge gathered from prior iterations."* Two papers published by this specific idea:
* [*"A statistical analyzing approach for Quantum Evolutionary Algorithms."* In 2011 19th Iranian Conference on Electrical Engineering, pp. 1-6. IEEE, 2011.](https://ieeexplore.ieee.org/abstract/document/5955671)
* [*"A novel initialization for quantum evolutionary algorithms based on spatial correlation in images for fractal image compression."* In Soft Computing in Industrial Applications, pp. 317-325. Springer, Berlin, Heidelberg, 2011.](https://link.springer.com/chapter/10.1007/978-3-642-20505-7_28)

The codes which uploaded, are employed to make solution for *Sphere model problem*. Sphere problem is a numerical function in a certain range and the goal is finding the global minima, however it has *d local minimas* (d is the dimensions of model).

![fig1](/images/sphere-model.png)

For running we need:
* Mtlab 2009 or later versions
* Windows XP,7,Vista,8,10
* Inpute file which shoud be with *.txt* extension

List of related Matlab files:
* QGA.m
* Knapsack_quantum.m
* Knapsack_fitness.m
* Knapsack_observe.m
* Knapsack_repair.m
* isconvergence.m

Input files:
* 100.txt (knapsack problem with 100 items)
* 500.txt (knapsack problem with 500 items)

Running:
- By running QGA.m function which is the main function of the algorithm the QEA begins. 
- Knapsack_quantum.m is the next important function of the algorithm which runs the QEA baed on the first configurations are done in the main file. 
- Knapsack_observe.m is the function for calculating the binary individuals from probabilities. 
- Knapsack_repair.m repairs the current solution.
- Knapsack_fitness.m produce the fitness based on the selected items. 
- isconvergence.m checks if the probabilities of the individuals are conveged or not.

Output files:
- fig.fig: shows the mean of performance after n runs during the defined iterations.
- res.txt : includes the final fitness of algorithm which is the mean of n runs. 
- time.txt: includes the run-time of the QEA in seconds.
- All the output file are written in *new* folder.
