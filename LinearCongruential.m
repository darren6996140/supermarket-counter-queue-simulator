function [ITRandNum, STRandNum, ItemNum] = LinearCongruential(customerNum) 

     % formula for linear congruential generator
     % X(i)=(a*X(i-1)+c) mod m
   
     amountofRandNum = customerNum;
     a = 17; 
     c = 43; 
     m = 211; 
     UpperBound = 100;
     

     
     %Inter-arrival Time------------------------------- 
     
     ITRandNum(1) = round(rand(1,1)*(UpperBound - 1)) + 1; %seed

     for i = 2:amountofRandNum-1
         ITRandNum(i) = mod(a*ITRandNum(i-1)+c,m); 
         ITRandNum(i) = round((ITRandNum(i)/m)*(UpperBound - 1)) + 1; % Normalize, convert to integer
     end
     
     disp('Random number for inter-arrival time: ')
     disp(ITRandNum)
     fprintf('\n') 
     
     
     
     
     
     %Service Time-------------------------------------

     STRandNum(1) = round(rand(1,1)*(UpperBound - 1)) + 1; %seed

     for i = 2:amountofRandNum
         STRandNum(i) = mod(a*STRandNum(i-1)+c,m); 
         STRandNum(i) = round((STRandNum(i)/m)*(UpperBound - 1)) + 1; % Normalize, convert to integer
     end
     
     disp('Random number for service time: ')
     disp(STRandNum) 
     fprintf('\n') 
     
       
     
     
     
     %Number of Items--------------------------------
     
     a = 5; 
     c = 7; 
     m = 97; 

     % Generate the seed using built-in random generator.
     ItemNum(1) = round(rand(1,1) * 49) + 1;

     for i = 2:amountofRandNum
         ItemNum(i) = mod((a * ItemNum(i-1) + c), m);
         % Scale the result to the desired range 1 to 50.
         ItemNum(i) = mod(ItemNum(i), 50) + 1;
     end

     disp('Random number of items acquired: ')
     fprintf('%d\t', ItemNum) 
     fprintf('\n\n')
     
end

      
    