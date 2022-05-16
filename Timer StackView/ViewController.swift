//
//  ViewController.swift
//  Timer StackView
//
//  Created by Ваня Сокол on 14.05.2022.
//

import UIKit

class ViewController: UIViewController {

    private lazy var resultLabel: UILabel = {

        let label = UILabel()
        label.text = "0"
        label.font = .systemFont(ofSize: Metric.resultLabelFontSize, weight: .light)
        label.textColor = .white
        label.textAlignment = .right

        return label

    }()

    private lazy var parentStackView: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .vertical
        stackView.spacing = Metric.parentStackViewSpacing

        return stackView
    }()

    private lazy var buttonStackView: UIStackView = {
          let stackView = UIStackView()

           stackView.axis = .vertical
           stackView.spacing = Metric.buttonStackViewSpacing
        stackView.distribution = .fillEqually

           return stackView
       }()

    private lazy var clearButton = createButton(with: "AC", titleColor: .black, backgroundColor: .lightGray)
    private lazy var plusMinusButton = createButton(with: "+/-", titleColor: .black, backgroundColor: .lightGray)
    private lazy var percentButton = createButton(with: "%", titleColor: .black, backgroundColor: .lightGray)
    private lazy var divisionButton = createButton(with: "/", titleColor: .white, backgroundColor: .systemOrange)
    private lazy var firstStackView = createHorizontalStackView()


    private lazy var sevenButton = createButton(with: "7", titleColor: .white, backgroundColor: .darkGray)
    private lazy var eightButton = createButton(with: "8", titleColor: .white, backgroundColor: .darkGray)
    private lazy var nineButton = createButton(with: "9", titleColor: .white, backgroundColor: .darkGray)
    private lazy var multiplyButton = createButton(with: "x", titleColor: .white, backgroundColor: .systemOrange)
    private lazy var secondStackView = createHorizontalStackView()

    private lazy var fourButton = createButton(with: "4", titleColor: .white, backgroundColor: .darkGray)
    private lazy var fiveButton = createButton(with: "5", titleColor: .white, backgroundColor: .darkGray)
    private lazy var sixButton = createButton(with: "6", titleColor: .white, backgroundColor: .darkGray)
    private lazy var minusButton = createButton(with: "-", titleColor: .white, backgroundColor: .systemOrange)
    private lazy var thirdStackView = createHorizontalStackView()

    private lazy var oneButton = createButton(with: "1", titleColor: .white, backgroundColor: .darkGray)
    private lazy var twoButton = createButton(with: "2", titleColor: .white, backgroundColor: .darkGray)
    private lazy var threeButton = createButton(with: "3", titleColor: .white, backgroundColor: .darkGray)
    private lazy var plusButton = createButton(with: "+", titleColor: .white, backgroundColor: .systemOrange)
    private lazy var forthStackView = createHorizontalStackView()

    private lazy var zeroButton = createZeroButton(with: "0", titleColor: .white, backgroundColor: .darkGray)
    private lazy var commaButton = createButton(with: ",", titleColor: .white, backgroundColor: .darkGray)
    private lazy var equalButton = createButton(with: "=", titleColor: .white, backgroundColor: .darkGray)
    private lazy var fifthStackView = createHorizontalStackView()


       // MARK: - Lifecycle

       override func viewDidLoad() {
           super.viewDidLoad()

           setupHierarchy()
           setupLayout()
           setupView()
       }



       // MARK: - Settings

    private func setupHierarchy() {
        view.addSubview(parentStackView)

        parentStackView.addArrangedSubview(resultLabel)
        parentStackView.addArrangedSubview(buttonStackView)

        buttonStackView.addArrangedSubview(firstStackView)

        firstStackView.addArrangedSubview(clearButton)
        firstStackView.addArrangedSubview(plusMinusButton)
        firstStackView.addArrangedSubview(percentButton)
        firstStackView.addArrangedSubview(divisionButton)

        buttonStackView.addArrangedSubview(secondStackView)

        secondStackView.addArrangedSubview(sevenButton)
        secondStackView.addArrangedSubview(eightButton)
        secondStackView.addArrangedSubview(nineButton)
        secondStackView.addArrangedSubview(multiplyButton)

        buttonStackView.addArrangedSubview(thirdStackView)

        thirdStackView.addArrangedSubview(fourButton)
        thirdStackView.addArrangedSubview(fiveButton)
        thirdStackView.addArrangedSubview(sixButton)
        thirdStackView.addArrangedSubview(minusButton)

        buttonStackView.addArrangedSubview(forthStackView)

        forthStackView.addArrangedSubview(oneButton)
        forthStackView.addArrangedSubview(twoButton)
        forthStackView.addArrangedSubview(threeButton)
        forthStackView.addArrangedSubview(plusButton)

        buttonStackView.addArrangedSubview(fifthStackView)

        fifthStackView.addArrangedSubview(zeroButton)
        fifthStackView.addArrangedSubview(commaButton)
        fifthStackView.addArrangedSubview(equalButton)

    }

    private func setupLayout() {
        parentStackView.translatesAutoresizingMaskIntoConstraints = false
        parentStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Metric.leftOffSet).isActive = true
        parentStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Metric.rightOffSet).isActive = true
        parentStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: Metric.buttonOffSet).isActive = true

        firstStackView.heightAnchor.constraint(equalToConstant: Metric.buttonHeight).isActive = true

    }

    private func setupView() {
        view.backgroundColor = .black

    }

    // MARK: - Private functions

    private func createButton(with title: String, titleColor: UIColor, backgroundColor: UIColor) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: Metric.buttonFontSize, weight: .medium)
        button.backgroundColor = backgroundColor

        button.layer.masksToBounds = true
        button.layer.cornerRadius = Metric.buttonHeight / 2

        button.widthAnchor.constraint(equalTo: button.heightAnchor, multiplier: 1).isActive = true

        return button
    }

    private func createZeroButton(with title: String, titleColor: UIColor, backgroundColor: UIColor) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: Metric.buttonFontSize, weight: .medium)
        button.backgroundColor = backgroundColor

        button.layer.masksToBounds = true
        button.layer.cornerRadius = Metric.buttonHeight / 2

        button.widthAnchor.constraint(equalTo: button.heightAnchor, multiplier: 2.5).isActive = true

        return button
    }

    private func createHorizontalStackView() -> UIStackView {
        let stackView = UIStackView()

        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing

        return stackView
    }


    // MARK: - Actions

    @objc private func buttonAction() {

    }

}

// MARK: - Constraints

extension ViewController {

    enum Metric {
        static let buttonHeight: CGFloat = 75
        static let buttonFontSize: CGFloat = 30
        static let parentStackViewSpacing: CGFloat = 30
        static let buttonStackViewSpacing: CGFloat = 15
        static let resultLabelFontSize: CGFloat = 70

        static let leftOffSet: CGFloat = 18
        static let rightOffSet: CGFloat = -18
        static let buttonOffSet: CGFloat = -50

    }

    enum Strings {

    }

}

