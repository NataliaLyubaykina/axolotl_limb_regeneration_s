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
if(i0<674.3584594726562){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<10940.47265625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<690.1453857421875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<680.8042602539062){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<10821.6796875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<10940.47265625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<10821.6796875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<701.1915893554688){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<10940.47265625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<680.8042602539062){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<690.1453857421875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-18298.998046875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<11571.2001953125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<694.7457885742188){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-18145.138671875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<690.1453857421875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<10940.47265625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<680.8042602539062){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<680.8042602539062){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-18355.673828125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-17787.021484375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-18537.42578125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-17764.701171875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<687.9332275390625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<10857.70703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-18298.998046875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<10821.6796875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<680.8042602539062){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-17787.021484375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-17940.880859375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-17673.21484375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-17556.265625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-18298.998046875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<706.0153198242188){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-17940.880859375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<680.8042602539062){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<11221.958984375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<690.1453857421875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<10857.70703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-18298.998046875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<10811.7392578125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-17940.880859375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<11075.634765625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<11185.931640625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<680.8042602539062){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-17940.880859375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<674.3584594726562){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<10857.70703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<10857.70703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<10857.70703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-17940.880859375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-17940.880859375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-18145.138671875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-18355.673828125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-17940.880859375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<10940.47265625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-18531.853515625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<680.8042602539062){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<11291.1962890625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<11144.8720703125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<10926.9443359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-18031.33203125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<690.1453857421875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<690.1453857421875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<690.1453857421875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<10926.9443359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<683.2569580078125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-17940.880859375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-17940.880859375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<680.8042602539062){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<680.8042602539062){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<10926.9443359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-17940.880859375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<10926.9443359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-18298.998046875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<690.1453857421875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<10926.9443359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-17940.880859375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<674.3584594726562){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<10926.9443359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<680.8042602539062){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<10926.9443359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-18145.138671875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-17940.880859375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<10926.9443359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<671.6116943359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<11221.958984375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-18145.138671875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-17787.021484375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-18298.998046875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<690.1453857421875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<10926.9443359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-17561.48046875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<10926.9443359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-17787.021484375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<10926.9443359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<706.0153198242188){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-17940.880859375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<10926.9443359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-18298.998046875){
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