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
if(i0<827.1150512695312){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<13276.01171875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<827.5469970703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<827.7169799804688){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<13446.185546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<13446.185546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<13446.185546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<827.5469970703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<13446.185546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<828.14892578125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<828.14892578125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-21038.5546875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<13446.185546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<819.8367309570312){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-20906.99609375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<827.5469970703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<13527.283203125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<827.5469970703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<827.5469970703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-21013.61328125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-21312.44921875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-21013.61328125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-20906.99609375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<827.1150512695312){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<13446.185546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-20912.51953125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<13527.283203125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<828.14892578125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-20906.99609375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-21038.5546875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-21038.5546875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-21038.5546875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-20887.580078125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<828.14892578125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-21038.5546875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<827.5469970703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<13204.2578125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<827.5469970703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<13446.185546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-20912.51953125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<13204.2578125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-21357.728515625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<13285.35546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<13446.185546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<827.5469970703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-21013.61328125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<827.5469970703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<13779.296875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<13527.283203125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<13446.185546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-21013.61328125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-21038.5546875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-21013.61328125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-21013.61328125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-21013.61328125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<13446.185546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-20931.9375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<839.46875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<13446.185546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<13204.2578125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<13276.01171875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-21013.61328125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<827.5469970703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<832.860595703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<827.5469970703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<13448.375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<827.1150512695312){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-21093.515625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-21013.61328125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<827.7169799804688){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<820.9165649414062){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<13268.0576171875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-21013.61328125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<13186.9609375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-21013.61328125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<827.5469970703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<13204.2578125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-21038.5546875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<842.2607421875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<13446.185546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<828.14892578125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<13285.35546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-21389.875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-20906.99609375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<13285.35546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<827.5469970703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<13285.35546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-21013.61328125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-20931.9375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-21013.61328125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<820.9165649414062){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<13446.185546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-21038.5546875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<13527.283203125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-21013.61328125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<13720.447265625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<827.5469970703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-20906.99609375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<13527.283203125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-20912.51953125){
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