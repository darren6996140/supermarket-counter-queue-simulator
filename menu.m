disp('Welcome to supermarket queueing simulator!') 

printf('\n')

disp('Types of Random Number Generator') 
disp('1. Linear Congruential Generator') 
disp('2. Random Variate Generator for Exponential Distribution')  
disp('3. Random Variate Generator for Uniform Distribution') 
disp('4. Random Number Generator using Rand Function') 

printf('\n')

generatorType = input('Choose the type of random number generator: '); %user presses either 1,2 or 3
                                                       %to get input of the type of random generator chosen by user

while generatorType < 1 || generatorType > 4
    generatorType = input('Choose the type of random generator (1-4): ');
    
    if generatorType < 1 || generatorType > 4
        fprintf('Invalid input. Please enter a valid generator type.\n');
    end
end
    
printf('\n')

generatorTypeName = '';

switch generatorType
    case 1
        generatorTypeName = 'LINEAR CONGRUENTIAL GENERATOR';
    case 2
        generatorTypeName = 'RANDOM VARIATE GENERATOR FOR EXPONENTIAL DISTRIBUTION';
    case 3
        generatorTypeName = 'RANDOM VARIATE GENERATOR FOR UNIFORM DISTRIBUTION';
    case 4
        generatorTypeName = 'RANDOM NUMBER GENERATOR USING RAND FUNCTION';
end

customerNum = input('Enter the number of customers in the simulator: '); %to get input of the number of customers entered by user 

printf('\n\n')

fprintf('----- %s -----\n', generatorTypeName);

fprintf('\n')

GeneratorChoice(generatorType,customerNum) %to call the function RandGenChoice in file generatorType.m 
                                       %the two arguments passed in the parameter is the random generator type and the number of customers
