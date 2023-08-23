clear all

% E; modulus of elasticity
% I: second moment of area
% L: length of bar
E=2e6;  L=9.15; t=20;I=10*t^3/12;  EI=E*I;

% generation of coordinates and connectivities
numberElements=3;
nodeCoordinates=linspace(0,L,numberElements+1)';
xx=nodeCoordinates;L=max(nodeCoordinates);
for i=1:numberElements; 
    elementNodes(i,1)=i; 
    elementNodes(i,2)=i+1;
end
numberNodes=size(nodeCoordinates,1)
xx=nodeCoordinates(:,1);

% distributed force
P=-20;  

% for structure:
    % displacements: displacement vector
    % force : force vector
    % stiffness: stiffness matrix
    % GDof: global number of degrees of freedom
GDof=2*numberNodes; 
%U=zeros(GDof,1);
stiffnessSpring=zeros(GDof+1);
forceSpring=zeros(GDof+1,1);

% stiffess matrix and force vector

force=zeros(GDof,1);
stiffness=zeros(GDof); 
% calculation of the system stiffness matrix
% and force vector
for e=1:numberElements; 
  % elementDof: element degrees of freedom (Dof)
  indice=elementNodes(e,:)   ;       
  elementDof=[ 2*(indice(1)-1)+1 2*(indice(2)-1)...
      2*(indice(2)-1)+1 2*(indice(2)-1)+2]; 
 % ndof=length(indice);  
  % length of element
  LElem=xx(indice(2))-xx(indice(1))  ;
  ll=LElem;
  k1=EI/(LElem)^3*[12   6*LElem -12 6*LElem;
     6*LElem 4*LElem^2 -6*LElem 2*LElem^2;
     -12 -6*LElem 12 -6*LElem ;
     6*LElem 2*LElem^2 -6*LElem 4*LElem^2];

  f1=[P*LElem/2 P*LElem*LElem/12 P*LElem/2 ...
      -P*LElem*LElem/12]';
  
  % equivalent force vector
  force(elementDof)=force(elementDof)+f1;  
  
  % stiffness matrix
  stiffness(elementDof,elementDof)=...
      stiffness(elementDof,elementDof)+k1;
end
% spring added
stiffnessSpring(1:GDof,1:GDof)=stiffness;
forceSpring(1:GDof)=force;
k=30;
stiffnessSpring([GDof-1 GDof+1],[GDof-1 GDof+1])=...
    stiffnessSpring([GDof-1 GDof+1],[GDof-1 GDof+1])+[k -k;-k k];

% boundary conditions and solution
fixedNodeU =[1]'; fixedNodeV =[2]';
prescribedDof=[fixedNodeU;fixedNodeV;GDof+1];

% solution
displacements=solution(GDof+1,prescribedDof,...
    stiffnessSpring,forceSpring);

% displacements
disp('Displacements')
jj=1:GDof+1; format
[jj' displacements]

% drawing deformed shape
U=displacements(1:2:2*numberNodes);   
plot(nodeCoordinates,U,'--*')

% exact solution by Bathe (Solutions Manual of Procedures ...)
load=[L*P/3;L*P/3;L*P/6]
K=E*I/L^3*[189 -108 27;-108 135 -54;27 -54 27+k*L^3/E/I];
X=K\load

%................................................................

function displacements=solution(GDof,prescribedDof,stiffness,force)
% function to find solution in terms of global displacements
activeDof=setdiff([1:GDof]', ...
    [prescribedDof]);
U=stiffness(activeDof,activeDof)\force(activeDof);
displacements=zeros(GDof,1);
displacements(activeDof)=U;
end
