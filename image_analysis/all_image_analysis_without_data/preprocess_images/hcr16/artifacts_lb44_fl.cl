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
if(i0<30789.859375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<509200.75){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<29292.923828125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<29195.3671875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<493197.125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<493197.125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<509200.75){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<30999.9609375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<493197.125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<29289.12890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<30183.5){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-707090.5){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<508105.0625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<29292.923828125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-704222.4375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<29292.923828125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<493197.125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<29237.4453125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<29082.822265625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-741345.5){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-704222.4375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-707090.5){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-718350.0625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<30187.294921875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<504651.9375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-718350.0625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<510573.375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<29292.923828125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-707090.5){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-703428.25){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-707090.5){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-703372.5625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-718350.0625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<30187.294921875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-703428.25){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<29292.923828125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<493154.0625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<29289.12890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<513715.625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-707090.5){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<504651.9375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-707090.5){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<509243.8125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<493197.125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<29289.12890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-715482.0){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<30183.5){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<509243.8125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<504608.875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<504651.9375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-741345.5){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-703428.25){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-718350.0625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-707090.5){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-707090.5){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<493197.125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-704222.4375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<30131.81640625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<509243.8125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<493197.125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<504651.9375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-707090.5){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<29292.923828125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<29292.923828125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<29292.923828125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<502920.34375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<30187.294921875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-741345.5){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-707090.5){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<30187.294921875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<30999.9609375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<493154.0625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-703428.25){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<507512.21875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-741345.5){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<30999.9609375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<493154.0625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-718350.0625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<29292.923828125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<509200.75){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<30187.294921875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<493197.125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-707090.5){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-718350.0625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<492058.375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<30999.9609375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<493197.125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-707090.5){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-707090.5){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-707090.5){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<29292.923828125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<493197.125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-741345.5){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<503513.1875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-747971.0625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<493197.125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<29292.923828125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-750839.125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<492058.375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-704222.4375){
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
