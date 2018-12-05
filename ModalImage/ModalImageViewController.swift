//
//  ModalImageViewConvtoller.swift
//  ModalImage
//
//  Created by Sofia on 25/11/2018.
//

import UIKit

public class ModalImageViewController: UIViewController {
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var dimmerLayer: UIView!
    @IBOutlet private weak var scrollView: UIScrollView!
    
    @IBOutlet private weak var imageHeight: NSLayoutConstraint!
    @IBOutlet private weak var imageWidth: NSLayoutConstraint!
    
    @IBOutlet private weak var navBarImageView: UIImageView!
    @IBOutlet private weak var navBarHeight: NSLayoutConstraint!
    @IBOutlet private weak var navBarDimmerLayer: UIView!
    @IBOutlet private weak var statusBarView: UIView!
    
    @IBOutlet private weak var tabbarImageView: UIImageView!
    @IBOutlet private weak var tabBarHeight: NSLayoutConstraint!
    @IBOutlet private weak var tabBarDimmerLayer: UIView!
    
    @IBOutlet private var doubleTapGesture: UITapGestureRecognizer!
    @IBOutlet private var singleTapGesture: UITapGestureRecognizer!
    
    public weak var delegate: ModalImageDelegate?
    
    private var originalImageFrame: CGRect!
    private var image: UIImage!
    
    private var primaryDuration = 0.25
    private var backgroundColor: UIColor = .black
    private var backgroundAlpha: CGFloat = 0.6
    private var useNavbar: Bool = true
    private var useTabbar: Bool = true
    private var backgroundBlur: Bool = false
    private var topScrollInset: CGFloat { return (scrollView.frame.height - imageView.frame.height) / 2.0 }
    private var statusBarStyle: UIStatusBarStyle = .lightContent
    
    public static func build(with imageView: UIImageView,
                             animationDuration: Double,
                             backgroundColor: UIColor,
                             backgroundAlpha: CGFloat,
                             backgroundBlur: Bool,
                             useNavbar: Bool,
                             useTabbar: Bool) -> ModalImageViewController? {
        let modalImageStoryboard = UIStoryboard(name: "ModalImageView",
                                                bundle: Bundle(for: ModalImageViewController.classForCoder()))
        let modalImageVC = modalImageStoryboard.instantiateInitialViewController() as? ModalImageViewController
        guard let image = imageView.image, let frame = imageView.originalFrame else { return nil }
        modalImageVC?.image = image
        modalImageVC?.originalImageFrame = frame
        modalImageVC?.primaryDuration = animationDuration
        modalImageVC?.backgroundColor = backgroundColor
        modalImageVC?.backgroundAlpha = backgroundAlpha
        modalImageVC?.backgroundBlur = backgroundBlur
        modalImageVC?.useNavbar = useNavbar
        modalImageVC?.useTabbar = useTabbar
        return modalImageVC
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        accessibilityViewIsModal = true
        
        setupImageViews()
        setupBarsStubs()
        setupBackground()
        setupGestureRecognizers()
        configureImageInStartPosition()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureImageInStartPosition()
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateImageIn() { _ in
            self.setNavBarStubIsHidden(true)
            self.setTabBarStubIsHidden(true)
        }
    }
    
    override public var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }
    
    override public func accessibilityPerformEscape() -> Bool {
        dismissAction()
        return true
    }
    
    private func setupImageViews() {
        imageView.image = image
        imageView.frame.origin = .zero
    }
    
    private func setupBarsStubs() {
        navBarHeight.constant = useNavbar ? delegate?.navBarImage?.size.height ?? 0 : 0
        tabBarHeight.constant = useTabbar ? delegate?.tabBarImage?.size.height ?? 0 : 0
        navBarImageView.image = delegate?.navBarImage
        tabbarImageView.image = delegate?.tabBarImage
        setNavBarStubIsHidden(false)
        setTabBarStubIsHidden(false)
    }
    
    private func setupBackground() {
        if backgroundBlur {
            dimmerLayer.isHidden = true
            let blurEffect = UIBlurEffect(style: .dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = view.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            view.addSubview(blurEffectView)
            view.sendSubviewToBack(blurEffectView)
            return
        }
        dimmerLayer.backgroundColor = backgroundColor
        navBarDimmerLayer.backgroundColor = backgroundColor
        tabBarDimmerLayer.backgroundColor = backgroundColor
    }
    
    private func setupGestureRecognizers() {
        singleTapGesture.require(toFail: doubleTapGesture)
    }
    
    private func dismissAction() {
        setNavBarStubIsHidden(false)
        setTabBarStubIsHidden(false)
        changeStatusBarStyle()
        animateImageOut() { _ in
            self.dismiss(animated: false)
        }
    }
    
    private func setBlackLayersAlpha(to value: CGFloat) {
        dimmerLayer.alpha = value
        navBarDimmerLayer.alpha = value
        tabBarDimmerLayer.alpha = value
    }
    
    private func setNavBarStubIsHidden(_ value: Bool) {
        navBarImageView.isHidden = value
        navBarDimmerLayer.isHidden = value
        statusBarView.isHidden = value
    }
    
    private func setTabBarStubIsHidden(_ value: Bool) {
        tabbarImageView.isHidden = value
        tabBarDimmerLayer.isHidden = value
    }
    
    private func changeStatusBarStyle() {
        statusBarStyle = statusBarStyle == .default ? .lightContent : .default
        setNeedsStatusBarAppearanceUpdate()
    }
}

