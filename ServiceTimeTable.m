function [serviceTime1, serviceTime2, serviceTime3, STLowerBoundRange1, STUpperBoundRange1, STLowerBoundRange2, STUpperBoundRange2, STLowerBoundRange3, STUpperBoundRange3] = ServiceTimeTable(generatorType)

 switch(generatorType) %switch case
        
      case 1  %the first option in the "types of random generator" menu
               
              numberofST1 = 5;
              numberofST2 = 5;
              numberofST3 = 3;
    
              ST1LowerBound = 5;
              ST1UpperBound = 9;
    
              ST2LowerBound = 4;
              ST2UpperBound = 8;
              
              ST3LowerBound = 1;
              ST3UpperBound = 3;
              
              a = 1;
              c = 1;
              mST1 = 10;
              
              serviceTime1(1) = ceil(rand(1,1))*ST1LowerBound;
              
              for i = 2:numberofST1
                  serviceTime1(i) = mod((a*serviceTime1(i-1)+c),mST1);
              end

              mST2 = 9;
              
              serviceTime2(1) = ceil(rand(1,1))*ST2LowerBound;
              
              for i = 2:numberofST2
                  serviceTime2(i) = mod((a*serviceTime2(i-1)+c),mST2);
              end
              
              mST3 = 4;
              
              serviceTime3(1) = ceil(rand(1,1))*ST3LowerBound;
              
              for i = 2:numberofST3
                  serviceTime3(i) = mod((a*serviceTime3(i-1)+c),mST3);
              end                

      case 2  %the second option in the "types of random generator" menu
          
              serviceTimeSeed = rand(1000,1);
              lambda = 1;
    
              serviceTime1 = ceil((9-5)*(-1/lambda)*log(abs(1-serviceTimeSeed))+4);
              serviceTime1 = unique(serviceTime1);
    
              serviceTime2 = ceil((8-4)*(-1/lambda)*log(abs(1-serviceTimeSeed))+3);
              serviceTime2 = unique(serviceTime2);
              
              serviceTime3 = ceil((3-1)*(-1/lambda)*log(abs(1-serviceTimeSeed))+2);
              serviceTime3 = unique(serviceTime3);
          
            
      case 3  %the third option in the "types of random generator" menu
          
              ST1LowerBoundRVU = 3;
              ST1UpperBoundRVU = 8;
    
              ST2LowerBoundRVU = 4;
              ST2UpperBoundRVU = 9;
              
              ST3LowerBoundRVU = 0;
              ST3UpperBoundRVU = 3;
              
              serviceTimeSeed = rand(1000,1); %random seed values
              
              serviceTime1 = ceil(ST1LowerBoundRVU + (ST1UpperBoundRVU-ST1LowerBoundRVU).*serviceTimeSeed);
              serviceTime1 = unique(serviceTime1);
                

              serviceTime2 = ceil(ST2LowerBoundRVU + (ST2UpperBoundRVU-ST2LowerBoundRVU).*serviceTimeSeed);
              serviceTime2 = unique(serviceTime2);
              
              serviceTime3 = ceil(ST3LowerBoundRVU + (ST3UpperBoundRVU-ST3LowerBoundRVU).*serviceTimeSeed);
              serviceTime3 = unique(serviceTime3);
                     
      case 4  %the fourth option in the "types of random generator" menu
          
              ST1LowerBoundRand = 3;
              ST1UpperBoundRand = 8;
    
              ST2LowerBoundRand = 4;
              ST2UpperBoundRand = 9;
              
              ST3LowerBoundRand = 0;
              ST3UpperBoundRand = 3;
              
              ST1Range = ST1UpperBoundRand-ST1LowerBoundRand; 
              serviceTime1 = ceil((rand(1,1000)*ST1Range)+ST1LowerBoundRand);
              serviceTime1 = unique(serviceTime1);

              ST2Range = ST2UpperBoundRand-ST2LowerBoundRand; 
              serviceTime2 = ceil((rand(1,1000)*ST2Range)+ST2LowerBoundRand);
              serviceTime2 = unique(serviceTime2);
              
              ST3Range = ST3UpperBoundRand-ST3LowerBoundRand; 
              serviceTime3 = ceil((rand(1,1000)*ST3Range)+ST3LowerBoundRand);
              serviceTime3 = unique(serviceTime3);
              
          
      end
     
      
