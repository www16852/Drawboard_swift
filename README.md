# Drawboard_swift

簡單建立一個UIView並能在上面作畫

![](https://github.com/www16852/Drawboard_swift/blob/master/README_content/drawboard_DEMO.gif)

## 特色

- [x] 給一個frame即可建立最簡單的畫板
- [x] 畫一段筆跡就會轉到背景上(使後續筆跡不會lag)
- [x] 復原、反復原功能

## 使用

```swift

    @IBOutlet weak var board: UIView!
    var drawView:DrawView!

    override func viewDidLoad() {
        super.viewDidLoad()
        drawView = DrawView(frame:board.frame, background:UIColor.gray, recordCounts:3)
        view.addSubview(drawView)
    }
    
```

## 額外功能

```swift

    @IBAction func recover(_ sender: UIButton) {
        drawView.recover()
    }
   
    @IBAction func cencelRecover(_ sender: UIButton) {
        drawView.cancelRecover()
    }
    
    @IBAction func clear(_ sender: UIButton) {
        drawView.clear()
    }
    
```
    
