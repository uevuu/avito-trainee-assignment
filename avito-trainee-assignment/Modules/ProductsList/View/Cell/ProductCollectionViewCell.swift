//
//  ProductCollectionViewCell.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 25.08.2023.
//

import UIKit

// MARK: - ProductCollectionViewCell
final class ProductCollectionViewCell: UICollectionViewCell {
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        }()
        
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.systemRegular(with: 20)
        label.numberOfLines = 2
        return label
    }()
        
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.systemBold(with: 20)
        return label
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.systemRegular(with: 17)
        label.textColor = .gray
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.systemRegular(with: 17)
        label.textColor = .gray
        return label
    }()
    
    private lazy var addToFavouriteButton: UIButton = {
        let button = UIButton()
        button.setImage(R.Image.heart, for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var moreActionButton: UIButton = {
        let button = UIButton()
        button.setImage(R.Image.ellipsis, for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var mainTextStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            titleLabel,
            priceLabel
        ])
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            addToFavouriteButton,
            moreActionButton
        ])
        stackView.axis = .vertical
        stackView.alignment = .trailing
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            mainTextStackView,
            buttonStackView
        ])
        stackView.spacing = 5
        stackView.distribution = .equalSpacing
        stackView.alignment = .top
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var secondaryTextStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            locationLabel,
            dateLabel
        ])
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setup() {
        contentView.addSubview(productImageView)
        contentView.addSubview(mainStackView)
        contentView.addSubview(secondaryTextStackView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            productImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),

            mainStackView.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 5),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),

            secondaryTextStackView.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 10),
            secondaryTextStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            secondaryTextStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            secondaryTextStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configureCell(
        imageUrl: String,
        title: String,
        price: String,
        location: String,
        date: String
    ) {
        productImageView.loadImage(imageUrl)
        titleLabel.text = title
        priceLabel.text = price
        locationLabel.text = location
        dateLabel.text = date
    }
}
