(* ::Package:: *)

(* ::Input:: *)
(*Clear["Global`*"]*)


(* ::Input:: *)
(*Get[FileNameJoin[{NotebookDirectory[],"solutions_and_parameters","plotstyle.m"}]];*)
(*Get[FileNameJoin[{NotebookDirectory[],"solutions_and_parameters","colors.m"}]];*)
(*Get[FileNameJoin[{NotebookDirectory[],"solutions_and_parameters","model_parameters.m"}]];*)
(*Get[FileNameJoin[{NotebookDirectory[],"solutions_and_parameters","solutions.m"}]];*)


(* ::Input:: *)
(*colorslistv=<|*)
(*"no"->Gray,*)
(*"Dscaling"->Cyan,*)
(*"Mixscaling"->Orange,*)
(*"\[Beta]scaling"->Magenta*)
(*|>;*)


(* ::Input:: *)
(*Lv = 2.5;*)
(*sc=2;*)
(**)
(*bv=0.25;*)
(*\[Theta]v=0.03;*)


(* ::Title:: *)
(*Combined 1: *)
(*SHH:  w dynamic, x0 dynamic, \[Lambda] dynamic*)
(*FGF8: w static,        x0 static,       \[Lambda]  static*)


\[Lambda]sc[b_,L_]:=b * L;

\[Beta]scD[b_, L_, \[Beta]ref_, Diffref_]:=\[Beta]ref;
DiffscD[b_, L_, \[Beta]ref_, Diffref_]:=\[Beta]ref*(b*L)^2;

