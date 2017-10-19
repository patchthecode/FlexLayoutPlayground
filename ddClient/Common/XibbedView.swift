import UIKit

class XibView: UIView {
    override convenience init(frame: CGRect) {
        let nibName = String(describing: type(of: self))
        self.init(nibName: nibName)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupNib()
    }
    
    init(nibName: String) {
        super.init(frame: CGRect.zero)
        setupNib()
    }
    
    private func setupNib() {
        let nibName = String(describing: type(of: self))
        let nib = loadNib(name: nibName)
        nib.frame = bounds
        nib.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nib)
        setUpConstraints(for: nib)

    }
    
    private func setUpConstraints(for nibView: UIView) {
        ["V","H"].forEach { (quote) -> () in
            let format = "\(quote):|[nibView]|"
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: [], metrics: nil, views: ["nibView" : nibView]))
        }
    }
    
    private func loadNib(name: String) -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: name, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
}
