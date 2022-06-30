# EduTube - Get Certified to Watch YouTube!
## AI platform to get credibility by watching Youtube Tutorial Videos

### Team name: Team Algos

## Team members
* Adil Khatri - adilaqzma@gmail.com
* Om Jadhav - omjadhav963@gmail.com

## Description

* Because technology is constantly being updated, YouTube serves as a platform for these updates to reach a large audience.
* A lot of people can't afford paid courses on various Edtech platforms like Coursera, Udemy, etc.
* Thus, learning through Youtube is the only way out. But, watching Youtube tutorials does not provide credibility to showcase as a criteria of employability. 
* As a result, we created an interactive and user-friendly mobile application that will aid in the credibility of YouTube playlists.
* EduTube is an AI platform that provides credibility to learners across all backgrounds through our dynamic and customizable test who aim to educate themselves through platforms like YouTube.
* The user can sign in with their Google account and add the YouTube playlist that they want to finish. The Playlist will not be added to the course list until it has been approved by the admin panel. Following videos, the user will be required to complete a quiz in which the questions are generated based on the subtitles extracted from the video using NLP(Natural Language Processing). Users can also view and watch playlists uploaded by other users.
* If a user believes that a question or answer is incorrect, they can report it to the admin panel, and the admin panel will investigate further.
* If the user receives a certain number of passing points at the end of all videos and quizzes, they will be certified for that course.

## Links
* GitHub Repo link: [Link to repository](https://github.com/omjadhav3714/eduTube-mobile-app)
* Admin Panel Github Repository(with Flutter set in it): [Admin Panel Code](https://github.com/omjadhav3714/eduTube-mobile-app)

## Technology stack

Tools and technologies that you learnt and used in the project.

1. Flutter (Dart)
2. Firebase
3. YouTube API
4. Python Flask
5. PyTorch
6. Tensorflow
7. Google Collab
8. HTML, CSS, JS
9. Material UI

## Project Setup
* For this project, you will have to install latest version of Android studio and latest version of Flutter and then install Dart and Flutter plugin in Android Studio. The steps to do so are:
  > Open Android studio -> Go to setting -> Plugins -> Seach dart and flutter -> Install and enable them -> Restart IDE.
* Run the command flutter doctor in the terminal on Android studio to check if there are any issues. You may install the SDK command-line tool. After that, you can either connect your phone to Android Studio or run the app on the emulator.

## Usage
* After setup on Android studio is done, you can connect your mobile device to your laptop via USB and then run the application on your mobile. The app will be installed and opened automatically.
* When the app is finished, you will see a splash screen with beautiful animation displaying the app's name. After that, a series of animated screens will appear before you reach the login screen.
* You can login using your google account which will read your profile name, email, phone and photo and store them in the database as user data. 
* Once logged in, you will see multiple courses uploaded by other users on the home page, which you can complete or request the playlist of your choice.
* When you click on the side drawer option on the app bar, you will see the option to "Add playlist", where you can enter the course name and YouTube playlist link before submitting the course to the admin panel for approval. You can view the course in the "My courses" option once it has been approved by the admin panel.
* When you click view more on any course, you will be able to see the course's ratings as well as all of the videos in two different views: grid view and list view. You can watch the YouTube video in the app by clicking on the video thumbnail. After watching the videos, you can attempt the quiz and get a passing score to receive certificate.

## Flowchart

<img src="https://github.com/omjadhav3714/eduTube-mobile-app/blob/main/Edutube%20-%20Screenshots/architecture.png" width="1000">


## Applications
* EduTube's most important application is that it can be used by anyone. Because it is not at all paid and even YouTube courses are becoming more credible, it will undoubtedly benefit students who cannot afford paid courses from Udemy, Coursera, and others.
* If it is published in collaboration with a government entity, the credibility of the certificate for courses will be enhanced even further, and the application can be made available to more schools and colleges.
* We can also use the quiz to determine whether or not the user is watching the video. Furthermore, testing your knowledge is a way to gain confidence in that subject, and thus our application will motivate users to complete the courses.

## Future scope
* Peer to peer quiz rounds after each video in a playlist - At the end of every video, the user will be asked to submit few questions along with their answer related to that video. This submitted quiz questions will be then shown to other users.
* Automate Admin panel -As the number of users grows, so will the number of playlist requests. As a result, we will implement an ML Model that will accept or deny requests based on the videos in the playlist, reducing manual work.


## Screenshots
| ![](./Edutube%20-%20Screenshots/initial%20screen.jpeg) | ![](./Edutube%20-%20Screenshots/home%20screen.jpeg) | ![](./Edutube%20-%20Screenshots/nav%20drawer.jpeg) | ![](./Edutube%20-%20Screenshots/all%20courses.jpeg) |
| :-------------: | :-------------:  | :-------------:  | :-------------:  |
|     Splash Screen     |    HomePage   |    Side Drawer     |     All Courses     |

| ![](./Edutube%20-%20Screenshots/videos%20grid%20view.jpeg) | ![](./Edutube%20-%20Screenshots//course%20list%20view.jpeg) | ![](./Edutube%20-%20Screenshots/course%20detail.jpeg) | ![](./Edutube%20-%20Screenshots/add%20playlist%20form.jpeg) |
| :-------------: | :-------------:  | :-------------:  | :-------------:  | 
|     Videos Grid View     |    Videos List View   |    YouTube Video    |     Add Playlist     |


- **Admin Panel**

<img src="https://github.com/omjadhav3714/eduTube-mobile-app/blob/main/Edutube%20-%20Screenshots/admin-login.png" width="1000">

<img src="https://github.com/omjadhav3714/eduTube-mobile-app/blob/main/Edutube%20-%20Screenshots/users-list.png" width="1000">

<img src="https://github.com/omjadhav3714/eduTube-mobile-app/blob/main/Edutube%20-%20Screenshots/user-playlist-list.png" width="1000">

<img src="https://github.com/omjadhav3714/eduTube-mobile-app/blob/main/Edutube%20-%20Screenshots/search.png" width="1000">

- **Model that will extract the submitiles from the YouTube Video and generate subjetive questions**
 
<img src="https://github.com/omjadhav3714/eduTube-mobile-app/blob/main/Edutube%20-%20Screenshots/ml1.png" width="1000">

<img src="https://github.com/omjadhav3714/eduTube-mobile-app/blob/main/Edutube%20-%20Screenshots/ml2.png" width="1000">

<img src="https://github.com/omjadhav3714/eduTube-mobile-app/blob/main/Edutube%20-%20Screenshots/ml3.png" width="1000">

