raw_data<-read.csv("�����_��ġ����_������2.csv",header=TRUE)

raw_data<-raw_data[,-c(73:80)]
### ������ copy
original_data<-raw_data

### �� �߰�
original_data<-cbind(original_data,clustered_1st_raw_data[,5])
names(original_data)[83]<-c("label")

### factor ���� 
original_data$label<-as.factor(original_data$label)

### ������ copy
norm_data<-original_data[-83]

### ����ȭ : norm_data
norm_data[,-1]<-as.data.frame(lapply(norm_data[,-1], normalize))


###########################################

copy_data<-read.csv("�����_��ġ����_������.csv",header=TRUE,stringsAsFactors=FALSE)
copy_data[,-1] <- as.data.frame(lapply(copy_data[,-1], normalize))


### header �̸� �����ϱ�
#1��
names(copy_data)[1]<-"��ġ��"

#2��
names(copy_data)[names(copy_data)=="��ġ��"]<-"district"

#3��
names(copy_data)[c(1,2)]<-c("a","b")

###
str(names(copy_data))
summary(names(copy_data))
mode(names(raw_data))

####����, ��� ����
str(copy_data)

###na Ȯ��
#��ü na �� ���
table(is.na(copy_data))
#���ึ�� na �� ���
colSums(is.na(copy_data))
#Ư���࿡ false�� ���� ��� ���ؼ� 0�� ���� ������ =>na ���� ���� ���� �ֵ�
test1.nona <- copy_data[ , colSums(is.na(copy_data)) == 0]
copy_data$X10.11.�α���ȭ[copy_data$X10.11.�α���ȭ==NA]<-0
TEST_DATA<-ORIGINAL_DONG_DATA
#���ึ�� na �� ���
colSums(is.na(TEST_DATA))

###for�� �̿�

for(i in 1: length(TEST_DATA[,5]))
{
  
  if(TEST_DATA[i,5]==NA){
    
    # Ŭ������ �׷� ����
    clusterNum<-subset(dong_clustering, dong_clustering$��==TEST_DATA[i,2])[2]
    
    # �ش� Ŭ�����Ϳ� ���ϴ� �� �̸� ����
    nameList<-subset(dong_clustering, dong_clustering$Ŭ������==clusterNum)[1]
    
    sum<-0
    for(j in 1: length(nameList)){
      sum+=subset(TEST_DATA, TEST_DATA[,2]==nameList[j])[5]
    }
    
    # data<-sum(subset(TEST_DATA, TEST_DATA[,2]==nameList)[5])
    
    print(data)
    
  }
  
}