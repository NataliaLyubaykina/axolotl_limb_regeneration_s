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
if(i0<2115.0380859375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<33997.0546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2114.73193359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2081.8525390625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<33860.02734375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<34452.265625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<33860.02734375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2114.73193359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<33729.28515625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2153.747802734375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2115.0380859375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-57533.65625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<33729.28515625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2154.05419921875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-55923.25){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2154.05419921875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<33860.02734375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2091.289306640625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2219.2509765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-56536.59765625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-55923.25){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-55923.25){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-55923.25){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2115.0380859375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<33866.3125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-55852.28125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<33860.02734375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2115.0380859375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-55923.25){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-57558.875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-55852.28125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-57533.65625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-55744.33203125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2115.0380859375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-55923.25){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2114.73193359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<33801.546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2091.289306640625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<33997.0546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-56517.703125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<33801.546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-56588.671875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<33997.0546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<33580.09375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2154.05419921875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-56465.62890625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2115.0380859375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<33860.02734375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<33801.546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<33860.02734375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-56536.59765625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-55923.25){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-55852.28125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-56517.703125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-56465.62890625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<33801.546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-55923.25){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2115.0380859375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<34452.265625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<33860.02734375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<33997.0546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-55744.33203125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2115.0380859375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2091.289306640625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2154.05419921875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<33860.02734375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2209.99658203125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-55923.25){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-55852.28125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2219.2509765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2115.0380859375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<33860.02734375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-55923.25){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<34785.33984375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-56536.59765625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2154.05419921875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<33860.02734375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-55923.25){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2115.0380859375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<33997.0546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2115.0380859375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<33860.02734375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-57533.65625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-55923.25){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<33860.02734375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2223.42919921875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<33860.02734375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-55923.25){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-55852.28125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-55923.25){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2115.0380859375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<34393.78515625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-56588.671875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<33997.0546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-56357.6796875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<33997.0546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2154.05419921875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-57462.6875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<33860.02734375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-56536.59765625){
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
