
clc
clear all
%inpot fil
nodes=[0 0;400 0;800 0];
elems=[1 2;2 3];
%BCS (Node_number dof specified_disp)
bcs=[1 1 0;1 2 0;3 1 0];
%Nodal loads (Node_number dof specified load)
loads=[2 1 -5000];
nel=size(elems,1);
Nnodes=size(nodes,1);
%Ddof
alldofs=1:2*Nnodes;
k =zeros(2*Nnodes);
u =zeros(2*Nnodes,1);
f =zeros(2*Nnodes,1);
%--------------------
dofspec=[];
for ii=1:size(bcs,1);
    thisdof=2*(bcs(ii,1)-1)+bcs(ii,2);
    dofspec =[dofspec thisdof];
    u(thisdof)=bcs(ii,3);
end
doffree=alldofs;
doffree(dofspec)=[];
%nodal loads
for ii=1:size(loads,1);
    f(2*(loads(ii,1)-1)+loads(ii,2))=loads(ii,3);
   
end
%global stiffness matrix
for iel=1:nel;
    elnodes=elems(iel,1:2);
    nodexy=nodes(elnodes, :);
    %[kel]=BeamElement2dBE(nodexy,E(iel),A(iel),I(iel));
    E1=[(nodexy(2,1)-nodexy(1,1)) (nodexy(2,2)-nodexy(1,2))];
    L=norm(E1);
    E1=E1/L;
    E2=[-E1(2) E1(1)];
    %--------------
    E=2000000;
    A=20;
    I=1000;
    %L=400;
    
    kel=[12*E*I/(L^3) 6*E*I/(L^2) -12*E*I/(L^3) 6*E*I/(L^2);...
    6*E*I/(L^2) 4*E*I/L -6*E*I/(L^2) 2*E*I/L;...
    -12*E*I/(L^3) -6*E*I/(L^2) 12*E*I/(L^3) -6*E*I/(L^2);...
    6*E*I/(L^2) 2*E*I/L -6*E*I/(L^2) 4*E*I/L];

    eldofs=2*(elnodes(1)-1)+1:2*elnodes(1);
    eldofs=[eldofs 2*(elnodes(2)-1)+1:2*elnodes(2)];
    k(eldofs,eldofs)=k(eldofs,eldofs)+kel;
end
%solve
u(doffree)=k(doffree,doffree)\(f(doffree)-k(doffree,dofspec)*u(dofspec));
f(dofspec)=k(dofspec, :)*u;
%format long
disp(['Number of']);
[1;2;3;4;5;6]
disp(['Displecment and Rotations']);u
disp(['Reactions (forces and Moments)']);f

