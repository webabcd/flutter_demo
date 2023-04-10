/*
 * 本例的 view 用于显示在 flutter 中
 */

import Foundation

class MyView : UIView
{
    var textViewBottom = UITextView()
    var textView = UITextView()
    var button = UIButton(type: .custom)
    
    required init?(coder: NSCoder)
    {
        super.init(coder:coder);
    }

    override init(frame: CGRect)
    {
        super.init(frame: frame);
        
        self.textView.font = UIFont.systemFont(ofSize: 14)
        self.textView.textColor = .black
        self.textView.backgroundColor = .clear
        self.textView.textAlignment = .center
        self.textView.isEditable = false
        self.addSubview(self.textView)
        
        self.button.setTitle("发送数据给 flutter", for: .normal)
        self.button.backgroundColor = .blue
        self.button.layer.cornerRadius = 10
        self.button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.button.titleLabel?.textColor = .white
        self.button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        self.addSubview(self.button)
        
        self.textViewBottom.font = UIFont.boldSystemFont(ofSize: 24)
        self.textViewBottom.textColor = .black
        self.textViewBottom.backgroundColor = .clear
        self.textViewBottom.textAlignment = .center
        self.textViewBottom.isEditable = false
        self.textViewBottom.text = "iOS - View"
        self.addSubview(self.textViewBottom)
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        self.button.frame = CGRect(x: (self.bounds.width - 200) / 2, y: self.bounds.height / 2, width: 200, height: 30)
        self.textView.frame = CGRect(x: 0, y: self.bounds.height / 4, width: self.bounds.width, height: 30)
        self.textViewBottom.frame = CGRect(x: 0, y: self.bounds.height - 60, width: self.bounds.width, height: 40)
    }
    
    // 用于显示 flutter 发送到 ios 的数据
    func showMessage(message: String)
    {
        self.textView.text = message
    }
    
    @objc func buttonPressed()
    {
        // 用于从 ios 发送数据到 flutter
        self.iosToFlutter("\(Int(Date().timeIntervalSince1970 * 1000))")
    }
    
    private var iosToFlutter:(_ message: String) -> () = { p in }
    func setIosToFlutterHandler(iosToFlutter: @escaping ((_ message: String) -> ()))
    {
        self.iosToFlutter = iosToFlutter
    }
}
