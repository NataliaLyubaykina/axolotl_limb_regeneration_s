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
if(i0<10468.8291015625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<189013.28125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<10975.638671875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<10198.943359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<187675.625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<187824.9375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<180277.34375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<10411.65234375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<188721.796875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<10198.943359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<10141.7666015625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-239576.4375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<187824.9375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<10198.943359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-241485.453125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<10411.65234375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<180128.03125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<10141.7666015625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<10198.943359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-241485.453125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-251088.71875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-241485.453125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-241485.453125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<10975.638671875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<180277.34375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-241485.453125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<187675.625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<10782.361328125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-241485.453125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-238885.234375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-254901.9375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-241485.453125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-241485.453125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<10141.7666015625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-241485.453125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<10749.091796875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<187824.9375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<10242.2822265625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<187824.9375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-239576.4375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<187824.9375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-238885.234375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<180128.03125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<180277.34375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<10198.943359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-239576.4375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<10198.943359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<180128.03125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<180277.34375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<180277.34375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-238885.234375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-248488.5){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-251088.71875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-257502.15625){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-241485.453125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<180277.34375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-251088.71875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<10198.943359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<180277.34375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<187824.9375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<180128.03125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-237007.3125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<10198.943359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<9972.396484375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<10468.8291015625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<180277.34375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<10198.943359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-238885.234375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-239576.4375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<10198.943359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<10141.7666015625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<180277.34375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-239576.4375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<180277.34375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-251088.71875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<10141.7666015625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<180128.03125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-251088.71875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<10782.361328125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<187824.9375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<9972.396484375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<188721.796875){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-251088.71875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-241485.453125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<180277.34375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<10198.943359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<180128.03125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-251088.71875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-239576.4375){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i2<-251220.875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i0<10198.943359375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i3<180277.34375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-251088.71875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<187675.625){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-241485.453125){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<187824.9375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i0<10782.361328125){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-251088.71875){
 s1+=1.0;
} else {
 s0+=1.0;
}
if(i3<180277.34375){
 s0+=1.0;
} else {
 s1+=1.0;
}
if(i2<-251088.71875){
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
