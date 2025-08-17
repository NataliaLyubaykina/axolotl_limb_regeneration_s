(* ::Package:: *)

(* ::Input:: *)
(*Clear["Global`*"]*)


(* ::Input:: *)
(*Get[FileNameJoin[{NotebookDirectory[],"solutions_and_parameters","plotstyle.m"}]];*)
(*Get[FileNameJoin[{NotebookDirectory[],"solutions_and_parameters","colors.m"}]];*)
(*Get[FileNameJoin[{NotebookDirectory[],"solutions_and_parameters","model_parameters.m"}]];*)
(*Get[FileNameJoin[{NotebookDirectory[],"solutions_and_parameters","solutions.m"}]];*)


(* ::Input:: *)
(*Lv*)


(* ::Input:: *)
(*Llistv={4, 8};*)
(*accuracy=100;*)
(*bv=0.2 (*\[Lambda]= b L*);*)


(* ::Section:: *)
(*Plot style for morphogen profiles for L and 2L plot style*)


PlotSingleProfile[ x0_,  \[Lambda]_, \[Alpha]_, w_, \[Beta]_, Diff_, L_, color_] :=
 plotStyle[
  Show[
   ListPlot[
   Select[   Table[{x, SolutionSteady[x, x0, \[Lambda], \[Alpha], w, \[Beta], Diff, L]}, {x, 0, L, L/accuracy}], #[[2]] != 0 &], (*remove zeros assign at the edges of heaviside funcitons*)
    Joined->True,
    PlotStyle -> color,
    Frame -> True,
    FrameStyle -> Thick,
     FrameLabel -> None,
    FrameTicks -> None,
	AspectRatio -> 1/1
    ],
   Plot[
    0.1 *\[Alpha]*\[Chi][x, x0, w] , {x, x0, x0+w}, Filling -> Bottom, FillingStyle -> Directive[color, Opacity[0.5]], PlotStyle -> None
    ]
   ]
   ];


PlotProfiles[ x0list_,  \[Lambda]list_, \[Alpha]list_, wlist_, \[Beta]list_, Difflist_, Llist_, color_]:=
plotStyle[
Show[
{
Table[PlotSingleProfile[x0list[[i]],  \[Lambda]list[[i]], \[Alpha]list[[i]], wlist[[i]], \[Beta]list[[i]], Difflist[[i]], Llist[[i]], {color, Darker[color, 0.5]}[[i]]], {i, 1, Length[Llist]}]
},
PlotRange->{{0, Max[Llist]},{0, 1.8}},
AxesOrigin->{0, 0}
]
];


(* ::Section:: *)
(*\[Lambda] scaling sun-scenarios: D-scaling, mixed-scaling, \[Beta]-scaling*)


(* ::Input:: *)
(*\[Beta]scaling[b_, L_, \[Beta]_, Diff_]:=<|"\[Lambda]"->b*L,"\[Beta]"->Diff/(b*L)^2,"D"->Diff|>;*)
(*Dscaling[b_, L_, \[Beta]_, Diff_]:=<|"\[Lambda]"->b*L,"\[Beta]"->\[Beta],"D"->\[Beta]*(b*L)^2|>;*)
(*Mixscaling[b_, L_, \[Beta]_, Diff_]:=<|"\[Lambda]"->b*L,"\[Beta]"->1/(b*L),"D"->b*L|>;*)
(*lamscaling[b_, L_, \[Beta]_, Diff_]:=<|*)
(*"no"-><|"\[Lambda]"->Sqrt[Diff/\[Beta]],"\[Beta]"->\[Beta],"D"->Diff|>,*)
(*"Dscaling"->Dscaling[b, L, \[Beta], Diff],*)
(*"Mixscaling"->Mixscaling[b, L, \[Beta], Diff],*)
(*"Betascaling"->\[Beta]scaling[b, L, \[Beta], Diff]*)
(*|>;*)


colorslistv=<|
"no"->Gray,
"Dscaling"->Cyan,
"Mixscaling"->Orange,
"\[Beta]scaling"->Magenta
|>;

lamscalingv =  Table[ lamscaling[bv, L, \[Beta]v, Diffv], {L, Llistv}];


(* ::Subtitle:: *)
(*Plot save option is here!*)


PlotProfilesLambdaScaling[x0list_, \[Alpha]list_, wlist_, Llist_, colorslist_, lamscaling_, row_, source_]:= Do[
plots = {};
col=1;
For[
i=1,
i<5,
i++,
myPlot = PlotProfiles[ x0list,  lamscaling[[;;, i]][[;;, "\[Lambda]"]], \[Alpha]list, wlist, lamscaling[[;;, i]][[;;, "\[Beta]"]], lamscaling[[;;, i]][[;;, "D"]], Llist, colorslist[[i]]];
AppendTo[plots, myPlot];
(*Export["row"<>ToString[row]<>"_col"<>ToString[col]<>".eps", myPlot,"EPS"];*)
col=col+1;
];
Print[GraphicsRow[plots, ImageSize->{250*4, 250}]];
, 1
]


(* ::Section:: *)
(*Source scaling: \[Alpha], x0, w*)


(* ::Input:: *)
(*addElements[x_,y_]:=If[x==0,x+y,x];*)
(*sourcescaling[L_, \[Alpha]_, x0_, w_]:=Table[*)
(*{*)
(*StringRiffle[IntegerDigits[i, 2, 3] * {"a", "x", "w"}, ""], *)
(*AssociationThread[*)
(*{"a", "x0", "w"},*)
(*MapThread[addElements,{IntegerDigits[i, 2, 3] * {\[Alpha]v*L/Llistv[[1]], x0v*L/Llistv[[1]], wv*L/Llistv[[1]]} ,{\[Alpha],x0, w}}]*)
(*]*)
(*}, *)
(*{i,0,2^3-1}*)
(*];*)
(**)
(*sourcescalingv =  Table[ sourcescaling[L, \[Alpha]v, x0v, wv], {L, Llistv}];*)


(* ::Input:: *)
(*TableForm[sourcescalingv]*)


(* ::Input:: *)
(*k =2;*)
(*Print[k];*)
(*sourcei=sourcescalingv[[;;,  k]][[;;, 1]][[1]];*)
(*Print[sourcei];*)
(*PlotProfilesLambdaScaling[sourcescalingv[[;;,  k]][[;;, 2]][[;;, "x0"]], sourcescalingv[[;;,  k]][[;;, 2]][[;;, "a"]], sourcescalingv[[;;, k]][[;;, 2]][[;;, "w"]], Llistv, colorslistv, lamscalingv, k, ToString[sourcei]];*)



