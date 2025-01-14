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
if(i0<5806.96337890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<103146.453125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<5806.96337890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<5565.84326171875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<105717.46875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<97824.625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<104194.4453125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<5607.46875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<103146.453125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<5783.546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<7215.36279296875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-140707.78125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<107466.109375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<5607.46875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-144046.78125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<5783.546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<102445.8046875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<5806.96337890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<5630.884765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-144046.78125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-154813.375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-139419.5625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-144046.78125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<5798.42138671875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<99874.7890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-152470.71875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<103146.453125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<5630.884765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-139419.5625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-145845.625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-144046.78125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-149030.34375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-149030.34375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<5783.546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-140707.78125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<5783.546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<102081.921875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<5783.546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<103146.453125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-139419.5625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<107466.109375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-144403.109375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<103146.453125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<103146.453125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<5607.46875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-145845.625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<5573.056640625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<107466.109375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<102081.921875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<103146.453125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-144046.78125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-140707.78125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-145845.625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-144403.109375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-144403.109375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<105717.46875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-144046.78125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<5783.546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<99874.7890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<107466.109375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<99874.7890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-145845.625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<5806.96337890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<5573.056640625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<5607.46875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<103146.453125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<5974.5){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-144046.78125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-144046.78125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<5783.546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<5806.96337890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<105717.46875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-144046.78125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<103146.453125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-144046.78125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<5806.96337890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<97824.625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-144046.78125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<5573.056640625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<105717.46875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<5607.46875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<103146.453125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-140707.78125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-144046.78125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<99874.7890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<5571.169921875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<107466.109375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-144046.78125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-140707.78125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-144046.78125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<5607.46875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<99874.7890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-140707.78125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<103146.453125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-145845.625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<97419.3125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<5792.232421875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-144046.78125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<105717.46875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-144046.78125){
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
