(* ::Package:: *)

(* ::Input:: *)
(*Clear["Global`*"]*)


(* ::Input:: *)
(*Get[FileNameJoin[{NotebookDirectory[],"solutions_and_parameters","plotstyle.m"}]];*)
(*Get[FileNameJoin[{NotebookDirectory[],"solutions_and_parameters","colors.m"}]];*)
(*Get[FileNameJoin[{NotebookDirectory[],"solutions_and_parameters","model_parameters.m"}]];*)
(*Get[FileNameJoin[{NotebookDirectory[],"solutions_and_parameters","solutions.m"}]];*)


Lv=4;
x0v=0.2*Lv;
wv=0.2*Lv;


(* ::Subsubsection:: *)
(*Plot steady state solution*)


SolutionSteadyPointUnboundRight[x_, \[Alpha]_, w_, \[Beta]_, Diff_]:=  \[Alpha] * w/(2 Sqrt[Diff \[Beta]]) E^(-Abs[x/Sqrt[Diff/\[Beta]]]);


(* ::Input:: *)
(*plotStyle[*)
(*Show[*)
(*{*)
(*Plot[*)
(*{*)
(*SolutionSteady[x,x0v,  \[Lambda]v, \[Alpha]v,wv, \[Beta]v, Diffv, Lv], SolutionSteadyPointUnboundRight[x - (x0v + wv/2), \[Alpha]v, wv, \[Beta]v, Diffv]*)
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
(*PlotRange->{{0,Lv}, {0,0.4}},*)
(*FrameTicks->None,*)
(*FrameLabel->{"Position, x", "Concentration, s(x)"}*)
(*]*)
(*]*)
