import cv2
import os
import mediapipe as mp
#La libreria de mediapipe tiene un deteccion de rostros para facilitarnos el proceso

#nuestra variable sera igual al metodo de deteccion de rostros que nos ofrece mediapipe
mp_face_detection = mp.solutions.face_detection

LABELS = ["Con mascarilla", "Sin mascarilla"] #creamos un array que tendra estas etiquetas

#Ahora vamos a leer nuesttro modelo entrenado

#para ello llamamos a LBPHfaceReconicer_Create para crear el reconocedor facial al modelo
face_mask = cv2.face.LBPHFaceRecognizer_create()
face_mask.read(r"d:\hugo_\Escritorio\reconocimiento_mascarilla\face_mask_model.xml") #leemos el modelo entrenado con la funcion read

#Lectura del video streamen
cap = cv2.VideoCapture(0, cv2.CAP_DSHOW) # ponemos 0 por que sera en vivo con nuestra propia camara y no con una imagen o video aparte

#ahora utilizaremos la funcion de mediapipe para reconocer rostros
#le decimos que con = mp_face_detection.FaceDetection utilizaremos su funcion y la llamaremos = face_tetection para mas corto
with mp_face_detection.FaceDetection(
    min_detection_confidence=0.5) as face_detection:


    while True:
        ret, frame = cap.read()
        if ret == False: break


        #ahora hacemos la deteccion de rostros utilizando mediapipe
        height, width, _ = frame.shape
        frame_rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        results = face_detection.process(frame_rgb)#a esta funcion le pasamos el frame_color que sera la la escala de grises para que haga la deteccion de rostro

        #ahora creamos el recuadro para detectar el rostro y verificamos o creamos la deteccion
        if results.detections is not None: # le decimos que si no hay una deteccion de rostros pues la creamos
            for detection in results.detections: # nuestro interador recorrera nuestro rostro para crear el recuadro del reconocimiento de rostro
         # para ello creamos el plano cartecioano donde se visualizara el rectangulo cuando detecte un rostros, osea formamos el rectangulo para el reconocedor
                xmin = int(detection.location_data.relative_bounding_box.xmin * width)
                ymin = int(detection.location_data.relative_bounding_box.ymin * height)
                w = int(detection.location_data.relative_bounding_box.width * width)
                h = int(detection.location_data.relative_bounding_box.height * height)
                #si tienen valores negativos xmin y ymin pues lo ignoramos con esto
                if xmin <0 and ymin <0:
                    continue

    #creamos el rectangulo del detector de rostros
    #le pasamos los parametoros, ()que sera la camara, los puntos donde se alogara el detectro = xmin + w, ymin + h) y el color del detector =rectangulo y por ultimo el grosor = 5
                #cv2.rectangle(frame, (xmin + w, ymin + h), (0, 255, 0),5)
        
                face_image = frame[ymin : ymin + h, xmin : xmin + w]
                face_image = cv2.cvtColor(face_image, cv2.COLOR_BGR2GRAY) # pasamos a escalas de grises
                face_image = cv2.resize(face_image, (72, 72), interpolation=cv2.INTER_CUBIC) #vamos a recortar el deteccion del rostro al tamaño de las imagenes entrenadas para que observe el puro rostro
        #cv2.imshow("Face_imagen", face_image)
                result = face_mask.predict(face_image)# hacemos la prediccion que nos arrogara unos numeros en la deteccion

                cv2.putText(frame, "{}".format(result), (xmin, ymin - 5), 1, 1.3, (210, 124, 176), 1, cv2.LINE_AA)
        

                if result[1] < 150: 
                    color = (0, 255, 0) if LABELS[result[0]] == "Con mascarilla" else (0,0,255)
                    cv2.putText(frame, "{}".format(LABELS[result[0]]), (xmin, ymin -25), 2, 1, color, 1, cv2.LINE_AA)
        cv2.rectangle(frame, (xmin, ymin), (xmin + w, ymin + h), color, 2)
        

        cv2.imshow("Frame", frame)
        k = cv2.waitKey(1)
        if k == 27:
            break


cap.release()
cv2.destroyAllWindows()





