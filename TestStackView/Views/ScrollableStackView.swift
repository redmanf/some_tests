//
//  ScrollableStackView.swift
//  TestStackView
//
//  Created by Sergii Demets on 05.09.2024.
//

import UIKit

protocol SupportsScrollableStack:UIView {
    
}

protocol ScrollableStackViewProtocol {
    var views:[SupportsScrollableStack] {get}
    
    init(frame:CGRect, views:[SupportsScrollableStack])
    
    func append(view:SupportsScrollableStack)
    func remove(view:SupportsScrollableStack)
}

final class ScrollableStackView: UIScrollView, ScrollableStackViewProtocol, SupportsScrollableStack {
    
    public var views: [SupportsScrollableStack] {
        didSet {
            updateStackView()
        }
    }
    
    private var stackView:UIStackView!
    private var constantsAreSet = false
    
    required init(frame: CGRect, views: [SupportsScrollableStack]) {
        self.views = views
        super.init(frame: frame)
    }
    
    private func createStackView(with views:[UIView]){
        guard stackView == nil else {
            return
        }
        
        self.stackView = UIStackView(frame: self.bounds)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        stackView.layer.borderColor = UIColor.green.cgColor
        stackView.layer.borderWidth = 4
        stackView.spacing = 10
        
        addSubview(self.stackView)
        
        stackView.leadingAnchor.constraint(equalTo: self.contentLayoutGuide.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.contentLayoutGuide.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: self.contentLayoutGuide.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.contentLayoutGuide.bottomAnchor).isActive = true
        
        stackView.widthAnchor.constraint(equalTo: self.frameLayoutGuide.widthAnchor).isActive = true
        
        views.forEach { view in
            view.heightAnchor.constraint(equalToConstant: view.bounds.size.height).isActive = true
            stackView.addArrangedSubview(view)
        }
        
        //self.invalidateIntrinsicContentSize()
    }
    
    func updateStackView(){
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        createStackView(with:views)
    }
    
    func append(view: SupportsScrollableStack) {
        
    }
    
    func remove(view: SupportsScrollableStack) {
        
    }
    
    required init(views: [SupportsScrollableStack]) {
        self.views = views
        
        super.init(frame: CGRectZero)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
