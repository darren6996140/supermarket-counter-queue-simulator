function [ITRandNum, STRandNum, ItemNum] = RandomVariateExponential(customerNum)
        
    %Interval Arrival Time ---------------------------------------------------
    ITRandSeedValues = (rand(1,customerNum));
    lambda = 0.005;

    for i=1:customerNum-1
        ln = log(1-ITRandSeedValues(i));
        ITRandNum(i)= (-1/lambda)*ln;
        
        while ITRandNum(i)>100
            ITRandNum(i)=floor(ITRandNum(i)/10);
        end
        
        if ITRandNum(i) < 1
            ITRandNum(i)=floor(ITRandNum(i)*10);
        else
            ITRandNum(i)=floor(ITRandNum(i));   
        end
                   
        if ITRandNum(i) == 0
            ITRandNum(i) = ITRandNum(i)+1;
        end
    
    end
     
    disp('Random number for inter-arrival time: ')
    printf('%d\t', ITRandNum)
    printf('\n\n')
    
    %Service Time ------------------------------------------------------------
    STRandSeedValues = (rand(1,customerNum));
    lambda = 0.005;
    
    for i=1:customerNum
        ln = log(1-STRandSeedValues(i));
        STRandNum(i)= (-1/lambda)*ln;
        
        while STRandNum(i)>100
            STRandNum(i)=floor(STRandNum(i)/10);
        end
        
        if STRandNum(i)<1
            STRandNum(i)=floor(STRandNum(i)*10) ;
        else
            STRandNum(i)=floor(STRandNum(i));   
        end
        
        if STRandNum(i)==0
           STRandNum(i)=STRandNum(i)+1;
        end
     
    end
    
    disp('Random number for service time: ')
    printf('%d\t', STRandNum)
    printf('\n\n')
    
   
    
    %ItemNum---------------------------------------------------------------
    NumRandSeedValues = (rand(1,customerNum));
    lambda = 1/50;
    
    for i=1:customerNum
        ln = log(1-NumRandSeedValues(i));
        ItemNum(i)= ceil((-1/lambda)*ln);
        
        while ItemNum(i)>50
            ItemNum(i)=floor(ItemNum(i)/3);
        end
        
        if ItemNum(i) < 1
            ItemNum(i) = 1;
        end
        
    end
    
    disp('Random number of items acquired: ')
    printf('%d\t', ItemNum)
    printf('\n\n')
    
    
    
    

    