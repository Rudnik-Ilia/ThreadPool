# ThreadPool
This multithreading project implements the thread pool design pattern to efficiently handle a large number of short tasks. It minimizes the overhead of thread creation and destruction, improving resource utilization and overall efficiency.

This is my project:
 
It is called “Thread Pool”. Actualy, threadpool is a  design pattern. This pattern aims to solve the problem of spending resourses while creating and destroying a large number of threads. The creation and destruction of threads is expensive....it occupies the resourses of your machine.With multiple tasks to execute, we have to create a lot of threads - it means using a lot of resouses, so creating a single thread for each resourse is a bad idea. Instead,  with the threadpool pattern, we create some amount of threads in advance...at the beginning of our program, and this is called a thread pool. And after that, we just assign our tasks to threads for execution. After execution, we return threads back into the pool. The conclusion is we don’t spend resourses on creation and destruction for each request...one allocation at the beginning of a program and one destruction at the end.

My implementation:

First of all, threadpool is a class. I provide to the user an API with several functions. To start using the threadPOOL, the user has to initialize the pool... in other words, to create an instanse of the class by invoking the CTOR from our API. At this point, the user can specify the desirable number of threads, otherwise it will be a default value. Then, the CTOR of the POOL creates the defined number of threads, and puts them into a special container for threads - THREDMAP. Each thread is represented by an instanse of a special class WORKERTHRED. Its a wrapper for each thread. (It means creation of the same number of instanses of class WORKTHREAD.) After that, each thread will be running a function GETTASK, which is trying to take and execute a task from another container - WQ. In this container the POOL stores user tasks sorted by priority. Right after its creation the WQ is empty, so  in this case all treads wait for task addition. Now let’s move to task additon.....to add a task the user should have the task itself, for this the user has to create his own class, inherited from the provided interface ITASK. It’s a special abstract class to create user tasks, it has only one pure virtual function EXECUTE, thus the user has to implement this function, which is an entrypoit for threads. After that, the user can invoke AdddTask function from our API, and put an object of his own task  class as a function parameter. In addition, the user can define the priority of a task, or it will be a default value. After that, the task will end up in the WQ container, from where it will be taken by one of the threads waiting for it. The thread executes the task and gets back to trying to get new tasks.
Also, in my implementation the user has the ability to pause the execution of all tasks by means of a Pause function. And to resume after some period of time by the Resume function. 
Besides, the user can change the number of preallocated threads without the recreation of the pool(decrease or increase)...if he wants...with the function SetNumThread . When you invoke this function, you specify the preferable nuber of threads. 

In the end, the user has a DTOR in our API, which will desroy and release all resourses locked by the POOL. It’s not  necessary to call it explicity, it will be called automatically when program is over.


TO TRY IT:
RUN MAKE FILE)
