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
if(i0<2179.33203125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<41318.50390625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2091.955810546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2178.928955078125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<40578.796875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<40578.796875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<40578.796875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2131.8134765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<40578.796875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2083.1328125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2131.8134765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-61239.9296875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<42429.3515625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2218.78662109375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-60976.671875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2218.78662109375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<40578.796875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2131.8134765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2131.8134765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-60704.84765625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-60637.03125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-61239.9296875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-60976.671875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2131.8134765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<40545.375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-60976.671875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<41783.0){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2218.78662109375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-60976.671875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-62368.21875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-61239.9296875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-61239.9296875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-60976.671875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2218.78662109375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-60976.671875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2219.189697265625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<41285.0859375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2219.189697265625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<40578.796875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-60900.2890625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<40578.796875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-60976.671875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<40578.796875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<40545.375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2166.1123046875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-62368.21875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2131.8134765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<40578.796875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<41318.50390625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<42429.3515625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-60968.10546875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-60976.671875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-62836.8828125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-60976.671875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-60976.671875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<40545.375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-60976.671875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2091.955810546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<40133.73046875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<40545.375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<41749.58203125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-60976.671875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2131.8134765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2083.1328125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2219.189697265625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<40133.73046875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2131.8134765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-60704.84765625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-60976.671875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2179.33203125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2204.0791015625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<40578.796875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-60704.84765625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<41783.0){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-61239.9296875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2218.78662109375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<41318.50390625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-60968.10546875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2178.928955078125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<41318.50390625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2170.10595703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<40545.375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-61239.9296875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-60206.61328125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<40545.375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2131.8134765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<41318.50390625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-60976.671875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-60637.03125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-61239.9296875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2131.8134765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<41783.0){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-61239.9296875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<42817.109375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-60976.671875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<40133.73046875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2131.8134765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-61239.9296875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<40545.375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-60976.671875){
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
