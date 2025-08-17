(* ::Package:: *)

(*the Heaviside step function, including zero*)
HeavisideThetaM[x_]:=Piecewise[{{0, x==0}},HeavisideTheta[x]];

(*the Heaviside step function, for numerical calculations*)
HeavisideThetaN[x_]:=If[x > -1/10^6, 1, 0];

(*extended source*)
\[Chi][x_, x0_,  w_]:= HeavisideThetaM[w + x0 - x] * HeavisideThetaM[x - x0];

(*steady state solution*)
part1[x_, x0_,  \[Lambda]_, \[Alpha]_, w_, \[Beta]_, Diff_, L_]:=  \[Alpha] /(\[Beta] Sinh[L/\[Lambda]])*(2 Sinh[w/(2 \[Lambda])]Cosh[(2 L-(w+2 x0))/(2 \[Lambda])] Cosh[x/\[Lambda]]);

part2[x_, x0_,  \[Lambda]_, \[Alpha]_, w_, \[Beta]_, Diff_, L_]:= \[Alpha] /(\[Beta] Sinh[L/\[Lambda]]) * (Sinh[L/\[Lambda]]-(Sinh[(L-(w+x0))/\[Lambda]]Cosh[x/\[Lambda]] + Sinh[x0/\[Lambda]]Cosh[(L-x)/\[Lambda]]));

part3[x_, x0_,  \[Lambda]_, \[Alpha]_, w_, \[Beta]_, Diff_, L_]:= \[Alpha] /(\[Beta] Sinh[L/\[Lambda]]) * (2  Sinh[w/(2 \[Lambda])] Cosh[(w + 2x0)/(2 \[Lambda])] Cosh[(L-x)/\[Lambda]] );

(*steady state solution*)
SolutionSteady[x_, x0_,  \[Lambda]_, \[Alpha]_, w_, \[Beta]_, Diff_, L_]:= HeavisideThetaM[x0 - x]* HeavisideThetaM[x] *  part1[x, x0,  \[Lambda], \[Alpha], w, \[Beta], Diff, L] +
+ HeavisideThetaM[x-x0]*HeavisideThetaM[w+x0-x] * part2[x, x0,  \[Lambda], \[Alpha], w, \[Beta], Diff, L] +
+ HeavisideThetaM[x - (x0+w)]*HeavisideThetaM[L - x] * part3[x, x0,  \[Lambda], \[Alpha], w, \[Beta], Diff, L];
