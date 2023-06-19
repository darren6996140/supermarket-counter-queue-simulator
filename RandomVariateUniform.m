function [ITRandNum, STRandNum, ItemNum] = RandomVariateUniform(customerNum)
        
    % formula for linear congruential generator
    % X(i)= a + (b-a)*R(i) 
    
    LowerBound = 1;
    UpperBound = 100; 
    amountofRandNum = customerNum;

    %Inter-arrival Time 
    
    ITRandSeedValues = rand(amountofRandNum-1,1); %random seed value
    ITRandNum = floor(LowerBound + (UpperBound-LowerBound).*ITRandSeedValues)+1; %to get random numbers for inter-arrival time     
    
    disp('Random number for inter-arrival time: ')
    printf('%d\t', ITRandNum) %to print the random numbers
    printf('\n\n')
    
    
    %Service Time
    
    STRandSeedValues = rand(amountofRandNum,1); %random seed value
    STRandNum = floor(LowerBound + (UpperBound-LowerBound).*STRandSeedValues)+1; %to get random numbers for service time
    
    disp('Random number for service time: ')
    printf('%d\t', STRandNum) %to print the random numbers
    printf('\n\n')
    
    
    %ItemNum Values
    
    LowerBoundItem = 1;
    UpperBoundItem = 50; 
    
    ItemRandSeedValues = rand(amountofRandNum,1); %random seed value
    ItemNum = floor(LowerBoundItem + (UpperBoundItem-LowerBoundItem).*ItemRandSeedValues)+1; %to get random numbers for temperature values
    
    disp('Random number of items acquired: ')
    printf('%d\t', ItemNum) %to print the random numbers
    printf('\n\n')
   
    end  