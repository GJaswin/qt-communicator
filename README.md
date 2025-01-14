# QT Communicator - A Simple Chatting Application

QT Communicator is a simple, user-friendly chatting application built with **Qt Quick (QML)** and **C++** for the frontend and integrated with **Firebase** for the backend using **JavaScript**. This project provides essential features like user authentication (login/signup) and real-time chatting.

---

## Features

- **User Authentication**: Secure login and signup functionality using Firebase Authentication.
- **Real-Time Chatting**: Seamless messaging experience powered by Firebase Realtime Database (TBD).
- **Responsive Design**: Designed with Qt Quick (QML) for a smooth and responsive UI.

---

## Tech Stack

- **Frontend**: Qt Quick (QML) and C++
- **Backend**: Firebase (Authentication & Realtime Database)
- **Scripting**: JavaScript for Firebase integration

---

## Prerequisites

- Qt Creator installed with support for Qt Quick and C++
- Firebase project set up (Firebase Authentication and Realtime Database enabled)
- Node.js installed (for Firebase configuration)

---

## Third-Party Libraries Used

This project uses Firebase through its REST API instead of a Firebase library SDK. This makes the app lightweight and very portable.
### **Firebase REST API (with JavaScript)**
   - **Reason**: Qt does not provide direct support for Firebase Authentication or Firestore Database. The Firebase REST API offers robust and easy-to-integrate APIs for authentication, database interaction, and real-time updates.
   - **Benefit**: Using the Firebase API simplifies backend management, allowing us to focus on frontend features.
     
---

## Installation
This project has been developed and compiled on *LINUX*, hence the binaries are for Linux only

1. Download the Debug Release from the "Releases" tab on the left
2. Open the folder on your local machine.
3. Open a terminal within the folder, and run
   ./appqt_communicator
   to test the app 
