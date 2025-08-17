(* ::Package:: *)

(* ::Input:: *)
(*Clear["Global`*"]*)


(* ::Input:: *)
(*Get[FileNameJoin[{NotebookDirectory[],"solutions_and_parameters","plotstyle.m"}]];*)
(*Get[FileNameJoin[{NotebookDirectory[],"solutions_and_parameters","colors.m"}]];*)
(*Get[FileNameJoin[{NotebookDirectory[],"solutions_and_parameters","model_parameters.m"}]];*)
(*Get[FileNameJoin[{NotebookDirectory[],"solutions_and_parameters","solutions.m"}]];*)


Lv


k = 0.2;(*proportionality coefficient \[Lambda] = k L*)
cmax = 0.5;
Llistv = {2, 4, 8};


(* ::Title:: *)
(*A. Dynamic scaling with blastema size (D-scaling)*)


(* ::Input:: *)
(*OnePlot[i_, Llist_, cmax_]:=*)
(*plotStyle[*)
(*Show[*)
(*{*)
(*Plot[*)
(*{*)
(*SolutionSteady[x, k*Llist[[i]] (*x0*), k*Llist[[i]] (*\[Lambda]*), \[Alpha]v, k*Llist[[i]](*w*), \[Beta]v, Diffv*(k*Llist[[i]])^2(*D-scaling*), Llist[[i]]], SolutionSteady[x, Llist[[i]] - k*Llist[[i]] - k*Llist[[i]](*x0*), k*Llist[[i]] (*\[Lambda]*), \[Alpha]v, k*Llist[[i]](*w*), \[Beta]v, Diffv*(k*Llist[[i]])^2(*D-scaling*), Llist[[i]]]*)
(*}, *)
(*{x, 0, Llist[[i]]},*)
(*PlotStyle->{colorsDict["Red"], colorsDict["Blue"],  {colorsDict["Gray"], Dashed}},*)
(*PlotRange->All*)
(*] ,*)
(*Plot[*)
(*0.1*\[Alpha]v*\[Chi][x, k*Llist[[i]], k*Llist[[i]]], *)
(*{x,0,  Llist[[i]]}, *)
(*Filling -> Bottom, *)
(*FillingStyle -> colorsDict["Red"], *)
(*PlotStyle -> None*)
(*],*)
(*Plot[*)
(*0.1*\[Alpha]v*\[Chi][x, Llist[[i]]-k*Llist[[i]]-k*Llist[[i]], k*Llist[[i]]], *)
(*{x,0,  Llist[[i]]}, *)
(*Filling -> Bottom, *)
(*FillingStyle -> colorsDict["Blue"], *)
(*PlotStyle -> None*)
(*]*)
(*},*)
(*AxesOrigin->{0, 0},*)
(*AspectRatio->1/1,*)
(*PlotRange->{{0,  Max[Llistv]},{0, cmax}},*)
(*FrameStyle->Black,*)
(*FrameTicks->None*)
(*]*)
(*];*)


(* ::Input:: *)
(*GraphicsRow[*)
(*Table[OnePlot[i, Llistv[[1;;2]], 0.5], {i, 1,Length[ Llistv[[1;;2]]]}]*)
(*]*)


(* ::Title:: *)
(*Scaling with animal size*)


(* ::Input:: *)
(*OnePlot[i_, Llist_, cmax_]:=*)
(*plotStyle[*)
(*Show[*)
(*{*)
(*Plot[*)
(*{*)
(*SolutionSteady[x, k*Llist[[1]](*x0*), k*Llist[[1]](*\[Lambda]*), \[Alpha]v, k*Llist[[1]](*w*), \[Beta]v, Diffv*(k*Llist[[1]])^2(*D-scaling*), Llist[[i]]],*)
(*SolutionSteady[x, Llist[[i]] - k*Llist[[1]] - k*Llist[[1]](*x0*), k*Llist[[1]](*\[Lambda]*), \[Alpha]v, k*Llist[[1]](*w*), \[Beta]v, Diffv*(k*Llist[[1]])^2(*D-scaling*), Llist[[i]]]*)
(*}, *)
(*{x, 0, Llist[[i]]},*)
(*PlotStyle->{colorsDict["Red"], colorsDict["Blue"],  {colorsDict["Gray"], Dashed}},*)
(*PlotRange->All*)
(*] ,*)
(*Plot[*)
(*0.1*\[Alpha]v*\[Chi][x, k*Llist[[1]], k*Llist[[1]]],*)
(*{x,0,  Llist[[i]]}, *)
(*Filling -> Bottom, *)
(*FillingStyle -> colorsDict["Red"], *)
(*PlotStyle -> None*)
(*],*)
(*Plot[*)
(*0.1*\[Alpha]v*\[Chi][x, Llist[[i]]-k*Llist[[1]]-k*Llist[[1]], k*Llist[[1]]], *)
(*{x,0,  Llist[[i]]}, *)
(*Filling -> Bottom, *)
(*FillingStyle -> colorsDict["Blue"], *)
(*PlotStyle -> None*)
(*]*)
(*},*)
(*AxesOrigin->{0, 0},*)
(*AspectRatio->1/1,*)
(*PlotRange->{{0,  Max[Llistv]},{0, cmax}},*)
(*FrameStyle->Black,*)
(*FrameTicks->None*)
(*]*)
(*];*)


(* ::Input:: *)
(*GraphicsRow[*)
(*Table[OnePlot[i, Llistv[[1;;2]], 0.5], {i, 1,Length[Llistv[[1;;2]]]}]*)
(*]*)


(* ::Input:: *)
(*GraphicsRow[*)
(*Table[OnePlot[i, Llistv[[2;;3]], 0.5], {i, 1,Length[Llistv[[2;;3]]]}]*)
(*]*)
