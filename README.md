# AlphaCamp_gesture_practice

## user swipe to change images...

![Alt text](screenshots/screenA.png?raw=true "screen A")
![Alt text](screenshots/screenB.png?raw=true "screen B")
![Alt text](screenshots/screenC.png?raw=true "screen C")
![Alt text](screenshots/screenD.png?raw=true "screen D")

## method
we can either use story board to create gesture recongizer or code it manually. In this practice, I will use story board to create gesture for left and right swipe while up and down swipe will implement by manual coding.  

```swift
@IBOutlet weak var imageView: UIImageView!
```  
![Alt text](screenshots/imageview_interaction.png?raw=true "view interaction enable")  
whatever which method you use, you should first declare outlet for view and enable interaction for specific view.  

```swift
let imageArray:[String] = ["flower","girl","hill","rose","sunset","tree"]
var currentImage:Int = 0
```
we have 6 image set in Assets.xcassets, let's declare string array and put all their names, also declare a variable for saving array index of image showing on view currently.

## story board method
![Alt text](screenshots/imageview_with2gesture.png?raw=true "imageview gesture linkage")  
by dragging your gesture to specific view, you should see their linkage right here  

![Alt text](screenshots/left_swipe_action.png?raw=true "left swipe gesture")
![Alt text](screenshots/right_swipe_action.png?raw=true "right swipe gestur")  
and for the gesture on storyboard, you should see their related IBAction too.  

```swift
override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageView.image = UIImage(named: imageArray.first!)
}
```
at viewDidLoad, just put our initial image.

```swift
@IBAction func rightSwipe(sender: AnyObject) {
        let updateShow = currentImage + 1 < imageArray.count ? currentImage + 1 : 0
        swipeAction(updateShow)
}
    
@IBAction func leftSwipe(sender: AnyObject) {
        let updateShow = currentImage - 1 >= 0 ? currentImage - 1 : imageArray.indexOf(imageArray.last!)
        swipeAction(updateShow!)
}
    
func swipeAction(index: Int) {
        imageView.image = UIImage(named: imageArray[index])
        currentImage = index
}
```
there are two IBAction drag from our storyboard gesture for left and right swipe. for right swipe, 'updateShow' will be add index by one if within the array bound, if bound out of index, index will be 0 as loading first image again. left swipe is almost the same concept by just reversing number.  
after got the index number, put it into swipeAction for showing new image and update current image index.

## manually coding method
```swift
override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageView.image = UIImage(named: imageArray.first!)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.upSwipe))
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.downSwipe))
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeDown)
}
```
actually i think this is more or less easier than using storyboard dragging in some case.
at viewDidLoad, we first let UISwipeGestureRecognizer, and set the direction property, and finally add it, that is. for the action part of selector, just call function whatever you want, if parameters needed, add ":" at tail of the function then it will pass the full object of you have let.  

```swift
func upSwipe() {
        imageView.image = UIImage(named: imageArray[0])
        currentImage = 0
}
    
func downSwipe() {
        imageView.image = UIImage(named: imageArray.last!)
        currentImage = imageArray.indexOf(imageArray.last!)!
}
```
in this practice, i just set up swipe for showing first image and down swipe for the last image. pretty simple one.
