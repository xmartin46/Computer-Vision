import os


from google_images_download import google_images_download   #importing the library

response = google_images_download.googleimagesdownload()
arguments= {"keywords":"roses, azalea, begonia, gazania,malva,petunia,tulip", "limit":10,"print_urls":True}
absolute_image_paths = response.download(arguments)
print(absolute_image_paths)
