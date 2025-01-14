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
if(i0<2331.8173828125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<40172.25){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2149.306640625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2217.819091796875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<40447.203125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<40410.50390625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<41917.93359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2178.048583984375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<40990.328125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2109.5361328125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2149.306640625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-60238.4609375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<40447.203125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2149.306640625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-62012.3125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2149.306640625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<40990.328125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2149.306640625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2149.306640625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-61091.875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-59976.09375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-60793.72265625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-61091.875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2149.306640625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<40990.328125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-61091.875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<40447.203125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2217.819091796875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-61780.44140625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-62078.59375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-61780.44140625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-62012.3125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-61091.875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2149.306640625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-64242.71875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2149.306640625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<40447.203125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2149.306640625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<43118.76953125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-61091.875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<41059.27734375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-60793.72265625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<40410.50390625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<43256.83984375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2149.306640625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-61091.875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2149.306640625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<40990.328125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<41059.27734375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<41059.27734375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-61091.875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-61091.875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-61091.875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-60793.72265625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-61091.875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<40172.25){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-61091.875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2111.36328125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<40447.203125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<40447.203125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<40990.328125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-61714.16015625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2217.819091796875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2111.36328125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2149.306640625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<40990.328125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2111.36328125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-60793.72265625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-59976.09375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2149.306640625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2149.306640625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<40990.328125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-61091.875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<40990.328125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-60793.72265625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2149.306640625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<40990.328125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-60793.72265625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2149.306640625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<41059.27734375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2111.36328125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<41059.27734375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-61158.8984375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-60962.8125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<40990.328125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2217.819091796875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<40990.328125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-61714.16015625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-61091.875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-61091.875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2149.306640625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<40447.203125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-60793.72265625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<42461.05859375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-61091.875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<40990.328125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2252.909912109375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-61714.16015625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<40341.5546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-62012.3125){
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
