%First, create an FIS, specifying its name.

fis = newfis('tipper');

%Add the first input variable for the service quality using addvar.

fis = addvar(fis,'input','service',[0 10]);

%Add membership functions for each of the service quality levels using addmf. In this case, use Gaussian membership functions. For more information on Gaussian membership function properties, see gaussmf.

fis = addmf(fis,'input',1,'poor','gaussmf',[1.5 0]);
fis = addmf(fis,'input',1,'good','gaussmf',[1.5 5]);
fis = addmf(fis,'input',1,'excellent','gaussmf',[1.5 10]);

%Add the second input variable for the food quality and add two trapezoidal membership functions. For information on trapezoidal membership functions, see trapmf.

fis = addvar(fis,'input','food',[0 10]);
fis = addmf(fis,'input',2,'rancid','trapmf',[-2 0 1 3]);
fis = addmf(fis,'input',2,'delicious','trapmf',[7 9 10 12]);


%Add the output variable for the tip and add three triabgular membership functions. For more information on the triangular membership function, see trimf.

fis = addvar(fis,'output','tip',[0 30]);
fis = addmf(fis,'output',1,'cheap','trimf',[0 5 10]);
fis = addmf(fis,'output',1,'average','trimf',[10 15 20]);
fis = addmf(fis,'output',1,'generous','trimf',[20 25 30]);

%Specify the following three rules for the FIS as an array:
%
%If (service is poor) or (food is rancid), then (tip is cheap).
%If (service is good), then (tip is average).
%If (service is excellent) or (food is delicious), then (tip is generous).
%Each row of the array contains one rule in the following format.

%Column 1 - Index of membership function for first input
%Column 2 - Index of membership function for second input
%Column 3 - Index of membership function for output
%Column 4 - Rule weight
%Column 5 - Fuzzy operator (1 for AND, 2 for OR)
%For more information on fuzzy rule specification, see addrule.

ruleList = [1 1 1 1 2;
            2 0 2 1 1;
            3 2 3 1 2];
        
%Add the rules to the FIS.

fis = addrule(fis,ruleList);



inputs = [3 5;
          2 7;
          3 1];
evalfis(inputs,fis)
