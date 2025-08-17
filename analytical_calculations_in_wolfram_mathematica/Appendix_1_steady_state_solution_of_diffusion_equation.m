(* ::Package:: *)

(* ::Input:: *)
(*Clear["Global`*"]*)


(* ::Input:: *)
(*Get[FileNameJoin[{NotebookDirectory[],"solutions_and_parameters","plotstyle.m"}]];*)
(*Get[FileNameJoin[{NotebookDirectory[],"solutions_and_parameters","colors.m"}]];*)
(*Get[FileNameJoin[{NotebookDirectory[],"solutions_and_parameters","model_parameters.m"}]];*)


(* ::Section:: *)
(*The steady state solution in case of finite system size and extended source region*)


(* ::Subsection:: *)
(*Greens's function of D\[PartialD]^2-\[Beta] with reflecting boundaries *)


(* ::Input:: *)
(*GreenFunction[*)
(*{*)
(*\[Lambda]^2 * D[c[x], {x, 2}]- c[x],*)
(*c'[0]==0,*)
(*c'[L]==0*)
(*},*)
(*c[x],*)
(*{x,0,L},*)
(*s]*)


(* ::Input:: *)
(*FullSimplify[%]*)


(* ::Input:: *)
(*FullSimplify[-(((E^(L/\[Lambda])) (-1+Coth[L/\[Lambda]]) )/\[Lambda])/.\[Lambda]->Sqrt[Diff/\[Beta]]]*)


(* ::Input:: *)
(*-((Sqrt[\[Beta]] Csch[(L Sqrt[\[Beta]])/Sqrt[Diff]])/Sqrt[Diff])*)


G[x_, s_, Diff_, \[Beta]_, \[Lambda]_, L_]:=1/(\[Lambda] Sinh[L/\[Lambda]]) (Cosh[(L-s)/\[Lambda]] Cosh[x/\[Lambda]] HeavisideTheta[s-x]+Cosh[s/\[Lambda]] Cosh[(L-x)/\[Lambda]] HeavisideTheta[-s+x]);


(* ::Subsection:: *)
(*Looking for the solutions located: to the left of the source, within the source, and to the right of the source*)


(*the Heaviside step function, including zero*)
HeavisideThetaM[x_]:=Piecewise[{{0,x==0}},HeavisideTheta[x]];

\[Chi][x_, x0_,  w_]:= HeavisideThetaM[w + x0 - x] * HeavisideThetaM[x - x0];


(* ::Input:: *)
(*ruleSumSinh =Sinh[a_]+Sinh[b_]:>2 Sinh[(a+b)/2] Cosh[(a-b)/2];*)
(*ruleDiffSinh=Sinh[a_]-Sinh[b_]:>2 Cosh[(a+b)/2] Sinh[(a-b)/2];*)


(* ::Subsubsection:: *)
(*to the left of the source: 0 < x < x0*)


(* ::Input:: *)
(*Assuming[*)
(*w>0&&w<L&&x0>0&&x0<L&&w +x0<L&&x>0 (*all parameters are positive and inside the system [0, L]*)*)
(*&&x<x0,(*to the left of the source*)*)
(*Integrate[ \[Alpha]/\[Beta]  \[Chi][s, x0,  w ] * G[x, s, Diff, \[Beta], \[Lambda], L], {s, 0, L} ]*)
(*]*)


(* ::Input:: *)
(*FullSimplify[%]*)


(* ::Input:: *)
(*(Sinh[(L-x0)/\[Lambda]]+Sinh[(-L+w+x0)/\[Lambda]])/. ruleSumSinh*)
(**)


(* ::Input:: *)
(*Simplify[%]*)


part1[x_, x0_,  \[Lambda]_, \[Alpha]_, w_, \[Beta]_, Diff_, L_]:= (\[Alpha]  Csch[L/\[Lambda]])/(\[Beta]) 2 Sinh[w/(2 \[Lambda])]Cosh[(2 L-(w+2 x0))/(2 \[Lambda])] Cosh[x/\[Lambda]];


(* ::Subsubsection:: *)
(*within the source: x0 < x < x0 + w*)


(* ::Input:: *)
(*Assuming[*)
(*w>0&&w<L&&x0>0&&x0<L&&w +x0<L&&x>0 (*all parameters are positive and inside the system [0, L]*)*)
(*&&x>x0 &&x<x0+w ,(*within the source:x0 < x < x0+w*)*)
(*Integrate[ \[Alpha]/\[Beta]   \[Chi][s, x0,  w ] * G[x, s, Diff, \[Beta], \[Lambda], L], {s, 0, L} ]*)
(*]*)


(* ::Input:: *)
(*FullSimplify[%]*)


(* ::Input:: *)
(*TrigExpand[Cosh[(L-x)/\[Lambda]] (Sinh[x/\[Lambda]]-Sinh[x0/\[Lambda]])+Cosh[x/\[Lambda]] (Sinh[(L-x)/\[Lambda]]+Sinh[(-L+w+x0)/\[Lambda]])]*)


(* ::Input:: *)
(*%-Sinh[L/\[Lambda]]*)


(* ::Input:: *)
(*FullSimplify[%]*)


(* ::Input:: *)
(*(Sinh[(L-x+x0)/\[Lambda]]+Sinh[(-L+x+x0)/\[Lambda]])/. ruleSumSinh*)


(* ::Input:: *)
(*Simplify[%]*)


(* ::Input:: *)
(*(+Sinh[(-L+w+x+x0)/\[Lambda]]-Sinh[(L-w+x-x0)/\[Lambda]])/. ruleDiffSinh*)


(* ::Input:: *)
(*Simplify[%]*)


part2[x_, x0_,  \[Lambda]_, \[Alpha]_, w_, \[Beta]_, Diff_, L_]:= (\[Alpha]  Csch[L/\[Lambda]])/(\[Beta]) (
Sinh[L/\[Lambda]]-( Sinh[(L-(w+x0))/\[Lambda]]Cosh[x/\[Lambda]]+ Sinh[x0/\[Lambda]]Cosh[(L-x)/\[Lambda]])
);


(* ::Subsubsection:: *)
(*to the right of the source: x0 + w < x < L*)


(* ::Input:: *)
(*Assuming[*)
(*w>0&&w<L&&x0>0&&x0<L&&w +x0<L&&x>0 (*all parameters are positive and inside the system [0, L]*)*)
(*&&x>x0 + w && x<L,(*to the left of the source*)*)
(*Integrate[ \[Alpha]/\[Beta]  \[Chi][s, x0,  w ] * G[x, s, Diff, \[Beta], \[Lambda], L], {s, 0, L} ]*)
(*]*)


(* ::Input:: *)
(*FullSimplify[%]*)


(* ::Input:: *)
(*(Sinh[(w+x0)/\[Lambda]]-Sinh[x0/\[Lambda]])/. ruleDiffSinh*)


(* ::Input:: *)
(*Simplify[%]*)


part3[x_, x0_,  \[Lambda]_, \[Alpha]_, w_, \[Beta]_, Diff_, L_]:= (\[Alpha]  Csch[L/\[Lambda]])/(\[Beta]) (
2  Sinh[w/(2 \[Lambda])] Cosh[(w+2 x0)/(2 \[Lambda])] Cosh[(L-x)/\[Lambda]] 
);


(*steady state solution*)
SolutionSteady[x_, x0_,  \[Lambda]_, \[Alpha]_, w_, \[Beta]_, Diff_, L_]:= 
HeavisideThetaM[x0 - x]* HeavisideThetaM[x] *  part1[x, x0,  \[Lambda], \[Alpha], w, \[Beta], Diff, L] +
+ HeavisideThetaM[x-x0]*HeavisideThetaM[w+x0-x] * part2[x, x0,  \[Lambda], \[Alpha], w, \[Beta], Diff, L] +
+ HeavisideThetaM[x - (x0+w)]*HeavisideThetaM[L - x] * part3[x, x0,  \[Lambda], \[Alpha], w, \[Beta], Diff, L];


(* ::Subsection:: *)
(*Plot steady state solution*)


(* ::Input:: *)
(*plot1=plotStyle[*)
(*Show[*)
(*{*)
(*Plot[*)
(*SolutionSteady[x,x0v,  \[Lambda]v, \[Alpha]v,wv, \[Beta]v, Diffv, Lv], {x, 0, Lv},*)
(*PlotStyle->{colorsDict["Red"]}*)
(*],*)
(*Plot[*)
(*0.05*\[Chi][x, x0v, wv],  {x, 0,  Lv}, *)
(*Filling -> Bottom, *)
(*FillingStyle -> colorsDict["Red"],*)
(*PlotStyle -> None*)
(*]*)
(*},*)
(*AspectRatio->1/1,*)
(*PlotRange->{{0,Lv}, {0,1}},*)
(*FrameTicks->None,*)
(*FrameLabel->{"Position, x", "Concentration, s(x)"}*)
(*]*)
(*]*)


(* ::Input:: *)
(*plot2=plotStyle[*)
(*Show[*)
(*{*)
(*Plot[*)
(*SolutionSteady[x,Lv-wv-x0v,  \[Lambda]v, \[Alpha]v,wv, \[Beta]v, Diffv, Lv], {x, 0, Lv},*)
(*PlotStyle->{colorsDict["Blue"]}*)
(*],*)
(*Plot[*)
(*0.05*\[Chi][x, Lv-wv-x0v, wv],  {x, 0,  Lv}, *)
(*Filling -> Bottom, *)
(*FillingStyle -> colorsDict["Blue"],*)
(*PlotStyle -> None*)
(*]*)
(*},*)
(*AspectRatio->1/1,*)
(*PlotRange->{{0,Lv}, {0,1}},*)
(*FrameTicks->None,*)
(*FrameLabel->{"Position, x", "Concentration, f(x)"}*)
(*]*)
(*]*)


(* ::Section:: *)
(*Point source region (width w \[RightArrow] 0) localized at x0 = 0*)


(* ::Input:: *)
(*GreenFunction[*)
(*{*)
(*\[Lambda]^2 * D[c[x], {x, 2}]- c[x],*)
(*c'[0]==0,*)
(*c'[L]==0*)
(*},*)
(*c[x],*)
(*{x,0,L},*)
(*s]*)


(* ::Subsection:: *)
(*Looking for the solutions located: to the left of the source and to the right of the source*)


\[Chi]point[x_, x0_]:= DiracDelta[x - x0];


(* ::Subsubsection:: *)
(*to the left of the source: 0 < x < x0*)


(* ::Input:: *)
(*Assuming[*)
(*x0>0&&x0<L&&x>0 (*all parameters are positive and inside the system [0, L]*)*)
(*&&x<x0,(*to the left of the source*)*)
(*Integrate[ \[Alpha]/\[Beta]  \[Chi]point[s, x0] * G[x, s, Diff, \[Beta], \[Lambda], L], {s, 0, L} ]*)
(*]*)


(* ::Input:: *)
(*FullSimplify[%]*)


(* ::Subsubsection:: *)
(*to the right of the source: x0  < x < L*)


(* ::Input:: *)
(*Assuming[*)
(*x0>0&&x0<L&&x>0 (*all parameters are positive and inside the system [0, L]*)*)
(*&&x>x0  && x<L,(*to the left of the source*)*)
(*Integrate[ \[Alpha]/\[Beta]  \[Chi]point[s, x0] * G[x, s, Diff, \[Beta], \[Lambda], L], {s, 0, L} ]*)
(*]*)


(* ::Input:: *)
(*FullSimplify[%]*)


SolutionSteadyPoint[x_, x0_,  \[Lambda]_, \[Alpha]_, \[Beta]_, Diff_, L_]:= 
(\[Alpha] Csch[L/\[Lambda]])/(\[Beta] \[Lambda]) (
HeavisideThetaM[x0 - x]* HeavisideThetaM[x] *  Cosh[(L-x0)/\[Lambda]] * Cosh[x/\[Lambda]]   +
+ HeavisideThetaM[x - x0]*HeavisideThetaM[L - x] *  Cosh[x0/\[Lambda]] * Cosh[(L-x)/\[Lambda]]  );


(* ::Input:: *)
(*plot3=plotStyle[*)
(*Show[*)
(*{*)
(*Plot[*)
(*SolutionSteadyPoint[x,0.001,  \[Lambda]v, \[Alpha]v, \[Beta]v, Diffv, Lv], {x, 0, Lv},*)
(*PlotStyle->{colorsDict["Red"]}*)
(*]*)
(*},*)
(*AspectRatio->1/1,*)
(*PlotRange->{{0,Lv}, {0,1}},*)
(*FrameTicks->None,*)
(*FrameLabel->{"Position, x", "Concentration, s(x)"}*)
(*]*)
(*]*)


(* ::Input:: *)
(*plot4=plotStyle[*)
(*Show[*)
(*{*)
(*Plot[*)
(*SolutionSteadyPoint[x, Lv-0.001,  \[Lambda]v, \[Alpha]v, \[Beta]v, Diffv, Lv], {x, 0, Lv},*)
(*PlotStyle->{colorsDict["Blue"]}*)
(*]*)
(*},*)
(*AspectRatio->1/1,*)
(*PlotRange->{{0,Lv}, {0,1}},*)
(*FrameTicks->None,*)
(*FrameLabel->{"Position, x", "Concentration, f(x)"}*)
(*]*)
(*]*)


(* ::Section:: *)
(*Figure A1. Opposing gradients at left and right system boundaries*)


(* ::Input:: *)
(*GraphicsRow[ {plot1, plot3, plot2, plot4}, ImageSize->1200 ]*)


(* ::Section:: *)
(*Unbound system and point source region*)


(* ::Input:: *)
(*Limit[(\[Alpha]  Csch[L/\[Lambda]])/(w \[Beta])  Cosh[(L-x)/\[Lambda]] , L->+Infinity]*)


SolutionSteadyPointUnboundRight[x_, x0_,  \[Lambda]_, \[Alpha]_, \[Beta]_, Diff_]:=  \[Alpha]/(\[Beta] \[Lambda]) E^(-(x/\[Lambda]));


(* ::Input:: *)
(*plotStyle[*)
(*Show[*)
(*{*)
(*Plot[*)
(*{*)
(*SolutionSteady[x,x0v,  \[Lambda]v, \[Alpha]v,wv, \[Beta]v, Diffv, Lv],*)
(*SolutionSteadyPointUnboundRight[x-(x0v+wv/2),  \[Lambda]v, \[Alpha]v,wv, \[Beta]v, Diffv]/2*)
(*},*)
(* {x, 0, Lv},*)
(*PlotStyle->{colorsDict["Red"], {Black, Dashed}}*)
(*],*)
(*Plot[*)
(*0.05*\[Chi][x, x0v, wv],  {x, 0,  Lv}, *)
(*Filling -> Bottom, *)
(*FillingStyle -> colorsDict["Red"],*)
(*PlotStyle -> None*)
(*]*)
(*},*)
(*AspectRatio->1/1,*)
(*PlotRange->{{0,Lv}, {0,0.5}},*)
(*FrameTicks->None,*)
(*FrameLabel->{"Position, x", "Concentration, s(x)"}*)
(*]*)
(*]*)
