/*
OpenCL RandomForestClassifier
classifier_class_name = ObjectSegmenter
feature_specification = gaussian_blur=1 difference_of_gaussian=1 laplace_box_of_gaussian_blur=1 sobel_of_gaussian_blur=1
num_ground_truth_dimensions = 3
num_classes = 2
num_features = 4
max_depth = 2
num_trees = 100
feature_importances = 0.15216714072914242,0.0008107470359571025,0.3339195116931719,0.5131026005417286
positive_class_identifier = 2
apoc_version = 0.12.0
*/
__kernel void predict (IMAGE_in0_TYPE in0, IMAGE_in1_TYPE in1, IMAGE_in2_TYPE in2, IMAGE_in3_TYPE in3, IMAGE_out_TYPE out) {
 sampler_t sampler = CLK_NORMALIZED_COORDS_FALSE | CLK_ADDRESS_CLAMP_TO_EDGE | CLK_FILTER_NEAREST;
 const int x = get_global_id(0);
 const int y = get_global_id(1);
 const int z = get_global_id(2);
 float i0 = READ_IMAGE(in0, sampler, POS_in0_INSTANCE(x,y,z,0)).x;
 float i1 = READ_IMAGE(in1, sampler, POS_in1_INSTANCE(x,y,z,0)).x;
 float i2 = READ_IMAGE(in2, sampler, POS_in2_INSTANCE(x,y,z,0)).x;
 float i3 = READ_IMAGE(in3, sampler, POS_in3_INSTANCE(x,y,z,0)).x;
 float s0=0;
 float s1=0;
if(i3<147074.1875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<157952.4375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<11014.25390625){
 if(i3<153610.484375){
  s0+=0.9995919200163232;
  s1+=0.00040807998367680065;
 } else {
  s1+=1.0;
 }
} else {
 if(i3<160471.03125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i0<11014.25390625){
 if(i0<8148.1640625){
  s0+=1.0;
 } else {
  s0+=0.8942307692307693;
  s1+=0.10576923076923077;
 }
} else {
 s1+=1.0;
}
if(i3<150484.140625){
 if(i3<132280.4375){
  s0+=1.0;
 } else {
  s0+=0.9230769230769231;
  s1+=0.07692307692307693;
 }
} else {
 s1+=1.0;
}
if(i3<158759.203125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<147074.1875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-249513.75){
 if(i2<-256090.65625){
  s1+=1.0;
 } else {
  s0+=0.25;
  s1+=0.75;
 }
} else {
 if(i2<-193536.9375){
  s0+=0.9557522123893806;
  s1+=0.04424778761061947;
 } else {
  s0+=1.0;
 }
}
if(i3<156425.375){
 if(i0<8150.7177734375){
  s0+=1.0;
 } else {
  s0+=0.9811320754716981;
  s1+=0.018867924528301886;
 }
} else {
 s1+=1.0;
}
if(i2<-258543.34375){
 s1+=1.0;
} else {
 if(i1<-600.341064453125){
  s0+=0.5;
  s1+=0.5;
 } else {
  s0+=0.9995894909688013;
  s1+=0.00041050903119868636;
 }
}
if(i3<156221.34375){
 if(i2<-209230.6875){
  s0+=0.9852941176470589;
  s1+=0.014705882352941176;
 } else {
  s0+=1.0;
 }
} else {
 s1+=1.0;
}
if(i2<-258871.78125){
 s1+=1.0;
} else {
 if(i3<146597.65625){
  s0+=0.9997950399672064;
  s1+=0.00020496003279360525;
 } else {
  s0+=0.25;
  s1+=0.75;
 }
}
if(i3<155944.3125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<11085.974609375){
 if(i3<144890.4375){
  s0+=0.9997953754859832;
  s1+=0.0002046245140167792;
 } else {
  s0+=0.08333333333333333;
  s1+=0.9166666666666666;
 }
} else {
 if(i2<-266224.09375){
  s1+=1.0;
 } else {
  s0+=1.0;
 }
}
if(i2<-256090.65625){
 s1+=1.0;
} else {
 if(i3<146597.65625){
  s0+=0.9997959183673469;
  s1+=0.00020408163265306123;
 } else {
  s1+=1.0;
 }
}
if(i0<11014.25390625){
 if(i2<-256090.65625){
  s1+=1.0;
 } else {
  s0+=0.9989747795776092;
  s1+=0.001025220422390814;
 }
} else {
 s1+=1.0;
}
if(i3<144613.96875){
 if(i2<-193536.9375){
  s0+=0.9903846153846154;
  s1+=0.009615384615384616;
 } else {
  s0+=1.0;
 }
} else {
 if(i2<-250051.890625){
  s1+=1.0;
 } else {
  s0+=0.16666666666666666;
  s1+=0.8333333333333334;
 }
}
if(i0<10706.236328125){
 if(i3<144151.875){
  s0+=1.0;
 } else {
  s0+=0.1111111111111111;
  s1+=0.8888888888888888;
 }
} else {
 if(i2<-267269.875){
  s1+=1.0;
 } else {
  s0+=1.0;
 }
}
if(i0<10706.236328125){
 if(i2<-256058.796875){
  s1+=1.0;
 } else {
  s0+=0.9991821713351053;
  s1+=0.0008178286648947046;
 }
} else {
 if(i0<11337.83203125){
  s0+=0.3333333333333333;
  s1+=0.6666666666666666;
 } else {
  s1+=1.0;
 }
}
if(i2<-256090.65625){
 s1+=1.0;
} else {
 if(i2<-247400.484375){
  s0+=0.6666666666666666;
  s1+=0.3333333333333333;
 } else {
  s0+=0.9995906672124437;
  s1+=0.00040933278755628325;
 }
}
if(i3<144151.875){
 s0+=1.0;
} else {
 if(i2<-247270.78125){
  s1+=1.0;
 } else {
  s0+=0.25;
  s1+=0.75;
 }
}
if(i2<-256090.65625){
 s1+=1.0;
} else {
 if(i3<156425.375){
  s0+=0.9997960432388334;
  s1+=0.00020395676116663266;
 } else {
  s1+=1.0;
 }
}
if(i2<-249156.75){
 if(i3<149907.484375){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i3<160767.3125){
  s0+=0.9995913363302003;
  s1+=0.0004086636697997548;
 } else {
  s1+=1.0;
 }
}
if(i3<156221.34375){
 if(i3<132280.4375){
  s0+=1.0;
 } else {
  s0+=0.9;
  s1+=0.1;
 }
} else {
 s1+=1.0;
}
if(i3<156221.34375){
 if(i1<-411.278076171875){
  s0+=0.9473684210526315;
  s1+=0.05263157894736842;
 } else {
  s0+=1.0;
 }
} else {
 s1+=1.0;
}
if(i2<-256090.65625){
 s1+=1.0;
} else {
 if(i3<156221.34375){
  s0+=0.99979633401222;
  s1+=0.00020366598778004074;
 } else {
  s1+=1.0;
 }
}
if(i3<147074.1875){
 s0+=1.0;
} else {
 if(i3<156221.34375){
  s0+=0.3333333333333333;
  s1+=0.6666666666666666;
 } else {
  s1+=1.0;
 }
}
if(i2<-249513.75){
 if(i3<147458.53125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i0<8150.7177734375){
  s0+=1.0;
 } else {
  s0+=0.9705882352941176;
  s1+=0.029411764705882353;
 }
}
if(i3<147074.1875){
 if(i3<132338.03125){
  s0+=1.0;
 } else {
  s0+=0.8928571428571429;
  s1+=0.10714285714285714;
 }
} else {
 if(i3<156221.34375){
  s0+=0.5;
  s1+=0.5;
 } else {
  s1+=1.0;
 }
}
if(i2<-256090.65625){
 s1+=1.0;
} else {
 if(i2<-222722.03125){
  s0+=0.8918918918918919;
  s1+=0.10810810810810811;
 } else {
  s0+=0.9997944501541624;
  s1+=0.00020554984583761563;
 }
}
if(i2<-256090.65625){
 s1+=1.0;
} else {
 if(i3<156221.34375){
  s0+=0.9993854977468251;
  s1+=0.0006145022531749283;
 } else {
  s1+=1.0;
 }
}
if(i2<-256090.65625){
 s1+=1.0;
} else {
 if(i3<156221.34375){
  s0+=0.9997950399672064;
  s1+=0.00020496003279360525;
 } else {
  s1+=1.0;
 }
}
if(i2<-255762.234375){
 s1+=1.0;
} else {
 if(i3<146597.65625){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i0<11417.693359375){
 if(i1<-600.341064453125){
  s1+=1.0;
 } else {
  s0+=0.9975445058317987;
  s1+=0.0024554941682013503;
 }
} else {
 s1+=1.0;
}
if(i2<-258871.78125){
 s1+=1.0;
} else {
 if(i3<147074.1875){
  s0+=0.999795584627964;
  s1+=0.0002044153720359771;
 } else {
  s0+=0.16666666666666666;
  s1+=0.8333333333333334;
 }
}
if(i3<153406.453125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<146597.65625){
 if(i3<132280.4375){
  s0+=1.0;
 } else {
  s0+=0.92;
  s1+=0.08;
 }
} else {
 if(i3<156425.375){
  s0+=0.5;
  s1+=0.5;
 } else {
  s1+=1.0;
 }
}
if(i3<147074.1875){
 if(i1<-411.278076171875){
  s0+=0.9444444444444444;
  s1+=0.05555555555555555;
 } else {
  s0+=1.0;
 }
} else {
 if(i2<-244035.875){
  s1+=1.0;
 } else {
  s0+=0.3333333333333333;
  s1+=0.6666666666666666;
 }
}
if(i3<156221.34375){
 if(i3<146597.65625){
  s0+=0.9997951659156084;
  s1+=0.00020483408439164277;
 } else {
  s0+=0.75;
  s1+=0.25;
 }
} else {
 s1+=1.0;
}
if(i3<156221.34375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<147074.1875){
 if(i3<132338.03125){
  s0+=1.0;
 } else {
  s0+=0.96;
  s1+=0.04;
 }
} else {
 if(i3<158759.203125){
  s0+=0.3333333333333333;
  s1+=0.6666666666666666;
 } else {
  s1+=1.0;
 }
}
if(i2<-266224.09375){
 s1+=1.0;
} else {
 if(i3<146597.65625){
  s0+=0.9995909183882185;
  s1+=0.00040908161178155044;
 } else {
  s0+=0.3333333333333333;
  s1+=0.6666666666666666;
 }
}
if(i3<151222.71875){
 if(i3<132280.4375){
  s0+=1.0;
 } else {
  s0+=0.9411764705882353;
  s1+=0.058823529411764705;
 }
} else {
 s1+=1.0;
}
if(i3<147074.1875){
 if(i2<-193299.9375){
  s0+=0.9905660377358491;
  s1+=0.009433962264150943;
 } else {
  s0+=1.0;
 }
} else {
 s1+=1.0;
}
if(i0<11337.83203125){
 if(i3<156221.34375){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 s1+=1.0;
}
if(i2<-258543.34375){
 s1+=1.0;
} else {
 if(i3<156425.375){
  s0+=0.9995898277276456;
  s1+=0.00041017227235438887;
 } else {
  s1+=1.0;
 }
}
if(i2<-249513.75){
 if(i2<-255762.234375){
  s1+=1.0;
 } else {
  s0+=0.5;
  s1+=0.5;
 }
} else {
 if(i1<-411.278076171875){
  s0+=0.972972972972973;
  s1+=0.02702702702702703;
 } else {
  s0+=0.9997945768282662;
  s1+=0.00020542317173377156;
 }
}
if(i3<147074.1875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<147074.1875){
 if(i3<132338.03125){
  s0+=1.0;
 } else {
  s0+=0.9130434782608695;
  s1+=0.08695652173913043;
 }
} else {
 s1+=1.0;
}
if(i3<153406.453125){
 if(i1<-411.278076171875){
  s0+=0.926829268292683;
  s1+=0.07317073170731707;
 } else {
  s0+=1.0;
 }
} else {
 s1+=1.0;
}
if(i2<-256090.65625){
 s1+=1.0;
} else {
 if(i2<-210202.3125){
  s0+=0.9516129032258065;
  s1+=0.04838709677419355;
 } else {
  s0+=0.9997937719117344;
  s1+=0.00020622808826562179;
 }
}
if(i3<146597.65625){
 if(i2<-193299.9375){
  s0+=0.9821428571428571;
  s1+=0.017857142857142856;
 } else {
  s0+=1.0;
 }
} else {
 s1+=1.0;
}
if(i2<-258543.34375){
 s1+=1.0;
} else {
 if(i1<-599.30029296875){
  s0+=0.6;
  s1+=0.4;
 } else {
  s0+=0.9997956264050685;
  s1+=0.00020437359493153485;
 }
}
if(i3<147074.1875){
 if(i1<-411.278076171875){
  s0+=0.9142857142857143;
  s1+=0.08571428571428572;
 } else {
  s0+=1.0;
 }
} else {
 if(i3<156221.34375){
  s0+=0.3333333333333333;
  s1+=0.6666666666666666;
 } else {
  s1+=1.0;
 }
}
if(i3<156425.375){
 if(i1<-411.278076171875){
  s0+=0.9574468085106383;
  s1+=0.0425531914893617;
 } else {
  s0+=1.0;
 }
} else {
 s1+=1.0;
}
if(i3<156425.375){
 if(i1<-411.278076171875){
  s0+=0.868421052631579;
  s1+=0.13157894736842105;
 } else {
  s0+=1.0;
 }
} else {
 s1+=1.0;
}
if(i3<147074.1875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-247757.46875){
 if(i3<152929.9375){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i3<158759.203125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i3<146597.65625){
 if(i3<132338.03125){
  s0+=1.0;
 } else {
  s0+=0.9166666666666666;
  s1+=0.08333333333333333;
 }
} else {
 s1+=1.0;
}
if(i3<156221.34375){
 if(i3<132280.4375){
  s0+=1.0;
 } else {
  s0+=0.9615384615384616;
  s1+=0.038461538461538464;
 }
} else {
 s1+=1.0;
}
if(i3<158759.203125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-249156.75){
 if(i3<147662.5625){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i3<158759.203125){
  s0+=0.9997944923962186;
  s1+=0.0002055076037813399;
 } else {
  s1+=1.0;
 }
}
if(i3<153610.484375){
 if(i3<132338.03125){
  s0+=1.0;
 } else {
  s0+=0.8888888888888888;
  s1+=0.1111111111111111;
 }
} else {
 s1+=1.0;
}
if(i0<11014.25390625){
 if(i3<147074.1875){
  s0+=0.9997952917093142;
  s1+=0.00020470829068577277;
 } else {
  s1+=1.0;
 }
} else {
 s1+=1.0;
}
if(i0<10916.17578125){
 if(i0<8148.1640625){
  s0+=0.9995849761361278;
  s1+=0.0004150238638721727;
 } else {
  s0+=0.9120879120879121;
  s1+=0.08791208791208792;
 }
} else {
 if(i3<160471.03125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i3<156221.34375){
 if(i3<146597.65625){
  s0+=0.999796126401631;
  s1+=0.00020387359836901122;
 } else {
  s0+=0.6666666666666666;
  s1+=0.3333333333333333;
 }
} else {
 s1+=1.0;
}
if(i0<11014.25390625){
 if(i2<-258871.78125){
  s1+=1.0;
 } else {
  s0+=0.9995902479000205;
  s1+=0.0004097520999795124;
 }
} else {
 if(i2<-265842.625){
  s1+=1.0;
 } else {
  s0+=1.0;
 }
}
if(i2<-267598.28125){
 s1+=1.0;
} else {
 if(i1<-534.705810546875){
  s0+=0.5714285714285714;
  s1+=0.42857142857142855;
 } else {
  s0+=0.9987722529158993;
  s1+=0.0012277470841006752;
 }
}
if(i2<-249156.75){
 if(i3<149703.453125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i3<158759.203125){
  s0+=0.9995913363302003;
  s1+=0.0004086636697997548;
 } else {
  s1+=1.0;
 }
}
if(i0<10987.896484375){
 if(i3<156221.34375){
  s0+=0.9997960848287113;
  s1+=0.0002039151712887439;
 } else {
  s1+=1.0;
 }
} else {
 if(i2<-268796.53125){
  s1+=1.0;
 } else {
  s0+=1.0;
 }
}
if(i0<11337.83203125){
 if(i0<8484.490234375){
  s0+=1.0;
 } else {
  s0+=0.8356164383561644;
  s1+=0.1643835616438356;
 }
} else {
 s1+=1.0;
}
if(i3<147074.1875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-267979.75){
 s1+=1.0;
} else {
 if(i3<147074.1875){
  s0+=1.0;
 } else {
  s0+=0.16666666666666666;
  s1+=0.8333333333333334;
 }
}
if(i3<156221.34375){
 if(i3<132338.03125){
  s0+=1.0;
 } else {
  s0+=0.7894736842105263;
  s1+=0.21052631578947367;
 }
} else {
 s1+=1.0;
}
if(i3<158759.203125){
 if(i3<146597.65625){
  s0+=1.0;
 } else {
  s0+=0.75;
  s1+=0.25;
 }
} else {
 s1+=1.0;
}
if(i0<11014.25390625){
 if(i3<144890.4375){
  s0+=0.9995901639344262;
  s1+=0.0004098360655737705;
 } else {
  s1+=1.0;
 }
} else {
 if(i0<11915.1875){
  s0+=0.2;
  s1+=0.8;
 } else {
  s1+=1.0;
 }
}
if(i3<156425.375){
 if(i1<-409.943115234375){
  s0+=0.9302325581395349;
  s1+=0.06976744186046512;
 } else {
  s0+=1.0;
 }
} else {
 s1+=1.0;
}
if(i2<-270552.1875){
 s1+=1.0;
} else {
 if(i1<-526.5482177734375){
  s0+=0.3333333333333333;
  s1+=0.6666666666666666;
 } else {
  s0+=0.9991838400326464;
  s1+=0.0008161599673536013;
 }
}
if(i0<10676.83203125){
 if(i3<147074.1875){
  s0+=0.9991816693944353;
  s1+=0.0008183306055646482;
 } else {
  s0+=0.08333333333333333;
  s1+=0.9166666666666666;
 }
} else {
 if(i3<158494.78125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i3<156221.34375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<10706.236328125){
 if(i3<144613.96875){
  s0+=0.9997953754859832;
  s1+=0.0002046245140167792;
 } else {
  s1+=1.0;
 }
} else {
 if(i3<160471.03125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i3<147074.1875){
 if(i2<-193299.9375){
  s0+=0.991304347826087;
  s1+=0.008695652173913044;
 } else {
  s0+=1.0;
 }
} else {
 s1+=1.0;
}
if(i2<-256090.65625){
 s1+=1.0;
} else {
 if(i3<151426.75){
  s0+=0.9997956264050685;
  s1+=0.00020437359493153485;
 } else {
  s1+=1.0;
 }
}
if(i3<146597.65625){
 s0+=1.0;
} else {
 if(i2<-244392.875){
  s1+=1.0;
 } else {
  s0+=0.14285714285714285;
  s1+=0.8571428571428571;
 }
}
if(i3<156221.34375){
 if(i3<146597.65625){
  s0+=0.9997950819672131;
  s1+=0.00020491803278688525;
 } else {
  s0+=0.6666666666666666;
  s1+=0.3333333333333333;
 }
} else {
 s1+=1.0;
}
if(i2<-247288.28125){
 if(i0<11337.83203125){
  s0+=0.125;
  s1+=0.875;
 } else {
  s1+=1.0;
 }
} else {
 if(i3<144151.875){
  s0+=0.9997957516339869;
  s1+=0.0002042483660130719;
 } else {
  s0+=0.4;
  s1+=0.6;
 }
}
if(i3<156221.34375){
 if(i2<-193299.9375){
  s0+=0.9807692307692307;
  s1+=0.019230769230769232;
 } else {
  s0+=1.0;
 }
} else {
 s1+=1.0;
}
if(i2<-256090.65625){
 s1+=1.0;
} else {
 if(i1<-521.581298828125){
  s0+=0.5;
  s1+=0.5;
 } else {
  s0+=0.9989783408255006;
  s1+=0.001021659174499387;
 }
}
if(i2<-256090.65625){
 s1+=1.0;
} else {
 if(i2<-210202.3125){
  s0+=0.8983050847457628;
  s1+=0.1016949152542373;
 } else {
  s0+=0.9997928319867413;
  s1+=0.00020716801325875285;
 }
}
if(i2<-247757.46875){
 if(i3<149703.453125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i3<147074.1875){
  s0+=0.9997954173486089;
  s1+=0.00020458265139116204;
 } else {
  s0+=0.25;
  s1+=0.75;
 }
}
if(i3<147074.1875){
 if(i3<132338.03125){
  s0+=1.0;
 } else {
  s0+=0.9354838709677419;
  s1+=0.06451612903225806;
 }
} else {
 if(i3<156221.34375){
  s0+=0.5;
  s1+=0.5;
 } else {
  s1+=1.0;
 }
}
if(i3<146597.65625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<147074.1875){
 s0+=1.0;
} else {
 if(i0<10665.03125){
  s0+=0.1;
  s1+=0.9;
 } else {
  s1+=1.0;
 }
}
if(i3<146597.65625){
 if(i3<132280.4375){
  s0+=1.0;
 } else {
  s0+=0.875;
  s1+=0.125;
 }
} else {
 if(i3<156221.34375){
  s0+=0.5;
  s1+=0.5;
 } else {
  s1+=1.0;
 }
}
if(i2<-256090.65625){
 s1+=1.0;
} else {
 if(i3<156425.375){
  s0+=0.9997964997964998;
  s1+=0.0002035002035002035;
 } else {
  s1+=1.0;
 }
}
if(i3<153406.453125){
 if(i1<-409.943115234375){
  s0+=0.967741935483871;
  s1+=0.03225806451612903;
 } else {
  s0+=1.0;
 }
} else {
 s1+=1.0;
}
if(i2<-255762.234375){
 s1+=1.0;
} else {
 if(i3<147074.1875){
  s0+=0.9993865030674847;
  s1+=0.0006134969325153375;
 } else {
  s0+=0.25;
  s1+=0.75;
 }
}
if(i2<-249513.75){
 if(i3<147458.53125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i2<-193299.9375){
  s0+=0.9375;
  s1+=0.0625;
 } else {
  s0+=1.0;
 }
}
if(i3<144890.4375){
 if(i1<-411.278076171875){
  s0+=0.972972972972973;
  s1+=0.02702702702702703;
 } else {
  s0+=1.0;
 }
} else {
 if(i3<158759.203125){
  s0+=0.3333333333333333;
  s1+=0.6666666666666666;
 } else {
  s1+=1.0;
 }
}
if(i2<-256090.65625){
 s1+=1.0;
} else {
 if(i3<146597.65625){
  s0+=0.999795207864018;
  s1+=0.00020479213598197828;
 } else {
  s1+=1.0;
 }
}
 float max_s=s0;
 int cls=1;
 if (max_s < s1) {
  max_s = s1;
  cls=2;
 }
 WRITE_IMAGE (out, POS_out_INSTANCE(x,y,z,0), cls);
}