//
//  ProductsListViewController.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 25.08.2023.
//

import UIKit

final class ProductsListViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(
            frame: .zero,
            collectionViewLayout: {
                let section: NSCollectionLayoutSection = {
                    let item = NSCollectionLayoutItem(
                        layoutSize: NSCollectionLayoutSize(
                            widthDimension: .fractionalWidth(0.5),
                            heightDimension: .estimated(150)
                        )
                    )
                    item.edgeSpacing = NSCollectionLayoutEdgeSpacing(
                        leading: .none,
                        top: .fixed(16),
                        trailing: .none,
                        bottom: .none
                    )
                    item.contentInsets.leading = 6
                    item.contentInsets.trailing = 6
                    let group = NSCollectionLayoutGroup.horizontal(
                        layoutSize: NSCollectionLayoutSize(
                            widthDimension: .fractionalWidth(1),
                            heightDimension: .estimated(150)
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
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setConstraints()
    }
    
    // MARK: - Setup
    
    private func setup() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ProductsListViewController: UICollectionViewDataSource{
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 20
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
        cell.configureCell()
        return cell
    }
}

extension ProductsListViewController: UICollectionViewDelegate{
}

final class CacheManager {
    static let shared = CacheManager()
    
    private let cache = NSCache<NSString, UIImage>()
    private init() {}
    
    func image(forKey key: String) async -> UIImage? {
        let cacheKey = NSString(string: key)
        if let image = cache.object(forKey: cacheKey) { return image }
        
        guard let url = URL(string: key),
              let result = try? await URLSession.shared.data(from: url),
              let image = UIImage(data: result.0) else { return nil }
        
        cache.setObject(image, forKey: cacheKey)
        
        return image
    }
}

final class HeaderTextLabel: UICollectionReusableView {
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.systemBold(with: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(headerLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    func setTitle(_ title: String) {
        headerLabel.text = title
    }
}