%Service Time Table for NORMAL Counter 1 

printf('\n');
disp('Service Time Table for Normal Counter 1:');
printf('\n');

serviceTimeProbability1=[0.35 0.25 0.15 0.20 0.05]; 

serviceTimeCDF1(1) = serviceTimeProbability1(1);

for i=2:5
    serviceTimeCDF1(i) = serviceTimeCDF1(i-1) + serviceTimeProbability1(i);
end

STLowerBoundRange1(1) = 1;

for i=2:5
    STLowerBoundRange1(i) = (serviceTimeCDF1(i-1)*100) + 1;
end    

for i=1:5
    STUpperBoundRange1(i) = (serviceTimeCDF1(i)*100);
end
    
disp('----------------------------------------------------------------------------------');
disp(sprintf('| %18s | %11s |  %3s  | %20s |','Service Time for Normal Counter 1','Probability','CDF','Random Number Range'));
disp('----------------------------------------------------------------------------------');

for i=1:5
    fprintf('| %-33d | %-11.2f | %-5.2f |  %-3d     -      %-3d  |\n', [serviceTime1(i), serviceTimeProbability1(i), serviceTimeCDF1(i), STLowerBoundRange1(i), STUpperBoundRange1(i)]); 
end

disp('----------------------------------------------------------------------------------');


%Service Time Table for NORMAL Counter 2 

printf('\n');
disp('Service Time Table for Normal Counter 2:');
printf('\n');

serviceTimeProbability2=[0.25 0.30 0.20 0.15 0.10]; 

serviceTimeCDF2(1) = serviceTimeProbability2(1);

for i=2:5
    serviceTimeCDF2(i) = serviceTimeCDF2(i-1) + serviceTimeProbability2(i);
end

STLowerBoundRange2(1) = 1;

for i=2:5
    STLowerBoundRange2(i) = (serviceTimeCDF2(i-1)*100) + 1;
end    

for i=1:5
    STUpperBoundRange2(i) = (serviceTimeCDF2(i)*100);
end
    
disp('----------------------------------------------------------------------------------');
disp(sprintf('| %18s | %11s |  %3s  | %20s |','Service Time for Normal Counter 2','Probability','CDF','Random Number Range'));
disp('----------------------------------------------------------------------------------');

for i=1:5
    fprintf('| %-33d | %-11.2f | %-5.2f |  %-3d     -      %-3d  |\n', [serviceTime2(i), serviceTimeProbability2(i), serviceTimeCDF2(i), STLowerBoundRange2(i), STUpperBoundRange2(i)]); 
end

disp('----------------------------------------------------------------------------------');


%Service Time Table for EXPRESS Counter 

printf('\n');
disp('Service Time Table for Express Counter:');
printf('\n');

serviceTimeProbability3=[0.4 0.4 0.2]; 

serviceTimeCDF3(1) = serviceTimeProbability3(1);

for i=2:3
    serviceTimeCDF3(i) = serviceTimeCDF3(i-1) + serviceTimeProbability3(i);
end

STLowerBoundRange3(1) = 1;

for i=2:3
    STLowerBoundRange3(i) = (serviceTimeCDF3(i-1)*100) + 1;
end    

for i=1:3
    STUpperBoundRange3(i) = (serviceTimeCDF3(i)*100);
end
    
disp('----------------------------------------------------------------------------------');
disp(sprintf('| %20s | %12s |  %3s  | %20s |','Service Time for Express Counter','Probability','CDF','Random Number Range'));
disp('----------------------------------------------------------------------------------');


for i=1:3
    fprintf('| %-32d | %-12.2f | %-5.2f |  %-3d     -      %-3d  |\n', [serviceTime3(i), serviceTimeProbability3(i), serviceTimeCDF3(i), STLowerBoundRange3(i), STUpperBoundRange3(i)]); 
end

disp('----------------------------------------------------------------------------------');

