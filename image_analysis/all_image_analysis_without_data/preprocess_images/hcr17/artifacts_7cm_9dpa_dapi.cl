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
if(i0<654.8093872070312){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<20038.41015625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<654.8093872070312){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<619.761962890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<14766.462890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<14766.462890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<14719.0390625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<654.8093872070312){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<14766.462890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<635.1904296875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<721.430908203125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-17443.87109375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<14766.462890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<711.6510009765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-17443.87109375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<654.8093872070312){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<18688.587890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<775.863525390625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<711.6510009765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-17434.48046875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-17443.87109375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-17434.48046875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-19216.35546875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<654.8093872070312){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<14766.462890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-17443.87109375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<14766.462890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<699.5146484375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-17210.1484375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-17443.87109375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-17443.87109375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-17210.1484375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-19225.748046875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<654.8093872070312){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-17434.48046875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<635.1904296875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<18485.734375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<711.6510009765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<14719.0390625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-17443.87109375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<14448.265625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-19225.748046875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<14766.462890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<18370.390625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<711.6510009765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-17443.87109375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<654.8093872070312){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<14719.0390625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<14766.462890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<20222.4765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-17443.87109375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-17443.87109375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-17443.87109375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-19225.748046875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-17434.48046875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<20085.833984375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-17443.87109375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<699.5146484375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<14719.0390625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<14766.462890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<14766.462890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-17434.48046875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<654.8093872070312){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<654.8093872070312){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<654.8093872070312){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<18688.587890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<642.673095703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-19225.748046875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-19225.748046875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<699.5146484375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<699.5146484375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<14766.462890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-17443.87109375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<14719.0390625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-17443.87109375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<733.5672607421875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<18688.587890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-20244.234375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<699.5146484375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<14766.462890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<654.8093872070312){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<14719.0390625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-16985.087890625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-17443.87109375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<14719.0390625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<642.673095703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<14766.462890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-20676.328125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-19957.26171875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-17434.48046875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<654.8093872070312){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<20085.833984375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-17443.87109375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<14766.462890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-17443.87109375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<14719.0390625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<654.8093872070312){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-17443.87109375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<14766.462890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-20244.234375){
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