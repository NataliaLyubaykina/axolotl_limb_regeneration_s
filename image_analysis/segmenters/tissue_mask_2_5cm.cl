/*
OpenCL RandomForestClassifier
classifier_class_name = ObjectSegmenter
feature_specification = original gaussian_blur=1 sobel_of_gaussian_blur=1
num_ground_truth_dimensions = 3
num_classes = 2
num_features = 3
max_depth = 2
num_trees = 100
feature_importances = 0.2978092740427233,0.43149310689351067,0.270697619063766
positive_class_identifier = 2
apoc_version = 0.12.0
*/
__kernel void predict (IMAGE_in0_TYPE in0, IMAGE_in1_TYPE in1, IMAGE_in2_TYPE in2, IMAGE_out_TYPE out) {
 sampler_t sampler = CLK_NORMALIZED_COORDS_FALSE | CLK_ADDRESS_CLAMP_TO_EDGE | CLK_FILTER_NEAREST;
 const int x = get_global_id(0);
 const int y = get_global_id(1);
 const int z = get_global_id(2);
 float i0 = READ_IMAGE(in0, sampler, POS_in0_INSTANCE(x,y,z,0)).x;
 float i1 = READ_IMAGE(in1, sampler, POS_in1_INSTANCE(x,y,z,0)).x;
 float i2 = READ_IMAGE(in2, sampler, POS_in2_INSTANCE(x,y,z,0)).x;
 float s0=0;
 float s1=0;
if(i2<62375.453125){
 if(i0<6023.0){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 s1+=1.0;
}
if(i0<1546.5){
 if(i2<71103.765625){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i1<2352.179931640625){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i0<1761.0){
 if(i2<69904.8046875){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i1<2219.490234375){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i1<2764.8115234375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1546.5){
 if(i2<71109.1875){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i0<2147.0){
  s0+=0.16666666666666666;
  s1+=0.8333333333333334;
 } else {
  s1+=1.0;
 }
}
if(i1<2770.63720703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<62375.453125){
 if(i1<5717.6162109375){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 s1+=1.0;
}
if(i1<2764.8115234375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i1<2764.8115234375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1374.0){
 if(i0<987.5){
  s0+=1.0;
 } else {
  s0+=0.7894736842105263;
  s1+=0.21052631578947367;
 }
} else {
 if(i0<2147.0){
  s0+=0.25;
  s1+=0.75;
 } else {
  s1+=1.0;
 }
}
if(i1<2764.8115234375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i1<2764.8115234375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<62370.02734375){
 if(i0<9738.5){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 s1+=1.0;
}
if(i2<62375.453125){
 if(i1<5717.6162109375){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 s1+=1.0;
}
if(i0<1761.0){
 if(i2<71363.25){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i0<2147.0){
  s0+=0.06666666666666667;
  s1+=0.9333333333333333;
 } else {
  s0+=0.000683526999316473;
  s1+=0.9993164730006835;
 }
}
if(i2<62370.02734375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i1<2764.8115234375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1761.0){
 if(i2<71109.1875){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 s1+=1.0;
}
if(i1<2764.8115234375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i1<2770.63720703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<64045.31640625){
 if(i2<54703.33203125){
  s0+=1.0;
 } else {
  s0+=0.8260869565217391;
  s1+=0.17391304347826086;
 }
} else {
 s1+=1.0;
}
if(i0<1761.0){
 if(i1<2894.82470703125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 s1+=1.0;
}
if(i0<1374.0){
 if(i0<987.5){
  s0+=1.0;
 } else {
  s0+=0.6666666666666666;
  s1+=0.3333333333333333;
 }
} else {
 if(i1<2652.1474609375){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i0<1374.0){
 if(i2<71363.25){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i0<1761.0){
  s0+=0.5;
  s1+=0.5;
 } else {
  s0+=0.0020147750167897917;
  s1+=0.9979852249832102;
 }
}
if(i1<2764.8115234375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1374.0){
 if(i0<987.5){
  s0+=1.0;
 } else {
  s0+=0.9411764705882353;
  s1+=0.058823529411764705;
 }
} else {
 if(i0<1761.0){
  s0+=0.5;
  s1+=0.5;
 } else {
  s0+=0.0006770480704129993;
  s1+=0.999322951929587;
 }
}
if(i0<1374.0){
 if(i1<2767.927490234375){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i1<2506.55810546875){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i2<65565.1484375){
 if(i2<60070.8671875){
  s0+=1.0;
 } else {
  s0+=0.8333333333333334;
  s1+=0.16666666666666666;
 }
} else {
 s1+=1.0;
}
if(i2<59886.578125){
 if(i2<54703.33203125){
  s0+=1.0;
 } else {
  s0+=0.875;
  s1+=0.125;
 }
} else {
 if(i2<64050.7421875){
  s0+=0.3333333333333333;
  s1+=0.6666666666666666;
 } else {
  s1+=1.0;
 }
}
if(i0<1761.0){
 if(i1<2770.63720703125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i0<3854.0){
  s0+=0.06060606060606061;
  s1+=0.9393939393939394;
 } else {
  s1+=1.0;
 }
}
if(i1<2764.8115234375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<62375.453125){
 if(i1<5735.53369140625){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 s1+=1.0;
}
if(i1<2762.10205078125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1374.0){
 if(i2<71363.25){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i1<2506.55810546875){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i1<2773.6064453125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<60996.2265625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1761.0){
 if(i2<69904.8046875){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i1<2452.80419921875){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i1<2593.878662109375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i1<2770.63720703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<62370.02734375){
 if(i2<59886.578125){
  s0+=0.9997086247086248;
  s1+=0.0002913752913752914;
 } else {
  s0+=0.5;
  s1+=0.5;
 }
} else {
 s1+=1.0;
}
if(i1<2798.723876953125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<62375.453125){
 if(i1<5717.6162109375){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 s1+=1.0;
}
if(i1<2764.8115234375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1374.0){
 if(i1<2770.63720703125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i2<50359.78125){
  s0+=1.0;
 } else {
  s0+=0.0006798096532970768;
  s1+=0.9993201903467029;
 }
}
if(i2<60070.8671875){
 if(i1<5887.490234375){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i0<966.5){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i1<2764.8115234375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<987.5){
 s0+=1.0;
} else {
 if(i0<1761.0){
  s0+=0.4473684210526316;
  s1+=0.5526315789473685;
 } else {
  s0+=0.0020718232044198894;
  s1+=0.9979281767955801;
 }
}
if(i1<2764.8115234375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1761.0){
 if(i2<71109.1875){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i1<2219.490234375){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i1<2764.8115234375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<62375.453125){
 if(i2<54650.1484375){
  s0+=1.0;
 } else {
  s0+=0.8;
  s1+=0.2;
 }
} else {
 s1+=1.0;
}
if(i1<2762.10205078125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i1<2764.8115234375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i1<2773.6064453125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i1<2762.10205078125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1374.0){
 if(i1<2773.6064453125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i1<2556.0380859375){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i1<2762.10205078125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<62370.02734375){
 if(i2<57668.3671875){
  s0+=1.0;
 } else {
  s0+=0.8181818181818182;
  s1+=0.18181818181818182;
 }
} else {
 s1+=1.0;
}
if(i2<64770.44140625){
 if(i2<57668.3671875){
  s0+=1.0;
 } else {
  s0+=0.5714285714285714;
  s1+=0.42857142857142855;
 }
} else {
 s1+=1.0;
}
if(i1<2764.8115234375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1761.0){
 if(i1<2770.63720703125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i0<3854.0){
  s0+=0.04838709677419355;
  s1+=0.9516129032258065;
 } else {
  s1+=1.0;
 }
}
if(i1<2770.63720703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1761.0){
 if(i2<69840.8828125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i0<3854.0){
  s0+=0.07792207792207792;
  s1+=0.922077922077922;
 } else {
  s1+=1.0;
 }
}
if(i2<64045.31640625){
 if(i0<7001.5){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 s1+=1.0;
}
if(i0<1761.0){
 if(i1<2892.114990234375){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i0<3854.0){
  s0+=0.014285714285714285;
  s1+=0.9857142857142858;
 } else {
  s1+=1.0;
 }
}
if(i2<62370.02734375){
 if(i0<6023.0){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 s1+=1.0;
}
if(i1<2859.834716796875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i1<2764.8115234375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<62375.453125){
 if(i0<8128.0){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 s1+=1.0;
}
if(i0<1761.0){
 if(i2<71353.640625){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i2<45368.3828125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i1<2762.10205078125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i1<2764.8115234375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<62375.453125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1374.0){
 if(i1<2770.89697265625){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i2<51506.48828125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i1<2702.614501953125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1374.0){
 if(i2<69904.8046875){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i0<1761.0){
  s0+=0.3;
  s1+=0.7;
 } else {
  s0+=0.002592352559948153;
  s1+=0.9974076474400518;
 }
}
if(i1<2764.8115234375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i1<2767.927490234375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<64050.7421875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i1<2702.614501953125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<59886.578125){
 if(i1<5887.490234375){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 s1+=1.0;
}
if(i2<64050.7421875){
 if(i1<5717.6162109375){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 s1+=1.0;
}
if(i0<1761.0){
 if(i1<2770.63720703125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i2<50262.56640625){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i1<2764.8115234375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1761.0){
 if(i1<2773.6064453125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 s1+=1.0;
}
if(i0<1761.0){
 if(i0<987.5){
  s0+=1.0;
 } else {
  s0+=0.55;
  s1+=0.45;
 }
} else {
 if(i1<2550.536865234375){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i1<2773.6064453125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1374.0){
 if(i1<2770.63720703125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i1<2556.0380859375){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i2<64770.44140625){
 if(i0<4896.5){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 s1+=1.0;
}
if(i0<1374.0){
 if(i0<987.5){
  s0+=1.0;
 } else {
  s0+=0.8;
  s1+=0.2;
 }
} else {
 if(i2<57613.421875){
  s0+=0.9;
  s1+=0.1;
 } else {
  s1+=1.0;
 }
}
if(i0<1374.0){
 if(i2<76419.8125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i0<1761.0){
  s0+=0.25;
  s1+=0.75;
 } else {
  s0+=0.0007067137809187279;
  s1+=0.9992932862190813;
 }
}
if(i1<2764.8115234375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<62370.02734375){
 if(i2<59886.578125){
  s0+=0.999418942475305;
  s1+=0.0005810575246949448;
 } else {
  s0+=0.5;
  s1+=0.5;
 }
} else {
 s1+=1.0;
}
if(i2<60070.8671875){
 if(i1<5735.53369140625){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i2<62375.453125){
  s0+=0.3333333333333333;
  s1+=0.6666666666666666;
 } else {
  s1+=1.0;
 }
}
if(i1<2764.8115234375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<59578.203125){
 if(i2<57668.3671875){
  s0+=0.9997099767981439;
  s1+=0.0002900232018561485;
 } else {
  s0+=0.625;
  s1+=0.375;
 }
} else {
 if(i2<62375.453125){
  s0+=0.3333333333333333;
  s1+=0.6666666666666666;
 } else {
  s1+=1.0;
 }
}
if(i1<2770.63720703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i1<2764.8115234375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i1<2770.63720703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i1<2770.63720703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
 float max_s=s0;
 int cls=1;
 if (max_s < s1) {
  max_s = s1;
  cls=2;
 }
 WRITE_IMAGE (out, POS_out_INSTANCE(x,y,z,0), cls);
}