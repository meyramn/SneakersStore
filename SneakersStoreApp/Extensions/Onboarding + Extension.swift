////
////  Onboarding + Extension.swift
////  SneakersStoreApp
////
////  Created by Meyram on 05.06.2023.
////
//
//import UIKit
//
//extension OnboardingViewController {
//
//    func setup() {
//        dataSource = self
//        delegate = self
//
//        pageControl.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)
//
//        let firstPage = ViewController1()
//        let secondPage = ViewController2()
//        let thirdPage = ViewController3()
//
//        pages.append(firstPage)
//        pages.append(secondPage)
//        pages.append(thirdPage)
//        
//        setViewControllers([pages[initialPage]], direction: .forward, animated: true)
//    }
//
//    func style() {
//        pageControl.translatesAutoresizingMaskIntoConstraints = false
//        pageControl.currentPageIndicatorTintColor = .black
//        pageControl.pageIndicatorTintColor = .white
//        pageControl.numberOfPages = pages.count
//        pageControl.currentPage = initialPage
//    }
//
//    func layout() {
//        view.addSubview(pageControl)
//        NSLayoutConstraint.activate([
//            pageControl.widthAnchor.constraint(equalTo: view.widthAnchor),
//            pageControl.heightAnchor.constraint(equalToConstant: 20),
//            view.bottomAnchor.constraint(equalToSystemSpacingBelow: pageControl.bottomAnchor, multiplier: 1)
//        ])
//    }
//}
//
//extension OnboardingViewController: UIPageViewControllerDataSource {
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
//
//        if currentIndex == 0 {
//            return pages.last
//        } else {
//            return pages[currentIndex - 1]
//        }
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
//
//        if currentIndex < pages.count - 1 {
//            return pages[currentIndex + 1]
//        } else {
//            return pages.first
//        }
//    }
//}
//
//extension OnboardingViewController: UIPageViewControllerDelegate {
//
//    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
//
//        guard let viewControllers = pageViewController.viewControllers else { return }
//        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
//
//        pageControl.currentPage = currentIndex
//    }
//}
