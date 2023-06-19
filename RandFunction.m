function [ITRandNum, STRandNum, ItemNum] = RandFunction(customerNum)
        
    amountOfRandNum = customerNum;
    
    %Inter-arrival Time
    interarrivalRange = 100;
    ITRandNum = ceil(rand(1,amountOfRandNum-1)*interarrivalRange); %to get random numbers for inter-arrival time     
    
    disp('Random number for interval-arrival time: ')
    printf('%d\t', ITRandNum) %to print the random numbers
    printf('\n\n')
    
    
    %Service Time
    serviceRange = 100;
    STRandNum = ceil(rand(1,amountOfRandNum)*serviceRange); %to get random numbers for service time
    
    disp('Random number for service time: ')
    printf('%d\t', STRandNum) %to print the random numbers
    printf('\n\n')
 
    
    %ItemNum Values
    LowerBoundItem = 1;
    UpperBoundItem = 50; 
    
    ItemRange = UpperBoundItem-LowerBoundItem; 
    ItemNum = ceil((rand(1,amountOfRandNum)*ItemRange)+LowerBoundItem);
    
    disp('Random number of items acquired: ')
    printf('%d\t', ItemNum) %print no of items
    printf('\n\n')
    
    end 
    
