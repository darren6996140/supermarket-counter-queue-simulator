function GeneratorChoice(generatorType,customerNum)
    
    fprintf('--------- Random Numbers ---------\n\n') 

    switch(generatorType) %switch case
        
      case 1                                      %the first option in the "types of random generator" menu
          [ITRandNum, STRandNum, ItemNum] = LinearCongruential(customerNum);         %to call the function which generates random number using linear congruential generator
            
      case 2                                      %the second option in the "types of random generator" menu
          [ITRandNum, STRandNum, ItemNum] = RandomVariateExponential(customerNum);  %to call the function which generates random number using random variate exponential
            
      case 3                                      %the third option in the "types of random generator" menu
          [ITRandNum, STRandNum, ItemNum] = RandomVariateUniform(customerNum);      %to call the function which generates random number using random variate uniform
            
      case 4                                      %the fourth option in the "types of random generator" menu
          [ITRandNum, STRandNum, ItemNum] = RandFunction(customerNum);              %to call the function which generates random number using rand function
            
      end
          
    
      [IT, ITLowerBoundRange, ITUpperBoundRange] = InterArrivalTimeTable(generatorType);
      [serviceTime1,serviceTime2,serviceTime3, STLowerBoundRange1,STUpperBoundRange1, STLowerBoundRange2, STUpperBoundRange2, STLowerBoundRange3, STUpperBoundRange3] = ServiceTimeTable(generatorType);
      
      printf('\n--------- Simulation Messages ---------\n\n') 
      
      QueueSimulator(customerNum, ITRandNum, IT, ITLowerBoundRange, ITUpperBoundRange, ItemNum, STRandNum, serviceTime1, serviceTime2, serviceTime3, STLowerBoundRange1,STUpperBoundRange1, STLowerBoundRange2, STUpperBoundRange2, STLowerBoundRange3, STUpperBoundRange3);
      
      