extension ModalImageViewController {
    private func configureImageInStartPosition() {
        imageHeight.constant = originalImageFrame.height
        imageWidth.constant = originalImageFrame.width
        scrollView.contentInset.left = originalImageFrame.minX
        scrollView.contentInset.top = originalImageFrame.minY
        setBlackLayersAlpha(to: 0)
    }
    
    private func animateImageIn(completion: @escaping ((Bool) -> Void)) {
        let contentHeight = image.size.height * (view.frame.width / image.size.width)
        
        UIView.animate(withDuration: primaryDuration,
                       delay: 0,
                       options: [.curveEaseIn],
                       animations: {
                        self.imageHeight.constant = contentHeight
                        self.imageWidth.constant = self.view.frame.width
                        self.imageView.center = self.view.center
                        self.scrollView.contentInset.left = 0
                        self.scrollView.contentInset.top = (self.view.frame.height - contentHeight) / 2
                        self.setBlackLayersAlpha(to: self.backgroundAlpha)
                        self.view.layoutIfNeeded()
        }, completion: completion)
    }
    
    private func animateImageOut(completion: @escaping ((Bool) -> Void)) {
        UIView.animate(withDuration: primaryDuration,
                       delay: 0,
                       options: [.curveEaseOut],
                       animations: {
                        self.configureImageInStartPosition()
                        self.view.layoutIfNeeded()
        }, completion: completion)
    }
}

extension ModalImageViewController {
    @IBAction private func handlePan(_ recognizer: UIPanGestureRecognizer) {
        func getProgress() -> CGFloat {
            let halfViewWidth = view.frame.width / 2
            let halfViewHeight = view.frame.height / 2
            let changeX = abs(imageView.center.x - halfViewWidth)
            let changeY = abs(imageView.center.y - halfViewHeight)
            let progressX = changeX / halfViewWidth
            let progressY = changeY / halfViewHeight
            return max(progressX, progressY)
        }
        
        func getChanged() -> CGPoint {
            let origin = imageView.center
            let change = recognizer.translation(in: view)
            recognizer.setTranslation(CGPoint.zero, in: self.view)
            return CGPoint(x: origin.x + change.x, y: origin.y + change.y)
        }
        
        func getVelocity() -> CGFloat {
            let velocity = recognizer.velocity(in: imageView)
            return sqrt(velocity.x * velocity.x + velocity.y * velocity.y)
        }
        
        switch recognizer.state {
        case .changed:
            imageView.center = getChanged()
            if UIDevice.current.userInterfaceIdiom == .phone {
                setBlackLayersAlpha(to: backgroundAlpha - (backgroundAlpha * getProgress()))
            }
        case .ended:
            if getProgress() > 0.5 || getVelocity() > 1000 {
                dismissAction()
            } else {
                fallthrough
            }
        default:
            UIView.animate(withDuration: primaryDuration,
                           animations: {
                            self.imageView.frame.origin = CGPoint(x: 0, y: 0)
                            self.setBlackLayersAlpha(to: self.backgroundAlpha)
            }, completion: nil)
        }
    }
    
    @IBAction private func singleTap() {
        dismissAction()
    }
    
    @IBAction private func doubleTap(_ recognizer: UITapGestureRecognizer) {
        if scrollView.zoomScale == 1 {
            scrollView.zoom(to: zoomToRectForScale(scrollView.maximumZoomScale,
                                                   center: recognizer.location(in: recognizer.view)),
                            animated: true)
        } else {
            scrollView.setZoomScale(1, animated: true)
        }
    }
    
    private func zoomToRectForScale(_ scale: CGFloat, center: CGPoint) -> CGRect {
        let zoomCenterPoint = imageView.convert(center, from: scrollView)
        let zoomRectSize = CGSize(width: imageView.frame.size.width / scale,
                                  height: imageView.frame.size.height / scale)
        let zoomOriginPoint = CGPoint(x: zoomCenterPoint.x - (zoomRectSize.width / 2.0),
                                      y: zoomCenterPoint.y - (zoomRectSize.height / 2.0))
        return CGRect(origin: zoomOriginPoint, size: zoomRectSize)
    }
}

extension ModalImageViewController: UIScrollViewDelegate {
    public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    public func scrollViewDidZoom(_ scrollView: UIScrollView) {
        scrollView.contentInset.top = imageView.frame.height < scrollView.frame.height ? topScrollInset : 0
    }
}
