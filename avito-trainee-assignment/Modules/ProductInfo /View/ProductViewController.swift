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
    
    private lazy var spinnerView: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private lazy var reloadButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.blue, for: .normal)
        button.setTitle("Попробуйте еще раз", for: .normal)
        button.addTarget(
            self,
            action: #selector(reloadButtonTapped),
            for: .touchUpInside
        )
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = R.Fonts.systemBold(with: 30)
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.systemSemiBold(with: 20)
        return label
    }()
    
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
    
    private lazy var contactLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.systemBold(with: 25)
        return label
    }()
    
    private lazy var phoneInfoLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.systemRegular(with: 17)
        return label
    }()
    
    private lazy var emailInfoLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.systemRegular(with: 17)
        return label
    }()
    
    private lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.systemBold(with: 25)
        return label
    }()
    
    private lazy var addressInfoLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.systemRegular(with: 17)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.systemBold(with: 25)
        return label
    }()
    
    private lazy var descriptionInfoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = R.Fonts.systemRegular(with: 17)
        return label
    }()
    
    private lazy var advertisementNumberLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.systemRegular(with: 14)
        label.textColor = .gray
        return label
    }()
    
    private lazy var dateInfoLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.systemRegular(with: 14)
        label.textColor = .gray
        return label
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
        
        output.viewDidLoadEvent()
        configureNavigationBar()
        setup()
        setConstraints()
    }
    
    // MARK: - Setup
    
    private func configureNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "chevron.backward"),
            style: .plain,
            target: self,
            action: #selector(backButtonTapped)
        )
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "cart.badge.plus")),
            UIBarButtonItem(image: UIImage(systemName: "heart")),
            UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"))
        ]
        navigationController?.navigationBar.tintColor = .black
    }
    
    private func setup() {
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
    
    // MARK: - Private
    
    @objc private func reloadButtonTapped() {
        output.tapOnReloadButton()
    }
}

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
