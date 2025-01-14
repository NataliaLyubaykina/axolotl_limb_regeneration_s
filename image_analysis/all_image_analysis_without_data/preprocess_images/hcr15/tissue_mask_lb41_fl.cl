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
if(i0<4504.1416015625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<75950.78125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4158.51171875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4504.1416015625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<78891.859375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<78818.765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<78818.765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4548.970703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<79409.4296875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4602.376953125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4158.51171875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-114904.8515625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<78818.765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4158.51171875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-122689.6796875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<4158.51171875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<78818.765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4417.732421875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4504.1416015625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-116289.8046875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-122935.90625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-121445.2578125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-119714.828125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<4158.51171875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<75950.78125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-116149.2734375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<78818.765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4158.51171875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-121445.2578125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-118470.40625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-121099.234375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-118470.40625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-121445.2578125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<4158.51171875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-121445.2578125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<4158.51171875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<75950.78125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4504.1416015625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<76361.5390625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-121445.2578125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<78818.765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-116289.8046875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<76023.8671875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<75950.78125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4072.1025390625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-121445.2578125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<4158.51171875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<78891.859375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<78891.859375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<74051.9375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-122935.90625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-122689.6796875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-123828.9609375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-121445.2578125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-121445.2578125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<77154.34375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-118470.40625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<4548.970703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<78891.859375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<76023.8671875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<78891.859375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-119714.828125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<3964.674560546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4593.6435546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4072.1025390625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<73094.2421875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4158.51171875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-118470.40625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-119714.828125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<3964.674560546875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4158.51171875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<78818.765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-122689.6796875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<74051.9375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-122935.90625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<4602.376953125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<78818.765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-121445.2578125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<4158.51171875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<78818.765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4022.75){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<75950.78125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-122935.90625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-122689.6796875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<78818.765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4504.1416015625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<78818.765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-122935.90625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-121445.2578125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-121445.2578125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<4548.970703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<78818.765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-122689.6796875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<78818.765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-123828.9609375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<73167.328125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<4072.1025390625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-114656.03125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<75950.78125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-121445.2578125){
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
