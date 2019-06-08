import os 
import cv2
import numpy
import shutil
import imageio
from PIL import Image
from matplotlib import pyplot as plt
from albumentations import (HorizontalFlip, RandomCrop, ShiftScaleRotate,Crop,  RandomScale, RandomRotate90, Transpose, Blur, MedianBlur, GaussNoise, Flip, RandomBrightnessContrast, IAASharpen, Compose)


def applyAugmentation(aug,image):
    image = aug(image=image)['image']
    return image


for root, dirs, files in os.walk("./Segmentades",topdown=False):
    for name in files:
        if name.endswith('.jpg') and 'horizontal' not in name and 'scale' not in name and 'brightness' not in name and 'blur' not in name:
            #print(name)
            img = Image.open(os.path.join(root, name))
            data = numpy.array(img)
            #aug = HorizontalFlip()
            #aug = RandomRotate90()
            #image = applyAugmentation(aug,data)
            #aug = Blur(blur_limit=12, p= 1)
            #image = applyAugmentation(aug,image)
            #aug = RandomBrightnessContrast(0.8)
            #aug = RandomScale(scale_limit=1,p=1)
            aug = RandomCrop(height = 400, width = 400, always_apply=True)
            image = applyAugmentation(aug,data)
            #aug = IAASharpen()
            #image = applyAugmentation(aug,image)
            
            im = Image.fromarray(image)
            #if not os.path.exists(os.path.join(root,'Augmentation')):
            #   os.mkdir(os.path.join(root,'Augmentation'))
           # else: 
           #     shutil.rmtree(os.path.join(root,'Augmentation')) 
            nom = os.path.join(root,'Augmentation',name)
            nom = nom[:-4]
            nom = nom + "_scale.jpg"
            #print(nom)
            im.save(nom)
            
           # LO MATEIX PER LA SEGMENTACIÓ canvia pq son PNGs
            try:
                segmented = name[:-4]
                segmented = segmented + ".png"
                print(segmented)

                img = imageio.imread(os.path.join(root, segmented))
                image = applyAugmentation(aug,data)
            
                nom = os.path.join(root,'Augmentation',segmented)
                nom = nom[:-4]
                nom = nom + "_scale.png"
                #print(nom)
                imageio.imwrite(nom, img[:,:,:])
            except:
                print('There is no segmentation for this flower') 

