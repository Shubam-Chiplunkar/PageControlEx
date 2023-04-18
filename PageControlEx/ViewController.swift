//
//  ViewController.swift
//  PageControlEx
//
//  Created by mayank ranka on 18/04/23.
//

import UIKit

class ViewController: UIViewController {
   

    var pageControl             : UIPageControl!
    var imagesCollectionView    : UICollectionView!
    var scrollView              : UIScrollView!
    
    
    var imageArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageArray = ["bear.jpg","cat.jpg","kola.jpg","panda.jpg"]
        
        loadPageControl()
        loadScrollView()
//        loadCollectionView()
        pageControl.addTarget(self, action: #selector(pageControlDid), for: .valueChanged)
    }

    @objc func pageControlDid(_ sender: UIPageControl){
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(current)*view.frame.size.width, y: 0), animated: true)
        
    }
    func loadPageControl(){
        pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.backgroundColor = .red
        pageControl.numberOfPages = 5
        
        view.addSubview(pageControl)
        NSLayoutConstraint.activate([
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
        
    }
    
    func loadScrollView(){
        
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.delegate = self
        scrollView.backgroundColor = .black
        scrollView.isScrollEnabled = true
        
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -10),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        
//        if scrollView.subviews.count == 2 {
            configureScrollView()
//        }
    }
    
    
    func configureScrollView(){
        scrollView.contentSize = CGSize(width: CGFloat(5) * view.frame.size.width, height: view.frame.size.height)
        scrollView.isPagingEnabled = true
        let colours : [UIColor] = [
            .red,
            .blue,
            .cyan,
            .green,
            .magenta
        ]
        for i in 0..<5{
            let page = UIView(frame: CGRect(x: CGFloat(i) * view.frame.size.width, y: 0, width: view.frame.size.width, height: view.frame.size.height))
            page.backgroundColor = colours[i]
            
            scrollView.addSubview(page)
            
        }
        
    }
//    func loadCollectionView(){
//        imagesCollectionView = UICollectionView()
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.scrollDirection = .horizontal
//        flowLayout.itemSize = CGSize(width: 400, height: 600)
//        flowLayout.minimumLineSpacing = 0
//        flowLayout.minimumInteritemSpacing = 0
//        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//        imagesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
//        imagesCollectionView.translatesAutoresizingMaskIntoConstraints = false
//        imagesCollectionView.register(ImagesCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
//        imagesCollectionView.delegate = self
//        imagesCollectionView.dataSource = self
//
//        imagesCollectionView.backgroundColor = .red
//        view.addSubview(imagesCollectionView)
//        NSLayoutConstraint.activate([
//            imagesCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            imagesCollectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            imagesCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
//            imagesCollectionView.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -30),
//            imagesCollectionView.heightAnchor.constraint(equalToConstant: 600),
//            imagesCollectionView.widthAnchor.constraint(equalToConstant: 400),
//        ])
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return imageArray.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//
//        return imagesCollectionView.bounds.size
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = imagesCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImagesCollectionViewCell
//        cell.imagesView.image = UIImage(named: imageArray[indexPath.row])
//        cell.backgroundColor = .black
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        pageControl.currentPage = indexPath.row
//    }
    


}

extension ViewController: UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floorf(Float(scrollView.contentOffset.x)/Float(scrollView.frame.size.width)))
    }
}
