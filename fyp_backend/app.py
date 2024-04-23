from flask import Flask, jsonify, request, Response
from keras.preprocessing import image
from PIL import Image
import io
import numpy as np
from onnxruntime import InferenceSession
from tensorflow.keras.applications.vgg16 import preprocess_input # type: ignore
from flask import send_file
from lime import lime_image
from skimage.segmentation import mark_boundaries
from flask_cors import CORS

app = Flask(__name__)
CORS(app) 

sess = InferenceSession('E:/YellowB/fyp_backend/onnx_model.onnx')

@app.route('/predictXai', methods=['POST'])
def predictXai():
    img = request.files['image']
    img = Image.open(io.BytesIO(img.read())).convert('RGB').resize((224, 224))  # Convert FileStorage to BytesIO and remove alpha channel
    x = image.img_to_array(img)
    x = np.expand_dims(x, axis=0)
    x = preprocess_input(x)  # Use VGG16 specific preprocessing

    input_name = sess.get_inputs()[0].name # Use the model to make a prediction
    classes = sess.run(None, {input_name: x})[0]
    predicted_class = str(np.argmax(classes))

    explainer = lime_image.LimeImageExplainer() # Create a LIME explainer
    explanation = explainer.explain_instance(x[0], lambda x: sess.run(None, {input_name: x})[0], top_labels=5, hide_color=0, num_samples=50)

    temp, mask = explanation.get_image_and_mask(explanation.top_labels[0], positive_only=False, num_features=10, hide_rest=False) # Get the explanation for the top class

    img_boundry1 = mark_boundaries(temp/255.0, mask) # Overlay the mask on the original image
    img_boundry = Image.fromarray((img_boundry1 * 255).astype(np.uint8))

    buffer = io.BytesIO() # Convert the explanation image to a PNG
    img_boundry.save(buffer, format='PNG')
    img_bytes = buffer.getvalue()

    return Response(img_bytes, mimetype='image/png')


@app.route('/predict', methods=['POST'])
def predict():
    img = request.files['image']
    img = Image.open(io.BytesIO(img.read())).convert('RGB').resize((224, 224))  # Convert FileStorage to BytesIO and remove alpha channel
    x = image.img_to_array(img)
    x = np.expand_dims(x, axis=0)
    x = preprocess_input(x)  # Use VGG16 specific preprocessing

    input_name = sess.get_inputs()[0].name # Use the model to make a prediction
    classes = sess.run(None, {input_name: x})[0]
    predicted_class = np.argmax(classes)
    confidence_score = classes[0][predicted_class]  # Get the confidence score of the predicted class

    return jsonify({"predicted_class": str(predicted_class), "confidence_score": str(confidence_score)})

if __name__ == '__main__':
    app.run(debug=True)