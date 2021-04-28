# Rotary dial Locker
![Null_safety OK](https://img.shields.io/badge/Null_safety-√-blue)
![Flutter-v2.0.3](https://img.shields.io/badge/Flutter-v2.0.3-blue) 
![Dart-v2.12.2](https://img.shields.io/badge/Dart-v2.12.2-blue)
![channel-stable](https://img.shields.io/badge/channel-stable-blue) 


 ### Dependencies :
  ![dependencies](https://img.shields.io/badge/provider-5.0.0-blue)
   ![dependencies](https://img.shields.io/badge/google_fonts-2.0.0-blue)
  ![dependencies](https://img.shields.io/badge/easy_rich_text-0.5.4-blue) </a>

<br> 

![OutPut Gif](images/rotateDial.gif)

## How it works

Most magic handle by `GuesterDetector`.
- onPanEnd
- onPanDown
- onPanUpdate
  
[SpringHouse](lib/components/wheel_handler.dart), 1st we locate where users tap on screen using `localPosition offset`. for UI tap update `Transform` angle will update automatically until it reaches its max point. We also confirm the digit by angle. Then, using ``Timer``, we minimize the value and change the UI until it reaches the original position.

UI State handle using [`Dot Provider`](lib/provider/dot_provider.dart). 


--------

<br>

### Dots Animation

![Dot Anime](images/dotsGif.gif)   

For the Dot animation you can check [anim_tester.dart](lib/components/utils/anim_tester.dart)


****
### [Text Animation](lib/components/creator_details.dart)
![Text Animation](images/textAnimate.gif)


----------
There are also different approaches that can be applied, like doing most parts just using CustomPainter. Best approach will be using images. Digit detection can handle touchPoint + radius. Rotate direction can be improved by calculating angles. I gave users more flexibility 😁.

But for wheels , it's easy to do with images. Also paint maker sites can help to make this shape with a short amount of time.
There are some unnecessary methods for test & future use purposes. 
 

inspiration [LinkedIn Video]( https://www.linkedin.com/posts/shubham0812_swiftui-iosdevelopment-iosdev-ugcPost-6791003295537344513-XmXz)


Know more about [Rotary dial](http://www.matilo.eu/restauratie/hoe-reviseer-ik-eenvoudig-een-kiesschijf-draaischijf/?lang=en)



<br>




## License & copyright
---
Licensed under the [MIT License](LICENCE).


<br>  

