//
//  ProductsListViewController.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 25.08.2023.
//

import UIKit

// MARK: - ProductsListViewController
final class ProductsListViewController: UIViewController {
    private let output: ProductsListViewOutput
    
    private lazy var spinnerView = SpinnerView(style: .large)
    private lazy var reloadButton = CommonButton(R.Strings.tryAgain)
    
    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(
            frame: .zero,
            collectionViewLayout: {
                let section: NSCollectionLayoutSection = {
                    let item = NSCollectionLayoutItem(
                        layoutSize: NSCollectionLayoutSize(
                            widthDimension: .fractionalWidth(0.5),
                            heightDimension: .estimated(500)
                        )
                    )
                    item.edgeSpacing = NSCollectionLayoutEdgeSpacing(
                        leading: .fixed(0),
                        top: .fixed(16),
                        trailing: .fixed(0),
                        bottom: .fixed(0)
                    )
                    item.contentInsets.leading = 6
                    item.contentInsets.trailing = 6
                    let group = NSCollectionLayoutGroup.horizontal(
                        layoutSize: NSCollectionLayoutSize(
                            widthDimension: .fractionalWidth(1),
                            heightDimension: .estimated(500)
                        ),
                        subitems: [item]
                    )
                    
                    let header = NSCollectionLayoutBoundarySupplementaryItem(
                        layoutSize: NSCollectionLayoutSize(
                            widthDimension: .fractionalWidth(1),
                            heightDimension: .absolute(44)
                        ),
                        elementKind: UICollectionView.elementKindSectionHeader,
                        alignment: .topLeading
                    )
                    
                    let section = NSCollectionLayoutSection(group: group)
                    section.contentInsets.leading = 10
                    section.contentInsets.trailing = 10
                    section.boundarySupplementaryItems = [header]
                    return section
                }()
                
                let layout = UICollectionViewCompositionalLayout(section: section)
                return layout
            }()
        )
        collection.delegate = self
        collection.dataSource = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(ProductCollectionViewCell.self)
        collection.registerHeader(HeaderTextLabel.self)
        collection.backgroundColor = .white
        return collection
    }()
    
    // MARK: - Init
    
    init(output: ProductsListViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.loadData()
        setup()
        setConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - Setup
    
    private func setup() {
        reloadButton.addTarget(
            self,
            action: #selector(reloadButtonTapped),
            for: .touchUpInside
        )
        view.backgroundColor = .white
        view.addSubview(spinnerView)
        view.addSubview(reloadButton)
        view.addSubview(collectionView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            reloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            reloadButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            spinnerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinnerView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // MARK: - Private
    
    @objc private func reloadButtonTapped() {
        output.loadData()
    }
}

//MARK: - UICollectionViewDataSource
extension ProductsListViewController: UICollectionViewDataSource{
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return output.getAdvertisementsCount()
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableHeader(HeaderTextLabel.self, for: indexPath)
        header.setTitle(R.Strings.recommendations)
        return header
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(ProductCollectionViewCell.self, for: indexPath)
        let advertisement = output.getAdvertisement(at: indexPath)
        cell.configureCell(
            imageUrl: advertisement.imageUrl,
            title: advertisement.title,
            price: advertisement.price,
            location: advertisement.location,
            date: advertisement.createdDate
        )
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension ProductsListViewController: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        output.tapOnProduct(at: indexPath)
    }
}

// MARK: - ProductsListViewInput
extension ProductsListViewController: ProductsListViewInput {
    func showProducts() {
        collectionView.reloadData()
        spinnerView.stopAnimating()
        reloadButton.isHidden = true
        collectionView.isHidden = false
    }
    
    func showError() {
        spinnerView.stopAnimating()
        reloadButton.isHidden = false
        collectionView.isHidden = true
    }
    
    func showLoading() {
        spinnerView.startAnimating()
        reloadButton.isHidden = true
        collectionView.isHidden = true
    }
}
