import cv2
import os
import numpy as np

#creamos la ruta donde se almacenan las imagenes a entrenar
dataPhat = "d:/hugo_/Escritorio/reconocimiento_mascarilla/Dataset_faces"
#nuestra variable sera igual a la funcion de os. listdir que lo que hace es listarme los archivos que tenemos en la carpeta que le indicamos
dir_list = os.listdir(dataPhat)
print("Lista Archivos:", dir_list) #imprimimos los archivos que tenemos lo listamos

#creamos unas listas o arrays, para que ahi se almacenen las etiquetas(labels) los rostros, etc

labels = []
facesData = []
label = 0 #lo inicializamos desde seor por que se va a ir incrementando

#le decimos a nuestro interador que recorra nuestros archivos
for i in dir_list: #para que nos los traiga
    dir_path = dataPhat + "/" + i

#ahora vamos a construir  el el dirphat con las imagenes correspondientes que vamos a leer
    for file_name in os.listdir(dir_path): #ahora nuestro interador recorrera cada imagen que tengamos en nuestros archivos
        image_phat = dir_path + "/" + file_name #cada imagen tendra el nombre del phat correspondiente Ejemplo : imagen1/con mascara, asi construimos el phat con sus imagenes crrespondientes
        print(image_phat)

        #con la funcion cv2.imread = leemos las imagenes y nos piden 2 parametros = la imagen o el phat de img a leer y la escala de grises =,0
        image = cv2.imread(image_phat, 0) #AHORA VAMOS A LEER LAS IMAGENES ya construidas, y con el ,0 las trasformamos a escalas de grises
        #nos piden 2 parametros(el texto a mostrar en el frame y ña imagen a visualizar)
       # cv2.imshow("Imagen", image) #con la funcion imshow= visualizamos la imagen ya a escalas de grises
       # cv2.waitKey(10) #Ahora cuendo ejecutemos el programa, primero nos nseñara las imagenes con mascarilla y despues sin mascarilla, ahora si ya quedo construido nuestro phat
 
     #Ahora vamos a almacenar los rostros ya construidos en con mascarilla y sin mascarilla en nuestro array = facesData que creamos al principio
        facesData.append(image)
        #ahora guardamos las etiquetas correspondientes en label
        labels.append(label)
        #Ahora vamos incrementando en 1 el label
    label += 1 # de este modo todas las imagenes que correspondan a los rostros con mascarillas tendran la etiqueta 0 y las de sin mascarilla tendran etiqueta 1

#Ahora imprimimos las etiquetas que tenemos, que 0 es con mascarilla y 1 es sin mascarilla
print("Etiquetas 0: ", np.count_nonzero(np.array(labels) == 0))
print("Etiquetas 1: ", np.count_nonzero(np.array(labels) == 1))

# LBPH FACERECONIZER
#utilizamos este metodo para hacer el entrenamineto de objetos o rostros
face_mask = cv2.face.LBPHFaceRecognizer_create()

# Empezamos a crear el entrenamiento
print("Entrenando...")
#para entrenar las imagenes guardadas hacemos lo siguiente
#utilizaremos el metodo .train() y entre ( pondremos los dos parametros a guardar)
# (facesData, np.array(labels)) osea las imagenes = FacesData y las etiquetas
face_mask.train(facesData, np.array(labels))




face_mask.write("face_mask_model.xml") 
print("Modelo almacenado")
{}