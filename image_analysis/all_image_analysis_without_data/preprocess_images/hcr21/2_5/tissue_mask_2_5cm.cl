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
if(i0<1982.701171875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<32493.10546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1982.701171875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1999.5732421875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<32493.10546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<33158.25390625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<32493.10546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2041.1483154296875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<32982.109375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1974.7744140625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1999.5732421875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-53318.40625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<33018.37890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1999.5732421875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-53165.06640625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2058.869384765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<32493.10546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2041.1483154296875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2061.5068359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-53318.40625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-53318.40625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-53318.40625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-53620.94140625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<1982.701171875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<32493.10546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-53157.59375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<32493.10546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2041.997314453125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-53318.40625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-53318.40625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-53318.40625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-53620.94140625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-54889.40234375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<1999.5732421875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-53165.06640625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<1982.701171875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<32353.23046875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1999.5732421875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<33158.25390625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-53157.59375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<32493.10546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-54974.9296875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<33018.37890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<32493.10546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1982.701171875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-53318.40625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2061.5068359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<33158.25390625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<32316.958984375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<32917.34375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-53165.06640625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-53318.40625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-53318.40625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-53165.06640625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-53620.94140625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<32493.10546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-53620.94140625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2058.869384765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<32348.603515625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<33783.99609375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<33344.56640625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-53460.12890625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<1999.5732421875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1982.701171875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<2039.526123046875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<32493.10546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1982.701171875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-53165.06640625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-53318.40625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<1980.22998046875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1982.701171875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<32493.10546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-53318.40625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<32353.23046875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-55102.65625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<1982.701171875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<32493.10546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-53620.94140625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<1999.5732421875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<32493.10546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1999.5732421875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<32493.10546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-53620.94140625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-53318.40625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<32493.10546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1999.5732421875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<33489.06640625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-53318.40625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-53318.40625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-53467.6015625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<2044.6348876953125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<33489.06640625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-53061.49609375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<32493.10546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-53318.40625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<32957.859375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<1999.5732421875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-53165.06640625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<33489.06640625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-53620.94140625){
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
