/*
OpenCL RandomForestClassifier
classifier_class_name = ObjectSegmenter
feature_specification = gaussian_blur=1 difference_of_gaussian=1 laplace_box_of_gaussian_blur=1 sobel_of_gaussian_blur=1
num_ground_truth_dimensions = 3
num_classes = 2
num_features = 4
max_depth = 2
num_trees = 100
feature_importances = 0.20112372800424022,0.0,0.4397246245372065,0.3591516474585532
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
if(i3<7784.60888671875){
 if(i2<-8413.17578125){
  s0+=0.553030303030303;
  s1+=0.44696969696969696;
 } else {
  s0+=0.9982761592828823;
  s1+=0.0017238407171177384;
 }
} else {
 if(i3<10540.6474609375){
  s0+=0.3983050847457627;
  s1+=0.6016949152542372;
 } else {
  s0+=0.006331785563528915;
  s1+=0.9936682144364711;
 }
}
if(i3<9037.861328125){
 if(i3<5008.08984375){
  s0+=0.99931717309662;
  s1+=0.0006828269033799932;
 } else {
  s0+=0.6204819277108434;
  s1+=0.3795180722891566;
 }
} else {
 if(i2<-15157.7265625){
  s0+=0.0029623360135421074;
  s1+=0.9970376639864579;
 } else {
  s0+=0.48484848484848486;
  s1+=0.5151515151515151;
 }
}
if(i0<416.75634765625){
 if(i3<4625.806640625){
  s0+=1.0;
 } else {
  s0+=0.6166666666666667;
  s1+=0.38333333333333336;
 }
} else {
 if(i3<8722.03125){
  s0+=0.6447368421052632;
  s1+=0.35526315789473684;
 } else {
  s0+=0.008564437194127243;
  s1+=0.9914355628058727;
 }
}
if(i0<416.75634765625){
 if(i0<294.63885498046875){
  s0+=0.9986355108306327;
  s1+=0.0013644891693672181;
 } else {
  s0+=0.6065573770491803;
  s1+=0.39344262295081966;
 }
} else {
 if(i0<589.613525390625){
  s0+=0.43609022556390975;
  s1+=0.5639097744360902;
 } else {
  s0+=0.003909643788010426;
  s1+=0.9960903562119896;
 }
}
if(i3<7784.60888671875){
 if(i0<296.26422119140625){
  s0+=0.9994855967078189;
  s1+=0.00051440329218107;
 } else {
  s0+=0.589041095890411;
  s1+=0.410958904109589;
 }
} else {
 if(i2<-15749.791015625){
  s0+=0.002551020408163265;
  s1+=0.9974489795918368;
 } else {
  s0+=0.37777777777777777;
  s1+=0.6222222222222222;
 }
}
if(i3<8722.03125){
 if(i2<-7470.15234375){
  s0+=0.6292134831460674;
  s1+=0.3707865168539326;
 } else {
  s0+=0.9989594172736732;
  s1+=0.001040582726326743;
 }
} else {
 if(i0<384.10504150390625){
  s0+=1.0;
 } else {
  s0+=0.010543390105433901;
  s1+=0.9894566098945661;
 }
}
if(i3<8796.96484375){
 if(i2<-8394.74609375){
  s0+=0.5235294117647059;
  s1+=0.4764705882352941;
 } else {
  s0+=0.9986488768789056;
  s1+=0.0013511231210944098;
 }
} else {
 if(i0<384.10504150390625){
  s0+=1.0;
 } else {
  s0+=0.00990952175786299;
  s1+=0.990090478242137;
 }
}
if(i2<-8742.130859375){
 if(i2<-15157.7265625){
  s0+=0.003015941404566997;
  s1+=0.996984058595433;
 } else {
  s0+=0.42342342342342343;
  s1+=0.5765765765765766;
 }
} else {
 if(i2<-7160.9931640625){
  s0+=0.74;
  s1+=0.26;
 } else {
  s0+=0.999828385103827;
  s1+=0.00017161489617298782;
 }
}
if(i3<7784.60888671875){
 if(i0<277.79364013671875){
  s0+=0.9989613986498183;
  s1+=0.0010386013501817552;
 } else {
  s0+=0.6363636363636364;
  s1+=0.36363636363636365;
 }
} else {
 if(i2<-15945.8486328125){
  s0+=0.002508361204013378;
  s1+=0.9974916387959866;
 } else {
  s0+=0.28865979381443296;
  s1+=0.711340206185567;
 }
}
if(i2<-12724.42578125){
 if(i2<-15078.052734375){
  s0+=0.004629629629629629;
  s1+=0.9953703703703703;
 } else {
  s0+=0.43103448275862066;
  s1+=0.5689655172413793;
 }
} else {
 if(i0<298.798095703125){
  s0+=0.9993157714676703;
  s1+=0.0006842285323297981;
 } else {
  s0+=0.6071428571428571;
  s1+=0.39285714285714285;
 }
}
if(i3<8700.70703125){
 if(i0<296.26422119140625){
  s0+=0.999320305862362;
  s1+=0.0006796941376380628;
 } else {
  s0+=0.6127167630057804;
  s1+=0.3872832369942196;
 }
} else {
 if(i0<672.5852661132812){
  s0+=0.2231404958677686;
  s1+=0.7768595041322314;
 } else {
  s0+=0.00178491744756805;
  s1+=0.998215082552432;
 }
}
if(i2<-9041.71484375){
 if(i2<-15945.8486328125){
  s0+=0.0030081650193382035;
  s1+=0.9969918349806618;
 } else {
  s0+=0.4019138755980861;
  s1+=0.5980861244019139;
 }
} else {
 if(i2<-7470.15234375){
  s0+=0.5882352941176471;
  s1+=0.4117647058823529;
 } else {
  s0+=0.9994856848962798;
  s1+=0.0005143151037202125;
 }
}
if(i3<7643.36376953125){
 if(i0<282.11968994140625){
  s0+=0.9998277050310131;
  s1+=0.00017229496898690558;
 } else {
  s0+=0.6268656716417911;
  s1+=0.373134328358209;
 }
} else {
 if(i2<-15076.9287109375){
  s0+=0.0029276453366792136;
  s1+=0.9970723546633208;
 } else {
  s0+=0.3516483516483517;
  s1+=0.6483516483516484;
 }
}
if(i0<430.76446533203125){
 if(i2<-8401.9013671875){
  s0+=0.58;
  s1+=0.42;
 } else {
  s0+=0.998468085106383;
  s1+=0.0015319148936170212;
 }
} else {
 if(i2<-15162.0390625){
  s0+=0.0034173430158052115;
  s1+=0.9965826569841948;
 } else {
  s0+=0.5;
  s1+=0.5;
 }
}
if(i2<-9523.638671875){
 if(i2<-15945.8486328125){
  s0+=0.0025906735751295338;
  s1+=0.9974093264248705;
 } else {
  s0+=0.4077669902912621;
  s1+=0.5922330097087378;
 }
} else {
 if(i3<4131.91162109375){
  s0+=1.0;
 } else {
  s0+=0.7868852459016393;
  s1+=0.21311475409836064;
 }
}
if(i0<388.1688232421875){
 if(i2<-7363.3662109375){
  s0+=0.5052631578947369;
  s1+=0.49473684210526314;
 } else {
  s0+=0.9984375;
  s1+=0.0015625;
 }
} else {
 if(i2<-15078.052734375){
  s0+=0.0036991368680641184;
  s1+=0.9963008631319359;
 } else {
  s0+=0.4393939393939394;
  s1+=0.5606060606060606;
 }
}
if(i3<7498.2353515625){
 if(i2<-8394.74609375){
  s0+=0.5454545454545454;
  s1+=0.45454545454545453;
 } else {
  s0+=0.9986256656931799;
  s1+=0.001374334306820134;
 }
} else {
 if(i2<-16012.71484375){
  s0+=0.0058601925491837585;
  s1+=0.9941398074508162;
 } else {
  s0+=0.35135135135135137;
  s1+=0.6486486486486487;
 }
}
if(i0<431.3417663574219){
 if(i3<4134.34765625){
  s0+=1.0;
 } else {
  s0+=0.6871508379888268;
  s1+=0.3128491620111732;
 }
} else {
 if(i2<-15078.052734375){
  s0+=0.004219409282700422;
  s1+=0.9957805907172996;
 } else {
  s0+=0.4205607476635514;
  s1+=0.5794392523364486;
 }
}
if(i0<327.51336669921875){
 if(i2<-7173.50146484375){
  s0+=0.6851851851851852;
  s1+=0.3148148148148148;
 } else {
  s0+=0.9991451530176099;
  s1+=0.0008548469823901521;
 }
} else {
 if(i0<566.4517211914062){
  s0+=0.3817204301075269;
  s1+=0.6182795698924731;
 } else {
  s0+=0.006435006435006435;
  s1+=0.9935649935649936;
 }
}
if(i2<-9512.0576171875){
 if(i2<-15157.7265625){
  s0+=0.002572898799313894;
  s1+=0.9974271012006861;
 } else {
  s0+=0.42857142857142855;
  s1+=0.5714285714285714;
 }
} else {
 if(i2<-8394.74609375){
  s0+=0.5957446808510638;
  s1+=0.40425531914893614;
 } else {
  s0+=0.998473023413641;
  s1+=0.001526976586359009;
 }
}
if(i2<-12744.7109375){
 if(i2<-16068.6005859375){
  s0+=0.003942181340341655;
  s1+=0.9960578186596584;
 } else {
  s0+=0.34831460674157305;
  s1+=0.651685393258427;
 }
} else {
 if(i2<-8394.74609375){
  s0+=0.5741935483870968;
  s1+=0.4258064516129032;
 } else {
  s0+=0.9981333785847616;
  s1+=0.0018666214152384185;
 }
}
if(i2<-9512.0576171875){
 if(i2<-15700.640625){
  s0+=0.0032976092333058533;
  s1+=0.9967023907666942;
 } else {
  s0+=0.3977272727272727;
  s1+=0.6022727272727273;
 }
} else {
 if(i0<277.1817626953125){
  s0+=0.9991273996509599;
  s1+=0.0008726003490401396;
 } else {
  s0+=0.625;
  s1+=0.375;
 }
}
if(i2<-9264.607421875){
 if(i3<10292.380859375){
  s0+=0.40764331210191085;
  s1+=0.5923566878980892;
 } else {
  s0+=0.006257822277847309;
  s1+=0.9937421777221527;
 }
} else {
 if(i3<4601.7783203125){
  s0+=0.9996544574982723;
  s1+=0.0003455425017277125;
 } else {
  s0+=0.717948717948718;
  s1+=0.28205128205128205;
 }
}
if(i0<451.09136962890625){
 if(i3<4854.873046875){
  s0+=0.9988101308856026;
  s1+=0.0011898691143974163;
 } else {
  s0+=0.622093023255814;
  s1+=0.37790697674418605;
 }
} else {
 if(i3<9506.50390625){
  s0+=0.5147058823529411;
  s1+=0.4852941176470588;
 } else {
  s0+=0.00261210274270788;
  s1+=0.9973878972572922;
 }
}
if(i3<6793.68994140625){
 if(i2<-7173.50146484375){
  s0+=0.6517857142857143;
  s1+=0.3482142857142857;
 } else {
  s0+=0.999140154772141;
  s1+=0.0008598452278589854;
 }
} else {
 if(i0<646.2725830078125){
  s0+=0.39267015706806285;
  s1+=0.6073298429319371;
 } else {
  s0+=0.002172024326672459;
  s1+=0.9978279756733276;
 }
}
if(i2<-8766.0234375){
 if(i3<10266.228515625){
  s0+=0.4213197969543147;
  s1+=0.5786802030456852;
 } else {
  s0+=0.005002084201750729;
  s1+=0.9949979157982493;
 }
} else {
 if(i2<-7363.3662109375){
  s0+=0.62;
  s1+=0.38;
 } else {
  s0+=0.9991340491860062;
  s1+=0.0008659508139937652;
 }
}
if(i3<9135.19140625){
 if(i3<4946.2099609375){
  s0+=0.9993183367416496;
  s1+=0.0006816632583503749;
 } else {
  s0+=0.6049382716049383;
  s1+=0.3950617283950617;
 }
} else {
 if(i3<10540.6474609375){
  s0+=0.19148936170212766;
  s1+=0.8085106382978723;
 } else {
  s0+=0.0034144259496372174;
  s1+=0.9965855740503627;
 }
}
if(i2<-12508.3046875){
 if(i2<-15076.9287109375){
  s0+=0.004266211604095563;
  s1+=0.9957337883959044;
 } else {
  s0+=0.3275862068965517;
  s1+=0.6724137931034483;
 }
} else {
 if(i0<303.1468200683594){
  s0+=0.9991493705341953;
  s1+=0.0008506294658046955;
 } else {
  s0+=0.5285714285714286;
  s1+=0.4714285714285714;
 }
}
if(i3<8796.96484375){
 if(i3<4882.6357421875){
  s0+=0.9998270494638534;
  s1+=0.00017295053614666206;
 } else {
  s0+=0.5739644970414202;
  s1+=0.4260355029585799;
 }
} else {
 if(i3<10540.6474609375){
  s0+=0.2698412698412698;
  s1+=0.7301587301587301;
 } else {
  s0+=0.007896924355777223;
  s1+=0.9921030756442227;
 }
}
if(i2<-9541.6904296875){
 if(i2<-14933.57421875){
  s0+=0.004306632213608958;
  s1+=0.9956933677863911;
 } else {
  s0+=0.44692737430167595;
  s1+=0.553072625698324;
 }
} else {
 if(i2<-8386.6064453125){
  s0+=0.6222222222222222;
  s1+=0.37777777777777777;
 } else {
  s0+=0.9986380660537963;
  s1+=0.001361933946203609;
 }
}
if(i2<-9041.71484375){
 if(i3<9894.833984375){
  s0+=0.4539877300613497;
  s1+=0.5460122699386503;
 } else {
  s0+=0.0060189165950128975;
  s1+=0.9939810834049871;
 }
} else {
 if(i3<4131.91162109375){
  s0+=1.0;
 } else {
  s0+=0.7575757575757576;
  s1+=0.24242424242424243;
 }
}
if(i2<-12880.07421875){
 if(i0<672.5852661132812){
  s0+=0.308411214953271;
  s1+=0.6915887850467289;
 } else {
  s0+=0.001759014951627089;
  s1+=0.9982409850483729;
 }
} else {
 if(i2<-8684.103515625){
  s0+=0.5641025641025641;
  s1+=0.4358974358974359;
 } else {
  s0+=0.9983001869794322;
  s1+=0.0016998130205677375;
 }
}
if(i2<-8727.01953125){
 if(i3<10228.626953125){
  s0+=0.44541484716157204;
  s1+=0.5545851528384279;
 } else {
  s0+=0.005998286203941731;
  s1+=0.9940017137960583;
 }
} else {
 if(i2<-7160.9931640625){
  s0+=0.7169811320754716;
  s1+=0.2830188679245283;
 } else {
  s0+=0.9993108201240524;
  s1+=0.0006891798759476223;
 }
}
if(i0<432.006103515625){
 if(i0<282.1363525390625){
  s0+=0.9991346486673589;
  s1+=0.0008653513326410523;
 } else {
  s0+=0.5853658536585366;
  s1+=0.4146341463414634;
 }
} else {
 if(i2<-14375.6357421875){
  s0+=0.006150061500615006;
  s1+=0.993849938499385;
 } else {
  s0+=0.4875;
  s1+=0.5125;
 }
}
if(i2<-12901.9306640625){
 if(i3<9960.677734375){
  s0+=0.40816326530612246;
  s1+=0.5918367346938775;
 } else {
  s0+=0.0073624945864010395;
  s1+=0.992637505413599;
 }
} else {
 if(i3<4882.6357421875){
  s0+=0.9994886654167376;
  s1+=0.0005113345832623146;
 } else {
  s0+=0.6;
  s1+=0.4;
 }
}
if(i0<388.1688232421875){
 if(i2<-8394.74609375){
  s0+=0.589041095890411;
  s1+=0.410958904109589;
 } else {
  s0+=0.9991425141485165;
  s1+=0.0008574858514834505;
 }
} else {
 if(i3<10266.228515625){
  s0+=0.4316546762589928;
  s1+=0.5683453237410072;
 } else {
  s0+=0.004206983592763988;
  s1+=0.995793016407236;
 }
}
if(i3<9037.861328125){
 if(i3<5018.458984375){
  s0+=0.9989802855200544;
  s1+=0.0010197144799456153;
 } else {
  s0+=0.5837837837837838;
  s1+=0.41621621621621624;
 }
} else {
 if(i3<10266.228515625){
  s0+=0.3125;
  s1+=0.6875;
 } else {
  s0+=0.00517464424320828;
  s1+=0.9948253557567918;
 }
}
if(i3<7926.890625){
 if(i0<298.51611328125){
  s0+=0.9987955953200275;
  s1+=0.0012044046799724708;
 } else {
  s0+=0.6308724832214765;
  s1+=0.3691275167785235;
 }
} else {
 if(i2<-15157.7265625){
  s0+=0.0037926675094816687;
  s1+=0.9962073324905183;
 } else {
  s0+=0.3953488372093023;
  s1+=0.6046511627906976;
 }
}
if(i3<9178.10546875){
 if(i3<4625.337890625){
  s0+=0.9996558251591808;
  s1+=0.00034417484081913615;
 } else {
  s0+=0.5956521739130435;
  s1+=0.4043478260869565;
 }
} else {
 if(i0<387.0403137207031){
  s0+=1.0;
 } else {
  s0+=0.006313131313131313;
  s1+=0.9936868686868687;
 }
}
if(i3<9665.12109375){
 if(i2<-7759.0771484375){
  s0+=0.5736842105263158;
  s1+=0.4263157894736842;
 } else {
  s0+=0.9987889273356402;
  s1+=0.0012110726643598615;
 }
} else {
 if(i0<487.95782470703125){
  s0+=0.6666666666666666;
  s1+=0.3333333333333333;
 } else {
  s0+=0.005319148936170213;
  s1+=0.9946808510638298;
 }
}
if(i3<6552.2685546875){
 if(i0<304.5187683105469){
  s0+=0.9989676531314522;
  s1+=0.0010323468685478321;
 } else {
  s0+=0.6781609195402298;
  s1+=0.3218390804597701;
 }
} else {
 if(i2<-15701.2548828125){
  s0+=0.004206983592763988;
  s1+=0.995793016407236;
 } else {
  s0+=0.4444444444444444;
  s1+=0.5555555555555556;
 }
}
if(i2<-12880.07421875){
 if(i3<8958.15234375){
  s0+=0.5294117647058824;
  s1+=0.47058823529411764;
 } else {
  s0+=0.004993757802746567;
  s1+=0.9950062421972534;
 }
} else {
 if(i2<-7856.7421875){
  s0+=0.5547945205479452;
  s1+=0.4452054794520548;
 } else {
  s0+=0.9991458831568159;
  s1+=0.0008541168431841476;
 }
}
if(i3<7572.6826171875){
 if(i3<4237.6416015625){
  s0+=1.0;
 } else {
  s0+=0.6571428571428571;
  s1+=0.34285714285714286;
 }
} else {
 if(i3<10292.380859375){
  s0+=0.35064935064935066;
  s1+=0.6493506493506493;
 } else {
  s0+=0.003469210754553339;
  s1+=0.9965307892454467;
 }
}
if(i3<7926.890625){
 if(i2<-7110.3837890625){
  s0+=0.567741935483871;
  s1+=0.432258064516129;
 } else {
  s0+=0.9993096306523991;
  s1+=0.0006903693476009665;
 }
} else {
 if(i2<-15157.7265625){
  s0+=0.0037767519932857744;
  s1+=0.9962232480067142;
 } else {
  s0+=0.4431818181818182;
  s1+=0.5568181818181818;
 }
}
if(i0<388.1688232421875){
 if(i3<4625.337890625){
  s0+=0.999827258593885;
  s1+=0.00017274140611504577;
 } else {
  s0+=0.6981132075471698;
  s1+=0.3018867924528302;
 }
} else {
 if(i2<-15162.0390625){
  s0+=0.007172995780590718;
  s1+=0.9928270042194093;
 } else {
  s0+=0.4129032258064516;
  s1+=0.5870967741935483;
 }
}
if(i2<-9247.052734375){
 if(i3<10266.228515625){
  s0+=0.48299319727891155;
  s1+=0.5170068027210885;
 } else {
  s0+=0.006239600665557404;
  s1+=0.9937603993344426;
 }
} else {
 if(i2<-7173.50146484375){
  s0+=0.6883116883116883;
  s1+=0.3116883116883117;
 } else {
  s0+=0.9998273480662984;
  s1+=0.00017265193370165745;
 }
}
if(i2<-15092.23046875){
 if(i0<531.1832275390625){
  s0+=0.5555555555555556;
  s1+=0.4444444444444444;
 } else {
  s0+=0.0038876889848812094;
  s1+=0.9961123110151188;
 }
} else {
 if(i0<299.1194763183594){
  s0+=0.9984665189981258;
  s1+=0.0015334810018742546;
 } else {
  s0+=0.5726872246696035;
  s1+=0.42731277533039647;
 }
}
if(i3<8593.71875){
 if(i2<-7173.50146484375){
  s0+=0.5932203389830508;
  s1+=0.4067796610169492;
 } else {
  s0+=0.9989738327347357;
  s1+=0.001026167265264238;
 }
} else {
 if(i0<642.065673828125){
  s0+=0.3333333333333333;
  s1+=0.6666666666666666;
 } else {
  s0+=0.0013111888111888112;
  s1+=0.9986888111888111;
 }
}
if(i3<9178.10546875){
 if(i3<4946.2099609375){
  s0+=0.999487879822465;
  s1+=0.0005121201775349949;
 } else {
  s0+=0.6153846153846154;
  s1+=0.38461538461538464;
 }
} else {
 if(i0<674.8272705078125){
  s0+=0.3333333333333333;
  s1+=0.6666666666666666;
 } else {
  s0+=0.0008806693086745927;
  s1+=0.9991193306913254;
 }
}
if(i2<-13654.9140625){
 if(i0<672.5852661132812){
  s0+=0.17307692307692307;
  s1+=0.8269230769230769;
 } else {
  s0+=0.00043840420868040335;
  s1+=0.9995615957913196;
 }
} else {
 if(i3<4656.0078125){
  s0+=0.9991422199348087;
  s1+=0.0008577800651912849;
 } else {
  s0+=0.5776699029126213;
  s1+=0.4223300970873786;
 }
}
if(i2<-13654.9140625){
 if(i2<-16012.71484375){
  s0+=0.0039164490861618795;
  s1+=0.9960835509138382;
 } else {
  s0+=0.22807017543859648;
  s1+=0.7719298245614035;
 }
} else {
 if(i0<303.1468200683594){
  s0+=0.9989747095010253;
  s1+=0.0010252904989747095;
 } else {
  s0+=0.5492957746478874;
  s1+=0.4507042253521127;
 }
}
if(i2<-12593.2265625){
 if(i2<-15701.2548828125){
  s0+=0.00263042525208242;
  s1+=0.9973695747479175;
 } else {
  s0+=0.2857142857142857;
  s1+=0.7142857142857143;
 }
} else {
 if(i3<5067.6513671875){
  s0+=0.9991535466395801;
  s1+=0.0008464533604198408;
 } else {
  s0+=0.668918918918919;
  s1+=0.3310810810810811;
 }
}
if(i2<-10507.125){
 if(i2<-14615.259765625){
  s0+=0.006881720430107527;
  s1+=0.9931182795698925;
 } else {
  s0+=0.4453125;
  s1+=0.5546875;
 }
} else {
 if(i2<-6237.4365234375){
  s0+=0.6062992125984252;
  s1+=0.3937007874015748;
 } else {
  s0+=0.9996575342465753;
  s1+=0.00034246575342465754;
 }
}
if(i3<8796.96484375){
 if(i0<282.11968994140625){
  s0+=0.9996568291008923;
  s1+=0.00034317089910775565;
 } else {
  s0+=0.5966850828729282;
  s1+=0.40331491712707185;
 }
} else {
 if(i2<-15076.9287109375){
  s0+=0.005897219882055603;
  s1+=0.9941027801179444;
 } else {
  s0+=0.3783783783783784;
  s1+=0.6216216216216216;
 }
}
if(i2<-12789.2177734375){
 if(i2<-15076.9287109375){
  s0+=0.003821656050955414;
  s1+=0.9961783439490446;
 } else {
  s0+=0.45454545454545453;
  s1+=0.5454545454545454;
 }
} else {
 if(i2<-7160.9931640625){
  s0+=0.6517412935323383;
  s1+=0.3482587064676617;
 } else {
  s0+=0.9994835599931141;
  s1+=0.0005164400068858667;
 }
}
if(i3<9506.50390625){
 if(i0<296.2254333496094){
  s0+=0.9977288609364081;
  s1+=0.0022711390635918936;
 } else {
  s0+=0.515625;
  s1+=0.484375;
 }
} else {
 if(i3<9899.3134765625){
  s0+=0.23529411764705882;
  s1+=0.7647058823529411;
 } else {
  s0+=0.0036188178528347406;
  s1+=0.9963811821471653;
 }
}
if(i3<7926.890625){
 if(i3<4914.62646484375){
  s0+=0.9991411885949846;
  s1+=0.0008588114050154586;
 } else {
  s0+=0.6419753086419753;
  s1+=0.35802469135802467;
 }
} else {
 if(i2<-15078.052734375){
  s0+=0.005121638924455826;
  s1+=0.9948783610755442;
 } else {
  s0+=0.3978494623655914;
  s1+=0.6021505376344086;
 }
}
if(i2<-12789.2177734375){
 if(i3<10228.626953125){
  s0+=0.4745762711864407;
  s1+=0.5254237288135594;
 } else {
  s0+=0.0038314176245210726;
  s1+=0.9961685823754789;
 }
} else {
 if(i3<4946.2099609375){
  s0+=0.999485773054508;
  s1+=0.0005142269454919438;
 } else {
  s0+=0.6348314606741573;
  s1+=0.3651685393258427;
 }
}
if(i2<-12744.7109375){
 if(i3<10549.2041015625){
  s0+=0.39473684210526316;
  s1+=0.6052631578947368;
 } else {
  s0+=0.0033883947479881405;
  s1+=0.9966116052520119;
 }
} else {
 if(i2<-7455.5244140625){
  s0+=0.5766871165644172;
  s1+=0.4233128834355828;
 } else {
  s0+=0.9991408934707904;
  s1+=0.000859106529209622;
 }
}
if(i3<9429.68359375){
 if(i3<4625.337890625){
  s0+=0.9994876174210077;
  s1+=0.0005123825789923143;
 } else {
  s0+=0.6095238095238096;
  s1+=0.3904761904761905;
 }
} else {
 if(i0<387.0403137207031){
  s0+=1.0;
 } else {
  s0+=0.00552956188855806;
  s1+=0.994470438111442;
 }
}
if(i3<9722.4599609375){
 if(i2<-7365.3193359375){
  s0+=0.5759162303664922;
  s1+=0.42408376963350786;
 } else {
  s0+=0.9998284145504461;
  s1+=0.00017158544955387783;
 }
} else {
 if(i0<672.5852661132812){
  s0+=0.2079207920792079;
  s1+=0.7920792079207921;
 } else {
  s0+=0.0008695652173913044;
  s1+=0.9991304347826087;
 }
}
if(i2<-12744.7109375){
 if(i3<10557.2529296875){
  s0+=0.27848101265822783;
  s1+=0.7215189873417721;
 } else {
  s0+=0.002145002145002145;
  s1+=0.9978549978549979;
 }
} else {
 if(i2<-7180.2177734375){
  s0+=0.5851063829787234;
  s1+=0.4148936170212766;
 } else {
  s0+=0.9996564754379939;
  s1+=0.00034352456200618345;
 }
}
if(i0<327.44769287109375){
 if(i2<-7184.7802734375){
  s0+=0.6222222222222222;
  s1+=0.37777777777777777;
 } else {
  s0+=0.9993167065254527;
  s1+=0.0006832934745473181;
 }
} else {
 if(i2<-15157.7265625){
  s0+=0.0039045553145336228;
  s1+=0.9960954446854664;
 } else {
  s0+=0.44907407407407407;
  s1+=0.5509259259259259;
 }
}
if(i0<337.94342041015625){
 if(i3<4134.34765625){
  s0+=1.0;
 } else {
  s0+=0.8181818181818182;
  s1+=0.18181818181818182;
 }
} else {
 if(i3<10292.380859375){
  s0+=0.46842105263157896;
  s1+=0.531578947368421;
 } else {
  s0+=0.004257130693912303;
  s1+=0.9957428693060877;
 }
}
if(i0<457.5142822265625){
 if(i0<277.1817626953125){
  s0+=0.999321343739396;
  s1+=0.0006786562606040041;
 } else {
  s0+=0.5827338129496403;
  s1+=0.4172661870503597;
 }
} else {
 if(i3<9665.12109375){
  s0+=0.47619047619047616;
  s1+=0.5238095238095238;
 } else {
  s0+=0.00387263339070568;
  s1+=0.9961273666092944;
 }
}
if(i3<7773.73291015625){
 if(i3<4858.3427734375){
  s0+=0.9993101069334254;
  s1+=0.0006898930665746809;
 } else {
  s0+=0.5846153846153846;
  s1+=0.4153846153846154;
 }
} else {
 if(i3<10457.0625){
  s0+=0.2755102040816326;
  s1+=0.7244897959183674;
 } else {
  s0+=0.006265664160401002;
  s1+=0.993734335839599;
 }
}
if(i0<535.1983642578125){
 if(i2<-7326.30859375){
  s0+=0.5806451612903226;
  s1+=0.41935483870967744;
 } else {
  s0+=0.9993098688750862;
  s1+=0.0006901311249137336;
 }
} else {
 if(i2<-14809.10546875){
  s0+=0.0050230221850146506;
  s1+=0.9949769778149854;
 } else {
  s0+=0.3888888888888889;
  s1+=0.6111111111111112;
 }
}
if(i2<-8766.0234375){
 if(i2<-15091.10546875){
  s0+=0.005515485787017395;
  s1+=0.9944845142129826;
 } else {
  s0+=0.44148936170212766;
  s1+=0.5585106382978723;
 }
} else {
 if(i2<-7173.50146484375){
  s0+=0.7037037037037037;
  s1+=0.2962962962962963;
 } else {
  s0+=0.9991410410582374;
  s1+=0.0008589589417625838;
 }
}
if(i2<-12775.7724609375){
 if(i3<10266.228515625){
  s0+=0.373134328358209;
  s1+=0.6268656716417911;
 } else {
  s0+=0.0025020850708924102;
  s1+=0.9974979149291076;
 }
} else {
 if(i0<303.58160400390625){
  s0+=0.9987964236588721;
  s1+=0.001203576341127923;
 } else {
  s0+=0.60431654676259;
  s1+=0.39568345323741005;
 }
}
if(i0<337.5187683105469){
 if(i3<4625.337890625){
  s0+=0.999829001367989;
  s1+=0.0001709986320109439;
 } else {
  s0+=0.7142857142857143;
  s1+=0.2857142857142857;
 }
} else {
 if(i3<10228.626953125){
  s0+=0.47674418604651164;
  s1+=0.5232558139534884;
 } else {
  s0+=0.004317789291882556;
  s1+=0.9956822107081175;
 }
}
if(i0<388.1688232421875){
 if(i0<277.1817626953125){
  s0+=0.999476622470342;
  s1+=0.00052337752965806;
 } else {
  s0+=0.6868686868686869;
  s1+=0.31313131313131315;
 }
} else {
 if(i3<10540.6474609375){
  s0+=0.45774647887323944;
  s1+=0.5422535211267606;
 } else {
  s0+=0.004495300367797303;
  s1+=0.9955046996322027;
 }
}
if(i2<-12593.2265625){
 if(i2<-16012.71484375){
  s0+=0.00216076058772688;
  s1+=0.9978392394122731;
 } else {
  s0+=0.3563218390804598;
  s1+=0.6436781609195402;
 }
} else {
 if(i0<296.2254333496094){
  s0+=0.9993156544054748;
  s1+=0.0006843455945252353;
 } else {
  s0+=0.5747126436781609;
  s1+=0.42528735632183906;
 }
}
if(i2<-8869.5576171875){
 if(i3<10540.6474609375){
  s0+=0.38497652582159625;
  s1+=0.6150234741784038;
 } else {
  s0+=0.0029661016949152543;
  s1+=0.9970338983050847;
 }
} else {
 if(i3<4675.9072265625){
  s0+=0.9994806993249091;
  s1+=0.0005193006750908776;
 } else {
  s0+=0.7714285714285715;
  s1+=0.22857142857142856;
 }
}
if(i3<7572.6826171875){
 if(i2<-8394.74609375){
  s0+=0.5073529411764706;
  s1+=0.49264705882352944;
 } else {
  s0+=0.9991539763113367;
  s1+=0.0008460236886632825;
 }
} else {
 if(i3<10295.8291015625){
  s0+=0.36792452830188677;
  s1+=0.6320754716981132;
 } else {
  s0+=0.006172839506172839;
  s1+=0.9938271604938271;
 }
}
if(i2<-12775.7724609375){
 if(i2<-15092.23046875){
  s0+=0.0025031289111389237;
  s1+=0.9974968710888611;
 } else {
  s0+=0.390625;
  s1+=0.609375;
 }
} else {
 if(i3<4946.2099609375){
  s0+=0.9989655172413793;
  s1+=0.0010344827586206897;
 } else {
  s0+=0.5911949685534591;
  s1+=0.4088050314465409;
 }
}
if(i0<492.6041259765625){
 if(i0<282.1363525390625){
  s0+=0.9993141289437586;
  s1+=0.0006858710562414266;
 } else {
  s0+=0.6139240506329114;
  s1+=0.3860759493670886;
 }
} else {
 if(i0<545.65478515625){
  s0+=0.46938775510204084;
  s1+=0.5306122448979592;
 } else {
  s0+=0.00503989920201596;
  s1+=0.994960100797984;
 }
}
if(i3<7498.2353515625){
 if(i0<302.453369140625){
  s0+=0.9982847341337907;
  s1+=0.0017152658662092624;
 } else {
  s0+=0.6260869565217392;
  s1+=0.3739130434782609;
 }
} else {
 if(i2<-15157.7265625){
  s0+=0.005069708491761723;
  s1+=0.9949302915082383;
 } else {
  s0+=0.39814814814814814;
  s1+=0.6018518518518519;
 }
}
if(i2<-9232.666015625){
 if(i0<600.336669921875){
  s0+=0.4069767441860465;
  s1+=0.5930232558139535;
 } else {
  s0+=0.004651162790697674;
  s1+=0.9953488372093023;
 }
} else {
 if(i2<-7414.52734375){
  s0+=0.7;
  s1+=0.3;
 } else {
  s0+=0.9991413360810579;
  s1+=0.000858663918942126;
 }
}
if(i0<534.8114624023438){
 if(i2<-8394.74609375){
  s0+=0.5308056872037915;
  s1+=0.46919431279620855;
 } else {
  s0+=0.998804440649018;
  s1+=0.0011955593509820667;
 }
} else {
 if(i3<10266.228515625){
  s0+=0.56;
  s1+=0.44;
 } else {
  s0+=0.0008587376556462001;
  s1+=0.9991412623443539;
 }
}
if(i0<328.035888671875){
 if(i2<-7856.7421875){
  s0+=0.5185185185185185;
  s1+=0.48148148148148145;
 } else {
  s0+=0.9991492257954738;
  s1+=0.0008507742045261188;
 }
} else {
 if(i3<10292.380859375){
  s0+=0.46733668341708545;
  s1+=0.5326633165829145;
 } else {
  s0+=0.002589555459646094;
  s1+=0.9974104445403539;
 }
}
if(i0<535.989501953125){
 if(i2<-8394.74609375){
  s0+=0.5677083333333334;
  s1+=0.4322916666666667;
 } else {
  s0+=0.9984779299847792;
  s1+=0.0015220700152207;
 }
} else {
 if(i3<9951.3515625){
  s0+=0.4;
  s1+=0.6;
 } else {
  s0+=0.0013157894736842105;
  s1+=0.9986842105263158;
 }
}
if(i3<8593.71875){
 if(i2<-7502.7353515625){
  s0+=0.6120218579234973;
  s1+=0.3879781420765027;
 } else {
  s0+=0.9991426611796982;
  s1+=0.0008573388203017832;
 }
} else {
 if(i2<-15945.8486328125){
  s0+=0.002572898799313894;
  s1+=0.9974271012006861;
 } else {
  s0+=0.3013698630136986;
  s1+=0.6986301369863014;
 }
}
if(i2<-9523.0390625){
 if(i0<600.336669921875){
  s0+=0.3988439306358382;
  s1+=0.6011560693641619;
 } else {
  s0+=0.0054575986565911;
  s1+=0.9945424013434089;
 }
} else {
 if(i2<-7365.3193359375){
  s0+=0.6;
  s1+=0.4;
 } else {
  s0+=0.9989637305699481;
  s1+=0.0010362694300518134;
 }
}
if(i2<-8864.99609375){
 if(i0<535.1983642578125){
  s0+=0.47468354430379744;
  s1+=0.5253164556962026;
 } else {
  s0+=0.008529650690495532;
  s1+=0.9914703493095045;
 }
} else {
 if(i2<-7856.7421875){
  s0+=0.5769230769230769;
  s1+=0.4230769230769231;
 } else {
  s0+=0.9984412885348112;
  s1+=0.0015587114651887772;
 }
}
if(i3<9247.9443359375){
 if(i3<4625.337890625){
  s0+=0.9994833821250215;
  s1+=0.0005166178749784743;
 } else {
  s0+=0.6195121951219512;
  s1+=0.3804878048780488;
 }
} else {
 if(i2<-16012.71484375){
  s0+=0.002979991485738612;
  s1+=0.9970200085142614;
 } else {
  s0+=0.3728813559322034;
  s1+=0.6271186440677966;
 }
}
if(i2<-12724.42578125){
 if(i0<660.88134765625){
  s0+=0.27941176470588236;
  s1+=0.7205882352941176;
 } else {
  s0+=0.00130605137135394;
  s1+=0.998693948628646;
 }
} else {
 if(i3<4625.806640625){
  s0+=0.9998272884283247;
  s1+=0.00017271157167530224;
 } else {
  s0+=0.5939086294416244;
  s1+=0.40609137055837563;
 }
}
if(i3<7784.60888671875){
 if(i2<-7502.7353515625){
  s0+=0.5241379310344828;
  s1+=0.47586206896551725;
 } else {
  s0+=0.9993102259010174;
  s1+=0.0006897740989825832;
 }
} else {
 if(i0<591.3614501953125){
  s0+=0.4117647058823529;
  s1+=0.5882352941176471;
 } else {
  s0+=0.0029486099410278013;
  s1+=0.9970513900589723;
 }
}
if(i2<-9088.4208984375){
 if(i2<-15157.7265625){
  s0+=0.0025564550489987218;
  s1+=0.9974435449510013;
 } else {
  s0+=0.3785310734463277;
  s1+=0.6214689265536724;
 }
} else {
 if(i2<-6237.4365234375){
  s0+=0.7524752475247525;
  s1+=0.24752475247524752;
 } else {
  s0+=0.9996548748921484;
  s1+=0.0003451251078515962;
 }
}
if(i2<-12479.3720703125){
 if(i2<-15076.9287109375){
  s0+=0.00371900826446281;
  s1+=0.9962809917355372;
 } else {
  s0+=0.3972602739726027;
  s1+=0.6027397260273972;
 }
} else {
 if(i2<-7126.1435546875){
  s0+=0.6184971098265896;
  s1+=0.3815028901734104;
 } else {
  s0+=0.9998262078554049;
  s1+=0.0001737921445950643;
 }
}
if(i2<-12744.7109375){
 if(i3<10266.228515625){
  s0+=0.42857142857142855;
  s1+=0.5714285714285714;
 } else {
  s0+=0.002054231717337716;
  s1+=0.9979457682826622;
 }
} else {
 if(i3<4625.806640625){
  s0+=0.999479618386817;
  s1+=0.0005203816131830009;
 } else {
  s0+=0.622093023255814;
  s1+=0.37790697674418605;
 }
}
if(i3<8722.03125){
 if(i0<296.2254333496094){
  s0+=0.9989597780859917;
  s1+=0.0010402219140083217;
 } else {
  s0+=0.55;
  s1+=0.45;
 }
} else {
 if(i0<600.336669921875){
  s0+=0.3037974683544304;
  s1+=0.6962025316455697;
 } else {
  s0+=0.004178854993731718;
  s1+=0.9958211450062683;
 }
}
if(i3<9506.50390625){
 if(i2<-7856.7421875){
  s0+=0.5282051282051282;
  s1+=0.4717948717948718;
 } else {
  s0+=0.9981503278964183;
  s1+=0.0018496721035816377;
 }
} else {
 if(i2<-15078.052734375){
  s0+=0.003553976010661928;
  s1+=0.9964460239893381;
 } else {
  s0+=0.48148148148148145;
  s1+=0.5185185185185185;
 }
}
if(i2<-9041.71484375){
 if(i0<672.5852661132812){
  s0+=0.328;
  s1+=0.672;
 } else {
  s0+=0.002967359050445104;
  s1+=0.9970326409495549;
 }
} else {
 if(i2<-7180.2177734375){
  s0+=0.6779661016949152;
  s1+=0.3220338983050847;
 } else {
  s0+=1.0;
 }
}
if(i3<6548.6845703125){
 if(i0<282.11968994140625){
  s0+=0.9994846246349425;
  s1+=0.0005153753650575503;
 } else {
  s0+=0.7083333333333334;
  s1+=0.2916666666666667;
 }
} else {
 if(i0<595.2078857421875){
  s0+=0.43356643356643354;
  s1+=0.5664335664335665;
 } else {
  s0+=0.00211864406779661;
  s1+=0.9978813559322034;
 }
}
if(i2<-8742.130859375){
 if(i0<545.65478515625){
  s0+=0.4467005076142132;
  s1+=0.5532994923857868;
 } else {
  s0+=0.006893580353295993;
  s1+=0.993106419646704;
 }
} else {
 if(i3<4882.6357421875){
  s0+=0.9994887525562373;
  s1+=0.0005112474437627812;
 } else {
  s0+=0.7647058823529411;
  s1+=0.23529411764705882;
 }
}
if(i2<-13646.98828125){
 if(i0<672.5852661132812){
  s0+=0.19;
  s1+=0.81;
 } else {
  s0+=0.000444247001332741;
  s1+=0.9995557529986673;
 }
} else {
 if(i0<277.1817626953125){
  s0+=0.9996577100804381;
  s1+=0.0003422899195618689;
 } else {
  s0+=0.5530973451327433;
  s1+=0.4469026548672566;
 }
}
if(i2<-9523.0390625){
 if(i2<-14933.57421875){
  s0+=0.004191114836546521;
  s1+=0.9958088851634534;
 } else {
  s0+=0.43478260869565216;
  s1+=0.5652173913043478;
 }
} else {
 if(i0<277.79364013671875){
  s0+=0.9994821336095288;
  s1+=0.0005178663904712584;
 } else {
  s0+=0.6796116504854369;
  s1+=0.32038834951456313;
 }
}
if(i2<-10923.615234375){
 if(i0<559.040283203125){
  s0+=0.38596491228070173;
  s1+=0.6140350877192983;
 } else {
  s0+=0.004301075268817204;
  s1+=0.9956989247311828;
 }
} else {
 if(i2<-6227.166015625){
  s0+=0.6967741935483871;
  s1+=0.3032258064516129;
 } else {
  s0+=1.0;
 }
}
if(i3<7572.6826171875){
 if(i0<296.2254333496094){
  s0+=0.9991374849059859;
  s1+=0.0008625150940141452;
 } else {
  s0+=0.636986301369863;
  s1+=0.363013698630137;
 }
} else {
 if(i3<10266.228515625){
  s0+=0.42857142857142855;
  s1+=0.5714285714285714;
 } else {
  s0+=0.006705783738474434;
  s1+=0.9932942162615256;
 }
}
if(i2<-12465.044921875){
 if(i0<672.5852661132812){
  s0+=0.2196969696969697;
  s1+=0.7803030303030303;
 } else {
  s0+=0.0008557980316645272;
  s1+=0.9991442019683354;
 }
} else {
 if(i3<4858.3427734375){
  s0+=1.0;
 } else {
  s0+=0.6272189349112426;
  s1+=0.3727810650887574;
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