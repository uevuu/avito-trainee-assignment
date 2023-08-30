//
//  ProductViewController.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 27.08.2023.
//

import UIKit

// MARK: - ProductViewController
final class ProductViewController: UIViewController {
    private let output: ProductViewOutput
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var spinnerView = SpinnerView(style: .large)
    private lazy var reloadButton = CommonButton(R.Strings.tryAgain)

    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var priceLabel = CommonLabel(font: R.Fonts.systemBold(with: 30))
    private lazy var titleLabel = CommonLabel(font: R.Fonts.systemSemiBold(with: 20))
    private lazy var contactLabel = CommonLabel(font: R.Fonts.systemBold(with: 25))
    private lazy var phoneInfoLabel = CommonLabel()
    private lazy var emailInfoLabel = CommonLabel()
    private lazy var addressLabel = CommonLabel(font: R.Fonts.systemBold(with: 25))
    private lazy var addressInfoLabel = CommonLabel()
    private lazy var descriptionLabel = CommonLabel(font: R.Fonts.systemBold(with: 25))
    
    private lazy var descriptionInfoLabel: CommonLabel = {
        let label = CommonLabel()
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var advertisementNumberLabel = CommonSecondaryLabel()
    private lazy var dateInfoLabel = CommonSecondaryLabel()
    
    private lazy var infoStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            priceLabel,
            titleLabel,
            contactLabel,
            phoneInfoLabel,
            emailInfoLabel,
            addressLabel,
            addressInfoLabel,
            descriptionLabel,
            descriptionInfoLabel,
            advertisementNumberLabel,
            dateInfoLabel
        ])
        stack.axis = .vertical
        stack.setCustomSpacing(20, after: titleLabel)
        stack.setCustomSpacing(20, after: emailInfoLabel)
        stack.setCustomSpacing(20, after: addressInfoLabel)
        stack.setCustomSpacing(20, after: descriptionInfoLabel)
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Init
    
    init(output: ProductViewOutput) {
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
        configureNavigationBar()
        setup()
        setConstraints()
    }
    
    // MARK: - Setup
    
    private func configureNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: R.Image.chevronBackward,
            style: .plain,
            target: self,
            action: #selector(backButtonTapped)
        )
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: R.Image.cartBadgePlus),
            UIBarButtonItem(image: R.Image.heart),
            UIBarButtonItem(image: R.Image.squareAndArrowUp)
        ]
        navigationController?.navigationBar.tintColor = .black
    }
    
    private func setup() {
        reloadButton.addTarget(
            self,
            action: #selector(reloadButtonTapped),
            for: .touchUpInside
        )
        view.backgroundColor = .white
        view.addSubview(spinnerView)
        view.addSubview(reloadButton)
        view.addSubview(scrollView)
        scrollView.addSubview(productImageView)
        scrollView.addSubview(infoStackView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            productImageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            productImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            productImageView.widthAnchor.constraint(equalToConstant: view.bounds.width),
            productImageView.heightAnchor.constraint(equalToConstant: view.bounds.width),
            
            infoStackView.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 20),
            infoStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            infoStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20),
            
            reloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            reloadButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            spinnerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinnerView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // MARK: - Private
    @objc private func backButtonTapped() {
        output.backToPreviosModule()
    }
    
    @objc private func reloadButtonTapped() {
        output.loadData()
    }
}

// MARK: - ProductViewInput
extension ProductViewController: ProductViewInput {
    func showDetail(_ advertisementDetail: AdvertisementDetail) {
        spinnerView.stopAnimating()
        scrollView.isHidden = false
        reloadButton.isHidden = true
        productImageView.loadImage(advertisementDetail.imageUrl)
        priceLabel.text = advertisementDetail.price
        titleLabel.text = advertisementDetail.title
        addressLabel.text = "Адрес"
        addressInfoLabel.text = "\(advertisementDetail.location), \(advertisementDetail.address)"
        contactLabel.text = "Контакты продавца"
        phoneInfoLabel.text = advertisementDetail.phoneNumber
        emailInfoLabel.text = advertisementDetail.email
        descriptionLabel.text = "Описание"
        descriptionInfoLabel.text = advertisementDetail.description
        advertisementNumberLabel.text = "Объявления №\(advertisementDetail.id)"
        dateInfoLabel.text = advertisementDetail.createdDate
    }
    
    func showError() {
        spinnerView.stopAnimating()
        reloadButton.isHidden = false
        scrollView.isHidden = true
    }
    
    func showLoading() {
        spinnerView.startAnimating()
        reloadButton.isHidden = true
        scrollView.isHidden = true
    }
}
