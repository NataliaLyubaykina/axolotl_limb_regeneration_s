/*
OpenCL RandomForestClassifier
classifier_class_name = ObjectSegmenter
feature_specification = original gaussian_blur=1 sobel_of_gaussian_blur=1
num_ground_truth_dimensions = 2
num_classes = 2
num_features = 3
max_depth = 2
num_trees = 100
feature_importances = 0.2986914211739589,0.4376288132300189,0.2636797655960223
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
if(i2<1322.937255859375){
 if(i0<1374.5){
  s0+=1.0;
 } else {
  s0+=0.02702702702702703;
  s1+=0.972972972972973;
 }
} else {
 if(i0<966.5){
  s0+=0.5862068965517241;
  s1+=0.41379310344827586;
 } else {
  s1+=1.0;
 }
}
if(i0<1374.0){
 if(i2<1829.721923828125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i1<1309.3885498046875){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i0<1374.0){
 if(i2<2125.20947265625){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i1<1384.2041015625){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i1<1454.6268310546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1374.0){
 if(i2<2074.385986328125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i0<1568.0){
  s0+=0.038461538461538464;
  s1+=0.9615384615384616;
 } else {
  s1+=1.0;
 }
}
if(i1<1454.6268310546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<1224.9854736328125){
 if(i1<2016.755615234375){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i1<1362.1279296875){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i1<1454.6268310546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i1<1528.912109375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1374.0){
 if(i0<987.5){
  s0+=0.9937321937321937;
  s1+=0.0062678062678062675;
 } else {
  s0+=0.6818181818181818;
  s1+=0.3181818181818182;
 }
} else {
 if(i0<2319.5){
  s0+=0.09090909090909091;
  s1+=0.9090909090909091;
 } else {
  s1+=1.0;
 }
}
if(i1<1454.6268310546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i1<1519.6212158203125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<1227.53076171875){
 if(i0<1740.0){
  s0+=1.0;
 } else {
  s0+=0.02631578947368421;
  s1+=0.9736842105263158;
 }
} else {
 if(i0<193.5){
  s0+=1.0;
 } else {
  s0+=0.004437869822485207;
  s1+=0.9955621301775148;
 }
}
if(i2<1377.50244140625){
 if(i1<2004.308349609375){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i2<1733.0426025390625){
  s0+=0.15384615384615385;
  s1+=0.8461538461538461;
 } else {
  s1+=1.0;
 }
}
if(i0<1374.0){
 if(i2<1829.721923828125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i0<1954.0){
  s0+=0.017241379310344827;
  s1+=0.9827586206896551;
 } else {
  s1+=1.0;
 }
}
if(i2<1225.244140625){
 if(i0<1954.0){
  s0+=1.0;
 } else {
  s0+=0.02564102564102564;
  s1+=0.9743589743589743;
 }
} else {
 if(i0<193.5){
  s0+=1.0;
 } else {
  s0+=0.0030840400925212026;
  s1+=0.9969159599074788;
 }
}
if(i1<1454.6268310546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1374.0){
 if(i2<2125.20947265625){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 s1+=1.0;
}
if(i1<1445.3359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i1<1454.6268310546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<1377.50244140625){
 if(i2<805.794189453125){
  s0+=0.9926153846153846;
  s1+=0.0073846153846153844;
 } else {
  s0+=0.7327586206896551;
  s1+=0.2672413793103448;
 }
} else {
 if(i2<1733.0426025390625){
  s0+=0.1;
  s1+=0.9;
 } else {
  s1+=1.0;
 }
}
if(i0<1374.0){
 if(i1<1546.732421875){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i1<1454.6268310546875){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i0<1374.0){
 if(i0<987.5){
  s0+=0.995875073659399;
  s1+=0.0041249263406010605;
 } else {
  s0+=0.5789473684210527;
  s1+=0.42105263157894735;
 }
} else {
 if(i1<1528.912109375){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i0<1374.0){
 if(i2<2125.20947265625){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i0<2319.5){
  s0+=0.06153846153846154;
  s1+=0.9384615384615385;
 } else {
  s1+=1.0;
 }
}
if(i1<1454.6268310546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1374.0){
 if(i0<580.0){
  s0+=0.9993804213135068;
  s1+=0.0006195786864931846;
 } else {
  s0+=0.8333333333333334;
  s1+=0.16666666666666666;
 }
} else {
 if(i0<2319.5){
  s0+=0.046153846153846156;
  s1+=0.9538461538461539;
 } else {
  s1+=1.0;
 }
}
if(i0<1374.0){
 if(i1<1546.732421875){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i1<1528.912109375){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i2<1322.937255859375){
 if(i2<907.076416015625){
  s0+=0.9941690962099126;
  s1+=0.0058309037900874635;
 } else {
  s0+=0.7230769230769231;
  s1+=0.27692307692307694;
 }
} else {
 if(i0<966.5){
  s0+=0.5;
  s1+=0.5;
 } else {
  s1+=1.0;
 }
}
if(i2<1224.9854736328125){
 if(i2<871.5687255859375){
  s0+=0.9910554561717353;
  s1+=0.008944543828264758;
 } else {
  s0+=0.6417910447761194;
  s1+=0.3582089552238806;
 }
} else {
 if(i2<1827.390625){
  s0+=0.16393442622950818;
  s1+=0.8360655737704918;
 } else {
  s1+=1.0;
 }
}
if(i0<1374.0){
 if(i1<1598.8603515625){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i0<2319.5){
  s0+=0.0410958904109589;
  s1+=0.958904109589041;
 } else {
  s1+=1.0;
 }
}
if(i1<1454.6268310546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<1224.9854736328125){
 if(i1<1924.375732421875){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i1<1394.6466064453125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i1<1454.6268310546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1374.0){
 if(i2<1778.8984375){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i1<1454.6268310546875){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i1<1454.6268310546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<1377.50244140625){
 if(i0<1374.5){
  s0+=1.0;
 } else {
  s0+=0.08333333333333333;
  s1+=0.9166666666666666;
 }
} else {
 if(i1<1472.3165283203125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i0<1374.0){
 if(i2<1829.721923828125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i1<1454.6268310546875){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i1<1407.6153564453125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i1<1528.912109375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<1224.9854736328125){
 if(i2<838.743896484375){
  s0+=0.9934445768772348;
  s1+=0.006555423122765197;
 } else {
  s0+=0.7317073170731707;
  s1+=0.2682926829268293;
 }
} else {
 if(i1<1340.1702880859375){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i1<1598.8603515625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<1224.9854736328125){
 if(i1<1924.375732421875){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i0<193.5){
  s0+=1.0;
 } else {
  s0+=0.003663003663003663;
  s1+=0.9963369963369964;
 }
}
if(i1<1454.6268310546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<987.5){
 if(i1<1788.3223876953125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i2<798.9949951171875){
  s0+=0.46153846153846156;
  s1+=0.5384615384615384;
 } else {
  s0+=0.001467351430667645;
  s1+=0.9985326485693323;
 }
}
if(i2<1224.9854736328125){
 if(i1<1924.375732421875){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i0<966.5){
  s0+=0.8;
  s1+=0.2;
 } else {
  s1+=1.0;
 }
}
if(i1<1586.7730712890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1374.0){
 if(i0<987.5){
  s0+=0.9949152542372881;
  s1+=0.005084745762711864;
 } else {
  s0+=0.6666666666666666;
  s1+=0.3333333333333333;
 }
} else {
 if(i2<256.1461486816406){
  s0+=1.0;
 } else {
  s0+=0.0023112480739599386;
  s1+=0.99768875192604;
 }
}
if(i1<1454.6268310546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1374.0){
 if(i2<1778.8984375){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i1<1454.6268310546875){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i1<1407.6153564453125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<1349.88330078125){
 if(i2<906.1483154296875){
  s0+=0.9929865575686733;
  s1+=0.0070134424313267095;
 } else {
  s0+=0.6;
  s1+=0.4;
 }
} else {
 if(i0<966.5){
  s0+=0.42857142857142855;
  s1+=0.5714285714285714;
 } else {
  s1+=1.0;
 }
}
if(i1<1454.6268310546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i1<1445.3359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i1<1546.732421875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i1<1445.3359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1374.0){
 if(i1<1598.8603515625){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i1<1528.912109375){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i1<1445.3359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<1224.9854736328125){
 if(i2<760.8539428710938){
  s0+=0.9945121951219512;
  s1+=0.00548780487804878;
 } else {
  s0+=0.7282608695652174;
  s1+=0.2717391304347826;
 }
} else {
 if(i1<1302.889892578125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i2<1355.3271484375){
 if(i2<871.375732421875){
  s0+=0.992078001218769;
  s1+=0.007921998781230956;
 } else {
  s0+=0.6744186046511628;
  s1+=0.32558139534883723;
 }
} else {
 if(i2<1706.3985595703125){
  s0+=0.1111111111111111;
  s1+=0.8888888888888888;
 } else {
  s1+=1.0;
 }
}
if(i1<1608.1512451171875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1374.0){
 if(i1<1484.10693359375){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i0<1568.0){
  s0+=0.0625;
  s1+=0.9375;
 } else {
  s0+=0.0007468259895444362;
  s1+=0.9992531740104555;
 }
}
if(i1<1407.6153564453125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1374.0){
 if(i2<1829.721923828125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i0<1954.0){
  s0+=0.03571428571428571;
  s1+=0.9642857142857143;
 } else {
  s1+=1.0;
 }
}
if(i2<1224.8662109375){
 if(i0<1954.0){
  s0+=0.9994134897360704;
  s1+=0.0005865102639296188;
 } else {
  s0+=0.05714285714285714;
  s1+=0.9428571428571428;
 }
} else {
 if(i0<966.5){
  s0+=0.47619047619047616;
  s1+=0.5238095238095238;
 } else {
  s1+=1.0;
 }
}
if(i0<1374.0){
 if(i1<1606.3349609375){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i0<2319.5){
  s0+=0.04477611940298507;
  s1+=0.9552238805970149;
 } else {
  s1+=1.0;
 }
}
if(i2<1224.9854736328125){
 if(i0<1374.5){
  s0+=1.0;
 } else {
  s0+=0.06060606060606061;
  s1+=0.9393939393939394;
 }
} else {
 if(i2<1827.390625){
  s0+=0.17543859649122806;
  s1+=0.8245614035087719;
 } else {
  s1+=1.0;
 }
}
if(i1<1454.6268310546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i1<1556.0233154296875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<1224.8662109375){
 if(i0<1740.0){
  s0+=0.9993939393939394;
  s1+=0.0006060606060606061;
 } else {
  s0+=0.0425531914893617;
  s1+=0.9574468085106383;
 }
} else {
 if(i1<1362.1279296875){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i0<1374.0){
 if(i2<1829.721923828125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i2<256.1461486816406){
  s0+=1.0;
 } else {
  s0+=0.0014858841010401188;
  s1+=0.9985141158989599;
 }
}
if(i1<1509.0118408203125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i1<1445.3359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<1227.53076171875){
 if(i2<788.422119140625){
  s0+=0.9909474954737477;
  s1+=0.009052504526252263;
 } else {
  s0+=0.6666666666666666;
  s1+=0.3333333333333333;
 }
} else {
 if(i2<1377.50244140625){
  s0+=0.35714285714285715;
  s1+=0.6428571428571429;
 } else {
  s0+=0.0030534351145038168;
  s1+=0.9969465648854962;
 }
}
if(i0<1374.0){
 if(i1<1509.0118408203125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i2<536.5811157226562){
  s0+=0.14285714285714285;
  s1+=0.8571428571428571;
 } else {
  s1+=1.0;
 }
}
if(i1<1546.732421875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1374.0){
 if(i2<1751.136962890625){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i0<1954.0){
  s0+=0.022222222222222223;
  s1+=0.9777777777777777;
 } else {
  s1+=1.0;
 }
}
if(i1<1556.0233154296875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i1<1556.0233154296875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<1217.283447265625){
 if(i0<1374.5){
  s0+=1.0;
 } else {
  s0+=0.07692307692307693;
  s1+=0.9230769230769231;
 }
} else {
 if(i0<580.0){
  s0+=0.8181818181818182;
  s1+=0.18181818181818182;
 } else {
  s0+=0.002291825821237586;
  s1+=0.9977081741787625;
 }
}
if(i1<1382.71044921875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<1355.3271484375){
 if(i1<1877.3642578125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i2<1733.0426025390625){
  s0+=0.14285714285714285;
  s1+=0.8571428571428571;
 } else {
  s1+=1.0;
 }
}
if(i2<1225.244140625){
 if(i1<1852.4593505859375){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i0<580.0){
  s0+=0.875;
  s1+=0.125;
 } else {
  s1+=1.0;
 }
}
if(i0<1374.0){
 if(i1<1546.732421875){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i2<796.0330200195312){
  s0+=0.25;
  s1+=0.75;
 } else {
  s1+=1.0;
 }
}
if(i1<1445.3359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1374.0){
 if(i1<1472.3104248046875){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i0<2319.5){
  s0+=0.046153846153846156;
  s1+=0.9538461538461539;
 } else {
  s1+=1.0;
 }
}
if(i0<1374.0){
 if(i0<987.5){
  s0+=0.9952690715552928;
  s1+=0.004730928444707274;
 } else {
  s0+=0.6538461538461539;
  s1+=0.34615384615384615;
 }
} else {
 if(i1<1309.9188232421875){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i1<1539.7615966796875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1374.0){
 if(i1<1624.644287109375){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i1<1454.6268310546875){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i2<1224.9854736328125){
 if(i0<2319.5){
  s0+=0.9994079336885732;
  s1+=0.0005920663114268798;
 } else {
  s1+=1.0;
 }
} else {
 if(i2<1758.10888671875){
  s0+=0.18518518518518517;
  s1+=0.8148148148148148;
 } else {
  s1+=1.0;
 }
}
if(i0<987.5){
 if(i0<580.0){
  s0+=0.9987951807228915;
  s1+=0.0012048192771084338;
 } else {
  s0+=0.9117647058823529;
  s1+=0.08823529411764706;
 }
} else {
 if(i2<798.9949951171875){
  s0+=0.5454545454545454;
  s1+=0.45454545454545453;
 } else {
  s0+=0.0007451564828614009;
  s1+=0.9992548435171386;
 }
}
if(i0<1374.0){
 if(i2<1829.721923828125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i0<2319.5){
  s0+=0.06097560975609756;
  s1+=0.9390243902439024;
 } else {
  s1+=1.0;
 }
}
if(i1<1454.6268310546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<1322.937255859375){
 if(i2<906.2758178710938){
  s0+=0.9911868390129259;
  s1+=0.00881316098707403;
 } else {
  s0+=0.6190476190476191;
  s1+=0.38095238095238093;
 }
} else {
 if(i1<1436.4132080078125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i2<1225.244140625){
 if(i1<1924.375732421875){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i2<1827.390625){
  s0+=0.25806451612903225;
  s1+=0.7419354838709677;
 } else {
  s1+=1.0;
 }
}
if(i1<1445.3359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<1217.02490234375){
 if(i2<907.076416015625){
  s0+=0.9896278218425869;
  s1+=0.010372178157413058;
 } else {
  s0+=0.5660377358490566;
  s1+=0.4339622641509434;
 }
} else {
 if(i2<1763.6158447265625){
  s0+=0.2;
  s1+=0.8;
 } else {
  s1+=1.0;
 }
}
if(i1<1454.6268310546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i1<1445.3359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i1<1556.0233154296875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i1<1445.3359375){
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
