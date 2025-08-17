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
(*Static scaling with animal size*)


\[Lambda]sc[b_,L_]:=b * L;

\[Beta]scD[b_, L_, \[Beta]ref_, Diffref_]:=\[Beta]ref;
DiffscD[b_, L_, \[Beta]ref_, Diffref_]:=\[Beta]ref*(b*L)^2;

\[Beta]scmix[b_, L_, \[Beta]ref_, Diffref_]:=(\[Beta]ref \!\(TraditionalForm\`
\*SqrtBox[\(Diffref/\[Beta]ref\)]\))/(b*L);
Diffscmix[b_, L_, \[Beta]ref_, Diffref_]:=(Diffref * (b*L) )/Sqrt[Diffref/\[Beta]ref];

\[Beta]sc\[Beta][b_, L_, \[Beta]ref_, Diffref_]:=Diffref/(b*L)^2;
Diffsc\[Beta][b_, L_, \[Beta]ref_, Diffref_]:=Diffref;


(* ::Input:: *)
(*PlotSolid[x_, x0_, \[Lambda]_, \[Alpha]_, w_, \[Beta]_, Diff_,  L_, color_]:=*)
(*plotStyle[Show[*)
(*{Plot[*)
(*SolutionSteady[x, x0, \[Lambda], \[Alpha], w, \[Beta], Diff, L],*)
(*{x, 0, L},*)
(*PlotStyle->color, *)
(*AspectRatio -> 1/1,*)
(*AxesOrigin->{0, 0},*)
(*FrameLabel->None,*)
(*FrameTicks->None,*)
(*PlotRange->{{0,12.01`},{0,0.7}}*)
(*],*)
(* Plot[*)
(*    0.1 *\[Alpha]*\[Chi][x, x0, w] , {x, x0, x0+w}, Filling -> Bottom, FillingStyle -> Directive[color, Opacity[0.5]], PlotStyle -> None*)
(*    ]}*)
(*]];*)
(**)
(*PlotDashed[x_, x0_, \[Lambda]_, \[Alpha]_, w_, \[Beta]_, Diff_,  L_, color_]:=*)
(*plotStyle[Show[*)
(*Plot[*)
(*SolutionSteady[x, x0, \[Lambda], \[Alpha], w, \[Beta], Diff, L],*)
(*{x, 0, L},*)
(*PlotStyle->{color, Dashed},*)
(*AspectRatio -> 1/1,*)
(*AxesOrigin->{0, 0},*)
(*FrameLabel->None,*)
(*FrameTicks->None,*)
(*PlotRange->{{0,12.01`},{0,0.7}}*)
(*]*)
(*]];*)


(* ::Title:: *)
(*Amplitudes and cmiddle*)


A[x0_, \[Lambda]_, \[Alpha]_, w_, \[Beta]_, Diff_, L_]:=Max[Table[SolutionSteady[x, x0, \[Lambda], \[Alpha], w, \[Beta], Diff, L], {x, 0, L, L/100}]];
cMiddle[x0_, \[Lambda]_, \[Alpha]_, w_, \[Beta]_, Diff_, L_]:=Table[SolutionSteady[x, x0, \[Lambda], \[Alpha], w, \[Beta], Diff, L], {x, 0, L, L/100}][[50]];


plotStyle[
Plot[
{
A[bv*L (*x0*), \[Lambda]v, \[Alpha]v, bv*L(*w*), \[Beta]v, Diffv, L],
A[bv*L, \[Lambda]sc[bv, L], \[Alpha]v, bv*L, \[Beta]scD[bv, L, \[Beta]v, Diffv], DiffscD[bv, L, \[Beta]v, Diffv], L],
A[bv*L, \[Lambda]sc[bv, L], \[Alpha]v, bv*L, \[Beta]scmix[bv, L, \[Beta]v, Diffv], Diffscmix[bv, L, \[Beta]v, Diffv], L],
A[bv*L, \[Lambda]sc[bv, L], \[Alpha]v, bv*L, \[Beta]sc\[Beta][bv, L, \[Beta]v, Diffv], Diffsc\[Beta][bv, L, \[Beta]v, Diffv], L]
},
{L, 0, 5*Lv},
PlotRange->{{0, 5*Lv}, {0, 4}},
FrameLabel->{"System size, L", "A"},
PlotStyle->{Black, Cyan, Orange, Magenta}
]
]


plotStyle[
Plot[
{
cMiddle[bv*L (*x0*), \[Lambda]v, \[Alpha]v, bv*L(*w*), \[Beta]v, Diffv, L],
cMiddle[bv*L, \[Lambda]sc[bv, L], \[Alpha]v, bv*L, \[Beta]scD[bv, L, \[Beta]v, Diffv], DiffscD[bv, L, \[Beta]v, Diffv], L],
cMiddle[bv*L, \[Lambda]sc[bv, L], \[Alpha]v, bv*L, \[Beta]scmix[bv, L, \[Beta]v, Diffv], Diffscmix[bv, L, \[Beta]v, Diffv], L],
cMiddle[bv*L, \[Lambda]sc[bv, L], \[Alpha]v, bv*L, \[Beta]sc\[Beta][bv, L, \[Beta]v, Diffv], Diffsc\[Beta][bv, L, \[Beta]v, Diffv], L]
},
{L, 0, 20*Lv},
PlotRange->{{0, 20*Lv}, {0, 1}},
FrameLabel->{"System size, L", "cMiddle"},
PlotStyle->{Black, Cyan, Orange, Magenta}
]
]


(* ::Title:: *)
(*Two-morphogen growth rule*)


(* ::Section:: *)
(*Final system size as function of model parameters*)


(* ::Input:: *)
(*LfinalTwo[\[Theta]_,b_,L0_]:=Module[*)
(*{LfinalTable,solutionsTable,closestIndex},(*Generate the tables for Lfinal and solutions*)*)
(*LfinalTable=Table[Lfinal,{Lfinal,0.01,10*L0,L0/50}];*)
(*solutionsTable=Table[SolutionSteady[Lfinal/2,b*L0(*x0*),\[Lambda]v(*\[Lambda]*),\[Alpha]v,b*L0(*w*),\[Beta]v,Diffv,Lfinal],{Lfinal,LfinalTable}];*)
(*closestIndex=First@Ordering[Abs[solutionsTable-\[Theta]],1];*)
(*LfinalTable[[closestIndex]]];*)
(**)
(*LfinalTwoDsc[\[Theta]_,b_,L0_]:=Module[*)
(*{LfinalTable,solutionsTable,closestIndex},(*Generate the tables for Lfinal and solutions*)*)
(*LfinalTable=Table[Lfinal,{Lfinal,0.01,10*L0,L0/50}];*)
(*solutionsTable=Table[SolutionSteady[Lfinal/2,b*L0(*x0*),b*L0(*\[Lambda]*),\[Alpha]v,b*L0(*w*),\[Beta]scD[b,L0,\[Beta]v,Diffv],DiffscD[b,L0,\[Beta]v,Diffv],Lfinal],{Lfinal,LfinalTable}];*)
(*closestIndex=First@Ordering[Abs[solutionsTable-\[Theta]],1];*)
(*LfinalTable[[closestIndex]]];*)
(**)
(*LfinalTwoMixsc[\[Theta]_,b_,L0_]:=Module[*)
(*{LfinalTable,solutionsTable,closestIndex},(*Generate the tables for Lfinal and solutions*)*)
(*LfinalTable=Table[Lfinal,{Lfinal,0.01,10*L0,L0/50}];*)
(*solutionsTable=Table[SolutionSteady[Lfinal/2,b*L0(*x0*),b*L0(*\[Lambda]*),\[Alpha]v,b*L0(*w*),\[Beta]scmix[b,L0,\[Beta]v,Diffv],Diffscmix[b,L0,\[Beta]v,Diffv],Lfinal],{Lfinal,LfinalTable}];*)
(*closestIndex=First@Ordering[Abs[solutionsTable-\[Theta]],1];*)
(*LfinalTable[[closestIndex]]];*)
(**)
(*LfinalTwoBetasc[\[Theta]_,b_,L0_]:=Module[*)
(*{LfinalTable,solutionsTable,closestIndex},(*Generate the tables for Lfinal and solutions*)*)
(*LfinalTable=Table[Lfinal,{Lfinal,0.01,10*L0,L0/50}];*)
(*solutionsTable=Table[SolutionSteady[Lfinal/2,b*L0(*x0*),b*L0(*\[Lambda]*),\[Alpha]v,b*L0(*w*),\[Beta]sc\[Beta][b,L0,\[Beta]v,Diffv],Diffsc\[Beta][b,L0,\[Beta]v,Diffv],Lfinal],{Lfinal,LfinalTable}];*)
(*closestIndex=First@Ordering[Abs[solutionsTable-\[Theta]],1];*)
(*LfinalTable[[closestIndex]]];*)


(* ::Input:: *)
(*plotStyle[Show[{ *)
(*Plot[*)
(*{*)
(*LfinalTwo[\[Theta]v, bv,L0],*)
(*LfinalTwoDsc[\[Theta]v, bv,L0], *)
(*LfinalTwoMixsc[\[Theta]v, bv,L0],*)
(*LfinalTwoBetasc[\[Theta]v, bv,L0]*)
(*},*)
(*{L0, 0.1, 15},*)
(*PlotStyle->{Black, Cyan, Orange, Magenta},*)
(*FrameLabel->{"L0", "Lfinal" },*)
(*PlotRange->{{0, 15},{0, 15}}*)
(*],*)
(*Plot[*)
(*L0, {L0, 0, 15},*)
(*PlotStyle->{{Dashed, Gray}},*)
(*Filling -> 0,*)
(*    FillingStyle -> Directive[Gray, Opacity[0.5]]*)
(*]*)
(*}]]*)


(* ::Section:: *)
(*Profiles*)


(* ::Input:: *)
(*LfinalTwoBetasc[\[Theta]v,bv,Lv*sc]*)


(* ::Input:: *)
(*GraphicsRow[*)
(*{*)
(*Show[*)
(*ReleaseHold[Hold[PlotSolid[x,bv*L,\[Lambda]v,\[Alpha]v,bv*L,\[Beta]v,Diffv,L,Darker[Gray, 0.5]]]/. L->sc*Lv],ReleaseHold[Hold[PlotSolid[x,bv*L,\[Lambda]v,\[Alpha]v,bv*L,\[Beta]v,Diffv,L,Gray]]/. L->Lv],ReleaseHold[Hold[PlotDashed[x,bv*L,\[Lambda]v,\[Alpha]v,bv*L,\[Beta]v,Diffv,LfinalTwo[\[Theta]v,bv,L],Darker[Gray, 0.5]]]/. L->sc*Lv],ReleaseHold[Hold[PlotDashed[x,bv*L,\[Lambda]v,\[Alpha]v,bv*L,\[Beta]v,Diffv,LfinalTwo[\[Theta]v,bv,L],Gray]]/. L->Lv]*)
(*],*)
(**)
(*Show[{ReleaseHold[Hold[PlotSolid[x,bv*L,\[Lambda]sc[bv,L],\[Alpha]v,bv*L,\[Beta]scD[bv,L,\[Beta]v,Diffv],DiffscD[bv,L,\[Beta]v,Diffv],L,Darker[Cyan,0.5]]]/. L->sc*Lv],*)
(*ReleaseHold[Hold[PlotSolid[x,bv*L,\[Lambda]sc[bv,L],\[Alpha]v,bv*L,\[Beta]scD[bv,L,\[Beta]v,Diffv],DiffscD[bv,L,\[Beta]v,Diffv],L,Cyan]]/. L->Lv],ReleaseHold[Hold[PlotDashed[x,bv*L,\[Lambda]sc[bv,L],\[Alpha]v,bv*L,\[Beta]scD[bv,L,\[Beta]v,Diffv],DiffscD[bv,L,\[Beta]v,Diffv],LfinalTwoDsc[\[Theta]v,bv,L],Darker[Cyan,0.5]]]/. L->sc*Lv],ReleaseHold[Hold[PlotDashed[x,bv*L,\[Lambda]sc[bv,L],\[Alpha]v,bv*L,\[Beta]scD[bv,L,\[Beta]v,Diffv],DiffscD[bv,L,\[Beta]v,Diffv],LfinalTwoDsc[\[Theta]v,bv,L],Cyan]]/. L->Lv]}],*)
(**)
(*Show[{ReleaseHold[Hold[PlotSolid[x,bv*L,\[Lambda]sc[bv,L],\[Alpha]v,bv*L,\[Beta]scmix[bv,L,\[Beta]v,Diffv],Diffscmix[bv,L,\[Beta]v,Diffv],L,Darker[Yellow,0.5]]]/. L->sc*Lv],ReleaseHold[Hold[PlotSolid[x,bv*L,\[Lambda]sc[bv,L],\[Alpha]v,bv*L,\[Beta]scmix[bv,L,\[Beta]v,Diffv],Diffscmix[bv,L,\[Beta]v,Diffv],L,Darker[Yellow,0.25]]]/. L->Lv],ReleaseHold[Hold[PlotDashed[x,bv*L,\[Lambda]sc[bv,L],\[Alpha]v,bv*L,\[Beta]scmix[bv,L,\[Beta]v,Diffv],Diffscmix[bv,L,\[Beta]v,Diffv],LfinalTwoMixsc[\[Theta]v,bv,L],Darker[Yellow,0.5]]]/. L->sc*Lv],ReleaseHold[Hold[PlotDashed[x,bv*L,\[Lambda]sc[bv,L],\[Alpha]v,bv*L,\[Beta]scmix[bv,L,\[Beta]v,Diffv],Diffscmix[bv,L,\[Beta]v,Diffv],LfinalTwoMixsc[\[Theta]v,bv,L],Darker[Yellow,0.25]]]/. L->Lv]}],*)
(**)
(*Show[{*)
(*ReleaseHold[Hold[PlotSolid[x,bv*L,\[Lambda]sc[bv,L],\[Alpha]v,bv*L,\[Beta]sc\[Beta][bv,L,\[Beta]v,Diffv],Diffsc\[Beta][bv,L,\[Beta]v,Diffv],L,Darker[Magenta,0.5]]]/. L->sc*Lv],ReleaseHold[Hold[PlotSolid[x,bv*L,\[Lambda]sc[bv,L],\[Alpha]v,bv*L,\[Beta]sc\[Beta][bv,L,\[Beta]v,Diffv],Diffsc\[Beta][bv,L,\[Beta]v,Diffv],L,Magenta]]/. L->Lv],ReleaseHold[Hold[PlotDashed[x,bv*L,\[Lambda]sc[bv,L],\[Alpha]v,bv*L,\[Beta]sc\[Beta][bv,L,\[Beta]v,Diffv],Diffsc\[Beta][bv,L,\[Beta]v,Diffv],LfinalTwoBetasc[\[Theta]v,bv,L],Darker[Magenta,0.5]]]/. L->sc*Lv],ReleaseHold[Hold[PlotDashed[x,bv*L,\[Lambda]sc[bv,L],\[Alpha]v,bv*L,\[Beta]sc\[Beta][bv,L,\[Beta]v,Diffv],Diffsc\[Beta][bv,L,\[Beta]v,Diffv],LfinalTwoBetasc[\[Theta]v,bv,L],Magenta]]/. L->Lv]*)
(*}]*)
(*},ImageSize->{250*4, 250}]*)
