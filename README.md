# Mikrogrup Final Project

## Colaboratory URL
<a href="https://colab.research.google.com/drive/1TSaH4qWPUcEp8JRCPqVXW-ZG-BTASc6e?usp=sharing" target="_blank">https://colab.research.google.com/drive/1TSaH4qWPUcEp8JRCPqVXW-ZG-BTASc6e?usp=sharing</a>

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Architecture](#architecture)
- [Technologies Used](#technologies-used)
- [App Video And Images](#app-video-and-images)

## Introduction

This project is a CSV analysis and visualization application built with Flutter, Flask, Google Colab, Firebase, and Cloudinary. It allows users to upload CSV files through a mobile app, processes the data in a cloud-based environment, and returns the results with visualizations.

## Features

- Upload CSV files through a mobile app.
- Process CSV files and perform data analysis in Google Colab.
- Generate visualizations and upload them to Cloudinary.
- Store analysis results in Firebase.
- Retrieve and display analysis results and visualizations in the mobile app.

## Architecture

The architecture of this project is as follows:

<img width="710" alt="SCR-20240608-rlve" src="https://github.com/dilaraozdemr/Mi-Power-Final-Project-Mobile/assets/73308194/291c6b67-8552-4290-b744-0f9af564ef44">

1. **Flutter App**: Users upload CSV files via the mobile app.
2. **ngrok**: Establishes a secure tunnel to the local Flask server.
3. **Flask API**: Receives the CSV file and sends it to Google Colab.
4. **Google Colab**: Performs data analysis on the CSV file and generates visualizations.
5. **Cloudinary**: Stores the generated visualizations and returns image URLs.
6. **Firebase**: Stores analysis results and image URLs.
7. **Flutter App**: Retrieves and displays the analysis results and visualizations from Firebase.

## Technologies Used

- **Flutter**: For building the mobile application.
- **ngrok**: For secure tunneling to the Flask server.
- **Flask**: As the backend framework to handle API requests.
- **Google Colab**: For performing data analysis.
- **Cloudinary**: For storing visualizations.
- **Firebase**: For storing and retrieving analysis results.
- **Cloud Firestore**: For real-time database operations.

## App Video And Images

Demo Video(https://youtu.be/OMLzy4bMMbY)


<img width="656" alt="SCR-20240608-rkrp" src="https://github.com/dilaraozdemr/Mi-Power-Final-Project-Mobile/assets/73308194/c4889053-b9f7-40ea-a30b-030324a46358">
