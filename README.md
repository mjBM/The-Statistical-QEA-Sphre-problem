# The-Statistical-Quantum Evolutionary Algorithm
This project is the Statistical version of Quantum Evolutionary Algorithm (QEA) which finds a solution for "Knapsack" problem.
- Team members:
1. Majid Beheshti Mohtasham
2. Jamshid Sabet Navokh
3. Mohammad Mobasher Kashani
4. Mohammad.H Tayarani

This algorithm is employed by statitistical idea on QEA platform which improves the performance of *Basic QEA*. Generally, the statistical idea comes from point of view which says that *"update individuals, for each global migration, using the knowledge gathered from prior iterations."* Two papers published by this specific idea:
* [*"A statistical analyzing approach for Quantum Evolutionary Algorithms."* In 2011 19th Iranian Conference on Electrical Engineering, pp. 1-6. IEEE, 2011.](https://ieeexplore.ieee.org/abstract/document/5955671)
* [*"A novel initialization for quantum evolutionary algorithms based on spatial correlation in images for fractal image compression."* In Soft Computing in Industrial Applications, pp. 317-325. Springer, Berlin, Heidelberg, 2011.](https://link.springer.com/chapter/10.1007/978-3-642-20505-7_28)

The *MATLAB* codes which uploaded, are employed to make solution for *Sphere model problem*. Sphere problem is a numerical function in a certain range of numbers and the goal is finding the global minima, however it has *d local minimas* (d is the dimension of model). The following is the formal definition of the sphere model:

<img src="https://github.com/mjBM/The-Statistical-QEA-Sphre-problem/blob/master/images/sphere-model.png" width="324" height="164">

We implemented basic QEA and statistical QEA on other several problems which mentioned in related publications.

For running we need:
* Mtlab 2009 or later versions
* Windows XP,7,Vista,8,10


List of related Matlab files:
* QGA.m
* sphere_quantum.m
* sphere_fitness.m
* sphere_observe.m
* sphere_B2matrix.m
* isconvergence.m
* get_statistics.m
* compare_statistics.m
* add_info.m

Running:
- By running QGA.m function which is the main function of the algorithm the QEA begins. 
- sphere_quantum.m is the next important function of the algorithm which runs the QEA baed on the first configurations are done in the main file. In this problem there is no input file, but we can adjust the dimension of the problem in QGA.m function.
- sphere_observe.m is the function for calculating the binary individuals from probabilities. 
- sphere_fitness.m produces the fitness based on the function definition. 
- isconvergence.m checks if the probabilities of the individuals are conveged or not.
- sphere_B2matrix.m is a function which convert binary amonts of the problem to decimal amounts without loosing the shape of matrix.
- get_statistics.m collects information based on defined threshold (lambda).
- compare_statistics.m makes the statistics idea formula, based on the gathered knowledge from prior genereations.
- add_info.m adds Informations of last generations to collect the best, worst, and median individual of iteration.

Output files:
- fig.fig: shows the mean of performance after n runs during the defined iterations.
- time.txt: includes the run-time of the QEA in seconds.
- All the output file are written in *new* folder.
