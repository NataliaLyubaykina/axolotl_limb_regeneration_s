/*
OpenCL RandomForestClassifier
classifier_class_name = ObjectSegmenter
feature_specification = gaussian_blur=1 difference_of_gaussian=1 laplace_box_of_gaussian_blur=1 sobel_of_gaussian_blur=1
num_ground_truth_dimensions = 3
num_classes = 2
num_features = 4
max_depth = 2
num_trees = 100
feature_importances = 0.31333459321134216,0.0,0.5025437557223121,0.1841216510663458
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
if(i0<1607.919677734375){
 if(i2<-36078.28125){
  s0+=0.5925925925925926;
  s1+=0.4074074074074074;
 } else {
  s0+=0.9997338301836571;
  s1+=0.00026616981634282674;
 }
} else {
 if(i0<1838.333740234375){
  s0+=0.21645021645021645;
  s1+=0.7835497835497836;
 } else {
  s0+=0.024124620898814446;
  s1+=0.9758753791011856;
 }
}
if(i0<1589.4161376953125){
 if(i0<1424.76904296875){
  s0+=0.9994728055531148;
  s1+=0.0005271944468851594;
 } else {
  s0+=0.5434782608695652;
  s1+=0.45652173913043476;
 }
} else {
 if(i2<-41489.265625){
  s0+=0.029005150447275686;
  s1+=0.9709948495527243;
 } else {
  s0+=0.6;
  s1+=0.4;
 }
}
if(i0<1607.910400390625){
 if(i0<1394.4345703125){
  s0+=0.9997333807323142;
  s1+=0.0002666192676857448;
 } else {
  s0+=0.56;
  s1+=0.44;
 }
} else {
 if(i2<-41298.26953125){
  s0+=0.028311965811965812;
  s1+=0.9716880341880342;
 } else {
  s0+=0.5769230769230769;
  s1+=0.4230769230769231;
 }
}
if(i0<1475.852783203125){
 if(i0<1406.602294921875){
  s0+=0.9998243302591129;
  s1+=0.0001756697408871322;
 } else {
  s0+=0.6956521739130435;
  s1+=0.30434782608695654;
 }
} else {
 if(i0<1753.960205078125){
  s0+=0.36764705882352944;
  s1+=0.6323529411764706;
 } else {
  s0+=0.02939964280807803;
  s1+=0.970600357191922;
 }
}
if(i0<1446.037353515625){
 if(i0<1311.972900390625){
  s0+=1.0;
 } else {
  s0+=0.859375;
  s1+=0.140625;
 }
} else {
 if(i2<-44064.9921875){
  s0+=0.030829824799674044;
  s1+=0.969170175200326;
 } else {
  s0+=0.36764705882352944;
  s1+=0.6323529411764706;
 }
}
if(i3<24648.6328125){
 if(i2<-34819.9609375){
  s0+=0.15;
  s1+=0.85;
 } else {
  s0+=1.0;
 }
} else {
 if(i0<1562.0615234375){
  s0+=0.9090909090909091;
  s1+=0.09090909090909091;
 } else {
  s0+=0.034500991407799074;
  s1+=0.965499008592201;
 }
}
if(i3<23534.9140625){
 if(i2<-34819.9609375){
  s0+=0.05263157894736842;
  s1+=0.9473684210526315;
 } else {
  s0+=1.0;
 }
} else {
 if(i0<1530.160888671875){
  s0+=0.922077922077922;
  s1+=0.07792207792207792;
 } else {
  s0+=0.034005535784895215;
  s1+=0.9659944642151048;
 }
}
if(i2<-39860.3984375){
 if(i2<-44524.9296875){
  s0+=0.027093596059113302;
  s1+=0.9729064039408867;
 } else {
  s0+=0.3333333333333333;
  s1+=0.6666666666666666;
 }
} else {
 if(i2<-36309.9296875){
  s0+=0.6578947368421053;
  s1+=0.34210526315789475;
 } else {
  s0+=0.9998232903339813;
  s1+=0.00017670966601873123;
 }
}
if(i3<23324.912109375){
 if(i0<1311.972900390625){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i2<-39693.296875){
  s0+=0.03699788583509514;
  s1+=0.9630021141649049;
 } else {
  s0+=0.9408602150537635;
  s1+=0.05913978494623656;
 }
}
if(i2<-39782.6015625){
 if(i2<-44524.9296875){
  s0+=0.02938336322251345;
  s1+=0.9706166367774866;
 } else {
  s0+=0.26744186046511625;
  s1+=0.7325581395348837;
 }
} else {
 if(i0<1331.774658203125){
  s0+=1.0;
 } else {
  s0+=0.782051282051282;
  s1+=0.21794871794871795;
 }
}
if(i0<1424.977783203125){
 if(i0<1406.602294921875){
  s0+=1.0;
 } else {
  s0+=0.625;
  s1+=0.375;
 }
} else {
 if(i0<1754.5472412109375){
  s0+=0.34234234234234234;
  s1+=0.6576576576576577;
 } else {
  s0+=0.030440148087206912;
  s1+=0.969559851912793;
 }
}
if(i2<-39748.515625){
 if(i2<-43914.171875){
  s0+=0.026340930803876075;
  s1+=0.9736590691961239;
 } else {
  s0+=0.2605633802816901;
  s1+=0.7394366197183099;
 }
} else {
 if(i2<-35996.0078125){
  s0+=0.6119402985074627;
  s1+=0.3880597014925373;
 } else {
  s0+=0.9998238661382651;
  s1+=0.00017613386173491853;
 }
}
if(i0<1477.459228515625){
 if(i0<1393.39501953125){
  s0+=0.9998238816484678;
  s1+=0.00017611835153222966;
 } else {
  s0+=0.6944444444444444;
  s1+=0.3055555555555556;
 }
} else {
 if(i2<-43907.546875){
  s0+=0.029167234564535915;
  s1+=0.970832765435464;
 } else {
  s0+=0.35802469135802467;
  s1+=0.6419753086419753;
 }
}
if(i0<1607.919677734375){
 if(i2<-35996.0078125){
  s0+=0.5507246376811594;
  s1+=0.4492753623188406;
 } else {
  s0+=1.0;
 }
} else {
 if(i0<1875.728271484375){
  s0+=0.2057877813504823;
  s1+=0.7942122186495176;
 } else {
  s0+=0.02349506464618379;
  s1+=0.9765049353538162;
 }
}
if(i2<-39527.71875){
 if(i2<-44339.875){
  s0+=0.02935208981468957;
  s1+=0.9706479101853104;
 } else {
  s0+=0.31137724550898205;
  s1+=0.688622754491018;
 }
} else {
 if(i0<1408.26708984375){
  s0+=0.9998225219629071;
  s1+=0.00017747803709290975;
 } else {
  s0+=0.6612903225806451;
  s1+=0.3387096774193548;
 }
}
if(i0<1408.7440185546875){
 if(i2<-34953.875){
  s0+=0.8571428571428571;
  s1+=0.14285714285714285;
 } else {
  s0+=1.0;
 }
} else {
 if(i2<-43948.859375){
  s0+=0.030377000271223215;
  s1+=0.9696229997287767;
 } else {
  s0+=0.38028169014084506;
  s1+=0.6197183098591549;
 }
}
if(i3<23554.892578125){
 if(i0<1311.972900390625){
  s0+=1.0;
 } else {
  s0+=0.05;
  s1+=0.95;
 }
} else {
 if(i2<-39784.66796875){
  s0+=0.03386903971310931;
  s1+=0.9661309602868907;
 } else {
  s0+=0.9081081081081082;
  s1+=0.0918918918918919;
 }
}
if(i0<1424.76904296875){
 if(i3<20348.59375){
  s0+=1.0;
 } else {
  s0+=0.9560975609756097;
  s1+=0.04390243902439024;
 }
} else {
 if(i2<-42051.34375){
  s0+=0.03078556263269639;
  s1+=0.9692144373673036;
 } else {
  s0+=0.49074074074074076;
  s1+=0.5092592592592593;
 }
}
if(i0<1521.5257568359375){
 if(i2<-35910.8984375){
  s0+=0.7068965517241379;
  s1+=0.29310344827586204;
 } else {
  s0+=1.0;
 }
} else {
 if(i0<1789.0927734375){
  s0+=0.31797235023041476;
  s1+=0.6820276497695853;
 } else {
  s0+=0.025860876780528282;
  s1+=0.9741391232194717;
 }
}
if(i2<-39744.6171875){
 if(i2<-44524.9296875){
  s0+=0.028938028938028937;
  s1+=0.971061971061971;
 } else {
  s0+=0.31788079470198677;
  s1+=0.6821192052980133;
 }
} else {
 if(i0<1387.95654296875){
  s0+=0.9999118010231082;
  s1+=8.819897689186806e-05;
 } else {
  s0+=0.75;
  s1+=0.25;
 }
}
if(i2<-39693.296875){
 if(i2<-43948.859375){
  s0+=0.030725500812127774;
  s1+=0.9692744991878722;
 } else {
  s0+=0.3048780487804878;
  s1+=0.6951219512195121;
 }
} else {
 if(i2<-35910.8984375){
  s0+=0.6438356164383562;
  s1+=0.3561643835616438;
 } else {
  s0+=0.9999112373513226;
  s1+=8.876264867743653e-05;
 }
}
if(i2<-39720.4453125){
 if(i2<-44117.1484375){
  s0+=0.03111587982832618;
  s1+=0.9688841201716738;
 } else {
  s0+=0.3105590062111801;
  s1+=0.6894409937888198;
 }
} else {
 if(i0<1387.95654296875){
  s0+=0.9999108575503655;
  s1+=8.914244963451596e-05;
 } else {
  s0+=0.75;
  s1+=0.25;
 }
}
if(i2<-39693.296875){
 if(i0<1875.868896484375){
  s0+=0.2299168975069252;
  s1+=0.7700831024930748;
 } else {
  s0+=0.02667225247870409;
  s1+=0.9733277475212959;
 }
} else {
 if(i3<20662.74609375){
  s0+=1.0;
 } else {
  s0+=0.8776371308016878;
  s1+=0.12236286919831224;
 }
}
if(i0<1477.459228515625){
 if(i0<1394.4345703125){
  s0+=0.9998207082025997;
  s1+=0.00017929179740026893;
 } else {
  s0+=0.6470588235294118;
  s1+=0.35294117647058826;
 }
} else {
 if(i0<1766.9373779296875){
  s0+=0.3488372093023256;
  s1+=0.6511627906976745;
 } else {
  s0+=0.029150994089199356;
  s1+=0.9708490059108007;
 }
}
if(i3<24565.859375){
 if(i2<-34819.9609375){
  s0+=0.16071428571428573;
  s1+=0.8392857142857143;
 } else {
  s0+=1.0;
 }
} else {
 if(i0<1602.074951171875){
  s0+=0.8557213930348259;
  s1+=0.14427860696517414;
 } else {
  s0+=0.03200540175557056;
  s1+=0.9679945982444295;
 }
}
if(i2<-39815.08203125){
 if(i3<83305.6953125){
  s0+=0.056386900889178054;
  s1+=0.9436130991108219;
 } else {
  s1+=1.0;
 }
} else {
 if(i2<-36173.1640625){
  s0+=0.7121212121212122;
  s1+=0.2878787878787879;
 } else {
  s0+=0.999911426040744;
  s1+=8.857395925597875e-05;
 }
}
if(i3<23556.16015625){
 if(i3<20340.869140625){
  s0+=1.0;
 } else {
  s0+=0.7894736842105263;
  s1+=0.21052631578947367;
 }
} else {
 if(i3<29571.73046875){
  s0+=0.24686940966010734;
  s1+=0.7531305903398927;
 } else {
  s0+=0.03827683615819209;
  s1+=0.9617231638418079;
 }
}
if(i2<-39693.296875){
 if(i2<-44637.80078125){
  s0+=0.031044857768052516;
  s1+=0.9689551422319475;
 } else {
  s0+=0.3163841807909605;
  s1+=0.6836158192090396;
 }
} else {
 if(i0<1387.95654296875){
  s0+=0.9998237419582269;
  s1+=0.0001762580417731559;
 } else {
  s0+=0.7272727272727273;
  s1+=0.2727272727272727;
 }
}
if(i2<-39744.6171875){
 if(i3<82287.4296875){
  s0+=0.0594413407821229;
  s1+=0.9405586592178771;
 } else {
  s0+=0.0003198976327575176;
  s1+=0.9996801023672425;
 }
} else {
 if(i3<20363.560546875){
  s0+=1.0;
 } else {
  s0+=0.9166666666666666;
  s1+=0.08333333333333333;
 }
}
if(i2<-39744.6171875){
 if(i2<-44637.80078125){
  s0+=0.027720598325785644;
  s1+=0.9722794016742143;
 } else {
  s0+=0.29533678756476683;
  s1+=0.7046632124352331;
 }
} else {
 if(i0<1311.972900390625){
  s0+=1.0;
 } else {
  s0+=0.7663551401869159;
  s1+=0.2336448598130841;
 }
}
if(i2<-39744.6171875){
 if(i0<1879.8472900390625){
  s0+=0.23011363636363635;
  s1+=0.7698863636363636;
 } else {
  s0+=0.027202255109231854;
  s1+=0.9727977448907682;
 }
} else {
 if(i2<-34953.875){
  s0+=0.8;
  s1+=0.2;
 } else {
  s0+=1.0;
 }
}
if(i2<-39671.38671875){
 if(i0<1794.8330078125){
  s0+=0.24528301886792453;
  s1+=0.7547169811320755;
 } else {
  s0+=0.028544372294372296;
  s1+=0.9714556277056277;
 }
} else {
 if(i2<-35910.8984375){
  s0+=0.6756756756756757;
  s1+=0.32432432432432434;
 } else {
  s0+=1.0;
 }
}
if(i2<-39720.4453125){
 if(i0<1838.094482421875){
  s0+=0.18243243243243243;
  s1+=0.8175675675675675;
 } else {
  s0+=0.026462965489019233;
  s1+=0.9735370345109807;
 }
} else {
 if(i2<-35910.8984375){
  s0+=0.6666666666666666;
  s1+=0.3333333333333333;
 } else {
  s0+=1.0;
 }
}
if(i0<1508.3382568359375){
 if(i0<1330.9873046875){
  s0+=1.0;
 } else {
  s0+=0.7014925373134329;
  s1+=0.29850746268656714;
 }
} else {
 if(i0<1753.960205078125){
  s0+=0.3442622950819672;
  s1+=0.6557377049180327;
 } else {
  s0+=0.02766101694915254;
  s1+=0.9723389830508474;
 }
}
if(i2<-39860.3984375){
 if(i3<78142.203125){
  s0+=0.06270863137815927;
  s1+=0.9372913686218407;
 } else {
  s0+=0.001899335232668566;
  s1+=0.9981006647673314;
 }
} else {
 if(i3<21180.84765625){
  s0+=1.0;
 } else {
  s0+=0.8974358974358975;
  s1+=0.10256410256410256;
 }
}
if(i0<1424.977783203125){
 if(i2<-34953.875){
  s0+=0.851063829787234;
  s1+=0.14893617021276595;
 } else {
  s0+=1.0;
 }
} else {
 if(i2<-44637.80078125){
  s0+=0.03063876350704418;
  s1+=0.9693612364929558;
 } else {
  s0+=0.3807531380753138;
  s1+=0.6192468619246861;
 }
}
if(i0<1446.037353515625){
 if(i3<20363.560546875){
  s0+=1.0;
 } else {
  s0+=0.9823788546255506;
  s1+=0.01762114537444934;
 }
} else {
 if(i3<83305.6953125){
  s0+=0.061701667027495126;
  s1+=0.9382983329725049;
 } else {
  s1+=1.0;
 }
}
if(i0<1446.037353515625){
 if(i0<1408.5048828125){
  s0+=0.9996445076430857;
  s1+=0.00035549235691432633;
 } else {
  s0+=0.5238095238095238;
  s1+=0.47619047619047616;
 }
} else {
 if(i0<1766.9373779296875){
  s0+=0.3805668016194332;
  s1+=0.6194331983805668;
 } else {
  s0+=0.028897028897028897;
  s1+=0.9711029711029711;
 }
}
if(i2<-39784.66796875){
 if(i2<-44339.875){
  s0+=0.028906463048813745;
  s1+=0.9710935369511863;
 } else {
  s0+=0.3298429319371728;
  s1+=0.6701570680628273;
 }
} else {
 if(i0<1409.81298828125){
  s0+=0.9998230088495575;
  s1+=0.00017699115044247788;
 } else {
  s0+=0.5303030303030303;
  s1+=0.4696969696969697;
 }
}
if(i2<-39744.6171875){
 if(i2<-43355.0546875){
  s0+=0.031229057767055354;
  s1+=0.9687709422329447;
 } else {
  s0+=0.3435114503816794;
  s1+=0.6564885496183206;
 }
} else {
 if(i0<1387.95654296875){
  s0+=0.9996436525612472;
  s1+=0.00035634743875278396;
 } else {
  s0+=0.7432432432432432;
  s1+=0.25675675675675674;
 }
}
if(i3<24613.828125){
 if(i0<1387.95654296875){
  s0+=0.9997309175710826;
  s1+=0.0002690824289173917;
 } else {
  s0+=0.024390243902439025;
  s1+=0.975609756097561;
 }
} else {
 if(i2<-39784.66796875){
  s0+=0.03343949044585987;
  s1+=0.9665605095541401;
 } else {
  s0+=0.9818181818181818;
  s1+=0.01818181818181818;
 }
}
if(i2<-39693.296875){
 if(i2<-44117.1484375){
  s0+=0.0296975502942384;
  s1+=0.9703024497057616;
 } else {
  s0+=0.3333333333333333;
  s1+=0.6666666666666666;
 }
} else {
 if(i2<-36665.421875){
  s0+=0.6808510638297872;
  s1+=0.3191489361702128;
 } else {
  s0+=0.9999120415164042;
  s1+=8.795848359574281e-05;
 }
}
if(i2<-39744.6171875){
 if(i3<81661.1171875){
  s0+=0.06323496782782338;
  s1+=0.9367650321721767;
 } else {
  s0+=0.0006684491978609625;
  s1+=0.9993315508021391;
 }
} else {
 if(i3<22026.453125){
  s0+=0.9999103782039792;
  s1+=8.962179602079225e-05;
 } else {
  s0+=0.9273504273504274;
  s1+=0.07264957264957266;
 }
}
if(i3<23556.16015625){
 if(i0<1321.5562744140625){
  s0+=1.0;
 } else {
  s0+=0.08;
  s1+=0.92;
 }
} else {
 if(i2<-39784.66796875){
  s0+=0.03780114468255025;
  s1+=0.9621988553174498;
 } else {
  s0+=0.9101123595505618;
  s1+=0.0898876404494382;
 }
}
if(i0<1541.4326171875){
 if(i2<-36665.421875){
  s0+=0.6486486486486487;
  s1+=0.35135135135135137;
 } else {
  s0+=0.9998229461756374;
  s1+=0.00017705382436260624;
 }
} else {
 if(i2<-43907.546875){
  s0+=0.02687296416938111;
  s1+=0.9731270358306189;
 } else {
  s0+=0.3464052287581699;
  s1+=0.6535947712418301;
 }
}
if(i2<-39635.640625){
 if(i0<1753.960205078125){
  s0+=0.29473684210526313;
  s1+=0.7052631578947368;
 } else {
  s0+=0.027201723673579314;
  s1+=0.9727982763264207;
 }
} else {
 if(i2<-36612.7265625){
  s0+=0.6229508196721312;
  s1+=0.3770491803278688;
 } else {
  s0+=0.9998216515070447;
  s1+=0.00017834849295523454;
 }
}
if(i2<-39784.66796875){
 if(i0<1657.5220947265625){
  s0+=0.4090909090909091;
  s1+=0.5909090909090909;
 } else {
  s0+=0.028540215758568892;
  s1+=0.9714597842414311;
 }
} else {
 if(i0<1387.95654296875){
  s0+=0.9999122576116521;
  s1+=8.774238834781083e-05;
 } else {
  s0+=0.6885245901639344;
  s1+=0.3114754098360656;
 }
}
if(i3<23556.16015625){
 if(i2<-34819.9609375){
  s0+=0.05;
  s1+=0.95;
 } else {
  s0+=1.0;
 }
} else {
 if(i0<1555.9185791015625){
  s0+=0.8737373737373737;
  s1+=0.12626262626262627;
 } else {
  s0+=0.03401633855631445;
  s1+=0.9659836614436855;
 }
}
if(i0<1424.977783203125){
 if(i0<1330.9873046875){
  s0+=1.0;
 } else {
  s0+=0.7714285714285715;
  s1+=0.22857142857142856;
 }
} else {
 if(i0<1708.9437255859375){
  s0+=0.39819004524886875;
  s1+=0.6018099547511312;
 } else {
  s0+=0.02884744398228901;
  s1+=0.971152556017711;
 }
}
if(i2<-39671.38671875){
 if(i0<1838.094482421875){
  s0+=0.26199261992619927;
  s1+=0.7380073800738007;
 } else {
  s0+=0.024770386863345394;
  s1+=0.9752296131366546;
 }
} else {
 if(i3<20305.65625){
  s0+=1.0;
 } else {
  s0+=0.9060150375939849;
  s1+=0.09398496240601503;
 }
}
if(i2<-39527.71875){
 if(i0<1794.8330078125){
  s0+=0.29;
  s1+=0.71;
 } else {
  s0+=0.031374707582221;
  s1+=0.968625292417779;
 }
} else {
 if(i0<1387.95654296875){
  s0+=0.9999119718309859;
  s1+=8.802816901408451e-05;
 } else {
  s0+=0.71875;
  s1+=0.28125;
 }
}
if(i2<-39527.71875){
 if(i0<1766.9373779296875){
  s0+=0.3051643192488263;
  s1+=0.6948356807511737;
 } else {
  s0+=0.0275;
  s1+=0.9725;
 }
} else {
 if(i0<1394.4345703125){
  s0+=0.9998247919404293;
  s1+=0.00017520805957074026;
 } else {
  s0+=0.6190476190476191;
  s1+=0.38095238095238093;
 }
}
if(i2<-38714.59375){
 if(i2<-44339.875){
  s0+=0.03186605455036457;
  s1+=0.9681339454496354;
 } else {
  s0+=0.3415841584158416;
  s1+=0.6584158415841584;
 }
} else {
 if(i2<-34879.28125){
  s0+=0.8363636363636363;
  s1+=0.16363636363636364;
 } else {
  s0+=1.0;
 }
}
if(i2<-39693.296875){
 if(i0<1760.3037109375){
  s0+=0.3192488262910798;
  s1+=0.6807511737089202;
 } else {
  s0+=0.029359552096135465;
  s1+=0.9706404479038645;
 }
} else {
 if(i2<-36309.9296875){
  s0+=0.6666666666666666;
  s1+=0.3333333333333333;
 } else {
  s0+=0.9999113946482368;
  s1+=8.86053517632465e-05;
 }
}
if(i2<-38465.5625){
 if(i2<-44041.97265625){
  s0+=0.02990628445424476;
  s1+=0.9700937155457552;
 } else {
  s0+=0.34759358288770054;
  s1+=0.6524064171122995;
 }
} else {
 if(i2<-34953.875){
  s0+=0.7333333333333333;
  s1+=0.26666666666666666;
 } else {
  s0+=1.0;
 }
}
if(i3<23556.16015625){
 if(i0<1310.734619140625){
  s0+=1.0;
 } else {
  s0+=0.041666666666666664;
  s1+=0.9583333333333334;
 }
} else {
 if(i3<31119.02734375){
  s0+=0.195822454308094;
  s1+=0.804177545691906;
 } else {
  s0+=0.03682032253460825;
  s1+=0.9631796774653918;
 }
}
if(i2<-39527.71875){
 if(i3<80543.0234375){
  s0+=0.06558849955076371;
  s1+=0.9344115004492363;
 } else {
  s0+=0.0010013351134846463;
  s1+=0.9989986648865153;
 }
} else {
 if(i0<1384.9814453125){
  s0+=0.9999121033664411;
  s1+=8.78966335589347e-05;
 } else {
  s0+=0.5909090909090909;
  s1+=0.4090909090909091;
 }
}
if(i2<-39920.8203125){
 if(i3<82287.4296875){
  s0+=0.062138418684379686;
  s1+=0.9378615813156204;
 } else {
  s0+=0.00033818058843422386;
  s1+=0.9996618194115657;
 }
} else {
 if(i3<20348.59375){
  s0+=1.0;
 } else {
  s0+=0.8888888888888888;
  s1+=0.1111111111111111;
 }
}
if(i2<-39693.296875){
 if(i2<-44360.26171875){
  s0+=0.02732463295269168;
  s1+=0.9726753670473083;
 } else {
  s0+=0.27906976744186046;
  s1+=0.7209302325581395;
 }
} else {
 if(i2<-36309.9296875){
  s0+=0.5925925925925926;
  s1+=0.4074074074074074;
 } else {
  s0+=1.0;
 }
}
if(i3<23405.08203125){
 if(i0<1311.972900390625){
  s0+=1.0;
 } else {
  s0+=0.07407407407407407;
  s1+=0.9259259259259259;
 }
} else {
 if(i0<1529.3154296875){
  s0+=0.9025974025974026;
  s1+=0.09740259740259741;
 } else {
  s0+=0.035202942335478785;
  s1+=0.9647970576645212;
 }
}
if(i3<23769.580078125){
 if(i2<-34980.35546875){
  s0+=0.15151515151515152;
  s1+=0.8484848484848485;
 } else {
  s0+=1.0;
 }
} else {
 if(i0<1508.3382568359375){
  s0+=0.934640522875817;
  s1+=0.06535947712418301;
 } else {
  s0+=0.03585763981803586;
  s1+=0.9641423601819642;
 }
}
if(i2<-39744.6171875){
 if(i0<1767.36572265625){
  s0+=0.3125;
  s1+=0.6875;
 } else {
  s0+=0.02700135685210312;
  s1+=0.9729986431478969;
 }
} else {
 if(i2<-36737.3203125){
  s0+=0.6724137931034483;
  s1+=0.3275862068965517;
 } else {
  s0+=0.9996456099937981;
  s1+=0.00035439000620182513;
 }
}
if(i0<1408.26708984375){
 if(i2<-35192.15234375){
  s0+=0.7142857142857143;
  s1+=0.2857142857142857;
 } else {
  s0+=1.0;
 }
} else {
 if(i2<-44117.1484375){
  s0+=0.031922088462058705;
  s1+=0.9680779115379413;
 } else {
  s0+=0.4080717488789238;
  s1+=0.5919282511210763;
 }
}
if(i0<1446.037353515625){
 if(i2<-34953.875){
  s0+=0.8148148148148148;
  s1+=0.18518518518518517;
 } else {
  s0+=1.0;
 }
} else {
 if(i0<1824.12255859375){
  s0+=0.31974921630094044;
  s1+=0.6802507836990596;
 } else {
  s0+=0.027434842249657063;
  s1+=0.9725651577503429;
 }
}
if(i0<1429.6474609375){
 if(i0<1311.972900390625){
  s0+=1.0;
 } else {
  s0+=0.75;
  s1+=0.25;
 }
} else {
 if(i3<82287.4296875){
  s0+=0.06840247131509268;
  s1+=0.9315975286849073;
 } else {
  s0+=0.00032829940906106366;
  s1+=0.9996717005909389;
 }
}
if(i0<1530.160888671875){
 if(i3<20363.560546875){
  s0+=1.0;
 } else {
  s0+=0.9045454545454545;
  s1+=0.09545454545454546;
 }
} else {
 if(i0<1753.960205078125){
  s0+=0.3407821229050279;
  s1+=0.659217877094972;
 } else {
  s0+=0.02981867024848892;
  s1+=0.9701813297515111;
 }
}
if(i0<1475.6126708984375){
 if(i2<-38037.83984375){
  s0+=0.5789473684210527;
  s1+=0.42105263157894735;
 } else {
  s0+=0.9995560685430169;
  s1+=0.0004439314569830418;
 }
} else {
 if(i2<-44064.9921875){
  s0+=0.02847887704143609;
  s1+=0.9715211229585639;
 } else {
  s0+=0.35;
  s1+=0.65;
 }
}
if(i2<-39877.15625){
 if(i2<-44637.80078125){
  s0+=0.027092600080873434;
  s1+=0.9729073999191266;
 } else {
  s0+=0.27011494252873564;
  s1+=0.7298850574712644;
 }
} else {
 if(i2<-36737.3203125){
  s0+=0.5866666666666667;
  s1+=0.41333333333333333;
 } else {
  s0+=0.999821794529092;
  s1+=0.00017820547090795688;
 }
}
if(i2<-38135.0625){
 if(i0<1859.9840087890625){
  s0+=0.26453488372093026;
  s1+=0.7354651162790697;
 } else {
  s0+=0.022964509394572025;
  s1+=0.9770354906054279;
 }
} else {
 if(i0<1311.972900390625){
  s0+=1.0;
 } else {
  s0+=0.8064516129032258;
  s1+=0.1935483870967742;
 }
}
if(i0<1437.3232421875){
 if(i3<20363.560546875){
  s0+=1.0;
 } else {
  s0+=0.9515418502202643;
  s1+=0.048458149779735685;
 }
} else {
 if(i2<-44064.9921875){
  s0+=0.030390143737166326;
  s1+=0.9696098562628337;
 } else {
  s0+=0.3770491803278688;
  s1+=0.6229508196721312;
 }
}
if(i0<1529.3154296875){
 if(i0<1387.95654296875){
  s0+=0.9999113003370588;
  s1+=8.869966294128082e-05;
 } else {
  s0+=0.6349206349206349;
  s1+=0.36507936507936506;
 }
} else {
 if(i0<1728.85595703125){
  s0+=0.3878787878787879;
  s1+=0.6121212121212121;
 } else {
  s0+=0.030721342536202463;
  s1+=0.9692786574637975;
 }
}
if(i2<-38865.98828125){
 if(i0<1760.3037109375){
  s0+=0.3514644351464435;
  s1+=0.6485355648535565;
 } else {
  s0+=0.030871753025975793;
  s1+=0.9691282469740242;
 }
} else {
 if(i0<1394.4345703125){
  s0+=0.9999110874010847;
  s1+=8.891259891526629e-05;
 } else {
  s0+=0.6730769230769231;
  s1+=0.3269230769230769;
 }
}
if(i2<-39671.38671875){
 if(i0<1767.5841064453125){
  s0+=0.32019704433497537;
  s1+=0.6798029556650246;
 } else {
  s0+=0.027049521431543905;
  s1+=0.9729504785684561;
 }
} else {
 if(i3<20662.74609375){
  s0+=1.0;
 } else {
  s0+=0.929368029739777;
  s1+=0.07063197026022305;
 }
}
if(i3<23556.16015625){
 if(i2<-34819.9609375){
  s1+=1.0;
 } else {
  s0+=1.0;
 }
} else {
 if(i3<29591.09375){
  s0+=0.2634315424610052;
  s1+=0.7365684575389948;
 } else {
  s0+=0.039898847991008714;
  s1+=0.9601011520089913;
 }
}
if(i2<-39860.3984375){
 if(i2<-44117.1484375){
  s0+=0.03064516129032258;
  s1+=0.9693548387096774;
 } else {
  s0+=0.30409356725146197;
  s1+=0.695906432748538;
 }
} else {
 if(i0<1311.972900390625){
  s0+=1.0;
 } else {
  s0+=0.6826923076923077;
  s1+=0.3173076923076923;
 }
}
if(i0<1530.62841796875){
 if(i0<1408.26708984375){
  s0+=0.9998246997984047;
  s1+=0.00017530020159523183;
 } else {
  s0+=0.6129032258064516;
  s1+=0.3870967741935484;
 }
} else {
 if(i0<1794.8330078125){
  s0+=0.28699551569506726;
  s1+=0.7130044843049327;
 } else {
  s0+=0.026955675976101153;
  s1+=0.9730443240238988;
 }
}
if(i3<23561.6640625){
 if(i0<1306.5400390625){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i2<-39693.296875){
  s0+=0.03401178361006963;
  s1+=0.9659882163899304;
 } else {
  s0+=0.9349112426035503;
  s1+=0.0650887573964497;
 }
}
if(i2<-39817.1484375){
 if(i0<1657.5220947265625){
  s0+=0.4;
  s1+=0.6;
 } else {
  s0+=0.02912228663880275;
  s1+=0.9708777133611972;
 }
} else {
 if(i2<-34953.875){
  s0+=0.7;
  s1+=0.3;
 } else {
  s0+=1.0;
 }
}
if(i0<1475.852783203125){
 if(i2<-35996.0078125){
  s0+=0.5892857142857143;
  s1+=0.4107142857142857;
 } else {
  s0+=0.9998228206945429;
  s1+=0.00017717930545712261;
 }
} else {
 if(i3<80262.1015625){
  s0+=0.06502242152466367;
  s1+=0.9349775784753364;
 } else {
  s0+=0.0012957563977972141;
  s1+=0.9987042436022028;
 }
}
if(i0<1475.852783203125){
 if(i0<1387.95654296875){
  s0+=1.0;
 } else {
  s0+=0.6176470588235294;
  s1+=0.38235294117647056;
 }
} else {
 if(i2<-43960.3515625){
  s0+=0.027227389136002155;
  s1+=0.9727726108639978;
 } else {
  s0+=0.3631578947368421;
  s1+=0.6368421052631579;
 }
}
if(i0<1478.0982666015625){
 if(i2<-35299.40234375){
  s0+=0.7592592592592593;
  s1+=0.24074074074074073;
 } else {
  s0+=1.0;
 }
} else {
 if(i0<1766.9373779296875){
  s0+=0.3565217391304348;
  s1+=0.6434782608695652;
 } else {
  s0+=0.029642906383565423;
  s1+=0.9703570936164346;
 }
}
if(i3<25597.58984375){
 if(i0<1387.95654296875){
  s0+=1.0;
 } else {
  s0+=0.08421052631578947;
  s1+=0.9157894736842105;
 }
} else {
 if(i2<-42687.0){
  s0+=0.0304853590052146;
  s1+=0.9695146409947853;
 } else {
  s0+=0.884393063583815;
  s1+=0.11560693641618497;
 }
}
if(i2<-39693.296875){
 if(i0<1880.2877197265625){
  s0+=0.18944099378881987;
  s1+=0.8105590062111802;
 } else {
  s0+=0.026319378153552436;
  s1+=0.9736806218464475;
 }
} else {
 if(i2<-35910.8984375){
  s0+=0.691358024691358;
  s1+=0.30864197530864196;
 } else {
  s0+=0.9998207082025997;
  s1+=0.00017929179740026893;
 }
}
if(i2<-39693.296875){
 if(i0<1844.623291015625){
  s0+=0.2490566037735849;
  s1+=0.7509433962264151;
 } else {
  s0+=0.029756164760986362;
  s1+=0.9702438352390136;
 }
} else {
 if(i2<-36924.0703125){
  s0+=0.6818181818181818;
  s1+=0.3181818181818182;
 } else {
  s0+=0.9997345367666578;
  s1+=0.0002654632333421821;
 }
}
if(i3<23561.6640625){
 if(i0<1311.972900390625){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i2<-39744.6171875){
  s0+=0.033006362672322376;
  s1+=0.9669936373276776;
 } else {
  s0+=0.9526315789473684;
  s1+=0.04736842105263158;
 }
}
if(i2<-39635.640625){
 if(i0<1657.5220947265625){
  s0+=0.44339622641509435;
  s1+=0.5566037735849056;
 } else {
  s0+=0.02949097764610827;
  s1+=0.9705090223538917;
 }
} else {
 if(i0<1408.5048828125){
  s0+=0.9996460803397629;
  s1+=0.00035391966023712616;
 } else {
  s0+=0.6140350877192983;
  s1+=0.38596491228070173;
 }
}
if(i3<23576.138671875){
 if(i2<-34980.35546875){
  s0+=0.05555555555555555;
  s1+=0.9444444444444444;
 } else {
  s0+=1.0;
 }
} else {
 if(i0<1627.565185546875){
  s0+=0.8008298755186722;
  s1+=0.1991701244813278;
 } else {
  s0+=0.03380876914949815;
  s1+=0.9661912308505018;
 }
}
if(i2<-39860.3984375){
 if(i2<-44637.80078125){
  s0+=0.027882543103448277;
  s1+=0.9721174568965517;
 } else {
  s0+=0.24598930481283424;
  s1+=0.7540106951871658;
 }
} else {
 if(i0<1387.4095458984375){
  s0+=0.9998213647731332;
  s1+=0.0001786352268667381;
 } else {
  s0+=0.6904761904761905;
  s1+=0.30952380952380953;
 }
}
if(i2<-39784.66796875){
 if(i0<1859.9840087890625){
  s0+=0.23297491039426524;
  s1+=0.7670250896057348;
 } else {
  s0+=0.024863042562157607;
  s1+=0.9751369574378423;
 }
} else {
 if(i0<1406.602294921875){
  s0+=0.999737555769399;
  s1+=0.0002624442306009973;
 } else {
  s0+=0.6774193548387096;
  s1+=0.3225806451612903;
 }
}
if(i2<-39505.1171875){
 if(i3<80543.0234375){
  s0+=0.061617745910822315;
  s1+=0.9383822540891776;
 } else {
  s0+=0.0006591957811470006;
  s1+=0.999340804218853;
 }
} else {
 if(i0<1394.4345703125){
  s0+=0.9998233995584989;
  s1+=0.00017660044150110375;
 } else {
  s0+=0.6521739130434783;
  s1+=0.34782608695652173;
 }
}
if(i0<1607.5108642578125){
 if(i0<1408.26708984375){
  s0+=0.9994700114830846;
  s1+=0.0005299885169154668;
 } else {
  s0+=0.553030303030303;
  s1+=0.44696969696969696;
 }
} else {
 if(i0<1874.7830810546875){
  s0+=0.1919191919191919;
  s1+=0.8080808080808081;
 } else {
  s0+=0.02282593474303319;
  s1+=0.9771740652569668;
 }
}
if(i3<23828.392578125){
 if(i2<-34980.35546875){
  s0+=0.16;
  s1+=0.84;
 } else {
  s0+=1.0;
 }
} else {
 if(i2<-39877.15625){
  s0+=0.03451054115751309;
  s1+=0.9654894588424869;
 } else {
  s0+=0.9310344827586207;
  s1+=0.06896551724137931;
 }
}
if(i2<-39817.1484375){
 if(i0<1708.9437255859375){
  s0+=0.37168141592920356;
  s1+=0.6283185840707964;
 } else {
  s0+=0.026716537536735238;
  s1+=0.9732834624632648;
 }
} else {
 if(i2<-36658.12109375){
  s0+=0.7307692307692307;
  s1+=0.2692307692307692;
 } else {
  s0+=1.0;
 }
}
if(i3<23556.16015625){
 if(i0<1387.95654296875){
  s0+=1.0;
 } else {
  s0+=0.047619047619047616;
  s1+=0.9523809523809523;
 }
} else {
 if(i0<1627.565185546875){
  s0+=0.7787610619469026;
  s1+=0.22123893805309736;
 } else {
  s0+=0.034882172813207296;
  s1+=0.9651178271867927;
 }
}
if(i2<-39744.6171875){
 if(i0<1741.234619140625){
  s0+=0.28484848484848485;
  s1+=0.7151515151515152;
 } else {
  s0+=0.02838988779234825;
  s1+=0.9716101122076517;
 }
} else {
 if(i3<20363.560546875){
  s0+=1.0;
 } else {
  s0+=0.9283154121863799;
  s1+=0.07168458781362007;
 }
}
if(i2<-39784.66796875){
 if(i0<1708.9437255859375){
  s0+=0.3624161073825503;
  s1+=0.6375838926174496;
 } else {
  s0+=0.027582477014602487;
  s1+=0.9724175229853975;
 }
} else {
 if(i0<1387.95654296875){
  s0+=0.999645075421473;
  s1+=0.000354924578527063;
 } else {
  s0+=0.6578947368421053;
  s1+=0.34210526315789475;
 }
}
if(i2<-39744.6171875){
 if(i2<-44117.1484375){
  s0+=0.029848730415991356;
  s1+=0.9701512695840087;
 } else {
  s0+=0.3609467455621302;
  s1+=0.6390532544378699;
 }
} else {
 if(i0<1387.95654296875){
  s0+=0.9997333096275225;
  s1+=0.00026669037247755356;
 } else {
  s0+=0.6231884057971014;
  s1+=0.37681159420289856;
 }
}
if(i2<-39784.66796875){
 if(i0<1753.960205078125){
  s0+=0.3389830508474576;
  s1+=0.6610169491525424;
 } else {
  s0+=0.026578521316783593;
  s1+=0.9734214786832164;
 }
} else {
 if(i2<-36665.421875){
  s0+=0.6323529411764706;
  s1+=0.36764705882352944;
 } else {
  s0+=0.9996439380452199;
  s1+=0.00035606195478013177;
 }
}
if(i0<1523.115966796875){
 if(i0<1424.977783203125){
  s0+=0.9996438429347342;
  s1+=0.0003561570652657822;
 } else {
  s0+=0.6590909090909091;
  s1+=0.3409090909090909;
 }
} else {
 if(i0<1766.9373779296875){
  s0+=0.3242009132420091;
  s1+=0.6757990867579908;
 } else {
  s0+=0.025550899013113425;
  s1+=0.9744491009868865;
 }
}
if(i2<-39784.66796875){
 if(i0<1708.913818359375){
  s0+=0.44144144144144143;
  s1+=0.5585585585585585;
 } else {
  s0+=0.027935991320857067;
  s1+=0.9720640086791429;
 }
} else {
 if(i3<20348.59375){
  s0+=1.0;
 } else {
  s0+=0.9149797570850202;
  s1+=0.08502024291497975;
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