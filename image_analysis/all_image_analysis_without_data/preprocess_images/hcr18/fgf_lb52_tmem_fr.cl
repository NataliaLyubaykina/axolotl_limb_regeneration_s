/*
OpenCL RandomForestClassifier
classifier_class_name = ObjectSegmenter
feature_specification = gaussian_blur=1 difference_of_gaussian=1 laplace_box_of_gaussian_blur=1 sobel_of_gaussian_blur=1
num_ground_truth_dimensions = 3
num_classes = 2
num_features = 4
max_depth = 2
num_trees = 100
feature_importances = 0.21085321579929817,0.0011630498098273774,0.3310612587555551,0.45692247563531935
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
if(i3<92878.96875){
 if(i2<-142937.8125){
  s0+=0.7619047619047619;
  s1+=0.23809523809523808;
 } else {
  s0+=1.0;
 }
} else {
 s1+=1.0;
}
if(i0<6331.29296875){
 if(i3<94272.671875){
  s0+=0.994994994994995;
  s1+=0.005005005005005005;
 } else {
  s1+=1.0;
 }
} else {
 if(i2<-149355.734375){
  s1+=1.0;
 } else {
  s0+=1.0;
 }
}
if(i0<6329.82470703125){
 if(i3<94272.671875){
  s0+=0.9959758551307847;
  s1+=0.004024144869215292;
 } else {
  s1+=1.0;
 }
} else {
 if(i3<91578.546875){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i0<6329.82470703125){
 if(i1<-230.268798828125){
  s0+=0.8181818181818182;
  s1+=0.18181818181818182;
 } else {
  s0+=0.9979508196721312;
  s1+=0.0020491803278688526;
 }
} else {
 if(i0<6467.4853515625){
  s0+=0.25;
  s1+=0.75;
 } else {
  s1+=1.0;
 }
}
if(i3<92878.96875){
 if(i0<6331.29296875){
  s0+=0.9969481180061037;
  s1+=0.003051881993896236;
 } else {
  s0+=0.6666666666666666;
  s1+=0.3333333333333333;
 }
} else {
 s1+=1.0;
}
if(i3<93743.4140625){
 if(i2<-147087.5){
  s0+=0.8888888888888888;
  s1+=0.1111111111111111;
 } else {
  s0+=1.0;
 }
} else {
 s1+=1.0;
}
if(i3<91578.546875){
 if(i2<-147087.5){
  s0+=0.6153846153846154;
  s1+=0.38461538461538464;
 } else {
  s0+=0.9949031600407747;
  s1+=0.0050968399592252805;
 }
} else {
 s1+=1.0;
}
if(i0<6329.82470703125){
 if(i2<-142990.125){
  s0+=0.7894736842105263;
  s1+=0.21052631578947367;
 } else {
  s0+=0.9989669421487604;
  s1+=0.0010330578512396695;
 }
} else {
 if(i2<-154957.1875){
  s1+=1.0;
 } else {
  s0+=0.5;
  s1+=0.5;
 }
}
if(i3<92878.96875){
 if(i0<5729.4853515625){
  s0+=1.0;
 } else {
  s0+=0.9;
  s1+=0.1;
 }
} else {
 s1+=1.0;
}
if(i2<-150455.03125){
 if(i2<-155182.828125){
  s1+=1.0;
 } else {
  s0+=0.16666666666666666;
  s1+=0.8333333333333334;
 }
} else {
 if(i0<5763.9375){
  s0+=0.9989417989417989;
  s1+=0.0010582010582010583;
 } else {
  s0+=0.9024390243902439;
  s1+=0.0975609756097561;
 }
}
if(i0<6329.82470703125){
 if(i2<-147087.5){
  s0+=0.7777777777777778;
  s1+=0.2222222222222222;
 } else {
  s0+=0.9989868287740629;
  s1+=0.0010131712259371835;
 }
} else {
 if(i3<91578.546875){
  s0+=0.5;
  s1+=0.5;
 } else {
  s1+=1.0;
 }
}
if(i2<-155682.328125){
 s1+=1.0;
} else {
 if(i2<-142990.125){
  s0+=0.6153846153846154;
  s1+=0.38461538461538464;
 } else {
  s0+=0.9989658738366081;
  s1+=0.001034126163391934;
 }
}
if(i3<92878.96875){
 if(i0<6331.29296875){
  s0+=0.9979959919839679;
  s1+=0.002004008016032064;
 } else {
  s0+=0.5;
  s1+=0.5;
 }
} else {
 s1+=1.0;
}
if(i0<6591.49951171875){
 if(i2<-150455.03125){
  s0+=0.25;
  s1+=0.75;
 } else {
  s0+=0.9970178926441352;
  s1+=0.002982107355864811;
 }
} else {
 s1+=1.0;
}
if(i2<-154957.1875){
 s1+=1.0;
} else {
 if(i2<-142579.5625){
  s0+=0.7333333333333333;
  s1+=0.26666666666666666;
 } else {
  s0+=1.0;
 }
}
if(i0<6259.541015625){
 if(i2<-142990.125){
  s0+=0.7368421052631579;
  s1+=0.2631578947368421;
 } else {
  s0+=0.9968976215098242;
  s1+=0.0031023784901758012;
 }
} else {
 if(i2<-155682.328125){
  s1+=1.0;
 } else {
  s0+=0.6666666666666666;
  s1+=0.3333333333333333;
 }
}
if(i3<92878.96875){
 if(i2<-142990.125){
  s0+=0.95;
  s1+=0.05;
 } else {
  s0+=0.9989637305699481;
  s1+=0.0010362694300518134;
 }
} else {
 s1+=1.0;
}
if(i0<6326.19140625){
 if(i3<93803.6875){
  s0+=0.993963782696177;
  s1+=0.006036217303822937;
 } else {
  s1+=1.0;
 }
} else {
 if(i2<-150175.8125){
  s1+=1.0;
 } else {
  s0+=1.0;
 }
}
if(i0<6640.55078125){
 if(i2<-150455.03125){
  s0+=0.2;
  s1+=0.8;
 } else {
  s0+=0.9939819458375125;
  s1+=0.006018054162487462;
 }
} else {
 s1+=1.0;
}
if(i2<-155456.6875){
 s1+=1.0;
} else {
 if(i1<-235.7073974609375){
  s0+=0.6666666666666666;
  s1+=0.3333333333333333;
 } else {
  s0+=0.9959432048681541;
  s1+=0.004056795131845842;
 }
}
if(i3<93148.3984375){
 if(i2<-147087.5){
  s0+=0.8823529411764706;
  s1+=0.11764705882352941;
 } else {
  s0+=0.9989680082559339;
  s1+=0.0010319917440660474;
 }
} else {
 s1+=1.0;
}
if(i2<-150175.8125){
 if(i3<92878.96875){
  s0+=0.6666666666666666;
  s1+=0.3333333333333333;
 } else {
  s1+=1.0;
 }
} else {
 if(i1<-235.7073974609375){
  s0+=0.7;
  s1+=0.3;
 } else {
  s0+=0.9989858012170385;
  s1+=0.0010141987829614604;
 }
}
if(i2<-150988.0){
 if(i3<92409.984375){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i3<92723.40625){
  s0+=0.9929078014184397;
  s1+=0.0070921985815602835;
 } else {
  s1+=1.0;
 }
}
if(i3<93148.3984375){
 if(i0<6331.29296875){
  s0+=0.9979445015416238;
  s1+=0.0020554984583761563;
 } else {
  s0+=0.6;
  s1+=0.4;
 }
} else {
 s1+=1.0;
}
if(i3<93597.734375){
 if(i2<-145944.84375){
  s0+=0.7142857142857143;
  s1+=0.2857142857142857;
 } else {
  s0+=0.9979899497487437;
  s1+=0.0020100502512562816;
 }
} else {
 s1+=1.0;
}
if(i2<-150368.15625){
 if(i3<92409.984375){
  s0+=0.3333333333333333;
  s1+=0.6666666666666666;
 } else {
  s1+=1.0;
 }
} else {
 if(i2<-142990.125){
  s0+=0.8888888888888888;
  s1+=0.1111111111111111;
 } else {
  s0+=0.9989680082559339;
  s1+=0.0010319917440660474;
 }
}
if(i3<92728.421875){
 if(i3<85143.453125){
  s0+=0.9989506820566632;
  s1+=0.001049317943336831;
 } else {
  s0+=0.926829268292683;
  s1+=0.07317073170731707;
 }
} else {
 s1+=1.0;
}
if(i0<6262.96484375){
 if(i2<-142937.8125){
  s0+=0.7894736842105263;
  s1+=0.21052631578947367;
 } else {
  s0+=0.9989743589743589;
  s1+=0.0010256410256410256;
 }
} else {
 s1+=1.0;
}
if(i3<92878.96875){
 if(i1<-233.7562255859375){
  s0+=0.8571428571428571;
  s1+=0.14285714285714285;
 } else {
  s0+=0.9979736575481256;
  s1+=0.002026342451874367;
 }
} else {
 s1+=1.0;
}
if(i2<-155456.6875){
 s1+=1.0;
} else {
 if(i2<-143350.015625){
  s0+=0.85;
  s1+=0.15;
 } else {
  s0+=1.0;
 }
}
if(i2<-155456.6875){
 s1+=1.0;
} else {
 if(i0<6326.19140625){
  s0+=0.993933265925177;
  s1+=0.006066734074823054;
 } else {
  s0+=0.3333333333333333;
  s1+=0.6666666666666666;
 }
}
if(i2<-150988.0){
 if(i3<92409.984375){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i2<-142990.125){
  s0+=0.75;
  s1+=0.25;
 } else {
  s0+=1.0;
 }
}
if(i2<-155456.6875){
 s1+=1.0;
} else {
 if(i3<96912.3515625){
  s0+=0.995987963891675;
  s1+=0.004012036108324975;
 } else {
  s1+=1.0;
 }
}
if(i0<6331.29296875){
 if(i0<6262.96484375){
  s0+=0.9989909182643795;
  s1+=0.0010090817356205853;
 } else {
  s0+=0.6666666666666666;
  s1+=0.3333333333333333;
 }
} else {
 if(i2<-150175.8125){
  s1+=1.0;
 } else {
  s0+=1.0;
 }
}
if(i2<-150988.0){
 if(i3<92409.984375){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i3<85143.453125){
  s0+=1.0;
 } else {
  s0+=0.875;
  s1+=0.125;
 }
}
if(i3<92878.96875){
 if(i2<-142417.65625){
  s0+=0.7391304347826086;
  s1+=0.2608695652173913;
 } else {
  s0+=0.9989690721649485;
  s1+=0.0010309278350515464;
 }
} else {
 s1+=1.0;
}
if(i3<92679.4140625){
 if(i3<85143.453125){
  s0+=1.0;
 } else {
  s0+=0.9361702127659575;
  s1+=0.06382978723404255;
 }
} else {
 s1+=1.0;
}
if(i3<91478.7890625){
 if(i0<6303.40185546875){
  s0+=0.9979838709677419;
  s1+=0.0020161290322580645;
 } else {
  s0+=0.6;
  s1+=0.4;
 }
} else {
 s1+=1.0;
}
if(i3<93148.3984375){
 if(i2<-147087.5){
  s0+=0.6363636363636364;
  s1+=0.36363636363636365;
 } else {
  s0+=0.9979508196721312;
  s1+=0.0020491803278688526;
 }
} else {
 s1+=1.0;
}
if(i3<92878.96875){
 if(i2<-142990.125){
  s0+=0.7586206896551724;
  s1+=0.2413793103448276;
 } else {
  s0+=1.0;
 }
} else {
 s1+=1.0;
}
if(i3<93148.3984375){
 if(i0<6299.9775390625){
  s0+=0.9979757085020243;
  s1+=0.0020242914979757085;
 } else {
  s0+=0.5;
  s1+=0.5;
 }
} else {
 s1+=1.0;
}
if(i2<-156074.40625){
 s1+=1.0;
} else {
 if(i2<-142990.125){
  s0+=0.7142857142857143;
  s1+=0.2857142857142857;
 } else {
  s0+=1.0;
 }
}
if(i3<94272.671875){
 if(i3<84198.6015625){
  s0+=1.0;
 } else {
  s0+=0.9615384615384616;
  s1+=0.038461538461538464;
 }
} else {
 s1+=1.0;
}
if(i3<93148.3984375){
 if(i0<6326.19140625){
  s0+=1.0;
 } else {
  s0+=0.75;
  s1+=0.25;
 }
} else {
 s1+=1.0;
}
if(i0<6467.4853515625){
 if(i3<94272.671875){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 s1+=1.0;
}
if(i2<-155456.6875){
 s1+=1.0;
} else {
 if(i3<96912.3515625){
  s0+=0.9970089730807578;
  s1+=0.0029910269192422734;
 } else {
  s1+=1.0;
 }
}
if(i2<-155182.828125){
 s1+=1.0;
} else {
 if(i2<-142937.8125){
  s0+=0.6521739130434783;
  s1+=0.34782608695652173;
 } else {
  s0+=1.0;
 }
}
if(i3<92878.96875){
 if(i2<-142990.125){
  s0+=0.7307692307692307;
  s1+=0.2692307692307692;
 } else {
  s0+=1.0;
 }
} else {
 s1+=1.0;
}
if(i0<6102.2138671875){
 if(i3<92689.7421875){
  s0+=0.9979529170931423;
  s1+=0.0020470829068577278;
 } else {
  s1+=1.0;
 }
} else {
 if(i3<93148.3984375){
  s0+=0.3333333333333333;
  s1+=0.6666666666666666;
 } else {
  s1+=1.0;
 }
}
if(i3<93197.40625){
 if(i0<6326.19140625){
  s0+=0.998992950654582;
  s1+=0.0010070493454179255;
 } else {
  s0+=0.6666666666666666;
  s1+=0.3333333333333333;
 }
} else {
 s1+=1.0;
}
if(i2<-150901.125){
 s1+=1.0;
} else {
 if(i2<-142990.125){
  s0+=0.6818181818181818;
  s1+=0.3181818181818182;
 } else {
  s0+=0.9989690721649485;
  s1+=0.0010309278350515464;
 }
}
if(i3<93148.3984375){
 if(i2<-147087.5){
  s0+=0.5333333333333333;
  s1+=0.4666666666666667;
 } else {
  s0+=0.9969199178644764;
  s1+=0.003080082135523614;
 }
} else {
 s1+=1.0;
}
if(i2<-155182.828125){
 s1+=1.0;
} else {
 if(i2<-143157.25){
  s0+=0.8484848484848485;
  s1+=0.15151515151515152;
 } else {
  s0+=0.9979296066252588;
  s1+=0.002070393374741201;
 }
}
if(i2<-155456.6875){
 s1+=1.0;
} else {
 if(i0<6080.9072265625){
  s0+=1.0;
 } else {
  s0+=0.9285714285714286;
  s1+=0.07142857142857142;
 }
}
if(i3<92878.96875){
 if(i2<-142990.125){
  s0+=0.72;
  s1+=0.28;
 } else {
  s0+=0.9979423868312757;
  s1+=0.00205761316872428;
 }
} else {
 s1+=1.0;
}
if(i3<92878.96875){
 if(i0<6331.29296875){
  s0+=0.9989878542510121;
  s1+=0.0010121457489878543;
 } else {
  s0+=0.5;
  s1+=0.5;
 }
} else {
 s1+=1.0;
}
if(i3<93148.3984375){
 if(i1<218.537109375){
  s0+=0.9989615784008308;
  s1+=0.0010384215991692627;
 } else {
  s0+=0.9166666666666666;
  s1+=0.08333333333333333;
 }
} else {
 s1+=1.0;
}
if(i2<-155456.6875){
 s1+=1.0;
} else {
 if(i3<94272.671875){
  s0+=0.9959677419354839;
  s1+=0.004032258064516129;
 } else {
  s1+=1.0;
 }
}
if(i3<92409.984375){
 if(i2<-147087.5){
  s0+=0.6666666666666666;
  s1+=0.3333333333333333;
 } else {
  s0+=0.9979654120040692;
  s1+=0.002034587995930824;
 }
} else {
 s1+=1.0;
}
if(i3<91847.96875){
 if(i0<5730.5703125){
  s0+=0.9989484752891693;
  s1+=0.0010515247108307045;
 } else {
  s0+=0.9545454545454546;
  s1+=0.045454545454545456;
 }
} else {
 s1+=1.0;
}
if(i3<92409.984375){
 if(i2<-142937.8125){
  s0+=0.875;
  s1+=0.125;
 } else {
  s0+=0.9989615784008308;
  s1+=0.0010384215991692627;
 }
} else {
 s1+=1.0;
}
if(i2<-150368.15625){
 if(i0<6285.111328125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i3<92872.484375){
  s0+=0.996003996003996;
  s1+=0.003996003996003996;
 } else {
  s1+=1.0;
 }
}
if(i3<92878.96875){
 if(i2<-146718.0625){
  s0+=0.782608695652174;
  s1+=0.21739130434782608;
 } else {
  s0+=0.9989690721649485;
  s1+=0.0010309278350515464;
 }
} else {
 s1+=1.0;
}
if(i0<6259.541015625){
 if(i3<92689.7421875){
  s0+=0.9969635627530364;
  s1+=0.003036437246963563;
 } else {
  s1+=1.0;
 }
} else {
 if(i3<91847.96875){
  s0+=0.5555555555555556;
  s1+=0.4444444444444444;
 } else {
  s1+=1.0;
 }
}
if(i0<6518.353515625){
 if(i0<6080.9072265625){
  s0+=0.9989806320081549;
  s1+=0.0010193679918450561;
 } else {
  s0+=0.6875;
  s1+=0.3125;
 }
} else {
 s1+=1.0;
}
if(i3<92878.96875){
 if(i3<84198.6015625){
  s0+=1.0;
 } else {
  s0+=0.8771929824561403;
  s1+=0.12280701754385964;
 }
} else {
 s1+=1.0;
}
if(i0<6262.96484375){
 if(i2<-146718.0625){
  s0+=0.5714285714285714;
  s1+=0.42857142857142855;
 } else {
  s0+=1.0;
 }
} else {
 if(i2<-154957.1875){
  s1+=1.0;
 } else {
  s0+=0.6666666666666666;
  s1+=0.3333333333333333;
 }
}
if(i2<-155682.328125){
 s1+=1.0;
} else {
 if(i1<-233.7562255859375){
  s0+=0.7692307692307693;
  s1+=0.23076923076923078;
 } else {
  s0+=0.9979402677651905;
  s1+=0.0020597322348094747;
 }
}
if(i0<6324.72314453125){
 if(i3<96912.3515625){
  s0+=0.9969604863221885;
  s1+=0.00303951367781155;
 } else {
  s1+=1.0;
 }
} else {
 if(i3<91478.7890625){
  s0+=0.5;
  s1+=0.5;
 } else {
  s1+=1.0;
 }
}
if(i0<6331.29296875){
 if(i3<85143.453125){
  s0+=1.0;
 } else {
  s0+=0.9642857142857143;
  s1+=0.03571428571428571;
 }
} else {
 if(i2<-150175.8125){
  s1+=1.0;
 } else {
  s0+=1.0;
 }
}
if(i0<6366.42724609375){
 if(i1<-235.7073974609375){
  s0+=0.7777777777777778;
  s1+=0.2222222222222222;
 } else {
  s0+=0.9959555106167847;
  s1+=0.004044489383215369;
 }
} else {
 s1+=1.0;
}
if(i3<92878.96875){
 if(i2<-150455.03125){
  s0+=0.5714285714285714;
  s1+=0.42857142857142855;
 } else {
  s0+=0.9949596774193549;
  s1+=0.005040322580645161;
 }
} else {
 s1+=1.0;
}
if(i2<-150455.03125){
 if(i3<93148.3984375){
  s0+=0.6666666666666666;
  s1+=0.3333333333333333;
 } else {
  s1+=1.0;
 }
} else {
 if(i3<92689.7421875){
  s0+=0.9949290060851927;
  s1+=0.005070993914807302;
 } else {
  s1+=1.0;
 }
}
if(i3<92409.984375){
 if(i2<-150455.03125){
  s0+=0.5;
  s1+=0.5;
 } else {
  s0+=0.9979633401221996;
  s1+=0.002036659877800407;
 }
} else {
 s1+=1.0;
}
if(i2<-150455.03125){
 if(i3<92878.96875){
  s0+=0.5;
  s1+=0.5;
 } else {
  s1+=1.0;
 }
} else {
 if(i0<5729.4853515625){
  s0+=0.997872340425532;
  s1+=0.002127659574468085;
 } else {
  s0+=0.9333333333333333;
  s1+=0.06666666666666667;
 }
}
if(i0<6102.2138671875){
 if(i3<92429.65625){
  s0+=0.9990029910269193;
  s1+=0.0009970089730807576;
 } else {
  s1+=1.0;
 }
} else {
 if(i0<6262.96484375){
  s0+=0.5;
  s1+=0.5;
 } else {
  s1+=1.0;
 }
}
if(i3<91847.96875){
 if(i0<5730.5703125){
  s0+=1.0;
 } else {
  s0+=0.9069767441860465;
  s1+=0.09302325581395349;
 }
} else {
 s1+=1.0;
}
if(i2<-147268.46875){
 if(i0<6467.4853515625){
  s0+=0.42857142857142855;
  s1+=0.5714285714285714;
 } else {
  s1+=1.0;
 }
} else {
 if(i2<-142990.125){
  s0+=0.7142857142857143;
  s1+=0.2857142857142857;
 } else {
  s0+=1.0;
 }
}
if(i0<6518.353515625){
 if(i3<94272.671875){
  s0+=0.9989939637826962;
  s1+=0.001006036217303823;
 } else {
  s1+=1.0;
 }
} else {
 s1+=1.0;
}
if(i3<93148.3984375){
 if(i2<-147087.5){
  s0+=0.7777777777777778;
  s1+=0.2222222222222222;
 } else {
  s0+=1.0;
 }
} else {
 s1+=1.0;
}
if(i0<6518.353515625){
 if(i2<-155682.328125){
  s1+=1.0;
 } else {
  s0+=0.9939819458375125;
  s1+=0.006018054162487462;
 }
} else {
 s1+=1.0;
}
if(i3<93597.734375){
 if(i2<-142990.125){
  s0+=0.8571428571428571;
  s1+=0.14285714285714285;
 } else {
  s0+=0.9969604863221885;
  s1+=0.00303951367781155;
 }
} else {
 s1+=1.0;
}
if(i2<-153601.5625){
 s1+=1.0;
} else {
 if(i0<6102.2138671875){
  s0+=0.9969481180061037;
  s1+=0.003051881993896236;
 } else {
  s0+=0.7142857142857143;
  s1+=0.2857142857142857;
 }
}
if(i3<93148.3984375){
 if(i2<-145944.84375){
  s0+=0.8333333333333334;
  s1+=0.16666666666666666;
 } else {
  s0+=0.9959432048681541;
  s1+=0.004056795131845842;
 }
} else {
 s1+=1.0;
}
if(i3<92878.96875){
 if(i0<5915.9833984375){
  s0+=0.997920997920998;
  s1+=0.002079002079002079;
 } else {
  s0+=0.8571428571428571;
  s1+=0.14285714285714285;
 }
} else {
 s1+=1.0;
}
if(i2<-154957.1875){
 s1+=1.0;
} else {
 if(i0<5763.1513671875){
  s0+=1.0;
 } else {
  s0+=0.8947368421052632;
  s1+=0.10526315789473684;
 }
}
if(i3<92878.96875){
 if(i0<6331.29296875){
  s0+=0.997948717948718;
  s1+=0.0020512820512820513;
 } else {
  s0+=0.3333333333333333;
  s1+=0.6666666666666666;
 }
} else {
 s1+=1.0;
}
if(i2<-150368.15625){
 s1+=1.0;
} else {
 if(i2<-142317.71875){
  s0+=0.7916666666666666;
  s1+=0.20833333333333334;
 } else {
  s0+=0.9979550102249489;
  s1+=0.002044989775051125;
 }
}
if(i2<-155182.828125){
 s1+=1.0;
} else {
 if(i2<-143350.015625){
  s0+=0.75;
  s1+=0.25;
 } else {
  s0+=0.9989594172736732;
  s1+=0.001040582726326743;
 }
}
if(i2<-155682.328125){
 s1+=1.0;
} else {
 if(i3<94272.671875){
  s0+=0.9949186991869918;
  s1+=0.00508130081300813;
 } else {
  s1+=1.0;
 }
}
if(i3<91478.7890625){
 if(i0<5915.9833984375){
  s0+=0.9979445015416238;
  s1+=0.0020554984583761563;
 } else {
  s0+=0.6666666666666666;
  s1+=0.3333333333333333;
 }
} else {
 s1+=1.0;
}
if(i3<93148.3984375){
 if(i2<-147087.5){
  s0+=0.7333333333333333;
  s1+=0.26666666666666666;
 } else {
  s0+=0.9979508196721312;
  s1+=0.0020491803278688526;
 }
} else {
 s1+=1.0;
}
if(i3<93148.3984375){
 if(i0<5915.9833984375){
  s0+=0.9979508196721312;
  s1+=0.0020491803278688526;
 } else {
  s0+=0.8846153846153846;
  s1+=0.11538461538461539;
 }
} else {
 s1+=1.0;
}
if(i3<92679.4140625){
 if(i0<6102.2138671875){
  s0+=0.9979674796747967;
  s1+=0.0020325203252032522;
 } else {
  s0+=0.7272727272727273;
  s1+=0.2727272727272727;
 }
} else {
 s1+=1.0;
}
if(i2<-154957.1875){
 s1+=1.0;
} else {
 if(i3<92972.25){
  s0+=0.9919759277833501;
  s1+=0.00802407221664995;
 } else {
  s1+=1.0;
 }
}
if(i3<92878.96875){
 if(i1<-235.7073974609375){
  s0+=0.7;
  s1+=0.3;
 } else {
  s0+=0.9959514170040485;
  s1+=0.004048582995951417;
 }
} else {
 s1+=1.0;
}
if(i2<-150455.03125){
 if(i3<93148.3984375){
  s0+=0.6666666666666666;
  s1+=0.3333333333333333;
 } else {
  s1+=1.0;
 }
} else {
 if(i3<92723.40625){
  s0+=0.9979818365287588;
  s1+=0.0020181634712411706;
 } else {
  s1+=1.0;
 }
}
if(i2<-150455.03125){
 if(i0<6244.67431640625){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i2<-147087.5){
  s0+=0.5555555555555556;
  s1+=0.4444444444444444;
 } else {
  s0+=0.9989827060020345;
  s1+=0.001017293997965412;
 }
}
if(i3<92878.96875){
 if(i0<5915.9833984375){
  s0+=0.9989743589743589;
  s1+=0.0010256410256410256;
 } else {
  s0+=0.9166666666666666;
  s1+=0.08333333333333333;
 }
} else {
 s1+=1.0;
}
if(i2<-155456.6875){
 s1+=1.0;
} else {
 if(i3<94272.671875){
  s0+=0.998001998001998;
  s1+=0.001998001998001998;
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