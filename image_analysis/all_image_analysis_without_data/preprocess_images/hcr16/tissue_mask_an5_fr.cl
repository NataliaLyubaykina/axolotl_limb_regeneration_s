/*
OpenCL RandomForestClassifier
classifier_class_name = ObjectSegmenter
feature_specification = gaussian_blur=1 difference_of_gaussian=1 laplace_box_of_gaussian_blur=1 sobel_of_gaussian_blur=1
num_ground_truth_dimensions = 3
num_classes = 2
num_features = 4
max_depth = 2
num_trees = 100
feature_importances = 0.3,0.0,0.37,0.33
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
if(i0<4648.1337890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<77648.859375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4600.86328125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4789.576171875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<74846.7109375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<77648.859375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<77398.515625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4648.1337890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<77648.859375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4837.34375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4648.1337890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-125199.0390625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<74846.7109375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4648.1337890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-125644.0859375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<4648.1337890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<77398.515625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4959.716796875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4837.34375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-125609.03125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-126671.875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-126671.875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-125199.0390625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<4959.716796875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<77207.25){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-124485.6328125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<74846.7109375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4648.1337890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-125199.0390625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-125199.0390625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-125199.0390625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-124316.9140625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-125199.0390625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<4837.34375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-125199.0390625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<4837.34375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<74846.7109375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4648.1337890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<77345.03125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-124316.9140625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<77648.859375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-124485.6328125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<74846.7109375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<77398.515625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4648.1337890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-125199.0390625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<4648.1337890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<74846.7109375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<74846.7109375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<77595.375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-125199.0390625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-125789.75){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-125199.0390625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-124485.6328125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-127218.1796875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<74793.2265625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-125199.0390625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<4837.34375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<74846.7109375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<74754.765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<77398.515625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-126671.875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<4648.1337890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4837.34375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4600.86328125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<77648.859375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4852.58984375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-126671.875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-126671.875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<4648.1337890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4648.1337890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<74846.7109375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-126336.0546875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<77595.375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-126671.875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<4648.1337890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<74846.7109375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-127218.1796875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<4600.86328125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<74846.7109375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4852.58984375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<77306.5703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-125199.0390625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-126671.875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<74846.7109375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4804.822265625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<74846.7109375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-125958.46875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-125199.0390625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-124485.6328125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<4648.1337890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<74846.7109375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-125199.0390625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<77648.859375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-125199.0390625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<74846.7109375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4790.0732421875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-125199.0390625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<77595.375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-125199.0390625){
 s1+=1.0;
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
