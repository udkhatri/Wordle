<div align="center">

  <h1>Technical quiz application</h1>
  
  <p>
    Quiz application for iOS using Swift and UIKit in agile development methodology in which users can test their technical skills, view their scores and improve their skills by completing new quizzes.
  </p>
  
</div>

<br />

<!-- About the Project -->

## :star2: About the Project

<!-- Screenshots -->

### :camera: Screenshots of gameplay

<div align="center">

<img src="https://user-images.githubusercontent.com/34532828/190878541-01aded98-012d-4952-a997-d5ea8a87d820.png" style="height:600px" />
<img src="https://user-images.githubusercontent.com/34532828/190878539-4e9733ab-71f2-4aed-8f06-15c5ac054380.png" style="height:600px" />
<img src="https://user-images.githubusercontent.com/34532828/190878538-a7915ac6-1ac3-423c-8ff6-430ab3a9839b.png" style="height:600px" />
<img src="https://user-images.githubusercontent.com/34532828/190878537-aaba8181-f322-4485-b723-0d6abcdbe738.png" style="height:600px" />
<img src="https://user-images.githubusercontent.com/34532828/190878536-55b73d48-edb8-43e8-82b1-d4e193cb1cb4.png" style="height:600px" />

> Note that word for these screenshots was: *BELAY*
</div>

<!-- TechStack -->

### :space_invader: Tools, Technologies, APIs, and Services used:

- Build the application using Swift programming language and UIKit of xcode.

<!-- GamePlay -->
## :dart: Gameplay and rules

-	You will start off with 6 rows of blank squares (letter placeholders) - each of these rows is your guess
-	There is an onscreen custom keyboard (you do not use the builtin keyboard)
-	Try to guess what the word is - type your guess by using the custom keyboard
     - As you select each letter, it will populate inside the letter placeholders
-	The Submit button is disabled until all 5 letters are entered, at which point it will be enabled
    - Note: If you hit the delete button and only 4 letters were entered, the button would disable again
-	Once you hit the Submit button (after enabled), one of two things will happen
    - You will get an error saying the word is not known
      - This will not count as a guess, and you will have to try another word
    - Your guess will be evaluated
      - Any of the letters that were found in the word in the correct spot will be colour coded one colour (blue above)
      - Any of the letters that were found in the word but not in the correct spot will be coded another colour (orange above)
      - Any letters not found in the word will default to grey
        - Note: If you specified a letter twice in your guess but it was only found once in the word, the second instance of that letter will be grey
      - In addition to the guess in the line being colour coded, the keyboard colours are also updated to reflect the correctness as well as indicate which letters have been used in a guess
      - If you guessed the word totally correct
        - You should get a message saying the word was correct
      - If you did not guess the word correct
        - And you still have guesses left
          - You start the process again on the next line
        -	And you have no guesses left
        - You should get a message telling you what the correct word was

### :camera: Image to demonstrate rules
<div style="height:400px">
 <img src="https://user-images.githubusercontent.com/34532828/190878435-de946731-16de-4894-ac9a-acae95ae83a5.png" style="height:600px" />
 - Note that this image is taken just for the referrence UI and colors for the application is bit different.
</div>

## To clone
> To clone and run this application, you'll need [Git](https://git-scm.com) and [Xcode](https://developer.apple.com/xcode/) installed on your computer. From your command line:


```bash
# Clone this repository
$ git clone https://github.com/udkhatri/Wordle.git
```

<!-- Contributing -->
## :wave: Contributor

<a href="https://github.com/ivanb47">
  <img src="https://avatars.githubusercontent.com/u/100738961?v=4" style="width:50px;height:50px;border-radius: 50%" />
</a>
<a href="https://github.com/udkhatri">
  <img src="https://avatars.githubusercontent.com/u/34532828?s=400&u=711ae709e314cb56700d4cf46ccbd55b4be5645a&v=4" style="width:50px;height:50px;border-radius: 50%" />
  <a href="https://github.com/HarpritKaurSidhu">
  <img src="https://avatars.githubusercontent.com/u/35619714?v=4" style="width:50px;height:50px;border-radius: 50%" />
</a>
</a>


## You may also like...

- [Weather app in iOS](https://github.com/udkhatri/WeatherAppIos)
- [tikTok clone in react native](https://github.com/udkhatri/TikTokClone)
- [Social media application like instagram](https://github.com/udkhatri/SocialApp)
- [recepie finding sand saving progressive web app](https://github.com/udkhatri/PWAProject)
