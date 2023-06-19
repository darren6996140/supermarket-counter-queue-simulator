function QueueSimulator(customerNum, ITRandNum, IT, ITLowerBoundRange, ITUpperBoundRange,ItemNum,STRandNum,serviceTime1,serviceTime2,serviceTime3, STLowerBoundRange1,STUpperBoundRange1, STLowerBoundRange2, STUpperBoundRange2, STLowerBoundRange3, STUpperBoundRange3)

    %INTER-ARRIVAL TIME

    PrintIT = cell(1,customerNum,1); 
    PrintIT{1,1} = '-';

    PrintRandIT = cell(1,customerNum,1);
    PrintRandIT{1,1} = '-';

    PrintSTRandNum = cell(1,customerNum,1);
    PrintNumOfCustomer = cell(1,customerNum,1);
    PrintTimeEnter = cell(1,customerNum,1);
    PrintST1 = cell(1,customerNum,1);
    PrintC1STBegin = cell(1,customerNum,1);
    PrintC1STEnd = cell(1,customerNum,1);
    PrintST2 = cell(1,customerNum,1);
    PrintC2STBegin = cell(1,customerNum,1);
    PrintC2STEnd = cell(1,customerNum,1);
    PrintST3 = cell(1,customerNum,1);
    PrintC3STBegin = cell(1,customerNum,1);
    PrintC3STEnd = cell(1,customerNum,1);
    PrintWaitingTime = cell(1,customerNum,1);
    PrintTimeSpent = cell(1,customerNum,1);

    InterArrivalTime(1) = 0;

    for i=1:customerNum-1    %9 times

        if ITRandNum(i) >= ITLowerBoundRange(1) && ITRandNum(i) < ITUpperBoundRange(1) + 1
            InterArrivalTime(i+1) = IT(1);

            PrintRandIT{1,i+1} = ITRandNum(i);
            PrintIT{1,i+1} = InterArrivalTime(i+1);

        elseif ITRandNum(i) >= ITLowerBoundRange(2) && ITRandNum(i) < ITUpperBoundRange(2) + 1
            InterArrivalTime(i+1) = IT(2);

            PrintRandIT{1,i+1} = ITRandNum(i);
            PrintIT{1,i+1} = InterArrivalTime(i+1);

        elseif ITRandNum(i) >= ITLowerBoundRange(3) && ITRandNum(i) < ITUpperBoundRange(3) + 1
            InterArrivalTime(i+1) = IT(3);

            PrintRandIT{1,i+1} = ITRandNum(i);
            PrintIT{1,i+1} = InterArrivalTime(i+1);

        elseif ITRandNum(i) >= ITLowerBoundRange(4) && ITRandNum(i) < ITUpperBoundRange(4) + 1
            InterArrivalTime(i+1) = IT(4);

            PrintRandIT{1,i+1} = ITRandNum(i);
            PrintIT{1,i+1} = InterArrivalTime(i+1);

        elseif ITRandNum(i) >= ITLowerBoundRange(5) && ITRandNum(i) < ITUpperBoundRange(5) + 1
            InterArrivalTime(i+1) = IT(5);
            
            PrintRandIT{1,i+1} = ITRandNum(i);
            PrintIT{1,i+1} = InterArrivalTime(i+1);

        end

    end

    %arrival time

    ArrivalTime(1) = 0;

    for i=1:customerNum-1
        ArrivalTime(i+1) = InterArrivalTime(i+1) + ArrivalTime(i);
    end

    %main queue simulator

    %variables
    TempC1STEnd = 0;
    TempC2STEnd = 0;
    TempC3STEnd = 0;

    %arrays
    C1STEnd = [0];
    C2STEnd = [0];
    C3STEnd = [0];
    C1STBegin = [0];
    C2STBegin = [0];
    C3STBegin = [0];
    TimeEnter = [0];

    val = 1;

    for i=1:customerNum

        if ItemNum(i) > 10

                CountCustomer = 0;

                for j=1:length(C1STEnd)
                    if TimeEnter(j) <= ArrivalTime(i) && C1STBegin(j) <= ArrivalTime(i) && C1STEnd(j) > ArrivalTime(i)
                        CountCustomer = CountCustomer + 1;
                    end
                end

                    for k=1:length(C2STEnd)  
                                if TimeEnter(k) <= ArrivalTime(i) && C2STBegin(k) <= ArrivalTime(i) && C2STEnd(k) > ArrivalTime(i)
                                    CountCustomer = CountCustomer + 1;
                        end
                    end

                NumOfCustomer(i) = CountCustomer;

                if NumOfCustomer(i) < 50
                    TimeEnter(i) = ArrivalTime(i);

                    if TempC1STEnd <= ArrivalTime(i)

                        if STRandNum(i) >= STLowerBoundRange1(1) && STRandNum(i) < STUpperBoundRange1(1) + 1
                            ST1(i) = serviceTime1(1);
                        elseif STRandNum(i) >= STLowerBoundRange1(2) && STRandNum(i) < STUpperBoundRange1(2) + 1
                            ST1(i) = serviceTime1(2);
                        elseif STRandNum(i) >= STLowerBoundRange1(3) && STRandNum(i) < STUpperBoundRange1(3) + 1
                            ST1(i) = serviceTime1(3);
                        elseif STRandNum(i) >= STLowerBoundRange1(4) && STRandNum(i) < STUpperBoundRange1(4) + 1
                            ST1(i) = serviceTime1(4);
                        elseif STRandNum(i) >= STLowerBoundRange1(5) && STRandNum(i) < STUpperBoundRange1(5) + 1
                            ST1(i) = serviceTime1(5);
                        end

                        C1STBegin(i) = ArrivalTime(i); 

                        C1STEnd(i) = ArrivalTime(i) + ST1(i); 

                        TempC1STEnd = C1STEnd(i);

                        ST2(i) = 0;
                        C2STBegin(i) = 0;
                        C2STEnd(i) = 0;

                        ST3(i) = 0;
                        C3STBegin(i) = 0;
                        C3STEnd(i) = 0;

                        WaitingTime(i) = C1STBegin(i) - ArrivalTime(i);
                        PrintWaitingTime{1,i} = WaitingTime(i);
                        
                        TimeSpent(i) = C1STEnd(i) - ArrivalTime(i);
                        PrintTimeSpent{1,i} = TimeSpent(i);

                    elseif TempC2STEnd <= ArrivalTime(i)

                        if STRandNum(i) >= STLowerBoundRange2(1) && STRandNum(i) < STUpperBoundRange2(1) + 1
                            ST2(i) = serviceTime2(1);
                        elseif STRandNum(i) >= STLowerBoundRange2(2) && STRandNum(i) < STUpperBoundRange2(2) + 1
                            ST2(i) = serviceTime2(2);
                        elseif STRandNum(i) >= STLowerBoundRange2(3) && STRandNum(i) < STUpperBoundRange2(3) + 1
                            ST2(i) = serviceTime2(3);
                        elseif STRandNum(i) >= STLowerBoundRange2(4) && STRandNum(i) < STUpperBoundRange2(4) + 1
                            ST2(i) = serviceTime2(4);
                        elseif STRandNum(i) >= STLowerBoundRange2(5) && STRandNum(i) < STUpperBoundRange2(5) + 1
                            ST2(i) = serviceTime2(5);
                        end

                        C2STBegin(i) = ArrivalTime(i);
                        
                        C2STEnd(i) = ArrivalTime(i) + ST2(i);
                        TempC2STEnd = C2STEnd(i);

                        ST1(i) = 0;
                        C1STBegin(i) = 0;
                        C1STEnd(i) = 0;

                        ST3(i) = 0;
                        C3STBegin(i) = 0;
                        C3STEnd(i) = 0;

                        WaitingTime(i) = C2STBegin(i) - ArrivalTime(i);
                        PrintWaitingTime{1,i} = WaitingTime(i);

                        TimeSpent(i) = C2STEnd(i) - ArrivalTime(i);
                        PrintTimeSpent{1,i} = TimeSpent(i);

                    else 

                        if TempC1STEnd <= TempC2STEnd && TempC1STEnd <= TempC3STEnd

                            if STRandNum(i) >= STLowerBoundRange1(1) && STRandNum(i) < STUpperBoundRange1(1) + 1
                                ST1(i) = serviceTime1(1);
                            elseif STRandNum(i) >= STLowerBoundRange1(2) && STRandNum(i) < STUpperBoundRange1(2) + 1
                                ST1(i) = serviceTime1(2);
                            elseif STRandNum(i) >= STLowerBoundRange1(3) && STRandNum(i) < STUpperBoundRange1(3) + 1
                                ST1(i) = serviceTime1(3);
                            elseif STRandNum(i) >= STLowerBoundRange1(4) && STRandNum(i) < STUpperBoundRange1(4) + 1
                                ST1(i) = serviceTime1(4);
                            elseif STRandNum(i) >= STLowerBoundRange1(5) && STRandNum(i) < STUpperBoundRange1(5) + 1
                                ST1(i) = serviceTime1(5);
                            end

                            C1STBegin(i) = TempC1STEnd;

                            C1STEnd(i) = C1STBegin(i) + ST1(i);
                            TempC1STEnd = C1STEnd(i);

                            ST2(i) = 0;
                            C2STBegin(i) = 0;
                            C2STEnd(i) = 0;

                            ST3(i) = 0;
                            C3STBegin(i) = 0;
                            C3STEnd(i) = 0;

                            WaitingTime(i) = C1STBegin(i) - ArrivalTime(i);
                            PrintWaitingTime{1,i} = WaitingTime(i);

                            TimeSpent(i) = C1STEnd(i) - ArrivalTime(i);
                            PrintTimeSpent{1,i} = TimeSpent(i);

                        else

                            if STRandNum(i) >= STLowerBoundRange2(1) && STRandNum(i) < STUpperBoundRange2(1) + 1
                                ST2(i) = serviceTime2(1);
                            elseif STRandNum(i) >= STLowerBoundRange2(2) && STRandNum(i) < STUpperBoundRange2(2) + 1
                                ST2(i) = serviceTime2(2);
                            elseif STRandNum(i) >= STLowerBoundRange2(3) && STRandNum(i) < STUpperBoundRange2(3) + 1
                                ST2(i) = serviceTime2(3);
                            elseif STRandNum(i) >= STLowerBoundRange2(4) && STRandNum(i) < STUpperBoundRange2(4) + 1
                                ST2(i) = serviceTime2(4);
                            elseif STRandNum(i) >= STLowerBoundRange2(5) && STRandNum(i) < STUpperBoundRange2(5) + 1
                                ST2(i) = serviceTime2(5);
                            end

                            C2STBegin(i) = TempC2STEnd;  

                            C2STEnd(i) = C2STBegin(i) + ST2(i); 
                            TempC2STEnd = C2STEnd(i); 

                            ST1(i) = 0;
                            C1STBegin(i) = 0;
                            C1STEnd(i) = 0;

                            ST3(i) = 0;
                            C3STBegin(i) = 0;
                            C3STEnd(i) = 0;

                            WaitingTime(i) = C2STBegin(i) - ArrivalTime(i);
                            PrintWaitingTime{1,i} = WaitingTime(i);

                            TimeSpent(i) = C2STEnd(i) - ArrivalTime(i);
                            PrintTimeSpent{1,i} = TimeSpent(i);
                        end
                    end 

                else
                        if TempC1STEnd <= TempC2STEnd && TempC1STEnd <= TempC3STEnd

                            if STRandNum(i) >= STLowerBoundRange1(1) && STRandNum(i) < STUpperBoundRange1(1) + 1
                                ST1(i) = serviceTime1(1);
                            elseif STRandNum(i) >= STLowerBoundRange1(2) && STRandNum(i) < STUpperBoundRange1(2) + 1
                                ST1(i) = serviceTime1(2);
                            elseif STRandNum(i) >= STLowerBoundRange1(3) && STRandNum(i) < STUpperBoundRange1(3) + 1
                                ST1(i) = serviceTime1(3);
                            elseif STRandNum(i) >= STLowerBoundRange1(4) && STRandNum(i) < STUpperBoundRange1(4) + 1
                                ST1(i) = serviceTime1(4);
                            elseif STRandNum(i) >= STLowerBoundRange1(5) && STRandNum(i) < STUpperBoundRange1(5) + 1
                                ST1(i) = serviceTime1(5);
                            end

                            TimeEnter(i) = TempC1STEnd;
                            C1STBegin(i) = TempC1STEnd;

                            C1STEnd(i) = C1STBegin(i) + ST1(i);
                            TempC1STEnd = C1STEnd(i);

                            ST2(i) = 0;
                            C2STBegin(i) = 0;
                            C2STEnd(i) = 0;

                            ST3(i) = 0;
                            C3STBegin(i) = 0;
                            C3STEnd(i) = 0;

                            WaitingTime(i) = C1STBegin(i) - ArrivalTime(i);
                            PrintWaitingTime{1,i} = WaitingTime(i);
                            
                            TimeSpent(i) = C1STEnd(i) - ArrivalTime(i);
                            PrintTimeSpent{1,i} = TimeSpent(i);

                        else

                            if STRandNum(i) >= STLowerBoundRange2(1) && STRandNum(i) < STUpperBoundRange2(1) + 1
                                ST2(i) = serviceTime2(1);
                            elseif STRandNum(i) >= STLowerBoundRange2(2) && STRandNum(i) < STUpperBoundRange2(2) + 1
                                ST2(i) = serviceTime2(2);
                            elseif STRandNum(i) >= STLowerBoundRange2(3) && STRandNum(i) < STUpperBoundRange2(3) + 1
                                ST2(i) = serviceTime2(3);
                            elseif STRandNum(i) >= STLowerBoundRange2(4) && STRandNum(i) < STUpperBoundRange2(4) + 1
                                ST2(i) = serviceTime2(4);
                            elseif STRandNum(i) >= STLowerBoundRange2(5) && STRandNum(i) < STUpperBoundRange2(5) + 1
                                ST2(i) = serviceTime2(5);
                            end

                        TimeEnter(i) = TempC2STEnd;
                        C2STBegin(i) = TempC2STEnd;

                        C2STEnd(i) = C2STBegin(i) + ST2(i);
                        TempC2STEnd = C2STEnd(i); 

                            ST1(i) = 0;
                            C1STBegin(i) = 0;
                            C1STEnd(i) = 0; 

                            ST3(i) = 0;
                            C3STBegin(i) = 0;
                            C3STEnd(i) = 0;

                        WaitingTime(i) = C2STBegin(i) - ArrivalTime(i);
                        PrintWaitingTime{1,i} = WaitingTime(i);

                        TimeSpent(i) = C2STEnd(i) - ArrivalTime(i); 
                        PrintTimeSpent{1,i} = TimeSpent(i);

                        end
                end 

        elseif ItemNum(i) > 0 && ItemNum(i) < 11

            CountCustomer = 0;

                for m=1:length(C3STEnd)  
                    if TimeEnter(m) <= ArrivalTime(i) && C3STBegin(m) <= ArrivalTime(i) && C3STEnd(m) > ArrivalTime(i)
                        CountCustomer = CountCustomer + 1;
                end
            end

            NumOfCustomer(i) = CountCustomer;

            if NumOfCustomer(i) < 50
                TimeEnter(i) = ArrivalTime(i);

            if TempC3STEnd <= ArrivalTime(i)

                    if STRandNum(i) >= STLowerBoundRange3(1) && STRandNum(i) < STUpperBoundRange3(1) + 1
                        ST3(i) = serviceTime3(1);
                    elseif STRandNum(i) >= STLowerBoundRange3(2) && STRandNum(i) < STUpperBoundRange3(2) + 1
                        ST3(i) = serviceTime3(2);
                    elseif STRandNum(i) >= STLowerBoundRange3(3) && STRandNum(i) < STUpperBoundRange3(3) + 1
                        ST3(i) = serviceTime3(3);
                    elseif STRandNum(i) >= STLowerBoundRange3(4) && STRandNum(i) < STUpperBoundRange3(4) + 1
                        ST3(i) = serviceTime3(4);
                    elseif STRandNum(i) >= STLowerBoundRange3(5) && STRandNum(i) < STUpperBoundRange3(5) + 1
                        ST3(i) = serviceTime3(5);
                    end

                    C3STBegin(i) = ArrivalTime(i);
                    
                    C3STEnd(i) = ArrivalTime(i) + ST3(i);
                    TempC2STEnd = C3STEnd(i);

                    ST1(i) = 0;
                    C1STBegin(i) = 0;
                    C1STEnd(i) = 0;

                    ST2(i) = 0;
                    C2STBegin(i) = 0;
                    C2STEnd(i) = 0;

                    WaitingTime(i) = C3STBegin(i) - ArrivalTime(i);
                    PrintWaitingTime{1,i} = WaitingTime(i);

                    TimeSpent(i) = C3STEnd(i) - ArrivalTime(i);
                    PrintTimeSpent{1,i} = TimeSpent(i);

                else 

                    if TempC3STEnd <= TempC1STEnd && TempC3STEnd <= TempC2STEnd

                        if STRandNum(i) >= STLowerBoundRange3(1) && STRandNum(i) < STUpperBoundRange3(1) + 1
                            ST3(i) = serviceTime3(1);
                        elseif STRandNum(i) >= STLowerBoundRange3(2) && STRandNum(i) < STUpperBoundRange3(2) + 1
                            ST3(i) = serviceTime3(2);
                        elseif STRandNum(i) >= STLowerBoundRange3(3) && STRandNum(i) < STUpperBoundRange3(3) + 1
                            ST3(i) = serviceTime3(3);
                        elseif STRandNum(i) >= STLowerBoundRange3(4) && STRandNum(i) < STUpperBoundRange3(4) + 1
                            ST3(i) = serviceTime3(4);
                        elseif STRandNum(i) >= STLowerBoundRange3(5) && STRandNum(i) < STUpperBoundRange3(5) + 1
                            ST3(i) = serviceTime3(5);
                        end

                        C3STBegin(i) = TempC3STEnd;  

                        C3STEnd(i) = C3STBegin(i) + ST3(i); 
                        TempC3STEnd = C3STEnd(i); 

                        ST1(i) = 0;
                        C1STBegin(i) = 0;
                        C1STEnd(i) = 0;

                        ST2(i) = 0;
                        C2STBegin(i) = 0;
                        C2STEnd(i) = 0;

                        WaitingTime(i) = C3STBegin(i) - ArrivalTime(i);
                        PrintWaitingTime{1,i} = WaitingTime(i);

                        TimeSpent(i) = C3STEnd(i) - ArrivalTime(i);
                        PrintTimeSpent{1,i} = TimeSpent(i); 

                    end
                end 

                else
                        if TempC3STEnd <= TempC1STEnd && TempC3STEnd <= TempC2STEnd
                            if STRandNum(i) >= STLowerBoundRange3(1) && STRandNum(i) < STUpperBoundRange3(1) + 1
                                ST3(i) = serviceTime3(1);
                            elseif STRandNum(i) >= STLowerBoundRange3(2) && STRandNum(i) < STUpperBoundRange3(2) + 1
                                ST3(i) = serviceTime3(2);
                            elseif STRandNum(i) >= STLowerBoundRange3(3) && STRandNum(i) < STUpperBoundRange3(3) + 1
                                ST3(i) = serviceTime3(3);
                            elseif STRandNum(i) >= STLowerBoundRange3(4) && STRandNum(i) < STUpperBoundRange3(4) + 1
                                ST3(i) = serviceTime3(4);
                            elseif STRandNum(i) >= STLowerBoundRange3(5) && STRandNum(i) < STUpperBoundRange3(5) + 1
                                ST3(i) = serviceTime3(5);
                            end

                            C3STBegin(i) = TempC3STEnd;  

                            C3STEnd(i) = C3STBegin(i) + ST3(i); 
                            TempC3STEnd = C3STEnd(i); 

                            ST1(i) = 0;
                            C1STBegin(i) = 0;
                            C1STEnd(i) = 0;

                            ST2(i) = 0;
                            C2STBegin(i) = 0;
                            C2STEnd(i) = 0;

                            WaitingTime(i) = C3STBegin(i) - ArrivalTime(i);
                            PrintWaitingTime{1,i} = WaitingTime(i);

                            TimeSpent(i) = C3STEnd(i) - ArrivalTime(i);
                            PrintTimeSpent{1,i} = TimeSpent(i); 
                        end
                end 

        else
            STRandNum(i) = 0;
            ST1(i) = 0;
            C1STBegin(i) = 0;
            C1STEnd(i) = 0;
            ST2(i) = 0;
            C2STBegin(i) = 0;
            C2STEnd(i) = 0;
            ST3(i) = 0;
            C3STBegin(i) = 0;
            C3STEnd(i) = 0;
            WaitingTime(i) = 0;
            TimeSpent(i) = 0; 
            NumOfCustomer(i) = 0;
            TimeEnter(i) = 0;
            
            PrintNumOfCustomer{1,i} = '-';
            PrintTimeEnter{1,i} = '-';
            PrintST1{1,i} = '-';
            PrintC1STBegin{1,i} = '-';
            PrintC1STEnd{1,i} = '-';
            PrintST2{1,i} = '-';
            PrintC2STBegin{1,i} = '-';
            PrintC2STEnd{1,i} = '-';
            PrintST3{1,i} = '-';
            PrintC3STBegin{1,i} = '-';
            PrintC3STEnd{1,i} = '-';
            PrintWaitingTime{1,i} = '-';
            PrintTimeSpent{1,i} = '-';
        end
    end
    

    

    for i=1:customerNum
        if ItemNum(i) > 0 && ItemNum(i) <= 50
            % Counter Type
            if C1STEnd(i) ~= 0
                counter_type = 1;
            elseif C2STEnd(i) ~= 0
                counter_type = 2;
            else
                counter_type = 3;
            end
            
            
            % Service Time Begin
            if i == 1
                serviceTimeBegin = 0;
            elseif C1STBegin(i) ~= 0
                serviceTimeBegin = C1STBegin(i);
            elseif C2STBegin(i) ~= 0
                serviceTimeBegin = C2STBegin(i);
            else 
                serviceTimeBegin = C3STBegin(i);
            end
            
            
            % Service Time End
            if C1STEnd(i) ~= 0
                serviceTimeEnd = C1STEnd(i);
            elseif C2STEnd(i) ~= 0
                serviceTimeEnd = C2STEnd(i);
            else 
                serviceTimeEnd = C3STEnd(i);
            end
            
            fprintf('Customer %d arrived at minute %d and queue at counter %d. \n\n',[i, ArrivalTime(i), counter_type]);
            
            fprintf('Service for customer %d started at minute %d. \n\n',[i, serviceTimeBegin]);
            
            fprintf('Departure of customer %d at minute %d. \n\n\n',[i, serviceTimeEnd]);
        end
    end

    for i = 1:customerNum
        
        
        if NumOfCustomer(i) ~= 0
           PrintNumOfCustomer{1,i} = NumOfCustomer(i);
        end
    
        if TimeEnter(i) ~= 0
           PrintTimeEnter{1,i} = TimeEnter(i);
        end  
    
        if STRandNum(i) == 0
           PrintSTRandNum{1,i} = '-';
        else 
           PrintSTRandNum{1,i} = STRandNum(i);
        end     

        if ST1(i) == 0 && C1STBegin(i) == 0 && C1STEnd(i) == 0
           PrintST1{1,i} = '-';
           PrintC1STBegin{1,i} = '-';
           PrintC1STEnd{1,i} = '-';
        else 
           PrintST1{1,i} = ST1(i);
           PrintC1STBegin{1,i} = C1STBegin(i);
           PrintC1STEnd{1,i} = C1STEnd(i);
        end 
       
        if ST2(i) == 0 && C2STBegin(i) == 0 && C2STEnd(i) == 0
           PrintST2{1,i} = '-';
           PrintC2STBegin{1,i} = '-';
           PrintC2STEnd{1,i} = '-';
        else 
           PrintST2{1,i} = ST2(i);
           PrintC2STBegin{1,i} = C2STBegin(i);
           PrintC2STEnd{1,i} = C2STEnd(i);
        end

        if ST3(i) == 0 && C3STBegin(i) == 0 && C3STEnd(i) == 0
            PrintST3{1,i} = '-';
            PrintC3STBegin{1,i} = '-';
            PrintC3STEnd{1,i} = '-';
         else 
            PrintST3{1,i} = ST3(i);
            PrintC3STBegin{1,i} = C3STBegin(i);
            PrintC3STEnd{1,i} = C3STEnd(i);
         end

    end

    printf('\n');
    disp('Queue Simulation');
    printf('\n');

    %table

    disp('----------------------------------------------------------------------');
    
    disp(sprintf('| %-8s | %-8s | %-18s | %-13s | %-7s |','Customer','Items','Random number for','Inter-arrival','Arrival'));
    disp(sprintf('| %-8s | %-8s | %-12s | %-13s | %-7s |','No.','Bought','inter-arrival time','time','time'));

    disp('----------------------------------------------------------------------');
    
    for i = 1:customerNum
        fprintf('| %-8d | %-8d ',[i, ItemNum(i)]);
        
    if isstr(PrintRandIT{1,i}) 
        fprintf('| %-18s ', PrintRandIT{1,i});
      else
        fprintf('| %-18d ', PrintRandIT{1,i});
    end
     
    if isstr(PrintIT{1,i}) 
        fprintf('| %-13s ', PrintIT{1,i});
      else
        fprintf('| %-13d ', PrintIT{1,i}); 
    end
    
    fprintf('| %-7d |',[ArrivalTime(i)]);
    
    
    printf('\n');  

    end
        
    disp('----------------------------------------------------------------------');
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    
    
    %table counter 1

    printf('\n');
    disp('Counter 1');
    printf('\n');
    
    disp('------------------------------------------------------------------------------------------------');

    disp(sprintf('| %-8s | %-18s |                  %-9s                 | %-7s | %-5s |', 'Customer', 'Random number', 'COUNTER 1', 'Waiting', 'Time'));
    disp(sprintf('| %-8s | %-18s | %-11s | %-11s | %-11s | %-7s | %-5s |', 'No.', 'for service time', 'Service time', 'Service begin', 'Service end', 'time', 'spent'));

    disp('------------------------------------------------------------------------------------------------');

    
    
    for i = 1:customerNum
        
        if ST1(i) == 0
            continue;
        end
        
        fprintf('| %-8d ',[i]);

        if isstr(PrintSTRandNum{1,i}) 
            fprintf('| %-18s ', PrintSTRandNum{1,i});
        else
            fprintf('| %-18d ', PrintSTRandNum{1,i}); 
        end
        
        if isstr(PrintST1{1,i}) 
            fprintf('| %-12s ', PrintST1{1,i});
        else
            fprintf('| %-12d ', PrintST1{1,i}); 
        end

        if isstr(PrintC1STBegin{1,i}) 
            fprintf('| %-13s ', PrintC1STBegin{1,i});
        else
            fprintf('| %-13d ', PrintC1STBegin{1,i}); 
        end

        if isstr(PrintC1STEnd{1,i}) 
            fprintf('| %-11s ', PrintC1STEnd{1,i});
        else
            fprintf('| %-11d ', PrintC1STEnd{1,i}); 
        end
        
        if isstr(PrintWaitingTime{1,i}) 
            fprintf('| %-7s ', PrintWaitingTime{1,i});
        else
            fprintf('| %-7d ', PrintWaitingTime{1,i}); 
        end
        
        if isstr(PrintTimeSpent{1,i}) 
            fprintf('| %-5s |', PrintTimeSpent{1,i});
        else
            fprintf('| %-5d |', PrintTimeSpent{1,i}); 
        end
    
        printf('\n');

    end

 
    disp('------------------------------------------------------------------------------------------------');

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    %table counter 2

    printf('\n');
    disp('Counter 2');
    printf('\n');
    
    disp('------------------------------------------------------------------------------------------------');

    disp(sprintf('| %-8s | %-18s |                  %-9s                 | %-7s | %-5s |', 'Customer', 'Random number', 'COUNTER 2', 'Waiting', 'Time'));
    disp(sprintf('| %-8s | %-18s | %-11s | %-11s | %-11s | %-7s | %-5s |', 'No.', 'for service time', 'Service time', 'Service begin', 'Service end', 'time', 'spent'));
    disp('------------------------------------------------------------------------------------------------');

    for i = 1:customerNum
        
        if ST2(i) == 0
            continue;
        end
        
        fprintf('| %-8d ',[i]);

        if isstr(PrintSTRandNum{1,i}) 
            fprintf('| %-18s ', PrintSTRandNum{1,i});
            else
            fprintf('| %-18d ', PrintSTRandNum{1,i}); 
        end
        
        if isstr(PrintST2{1,i}) 
            fprintf('| %-12s ', PrintST2{1,i});
        else
            fprintf('| %-12d ', PrintST2{1,i}); 
        end

        if isstr(PrintC2STBegin{1,i}) 
            fprintf('| %-13s ', PrintC2STBegin{1,i});
        else
            fprintf('| %-13d ', PrintC2STBegin{1,i}); 
        end

        if isstr(PrintC2STEnd{1,i}) 
            fprintf('| %-11s ', PrintC2STEnd{1,i});
        else
            fprintf('| %-11d ', PrintC2STEnd{1,i}); 
        end
        
        if isstr(PrintWaitingTime{1,i}) 
            fprintf('| %-7s ', PrintWaitingTime{1,i});
            else
            fprintf('| %-7d ', PrintWaitingTime{1,i}); 
        end
        
        if isstr(PrintTimeSpent{1,i}) 
            fprintf('| %-5s |', PrintTimeSpent{1,i});
            else
            fprintf('| %-5d |', PrintTimeSpent{1,i}); 
        end
        
        printf('\n');
        
    end
    disp('------------------------------------------------------------------------------------------------');

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    %table counter 3

    printf('\n');
    disp('Counter 3 (Express)');
    printf('\n');
    
    disp('------------------------------------------------------------------------------------------------');

    disp(sprintf('| %-8s | %-18s |                  %-9s                 | %-7s | %-5s |', 'Customer', 'Random number', 'COUNTER 3', 'Waiting', 'Time'));
    disp(sprintf('| %-8s | %-18s | %-11s | %-11s | %-11s | %-7s | %-5s |', 'No.', 'for service time', 'Service time', 'Service begin', 'Service end', 'time', 'spent'));

    disp('------------------------------------------------------------------------------------------------');

    for i = 1:customerNum
        
        if ST3(i) == 0
            continue;
        end
        
        fprintf('| %-8d ',[i]);

        if isstr(PrintSTRandNum{1,i}) 
            fprintf('| %-18s ', PrintSTRandNum{1,i});
            else
            fprintf('| %-18d ', PrintSTRandNum{1,i}); 
        end
        
        if isstr(PrintST3{1,i}) 
            fprintf('| %-12s ', PrintST3{1,i});
        else
            fprintf('| %-12d ', PrintST3{1,i}); 
        end

        if isstr(PrintC3STBegin{1,i}) 
            fprintf('| %-13s ', PrintC3STBegin{1,i});
        else
            fprintf('| %-13d ', PrintC3STBegin{1,i}); 
        end

        if isstr(PrintC3STEnd{1,i}) 
            fprintf('| %-11s ', PrintC3STEnd{1,i});
        else
            fprintf('| %-11d ', PrintC3STEnd{1,i}); 
        end
        
        if isstr(PrintWaitingTime{1,i}) 
            fprintf('| %-7s ', PrintWaitingTime{1,i});
            else
            fprintf('| %-7d ', PrintWaitingTime{1,i}); 
        end
        
        if isstr(PrintTimeSpent{1,i}) 
            fprintf('| %-5s |', PrintTimeSpent{1,i});
            else
            fprintf('| %-5d |', PrintTimeSpent{1,i}); 
        end
        
        printf('\n');

    end
    disp('------------------------------------------------------------------------------------------------');

    %TableCalculation(customerNum,PrintWaitingTime,PrintTimeSpent,PrintST1,PrintST2,PrintIT,WaitingTime);
    %ExportQueueSimulator(customerNum,ItemNum,PrintRandIT,PrintIT,ArrivalTime,PrintNumOfCustomer,PrintTimeEnter,PrintSTRandNum, PrintST1, PrintC1STBegin, PrintC1STEnd, PrintST2, PrintC2STBegin, PrintC2STEnd,PrintWaitingTime,PrintTimeSpent);
    %% CHANGE THE FPRINTF FROM -5.0F TO -5D
    
    
    averageWaitingTime = 0;
    
    for i = 1:customerNum
        averageWaitingTime = averageWaitingTime + WaitingTime(i);
    end 
    
    averageWaitingTime = averageWaitingTime / customerNum;
    disp('Average Waiting Time:');
    disp(averageWaitingTime);
    
    
    
    averageInterArrivalTime = 0;
    
    for i = 1:customerNum
        averageInterArrivalTime = averageInterArrivalTime + InterArrivalTime(i);
    end 
    
    averageInterArrivalTime = averageInterArrivalTime / customerNum;
    disp('Average Inter Arrival Time:');
    disp(averageInterArrivalTime);
    
    
    
    
    
    averageArrivalTime = 0;
    
    for i = 1:customerNum
        averageArrivalTime = averageArrivalTime + ArrivalTime(i);
    end 
    
    averageArrivalTime = averageArrivalTime / customerNum;
    disp('Average Arrival Time:');
    disp(averageArrivalTime);
    
    
   
    
    
    averageTimeSpent = 0;
    
    for i = 1:customerNum
        averageTimeSpent = averageTimeSpent + TimeSpent(i);
    end 
    
    averageTimeSpent = averageTimeSpent / customerNum;
    disp('Average Time Spent:');
    disp(averageTimeSpent);
    
    
    

    
    waitingCounter = 0;
    
    for i = 1:customerNum
        if WaitingTime(i) ~= 0 
            waitingCounter = waitingCounter + 1;
        end
    end
    
    waitingProbability = waitingCounter / customerNum;
    disp('Probability that a customer has to wait in the queue:');
    disp(waitingProbability);
    
    
    
    
    ST1Counter = 0;
    ST1CustomerCounter = 0;
    
    for i = 1:customerNum
        if ST1(i) ~= 0
            ST1Counter = ST1Counter + ST1(i);
            ST1CustomerCounter = ST1CustomerCounter + 1;
        end
    end
    
    averageST1 = ST1Counter / ST1CustomerCounter;
    
    disp('Average Service Time Counter 1:');
    disp(averageST1);
    
    
    
    
    
    
    ST2Counter = 0;
    ST2CustomerCounter = 0;
    
    for i = 1:customerNum
        if ST2(i) ~= 0
            ST2Counter = ST2Counter + ST2(i);
            ST2CustomerCounter = ST2CustomerCounter + 1;
        end
    end
    
    averageST2 = ST2Counter / ST2CustomerCounter;
    
    disp('Average Service Time Counter 2:');
    disp(averageST2);
            
       
    
    
    
    
    
    
    
    
    ST3Counter = 0;
    ST3CustomerCounter = 0;
    
    for i = 1:customerNum
        if ST3(i) ~= 0
            ST3Counter = ST3Counter + ST3(i);
            ST3CustomerCounter = ST3CustomerCounter + 1;
        end
    end
    
    averageST3 = ST3Counter / ST3CustomerCounter;
    
    disp('Average Service Time Counter 3 (Express):');
    disp(averageST3);
    
    