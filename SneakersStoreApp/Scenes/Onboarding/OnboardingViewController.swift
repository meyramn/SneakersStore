import UIKit

class OnboardingViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var pageViewController: UIPageViewController!
    var pages: [UIViewController] = []
    var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupOnboardingBackground()
        setupPageView()
    }
    
    func setupOnboardingBackground() {
        backgroundImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 390, height: 844))
        backgroundImage.image = UIImage(named: "OnboardingImage")
        view.addSubview(backgroundImage)
    }
    
    func setupPageView() {
        let container = UIView(frame: CGRect(x: 0, y: 556, width: 390, height: 288))
        container.layer.cornerRadius = 12
        container.clipsToBounds = true
        
        let blurredView = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialDark))
        blurredView.frame = container.bounds
        container.addSubview(blurredView)
        
        let firstPage = createPageViewController(with: "Welcome!", text: "Asalamalleikum bratcy! Kak jizn'?", backgroundColor: .clear)
        let secondPage = createPageViewController(with: "Fast Shipping", text: "Ochen' bystraya dostavka do kaskelena", backgroundColor: .clear)
        let thirdPage = createPageViewController(with: "Enjoy",text: "Strogo original! Nosit' s kaif'om", backgroundColor: .clear)
        
        pages = [firstPage, secondPage, thirdPage]
        
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.dataSource = self
        pageViewController.delegate = self
        pageViewController.setViewControllers([firstPage], direction: .forward, animated: true, completion: nil)
        pageViewController.view.frame = blurredView.bounds
        blurredView.contentView.addSubview(pageViewController.view)
        
        container.addSubview(pageViewController.view)
        view.addSubview(container)
        
        addChild(pageViewController)
        pageViewController.didMove(toParent: self)
    }
    
    func createPageViewController(with heading: String, text: String, backgroundColor: UIColor) -> UIViewController {
        let viewController = UIViewController()
        let pageView = UIView(frame: CGRect(x: 0, y: 0, width: 390, height: 288))
        
        let blurredView = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialDark))
        blurredView.frame = pageView.bounds
        blurredView.layer.cornerRadius = 12
        blurredView.clipsToBounds = true
        pageView.addSubview(blurredView)
        
        let headingLabel = UILabel()
        headingLabel.text = heading
        headingLabel.textAlignment = .center
        headingLabel.textColor = .white
        headingLabel.font = UIFont.boldSystemFont(ofSize: 24)
        pageView.addSubview(headingLabel)
        
        let extraLabel = UILabel()
        extraLabel.text = text
        extraLabel.textAlignment = .center
        extraLabel.textColor = .white
        extraLabel.font = UIFont.systemFont(ofSize: 17)
        pageView.addSubview(extraLabel)
        
        let nextButton = UIButton()
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.backgroundColor = .black
        nextButton.layer.cornerRadius = 28
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        pageView.addSubview(nextButton)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        headingLabel.translatesAutoresizingMaskIntoConstraints = false
        extraLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalToConstant: 358),
            nextButton.heightAnchor.constraint(equalToConstant: 54),
            nextButton.centerXAnchor.constraint(equalTo: pageView.centerXAnchor),
            nextButton.bottomAnchor.constraint(equalTo: pageView.bottomAnchor, constant: -58),
            
            headingLabel.widthAnchor.constraint(equalToConstant: 358),
            headingLabel.heightAnchor.constraint(equalToConstant: 34),
            headingLabel.centerXAnchor.constraint(equalTo: pageView.centerXAnchor),
            headingLabel.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -62),
            
            extraLabel.widthAnchor.constraint(equalToConstant: 358),
            extraLabel.heightAnchor.constraint(equalToConstant: 22),
            extraLabel.centerXAnchor.constraint(equalTo: pageView.centerXAnchor),
            extraLabel.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: 16)
        ])
        
        viewController.view = pageView
        return viewController
    }
    
    @objc func nextButtonTapped() {
        guard let currentViewController = pageViewController.viewControllers?.first else {
            return
        }
        
        if let currentIndex = pages.firstIndex(of: currentViewController),
           currentIndex < pages.count - 1 {
            let nextPage = pages[currentIndex + 1]
            pageViewController.setViewControllers([nextPage], direction: .forward, animated: true, completion: nil)
            updateBackgroundImage(with: currentIndex + 1)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index > 0 else {
            return nil
        }
        return pages[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index < pages.count - 1 else {
            return nil
        }
        return pages[index + 1]
    }
    
    func updateBackgroundImage(with index: Int) {
        switch index {
        case 1:
            backgroundImage.image = UIImage(named: "OnboardingImage2")
        case 2:
            backgroundImage.image = UIImage(named: "OnboardingImage3")
        default:
            break
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let currentViewController = pageViewController.viewControllers?.first,
              let currentIndex = pages.firstIndex(of: currentViewController) else {
            return
        }
        updateBackgroundImage(with: currentIndex)
    }
}