\[Beta]scmix[b_, L_, \[Beta]ref_, Diffref_]:=(\[Beta]ref \!\(TraditionalForm\`
\*SqrtBox[\(Diffref/\[Beta]ref\)]\))/(b*L);
Diffscmix[b_, L_, \[Beta]ref_, Diffref_]:=(Diffref * (b*L) )/Sqrt[Diffref/\[Beta]ref];

\[Beta]sc\[Beta][b_, L_, \[Beta]ref_, Diffref_]:=Diffref/(b*L)^2;
Diffsc\[Beta][b_, L_, \[Beta]ref_, Diffref_]:=Diffref;


(* ::Title:: *)
(*cInters, during blastema growth*)


Show[
{
Table[
Plot[ SolutionSteady[x, bv*L, \[Lambda]v, \[Alpha]v, bv*L, \[Beta]v, Diffv, L], {x, 0, L}, PlotStyle->Red],
{L, 2*(x0v + wv), 5*Lv, (5*Lv-2*(x0v + wv))/4 }],
Table[
Plot[ SolutionSteady[x, L-x0v-wv, \[Lambda]v, \[Alpha]v, wv, \[Beta]v, Diffv, L], {x, 0, L}, PlotStyle->Blue],
{L, 2*(x0v + wv), 5*Lv, (5*Lv-2*(x0v + wv))/4 }]
},
PlotRange->{{0, 5Lv}, {0, 1}},
AxesOrigin->0
]


cInters[x01_, w1_, \[Beta]1_, Diff1_, x02_, w2_, \[Beta]2_, Diff2_, L_] := Module[
    {xValues, profile1, profile2, differences, closestIndex, xMiddle, nonZeroIndices},
    
    (* Generate x values from 0 to L with 100 points *)
    xValues = N[Range[0, L, L/50]];
    
    (* Calculate the steady-state profiles numerically *)
    profile1 = SolutionSteady[#, x01, Sqrt[Diff1/\[Beta]1], \[Alpha]v, w1, \[Beta]1, Diff1, L] & /@ xValues;
    profile2 = SolutionSteady[#, x02, Sqrt[Diff2/\[Beta]2], \[Alpha]v, w2, \[Beta]2, Diff2, L] & /@ xValues;
    
    (* Remove zeros from profiles *)
    nonZeroIndices = Select[Range[Length[profile1]], profile1[[#]] != 0 && profile2[[#]] != 0 &];
    profile1 = profile1[[nonZeroIndices]];
    profile2 = profile2[[nonZeroIndices]];
    xValues = xValues[[nonZeroIndices]];
    
    (* Compute the differences between the two profiles *)
    differences = Abs[profile1 - profile2];
    
    (* Find the index of the smallest difference *)
    closestIndex = FirstPosition[differences, Min[differences]][[1]];
    
    (* Find the corresponding x value *)
    xMiddle = xValues[[closestIndex]];
    
    SolutionSteady[xMiddle, x01, Sqrt[Diff1/\[Beta]1], \[Alpha]v, w1, \[Beta]1, Diff1, L]
];


Table[
cInters[bv*L (*x01*), bv*L (*w1*), \[Beta]v, Diffv, L-x0v-wv, wv, \[Beta]v, Diffv, L],
{L, 2*(x0v + wv), 5*Lv, (5*Lv-2*(x0v + wv))/4 }
]


plotStyle[
Plot[
{
cInters[bv*L (*x01*), bv*L (*w1*), \[Beta]v, Diffv, L-x0v-wv, wv, \[Beta]v, Diffv, L]
},
{L, 2*(x0v+wv), 5*Lv},
PlotRange->All(*{{0, 5*Lv}, {0, 1}},*),
FrameLabel->{"System size, L", "cInters"},
PlotStyle->Black
]
]


(* ::Title:: *)
(*Lfinal (L0)*)


accuracy=50;

LfinalTwo[\[Theta]_,b_,L0_]:=Module[
{LfinalTable,solutionsTable,closestIndex},(*Generate the tables for Lfinal and solutions*)
LfinalTable=Table[Lfinal,{Lfinal, 0.01, 5*L0, L0/accuracy}];
solutionsTable = Table[cInters[bv*Lfinal (*x01*), bv*Lfinal (*w1*), \[Beta]v, Diffv, Lfinal-x0v-wv, wv, \[Beta]v, Diffv, Lfinal],{Lfinal, LfinalTable}];
closestIndex=First@Ordering[Abs[solutionsTable-\[Theta]],1];
LfinalTable[[closestIndex]]];

LfinalTwoDsc[\[Theta]_,b_,L0_]:=Module[
{LfinalTable,solutionsTable,closestIndex},(*Generate the tables for Lfinal and solutions*)
LfinalTable=Table[Lfinal,{Lfinal,0.01,10*L0,L0/50}];
solutionsTable = Table[cInters[bv*Lfinal (*x01*), bv*Lfinal (*w1*), \[Beta]scD[b,L0,\[Beta]v,Diffv],DiffscD[b,L0,\[Beta]v,Diffv], Lfinal-x0v-wv, wv, \[Beta]v, Diffv, Lfinal],{Lfinal, LfinalTable}];
closestIndex=First@Ordering[Abs[solutionsTable-\[Theta]],1];
LfinalTable[[closestIndex]]];

LfinalTwoMixsc[\[Theta]_,b_,L0_]:=Module[
{LfinalTable,solutionsTable,closestIndex},(*Generate the tables for Lfinal and solutions*)
LfinalTable=Table[Lfinal,{Lfinal,0.01,10*L0,L0/50}];
solutionsTable = Table[cInters[bv*Lfinal (*x01*), bv*Lfinal (*w1*), \[Beta]scmix[b,L0,\[Beta]v,Diffv],Diffscmix[b,L0,\[Beta]v,Diffv], Lfinal-x0v-wv, wv, \[Beta]v, Diffv, Lfinal],{Lfinal, LfinalTable}];
closestIndex=First@Ordering[Abs[solutionsTable-\[Theta]],1];
LfinalTable[[closestIndex]]];

LfinalTwoBetasc[\[Theta]_,b_,L0_]:=Module[
{LfinalTable,solutionsTable,closestIndex},(*Generate the tables for Lfinal and solutions*)
LfinalTable=Table[Lfinal,{Lfinal,0.01,10*L0,L0/50}];
solutionsTable = Table[cInters[bv*Lfinal (*x01*), bv*Lfinal (*w1*), \[Beta]v, Diffv, Lfinal-x0v-wv, wv, \[Beta]sc\[Beta][b,L0,\[Beta]v,Diffv],Diffsc\[Beta][b,L0,\[Beta]v,Diffv], Lfinal],{Lfinal, LfinalTable}];
closestIndex=First@Ordering[Abs[solutionsTable-\[Theta]],1];
LfinalTable[[closestIndex]]];


plotStyle[Show[{ 
ListPlot[
{
Table[LfinalTwo[\[Theta]v, bv, L0], {L0, 2*(x0v+wv), 5*Lv, (5*Lv-2*(x0v + wv))/accuracy}],
Table[LfinalTwoDsc[\[Theta]v, bv, L0], {L0, 2*(x0v+wv), 5*Lv, (5*Lv-2*(x0v + wv))/accuracy}],
Table[LfinalTwoMixsc[\[Theta]v, bv, L0], {L0, 2*(x0v+wv), 5*Lv, (5*Lv-2*(x0v + wv))/accuracy}],
Table[LfinalTwoBetasc[\[Theta]v, bv, L0], {L0, 2*(x0v+wv), 5*Lv, (5*Lv-2*(x0v + wv))/accuracy}]
},
PlotStyle->{Black, Cyan, Orange, Magenta},
FrameLabel->{"L0", "Lfinal" },
PlotRange->{{0, 15},{0, 15}}
],
Plot[
L0, {L0, 0, 15},
PlotStyle->{{Dashed, Gray}},
Filling -> 0,
    FillingStyle -> Directive[Gray, Opacity[0.5]]
]
}]]
