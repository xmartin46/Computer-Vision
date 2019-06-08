import os 
import cv2
import numpy
from PIL import Image
from matplotlib import pyplot as plt
from albumentations import (HorizontalFlip, IAAPerspective, ShiftScaleRotate, RandomRotate90, Transpose, Blur, MedianBlur, GaussNoise, Flip, RandomBrightnessContrast, IAASharpen)


def applyAugmentation(aug,image):
    image = aug(image=image)['image']
    return image

for root, dirs, files in os.walk("./Segmentades",topdown=False):
    for name in files:
        if name.endswith('.jpg'):
            print(name)
            img = Image.open(os.path.join(root, name))
            data = numpy.array(img)
            #aug = IAAPerspective(scale=0.9,p=1)
            aug = HorizontalFlip(p=1)
            image = applyAugmentation(aug,data)
            plt.figure(figsize=(10, 10))
            im = Image.fromarray(image)
            if not os.path.exists(os.path.join(root,'Augmentation')):
                os.mkdir(os.path.join(root,'Augmentation'))
            nom = os.path.join(root,'Augmentation',name)
            nom = nom[:-5]
            nom = nom + "_horizontalFlip.jpeg"
            #print(nom)
            im.save(nom)
            
