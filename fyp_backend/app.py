from flask import Flask, jsonify, request, Response
from keras.preprocessing import image
from PIL import Image
import io
import numpy as np
from onnxruntime import InferenceSession
from tensorflow.keras.applications.vgg16 import preprocess_input
from flask import send_file
from lime import lime_image
from skimage.segmentation import mark_boundaries
from flask_cors import CORS




app = Flask(__name__)
CORS(app) 

# Load your trained model
sess = InferenceSession('D:/FYP-FrontEnd/fyp_backend/onnx_model.onnx')

@app.route('/predictXai', methods=['POST'])
def predictXai():
    img = request.files['image']
    img = Image.open(io.BytesIO(img.read())).convert('RGB').resize((224, 224))  # Convert FileStorage to BytesIO and remove alpha channel
    x = image.img_to_array(img)
    x = np.expand_dims(x, axis=0)
    x = preprocess_input(x)  # Use VGG16 specific preprocessing

    # Use the model to make a prediction
    input_name = sess.get_inputs()[0].name
    classes = sess.run(None, {input_name: x})[0]
    predicted_class = str(np.argmax(classes))

    # Create a LIME explainer
    explainer = lime_image.LimeImageExplainer()
    explanation = explainer.explain_instance(x[0], lambda x: sess.run(None, {input_name: x})[0], top_labels=5, hide_color=0, num_samples=20)

    # Get the explanation for the top class
    temp, mask = explanation.get_image_and_mask(explanation.top_labels[0], positive_only=False, num_features=10, hide_rest=False)

    # Overlay the mask on the original image
    img_boundry1 = mark_boundaries(temp/255.0, mask)
    img_boundry = Image.fromarray((img_boundry1 * 255).astype(np.uint8))

    # Convert the explanation image to a PNG
    buffer = io.BytesIO()
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

    # Use the model to make a prediction
    input_name = sess.get_inputs()[0].name
    classes = sess.run(None, {input_name: x})[0]
    predicted_class = np.argmax(classes)
    confidence_score = classes[0][predicted_class]  # Get the confidence score of the predicted class

    return jsonify({"predicted_class": str(predicted_class), "confidence_score": str(confidence_score)})

@app.route('/predictImage', methods=['GET'])
def predictImage():
    img_path = 'D:/FYP-FrontEnd/fyp_backend/1.jpeg'
    img = Image.open(img_path).convert('RGB').resize((224, 224))
    x = image.img_to_array(img)
    x = np.expand_dims(x, axis=0)
    x = preprocess_input(x)  # Use VGG16 specific preprocessing

    # Use the model to make a prediction
    input_name = sess.get_inputs()[0].name
    classes = sess.run(None, {input_name: x})[0]
    predicted_class = str(np.argmax(classes))

    # Print the predicted class and the confidence scores for debugging
    print("Predicted class: ", predicted_class)
    print("Confidence scores: ", classes)

    return jsonify({predicted_class})

@app.route('/predictImage_get', methods=['GET'])
def predictImage_get():
    img_path = 'D:/FYP-FrontEnd/fyp_backend/1.jpeg'  # New image path
    img = Image.open(img_path).convert('RGB').resize((224, 224))
    x = image.img_to_array(img)
    x = np.expand_dims(x, axis=0)
    x = preprocess_input(x)  # Use VGG16 specific preprocessing

    # Use the model to make a prediction
    input_name = sess.get_inputs()[0].name
    classes = sess.run(None, {input_name: x})[0]
    predicted_class = str(np.argmax(classes))

    # Create a LIME explainer
    explainer = lime_image.LimeImageExplainer()
    explanation = explainer.explain_instance(x[0], lambda x: sess.run(None, {input_name: x})[0], top_labels=5, hide_color=0, num_samples=100)

    # Get the explanation for the top class
    temp, mask = explanation.get_image_and_mask(explanation.top_labels[0], positive_only=False, num_features=10, hide_rest=False)

    # Overlay the mask on the original image
    img_boundry1 = mark_boundaries(temp/255.0, mask)
    img_boundry = Image.fromarray((img_boundry1 * 255).astype(np.uint8))

    # Convert the explanation image to a PNG
    buffer = io.BytesIO()
    img_boundry.save(buffer, format='PNG')
    img_bytes = buffer.getvalue()

    return Response(img_bytes, mimetype='image/png')


if __name__ == '__main__':
    app.run(debug=True)