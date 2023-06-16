import UIKit


class OnboardingViewController: UIPageViewController {
    
    var pages = [UIViewController]()
    let pageControl = UIPageControl()
    let nextButton = UIButton()
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: options)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let initialPage = 0
    
    var pageControlBottomAnchor: NSLayoutConstraint?
    
    lazy var backgroundImage: UIImageView = {
        let background = UIImageView()
        background.image = UIImage(named: "OnboardingImage")
        return background
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
        style()
        layout()
    }
    
    
}

extension OnboardingViewController {
    
    func setup() {
        dataSource = self
        delegate = self
        
        
        let firstPage = DemoViewController(imageName: "OnboardingImage", titleText: "Welcome", subtitleText: "Get all your desired sneakers in one place")
        let secondPage = DemoViewController(imageName: "OnboardingImage2", titleText: "Fast Shipping", subtitleText: "Ochen' bystraya dostavka do Kaskelena")
        let thirdPage = DemoViewController(imageName: "OnboardingImage3", titleText: "Get daily bonus", subtitleText: "Privodi podrugu i poluchai bonus 1 tenge")
        
        pages.append(firstPage)
        pages.append(secondPage)
        pages.append(thirdPage)
        
        setViewControllers([pages[initialPage]], direction: .forward, animated: true)
    }
    
    func style() {
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.pageIndicatorTintColor = .systemGray2
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("Next", for: .normal)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        nextButton.backgroundColor = .black
        nextButton.layer.cornerRadius = 28
        nextButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
    }
    
    func layout() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageControl)
        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            pageControl.widthAnchor.constraint(equalTo: view.widthAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 20),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nextButton.widthAnchor.constraint(equalToConstant: 358),
            nextButton.heightAnchor.constraint(equalToConstant: 54),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:-58),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        pageControlBottomAnchor = view.bottomAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 248)
        pageControlBottomAnchor?.isActive = true
    }
}

extension OnboardingViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex == 0 {
            return pages.last               // wrap last
        } else {
            return pages[currentIndex - 1]  // go previous
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]  // go next
        } else {
            return pages.first              // wrap first
        }
    }
    
    
}

extension OnboardingViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
        
        pageControl.currentPage = currentIndex
    }
}

extension UIPageViewController {
    
    func goToNextPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        guard let currentPage = viewControllers?[0] else { return }
        guard let nextPage = dataSource?.pageViewController(self, viewControllerAfter: currentPage) else { return }
        
        setViewControllers([nextPage], direction: .forward, animated: animated, completion: completion)
    }
    
    func goToPreviousPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        guard let currentPage = viewControllers?[0] else { return }
        guard let prevPage = dataSource?.pageViewController(self, viewControllerBefore: currentPage) else { return }
        
        setViewControllers([prevPage], direction: .forward, animated: animated, completion: completion)
    }
    
    func goToSpecificPage(index: Int, ofViewControllers pages: [UIViewController]) {
        setViewControllers([pages[index]], direction: .forward, animated: true, completion: nil)
    }
}

//Handle button logic
//TODO: Make navigation when last nextTapped to push on welcomepage
extension OnboardingViewController {
    
    @objc func nextTapped(_ sender: UIButton) {
        if pageControl.currentPage < pages.count - 1 {
            pageControl.currentPage += 1
            goToNextPage()
        } else if pageControl.currentPage == pages.count - 1 {
    
            let welcomePage = UINavigationController(rootViewController: WelcomePageViewController())
            welcomePage.modalPresentationStyle = .fullScreen
            present(welcomePage, animated: true, completion: nil)
        }
    }
}



// Code for one seperate page. You will declare this class inside OnboardingViewController
class DemoViewController: UIViewController {
    
    let container = UIVisualEffectView(effect: UIBlurEffect(style: .systemThinMaterialDark))
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    
    init(imageName: String, titleText: String, subtitleText: String) {
        super.init(nibName: nil, bundle: nil)
        imageView.image = UIImage(named: imageName)
        titleLabel.text = titleText
        subtitleLabel.text = subtitleText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension DemoViewController {
    
    func style() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        
        container.translatesAutoresizingMaskIntoConstraints = false
        container.contentView.layer.cornerRadius = 10
        container.contentView.clipsToBounds = true
        
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        subtitleLabel.textAlignment = .center
        subtitleLabel.textColor = .white
        subtitleLabel.numberOfLines = 0
        
    }
    
    
    func layout() {
        
        container.contentView.addSubview(titleLabel)
        container.contentView.addSubview(subtitleLabel)
        
        
        view.addSubview(imageView)
        imageView.addSubview(container)
        
        NSLayoutConstraint.activate([
            
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            container.heightAnchor.constraint(equalToConstant: 288),
            
            titleLabel.widthAnchor.constraint(equalToConstant: 358),
            titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 80),
            titleLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            
            subtitleLabel.widthAnchor.constraint(equalToConstant: 400),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            subtitleLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor)
            
        ])
    }
}
