(* ::Package:: *)

plotStyle[plot_] := Show[ 
plot, 
Frame -> True, 
LabelStyle -> {FontFamily -> "Times", 18, Black}, 
AxesOrigin -> {0, 0}, 
ImageResolution->300,
FrameStyle->{{Thickness[0.01], Black}, {Thickness[0.01], Black}, {Thickness[0.01], Black}, {Thickness[0.01], Black}}
];
