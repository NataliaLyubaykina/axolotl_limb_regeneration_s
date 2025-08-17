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
(*Llistv={2.5, 5};*)
(*accuracy=100;*)
(*bv = 0.25;*)


(* ::Section:: *)
(*Plot style for morphogen profiles for L and 2L plot style*)


PlotSingleProfile[ x0_,  \[Lambda]_, \[Alpha]_, w_, \[Beta]_, Diff_, L_, color_] :=
 plotStyle[
  Show[
   ListPlot[
   Select[   Table[{x, SolutionSteady[x, x0, \[Lambda], \[Alpha], w, \[Beta], Diff, L]}, {x, 0, L, L/accuracy}], #[[2]] != 0 &], (*remove zeros assign at the edges of heaviside funcitons*)
    Joined->True,
    PlotStyle -> color,
	AspectRatio -> 1/1,
	AxesOrigin->{0, 0},
	FrameLabel->None,
	FrameTicks->None,
	PlotRange->{{0, 5},{0, 0.7}}
    ],
   Plot[
    0.1 *\[Alpha]*\[Chi][x, x0, w] , {x, x0, x0+w}, Filling -> Bottom, FillingStyle -> color, PlotStyle -> None
    ]
   ]
   ];


PlotProfiles[ x0list_,  \[Lambda]list_, \[Alpha]list_, wlist_, \[Beta]list_, Difflist_, Llist_, color_]:=
plotStyle[
Show[
{
Table[PlotSingleProfile[x0list[[i]],  \[Lambda]list[[i]], \[Alpha]list[[i]], wlist[[i]], \[Beta]list[[i]], Difflist[[i]], Llist[[i]], {color, Darker[color, 0.5]}[[i]]], {i, 1, Length[Llist]}]
}
]
];


(* ::Section:: *)
(*\[Lambda] scaling sun-scenarios: D-scaling, mixed-scaling, \[Beta]-scaling*)
(*\[Lambda]ref = Sqrt[Dref/\[Beta]ref]= b Lref just to make sure, that the profiles normalized to the reference profile*)
(*for proper visualization *)


(* ::Input:: *)
(*Dscaling[b_, L_, \[Beta]ref_, Diffref_]:=<|"\[Lambda]"->b*L,"\[Beta]"->\[Beta]ref,"D"->\[Beta]ref*(b*L)^2|>;*)
(**)
(*\[Beta]scaling[b_, L_, \[Beta]ref_, Diffref_]:=<|"\[Lambda]"->b*L,"\[Beta]"->Diffref/(b*L)^2,"D"->Diffref|>;*)
(**)
(*Mixscaling[b_, L_, \[Beta]ref_, Diffref_]:=<|"\[Lambda]"->b*L,"\[Beta]"->(\[Beta]ref \!\(TraditionalForm\`*)
(*\*SqrtBox[\(Diffref/\[Beta]ref\)]\))/(b*L),"D"->(Diffref * (b*L) )/Sqrt[Diffref/\[Beta]ref]|>;*)
(**)
(**)
(*lamscaling[b_, L_, \[Beta]ref_, Diffref_]:=<|*)
(*"no"-><|"\[Lambda]"->Sqrt[Diffref/\[Beta]ref],"\[Beta]"->\[Beta]ref,"D"->Diffref|>,*)
(*"Dscaling"->Dscaling[b, L, \[Beta]ref, Diffref],*)
(*"Mixscaling"->Mixscaling[b, L, \[Beta]ref, Diffref],*)
(*"Betascaling"->\[Beta]scaling[b, L, \[Beta]ref, Diffref]*)
(*|>;*)
(**)


colorslistv=<|
"no"->Gray,
"Dscaling"->Cyan,
"Mixscaling"->Orange,
"\[Beta]scaling"->Magenta
|>;

lamscalingv =  Table[ lamscaling[bv, L, \[Beta]v, Diffv], {L, Llistv}];


Llistv


lamscalingv


PlotProfilesLambdaScaling[x0list_, \[Alpha]list_, wlist_, Llist_, colorslist_, lamscaling_, row_, source_]:= Do[
plots = {};
col=1;
For[
i=1,
i<5,
i++,
myPlot = PlotProfiles[ x0list,  lamscaling[[;;, i]][[;;, "\[Lambda]"]], \[Alpha]list, wlist, lamscaling[[;;, i]][[;;, "\[Beta]"]], lamscaling[[;;, i]][[;;, "D"]], Llist, colorslist[[i]]];
AppendTo[plots, myPlot];
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
(*MapThread[addElements,{IntegerDigits[i, 2, 3] * {\[Alpha]v*L/Llistv[[1]], bv*L, bv*L} ,{\[Alpha],x0, w}}]*)
(*]*)
(*}, *)
(*{i,0,2^3-1}*)
(*];*)
(**)
(*sourcescalingv =  Table[ sourcescaling[L, \[Alpha]v, x0v, wv], {L, Llistv}];*)


(* ::Input:: *)
(*TableForm[sourcescalingv]*)


(* ::Input:: *)
(*k =4;*)
(*Print[k];*)
(*sourcei=sourcescalingv[[;;,  k]][[;;, 1]][[1]];*)
(*Print[sourcei];*)
(*PlotProfilesLambdaScaling[sourcescalingv[[;;,  k]][[;;, 2]][[;;, "x0"]], sourcescalingv[[;;,  k]][[;;, 2]][[;;, "a"]], sourcescalingv[[;;, k]][[;;, 2]][[;;, "w"]], Llistv, colorslistv, lamscalingv, k, ToString[sourcei]];*)


(* ::Title:: *)
(*Amplitudes and cmiddle*)


A[x0_, \[Lambda]_, \[Alpha]_, w_, \[Beta]_, Diff_, L_]:=Max[Table[SolutionSteady[x, x0, \[Lambda], \[Alpha], w, \[Beta], Diff, L], {x, 0, L, L/100}]];
cMiddle[x0_, \[Lambda]_, \[Alpha]_, w_, \[Beta]_, Diff_, L_]:=Table[SolutionSteady[x, x0, \[Lambda], \[Alpha], w, \[Beta], Diff, L], {x, 0, L, L/100}][[50]];


\[Lambda]sc[b_,L_]:=b * L;

\[Beta]scD[b_, L_, \[Beta]ref_, Diffref_]:=\[Beta]ref;
DiffscD[b_, L_, \[Beta]ref_, Diffref_]:=\[Beta]ref*(b*L)^2;

\[Beta]scmix[b_, L_, \[Beta]ref_, Diffref_]:=(\[Beta]ref \!\(TraditionalForm\`
\*SqrtBox[\(Diffref/\[Beta]ref\)]\))/(b*L);
Diffscmix[b_, L_, \[Beta]ref_, Diffref_]:=(Diffref * (b*L) )/Sqrt[Diffref/\[Beta]ref];

\[Beta]sc\[Beta][b_, L_, \[Beta]ref_, Diffref_]:=Diffref/(b*L)^2;
Diffsc\[Beta][b_, L_, \[Beta]ref_, Diffref_]:=Diffref;


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
{L, 0, 5*Lv},
PlotRange->{{0, 20*Lv}, {0, 1}},
FrameLabel->{"System size, L", "cMiddle"},
PlotStyle->{Black, Cyan, Orange, Magenta}
]
]


(* ::Title:: *)
(*Loop*)


For[
k=1,k<9,k++,

Print[k];
sourcei=sourcescalingv[[;;,  k]][[;;, 1]][[1]];
Print[sourcei];
PlotProfilesLambdaScaling[sourcescalingv[[;;,  k]][[;;, 2]][[;;, "x0"]], sourcescalingv[[;;,  k]][[;;, 2]][[;;, "a"]], sourcescalingv[[;;, k]][[;;, 2]][[;;, "w"]], Llistv, colorslistv, lamscalingv, k, ToString[sourcei]];
]



