/*
OpenCL RandomForestClassifier
classifier_class_name = ObjectSegmenter
feature_specification = gaussian_blur=1 difference_of_gaussian=1 laplace_box_of_gaussian_blur=1 sobel_of_gaussian_blur=1
num_ground_truth_dimensions = 3
num_classes = 2
num_features = 4
max_depth = 2
num_trees = 100
feature_importances = 0.3099114690377007,0.0,0.5003045734613355,0.18978395750096386
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
if(i0<1697.28466796875){
 s0+=1.0;
} else {
 if(i2<-56428.71875){
  s0+=0.00027427317608337906;
  s1+=0.9997257268239166;
 } else {
  s0+=0.26666666666666666;
  s1+=0.7333333333333333;
 }
}
if(i0<1753.441650390625){
 s0+=1.0;
} else {
 if(i3<43063.12109375){
  s0+=0.04878048780487805;
  s1+=0.9512195121951219;
 } else {
  s1+=1.0;
 }
}
if(i0<1697.28466796875){
 s0+=1.0;
} else {
 if(i0<1920.1025390625){
  s0+=0.46153846153846156;
  s1+=0.5384615384615384;
 } else {
  s0+=0.0016233766233766235;
  s1+=0.9983766233766234;
 }
}
if(i0<1753.441650390625){
 if(i0<1697.28466796875){
  s0+=1.0;
 } else {
  s0+=0.6666666666666666;
  s1+=0.3333333333333333;
 }
} else {
 if(i0<2077.62158203125){
  s0+=0.2727272727272727;
  s1+=0.7272727272727273;
 } else {
  s0+=0.0013354700854700855;
  s1+=0.9986645299145299;
 }
}
if(i0<1753.441650390625){
 s0+=1.0;
} else {
 if(i3<37993.7265625){
  s0+=0.25;
  s1+=0.75;
 } else {
  s0+=0.0013462574044157242;
  s1+=0.9986537425955843;
 }
}
if(i3<35068.015625){
 if(i2<-48495.984375){
  s1+=1.0;
 } else {
  s0+=1.0;
 }
} else {
 if(i0<2077.62158203125){
  s0+=0.23809523809523808;
  s1+=0.7619047619047619;
 } else {
  s0+=0.0024489795918367346;
  s1+=0.9975510204081632;
 }
}
if(i3<32593.822265625){
 s0+=1.0;
} else {
 if(i2<-48495.984375){
  s0+=0.0005275652862041678;
  s1+=0.9994724347137959;
 } else {
  s0+=1.0;
 }
}
if(i2<-48720.0859375){
 if(i2<-52208.9296875){
  s0+=0.0005462988254575252;
  s1+=0.9994537011745425;
 } else {
  s0+=0.2;
  s1+=0.8;
 }
} else {
 s0+=1.0;
}
if(i3<37993.7265625){
 if(i0<1725.340087890625){
  s0+=1.0;
 } else {
  s0+=0.3333333333333333;
  s1+=0.6666666666666666;
 }
} else {
 if(i0<1890.760009765625){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i2<-47234.8046875){
 if(i2<-57074.953125){
  s0+=0.0005385029617662897;
  s1+=0.9994614970382337;
 } else {
  s0+=0.23529411764705882;
  s1+=0.7647058823529411;
 }
} else {
 s0+=1.0;
}
if(i0<1829.640380859375){
 if(i2<-52467.0703125){
  s1+=1.0;
 } else {
  s0+=1.0;
 }
} else {
 if(i3<43093.9765625){
  s0+=0.1282051282051282;
  s1+=0.8717948717948718;
 } else {
  s0+=0.0005412719891745603;
  s1+=0.9994587280108255;
 }
}
if(i2<-45865.765625){
 if(i2<-60683.0703125){
  s0+=0.00026910656620021526;
  s1+=0.9997308934337998;
 } else {
  s0+=0.20689655172413793;
  s1+=0.7931034482758621;
 }
} else {
 s0+=1.0;
}
if(i0<1696.587890625){
 s0+=1.0;
} else {
 if(i0<2077.62158203125){
  s0+=0.14814814814814814;
  s1+=0.8518518518518519;
 } else {
  s0+=0.0008012820512820513;
  s1+=0.999198717948718;
 }
}
if(i0<1697.28466796875){
 s0+=1.0;
} else {
 if(i2<-60762.7265625){
  s1+=1.0;
 } else {
  s0+=0.21875;
  s1+=0.78125;
 }
}
if(i2<-47647.7578125){
 if(i2<-52968.79296875){
  s1+=1.0;
 } else {
  s0+=0.5;
  s1+=0.5;
 }
} else {
 s0+=1.0;
}
if(i0<1829.640380859375){
 if(i2<-48187.0390625){
  s0+=0.5;
  s1+=0.5;
 } else {
  s0+=1.0;
 }
} else {
 if(i2<-60687.78125){
  s0+=0.0002729257641921397;
  s1+=0.9997270742358079;
 } else {
  s0+=0.34782608695652173;
  s1+=0.6521739130434783;
 }
}
if(i3<33334.484375){
 if(i0<1756.3642578125){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i2<-53281.84375){
  s0+=0.0010643959552953698;
  s1+=0.9989356040447046;
 } else {
  s0+=0.5454545454545454;
  s1+=0.45454545454545453;
 }
}
if(i0<1753.441650390625){
 s0+=1.0;
} else {
 if(i3<49230.109375){
  s0+=0.031746031746031744;
  s1+=0.9682539682539683;
 } else {
  s1+=1.0;
 }
}
if(i0<1753.441650390625){
 s0+=1.0;
} else {
 if(i2<-60687.78125){
  s0+=0.00134661998384056;
  s1+=0.9986533800161594;
 } else {
  s0+=0.25925925925925924;
  s1+=0.7407407407407407;
 }
}
if(i2<-47871.859375){
 if(i2<-60683.0703125){
  s0+=0.0007876082961407193;
  s1+=0.9992123917038592;
 } else {
  s0+=0.15;
  s1+=0.85;
 }
} else {
 s0+=1.0;
}
if(i2<-48411.13671875){
 if(i2<-60683.0703125){
  s0+=0.00027085590465872155;
  s1+=0.9997291440953413;
 } else {
  s0+=0.21428571428571427;
  s1+=0.7857142857142857;
 }
} else {
 s0+=1.0;
}
if(i2<-48720.0859375){
 if(i2<-60683.0703125){
  s0+=0.0007989347536617843;
  s1+=0.9992010652463382;
 } else {
  s0+=0.23809523809523808;
  s1+=0.7619047619047619;
 }
} else {
 s0+=1.0;
}
if(i2<-48495.984375){
 if(i0<1829.640380859375){
  s0+=0.4;
  s1+=0.6;
 } else {
  s0+=0.0005309264666843643;
  s1+=0.9994690735333156;
 }
} else {
 s0+=1.0;
}
if(i0<1725.340087890625){
 s0+=1.0;
} else {
 if(i0<2076.637451171875){
  s0+=0.23809523809523808;
  s1+=0.7619047619047619;
 } else {
  s0+=0.0002626740215392698;
  s1+=0.9997373259784608;
 }
}
if(i3<32898.8046875){
 s0+=1.0;
} else {
 if(i2<-52467.0703125){
  s0+=0.0016085790884718498;
  s1+=0.9983914209115281;
 } else {
  s0+=0.6666666666666666;
  s1+=0.3333333333333333;
 }
}
if(i2<-48411.13671875){
 if(i3<43093.9765625){
  s0+=0.13636363636363635;
  s1+=0.8636363636363636;
 } else {
  s1+=1.0;
 }
} else {
 s0+=1.0;
}
if(i3<33127.5546875){
 s0+=1.0;
} else {
 if(i3<43063.12109375){
  s0+=0.28888888888888886;
  s1+=0.7111111111111111;
 } else {
  s0+=0.000550812448361333;
  s1+=0.9994491875516387;
 }
}
if(i2<-48720.0859375){
 if(i2<-56428.71875){
  s0+=0.00027041644131963225;
  s1+=0.9997295835586804;
 } else {
  s0+=0.2777777777777778;
  s1+=0.7222222222222222;
 }
} else {
 s0+=1.0;
}
if(i2<-48187.0390625){
 if(i3<42894.5){
  s0+=0.14634146341463414;
  s1+=0.8536585365853658;
 } else {
  s0+=0.0005343307507347048;
  s1+=0.9994656692492653;
 }
} else {
 s0+=1.0;
}
if(i2<-48495.984375){
 if(i2<-60687.78125){
  s0+=0.00027693159789531985;
  s1+=0.9997230684021047;
 } else {
  s0+=0.2857142857142857;
  s1+=0.7142857142857143;
 }
} else {
 s0+=1.0;
}
if(i2<-48411.13671875){
 if(i3<49230.109375){
  s0+=0.03496503496503497;
  s1+=0.965034965034965;
 } else {
  s1+=1.0;
 }
} else {
 s0+=1.0;
}
if(i2<-48495.984375){
 if(i3<37470.0){
  s0+=0.2;
  s1+=0.8;
 } else {
  s0+=0.0005320563979781857;
  s1+=0.9994679436020218;
 }
} else {
 s0+=1.0;
}
if(i2<-48495.984375){
 if(i3<37443.0390625){
  s0+=0.3125;
  s1+=0.6875;
 } else {
  s0+=0.0010669511869831954;
  s1+=0.9989330488130168;
 }
} else {
 s0+=1.0;
}
if(i0<1697.28466796875){
 s0+=1.0;
} else {
 if(i0<2076.637451171875){
  s0+=0.23333333333333334;
  s1+=0.7666666666666667;
 } else {
  s0+=0.0010692328254477412;
  s1+=0.9989307671745522;
 }
}
if(i2<-48495.984375){
 if(i3<43063.12109375){
  s0+=0.057692307692307696;
  s1+=0.9423076923076923;
 } else {
  s1+=1.0;
 }
} else {
 s0+=1.0;
}
if(i0<1753.441650390625){
 s0+=1.0;
} else {
 if(i2<-47234.8046875){
  s0+=0.0013276686139139671;
  s1+=0.998672331386086;
 } else {
  s0+=1.0;
 }
}
if(i0<1697.28466796875){
 s0+=1.0;
} else {
 if(i3<41198.03515625){
  s0+=0.22857142857142856;
  s1+=0.7714285714285715;
 } else {
  s0+=0.0002698327037236913;
  s1+=0.9997301672962763;
 }
}
if(i0<1753.441650390625){
 if(i0<1697.28466796875){
  s0+=1.0;
 } else {
  s0+=0.6;
  s1+=0.4;
 }
} else {
 if(i2<-60683.0703125){
  s0+=0.0005336179295624333;
  s1+=0.9994663820704376;
 } else {
  s0+=0.18181818181818182;
  s1+=0.8181818181818182;
 }
}
if(i2<-52467.0703125){
 if(i2<-60683.0703125){
  s0+=0.0002707092582566324;
  s1+=0.9997292907417433;
 } else {
  s0+=0.13333333333333333;
  s1+=0.8666666666666667;
 }
} else {
 if(i0<1725.340087890625){
  s0+=1.0;
 } else {
  s0+=0.75;
  s1+=0.25;
 }
}
if(i2<-47647.7578125){
 if(i2<-60683.0703125){
  s0+=0.00027247956403269756;
  s1+=0.9997275204359674;
 } else {
  s0+=0.07407407407407407;
  s1+=0.9259259259259259;
 }
} else {
 s0+=1.0;
}
if(i3<33334.484375){
 s0+=1.0;
} else {
 if(i0<1725.340087890625){
  s0+=1.0;
 } else {
  s0+=0.0024180548092423426;
  s1+=0.9975819451907576;
 }
}
if(i2<-48495.984375){
 if(i2<-60762.7265625){
  s0+=0.0002757859900717044;
  s1+=0.9997242140099283;
 } else {
  s0+=0.2903225806451613;
  s1+=0.7096774193548387;
 }
} else {
 s0+=1.0;
}
if(i2<-48495.984375){
 if(i3<37443.0390625){
  s0+=0.15384615384615385;
  s1+=0.8461538461538461;
 } else {
  s0+=0.0005336179295624333;
  s1+=0.9994663820704376;
 }
} else {
 s0+=1.0;
}
if(i3<33334.484375){
 s0+=1.0;
} else {
 if(i2<-48519.46875){
  s0+=0.0027631942525559545;
  s1+=0.997236805747444;
 } else {
  s0+=1.0;
 }
}
if(i0<1697.28466796875){
 s0+=1.0;
} else {
 if(i2<-56428.71875){
  s0+=0.0005380683346785041;
  s1+=0.9994619316653215;
 } else {
  s0+=0.4166666666666667;
  s1+=0.5833333333333334;
 }
}
if(i2<-47647.7578125){
 if(i3<43063.12109375){
  s0+=0.13043478260869565;
  s1+=0.8695652173913043;
 } else {
  s0+=0.000546000546000546;
  s1+=0.9994539994539995;
 }
} else {
 s0+=1.0;
}
if(i2<-47234.8046875){
 if(i2<-69393.015625){
  s1+=1.0;
 } else {
  s0+=0.059322033898305086;
  s1+=0.940677966101695;
 }
} else {
 s0+=1.0;
}
if(i3<32593.822265625){
 s0+=1.0;
} else {
 if(i2<-60820.27734375){
  s1+=1.0;
 } else {
  s0+=0.44;
  s1+=0.56;
 }
}
if(i0<1753.441650390625){
 s0+=1.0;
} else {
 if(i3<46174.5703125){
  s0+=0.041666666666666664;
  s1+=0.9583333333333334;
 } else {
  s1+=1.0;
 }
}
if(i2<-48720.0859375){
 if(i0<2351.491943359375){
  s0+=0.061855670103092786;
  s1+=0.9381443298969072;
 } else {
  s0+=0.0008253094910591472;
  s1+=0.9991746905089408;
 }
} else {
 s0+=1.0;
}
if(i2<-48495.984375){
 if(i2<-60683.0703125){
  s0+=0.0005376344086021505;
  s1+=0.9994623655913979;
 } else {
  s0+=0.2916666666666667;
  s1+=0.7083333333333334;
 }
} else {
 s0+=1.0;
}
if(i2<-48187.0390625){
 if(i2<-60761.921875){
  s0+=0.0002663115845539281;
  s1+=0.9997336884154461;
 } else {
  s0+=0.16666666666666666;
  s1+=0.8333333333333334;
 }
} else {
 s0+=1.0;
}
if(i2<-48828.41796875){
 if(i2<-60687.78125){
  s0+=0.00027159152634437803;
  s1+=0.9997284084736556;
 } else {
  s0+=0.08;
  s1+=0.92;
 }
} else {
 s0+=1.0;
}
if(i2<-48187.0390625){
 if(i0<1988.074462890625){
  s0+=0.1875;
  s1+=0.8125;
 } else {
  s0+=0.0010825439783491205;
  s1+=0.9989174560216508;
 }
} else {
 s0+=1.0;
}
if(i2<-48495.984375){
 if(i2<-58083.07421875){
  s0+=0.0005324813631522897;
  s1+=0.9994675186368477;
 } else {
  s0+=0.1875;
  s1+=0.8125;
 }
} else {
 s0+=1.0;
}
if(i3<33776.36328125){
 if(i0<1697.28466796875){
  s0+=1.0;
 } else {
  s0+=0.3333333333333333;
  s1+=0.6666666666666666;
 }
} else {
 if(i3<41177.7578125){
  s0+=0.2413793103448276;
  s1+=0.7586206896551724;
 } else {
  s0+=0.001100715465052284;
  s1+=0.9988992845349477;
 }
}
if(i2<-48495.984375){
 if(i3<43063.12109375){
  s0+=0.2222222222222222;
  s1+=0.7777777777777778;
 } else {
  s0+=0.000271370420624152;
  s1+=0.9997286295793758;
 }
} else {
 s0+=1.0;
}
if(i2<-48187.0390625){
 if(i3<43093.9765625){
  s0+=0.15555555555555556;
  s1+=0.8444444444444444;
 } else {
  s0+=0.0010598834128245894;
  s1+=0.9989401165871754;
 }
} else {
 s0+=1.0;
}
if(i2<-48720.0859375){
 if(i2<-53272.5234375){
  s0+=0.0007974481658692185;
  s1+=0.9992025518341308;
 } else {
  s0+=0.5;
  s1+=0.5;
 }
} else {
 s0+=1.0;
}
if(i3<31486.59375){
 s0+=1.0;
} else {
 if(i0<1696.587890625){
  s0+=1.0;
 } else {
  s0+=0.0008116883116883117;
  s1+=0.9991883116883117;
 }
}
if(i3<32690.18359375){
 s0+=1.0;
} else {
 if(i2<-58083.07421875){
  s0+=0.0007849293563579278;
  s1+=0.9992150706436421;
 } else {
  s0+=0.4583333333333333;
  s1+=0.5416666666666666;
 }
}
if(i2<-48495.984375){
 if(i0<1829.640380859375){
  s0+=0.2222222222222222;
  s1+=0.7777777777777778;
 } else {
  s0+=0.0007814535035165407;
  s1+=0.9992185464964835;
 }
} else {
 s0+=1.0;
}
if(i0<1662.3310546875){
 s0+=1.0;
} else {
 if(i2<-60683.0703125){
  s0+=0.0005446623093681918;
  s1+=0.9994553376906318;
 } else {
  s0+=0.375;
  s1+=0.625;
 }
}
if(i0<1756.3642578125){
 if(i2<-48720.0859375){
  s1+=1.0;
 } else {
  s0+=1.0;
 }
} else {
 if(i3<43063.12109375){
  s0+=0.2564102564102564;
  s1+=0.7435897435897436;
 } else {
  s0+=0.0010961907371882709;
  s1+=0.9989038092628117;
 }
}
if(i0<1725.340087890625){
 s0+=1.0;
} else {
 if(i0<1988.074462890625){
  s0+=0.25;
  s1+=0.75;
 } else {
  s0+=0.0007894736842105263;
  s1+=0.9992105263157894;
 }
}
if(i0<1697.28466796875){
 s0+=1.0;
} else {
 if(i3<39744.16796875){
  s0+=0.3125;
  s1+=0.6875;
 } else {
  s0+=0.0010672358591248667;
  s1+=0.9989327641408752;
 }
}
if(i0<1697.28466796875){
 s0+=1.0;
} else {
 if(i2<-56428.71875){
  s0+=0.0005390835579514825;
  s1+=0.9994609164420485;
 } else {
  s0+=0.42857142857142855;
  s1+=0.5714285714285714;
 }
}
if(i2<-48720.0859375){
 if(i2<-57614.078125){
  s0+=0.00027166530834012495;
  s1+=0.9997283346916599;
 } else {
  s0+=0.11538461538461539;
  s1+=0.8846153846153846;
 }
} else {
 s0+=1.0;
}
if(i2<-48495.984375){
 if(i0<1829.640380859375){
  s0+=0.25;
  s1+=0.75;
 } else {
  s0+=0.0010967918837400603;
  s1+=0.99890320811626;
 }
} else {
 s0+=1.0;
}
if(i0<1753.441650390625){
 s0+=1.0;
} else {
 if(i3<39757.703125){
  s0+=0.30434782608695654;
  s1+=0.6956521739130435;
 } else {
  s0+=0.0013238019592268996;
  s1+=0.9986761980407731;
 }
}
if(i0<1696.587890625){
 s0+=1.0;
} else {
 if(i0<1920.1025390625){
  s0+=0.4;
  s1+=0.6;
 } else {
  s0+=0.0016072863648540047;
  s1+=0.998392713635146;
 }
}
if(i2<-48495.984375){
 if(i2<-56673.29296875){
  s0+=0.0002723311546840959;
  s1+=0.9997276688453159;
 } else {
  s0+=0.3157894736842105;
  s1+=0.6842105263157895;
 }
} else {
 s0+=1.0;
}
if(i2<-48495.984375){
 if(i3<43063.12109375){
  s0+=0.09523809523809523;
  s1+=0.9047619047619048;
 } else {
  s0+=0.0005452562704471102;
  s1+=0.9994547437295529;
 }
} else {
 s0+=1.0;
}
if(i3<35323.55078125){
 if(i2<-47647.7578125){
  s1+=1.0;
 } else {
  s0+=1.0;
 }
} else {
 if(i3<37993.7265625){
  s0+=0.3333333333333333;
  s1+=0.6666666666666666;
 } else {
  s0+=0.0005346164127238706;
  s1+=0.9994653835872761;
 }
}
if(i2<-48187.0390625){
 if(i2<-60683.0703125){
  s0+=0.0002681684097613301;
  s1+=0.9997318315902387;
 } else {
  s0+=0.20689655172413793;
  s1+=0.7931034482758621;
 }
} else {
 s0+=1.0;
}
if(i0<1753.441650390625){
 if(i0<1697.28466796875){
  s0+=1.0;
 } else {
  s0+=0.6666666666666666;
  s1+=0.3333333333333333;
 }
} else {
 if(i0<1829.640380859375){
  s0+=0.3333333333333333;
  s1+=0.6666666666666666;
 } else {
  s0+=0.0016029922522041143;
  s1+=0.9983970077477959;
 }
}
if(i3<35415.63671875){
 if(i0<1697.28466796875){
  s0+=1.0;
 } else {
  s1+=1.0;
 }
} else {
 if(i2<-52710.6484375){
  s0+=0.0013528138528138528;
  s1+=0.9986471861471862;
 } else {
  s0+=1.0;
 }
}
if(i2<-48495.984375){
 if(i0<2076.637451171875){
  s0+=0.15;
  s1+=0.85;
 } else {
  s0+=0.0013220518244315177;
  s1+=0.9986779481755684;
 }
} else {
 s0+=1.0;
}
if(i0<1697.28466796875){
 s0+=1.0;
} else {
 if(i2<-48495.984375){
  s0+=0.0024;
  s1+=0.9976;
 } else {
  s0+=1.0;
 }
}
if(i0<1827.70166015625){
 if(i2<-48495.984375){
  s1+=1.0;
 } else {
  s0+=1.0;
 }
} else {
 if(i2<-47567.2421875){
  s0+=0.00026917900403768504;
  s1+=0.9997308209959623;
 } else {
  s0+=1.0;
 }
}
if(i0<1696.587890625){
 s0+=1.0;
} else {
 if(i2<-48187.0390625){
  s0+=0.0008019246190858059;
  s1+=0.9991980753809142;
 } else {
  s0+=1.0;
 }
}
if(i3<34120.6640625){
 if(i2<-48495.984375){
  s1+=1.0;
 } else {
  s0+=1.0;
 }
} else {
 if(i2<-48232.3984375){
  s0+=0.0007959671000265323;
  s1+=0.9992040328999735;
 } else {
  s0+=1.0;
 }
}
if(i2<-48495.984375){
 if(i3<46174.5703125){
  s0+=0.08641975308641975;
  s1+=0.9135802469135802;
 } else {
  s0+=0.0002697599136768276;
  s1+=0.9997302400863232;
 }
} else {
 s0+=1.0;
}
if(i2<-48720.0859375){
 if(i2<-69461.359375){
  s1+=1.0;
 } else {
  s0+=0.038834951456310676;
  s1+=0.9611650485436893;
 }
} else {
 s0+=1.0;
}
if(i3<32593.822265625){
 s0+=1.0;
} else {
 if(i3<43063.12109375){
  s0+=0.175;
  s1+=0.825;
 } else {
  s0+=0.0005344735435595938;
  s1+=0.9994655264564404;
 }
}
if(i2<-48828.41796875){
 if(i0<2351.491943359375){
  s0+=0.047619047619047616;
  s1+=0.9523809523809523;
 } else {
  s1+=1.0;
 }
} else {
 s0+=1.0;
}
if(i3<32593.822265625){
 s0+=1.0;
} else {
 if(i2<-48495.984375){
  s0+=0.0013089005235602095;
  s1+=0.9986910994764397;
 } else {
  s0+=1.0;
 }
}
if(i2<-48187.0390625){
 if(i2<-57614.078125){
  s0+=0.0010718113612004287;
  s1+=0.9989281886387996;
 } else {
  s0+=0.2727272727272727;
  s1+=0.7272727272727273;
 }
} else {
 s0+=1.0;
}
if(i2<-48495.984375){
 if(i2<-60683.0703125){
  s0+=0.0005343307507347048;
  s1+=0.9994656692492653;
 } else {
  s0+=0.13043478260869565;
  s1+=0.8695652173913043;
 }
} else {
 s0+=1.0;
}
if(i2<-48187.0390625){
 if(i3<41177.7578125){
  s0+=0.18518518518518517;
  s1+=0.8148148148148148;
 } else {
  s0+=0.001094391244870041;
  s1+=0.9989056087551299;
 }
} else {
 s0+=1.0;
}
if(i0<1728.2625732421875){
 s0+=1.0;
} else {
 if(i3<39744.16796875){
  s0+=0.2916666666666667;
  s1+=0.7083333333333334;
 } else {
  s0+=0.0015727391874180866;
  s1+=0.9984272608125819;
 }
}
if(i3<33707.7734375){
 if(i2<-48495.984375){
  s1+=1.0;
 } else {
  s0+=1.0;
 }
} else {
 if(i2<-52467.0703125){
  s0+=0.0015868817773075905;
  s1+=0.9984131182226924;
 } else {
  s0+=0.8;
  s1+=0.2;
 }
}
if(i2<-48495.984375){
 if(i0<2351.491943359375){
  s0+=0.06097560975609756;
  s1+=0.9390243902439024;
 } else {
  s0+=0.0002738975623116954;
  s1+=0.9997261024376883;
 }
} else {
 s0+=1.0;
}
if(i3<31486.59375){
 s0+=1.0;
} else {
 if(i0<1753.441650390625){
  s0+=0.8333333333333334;
  s1+=0.16666666666666666;
 } else {
  s0+=0.002369668246445498;
  s1+=0.9976303317535545;
 }
}
if(i2<-47234.8046875){
 if(i0<1829.640380859375){
  s0+=0.16666666666666666;
  s1+=0.8333333333333334;
 } else {
  s0+=0.0007989347536617843;
  s1+=0.9992010652463382;
 }
} else {
 s0+=1.0;
}
if(i2<-48495.984375){
 if(i0<2352.029052734375){
  s0+=0.029850746268656716;
  s1+=0.9701492537313433;
 } else {
  s1+=1.0;
 }
} else {
 s0+=1.0;
}
if(i2<-48411.13671875){
 if(i2<-69393.015625){
  s1+=1.0;
 } else {
  s0+=0.061946902654867256;
  s1+=0.9380530973451328;
 }
} else {
 s0+=1.0;
}
if(i2<-48495.984375){
 if(i3<43093.9765625){
  s0+=0.18421052631578946;
  s1+=0.8157894736842105;
 } else {
  s0+=0.000547645125958379;
  s1+=0.9994523548740416;
 }
} else {
 s0+=1.0;
}
if(i0<1697.28466796875){
 s0+=1.0;
} else {
 if(i0<1988.074462890625){
  s0+=0.2608695652173913;
  s1+=0.7391304347826086;
 } else {
  s0+=0.0010698047606311847;
  s1+=0.9989301952393688;
 }
}
if(i2<-48828.41796875){
 if(i3<43093.9765625){
  s0+=0.1724137931034483;
  s1+=0.8275862068965517;
 } else {
  s0+=0.00027210884353741496;
  s1+=0.9997278911564625;
 }
} else {
 s0+=1.0;
}
 float max_s=s0;
 int cls=1;
 if (max_s < s1) {
  max_s = s1;
  cls=2;
 }
 WRITE_IMAGE (out, POS_out_INSTANCE(x,y,z,0), cls);
}