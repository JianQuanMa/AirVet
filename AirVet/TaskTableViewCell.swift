//
//  TaskTableViewCell.swift
//  AirVet
//
//  Created by Jian Ma on 8/27/24.
//
import UIKit

class TaskTableViewCell: UITableViewCell {
    static let identifier = "TaskTableViewCell"
    
    private let taskNameLabel = UILabel()
    private let taskDescriptionLabel = UILabel()
    private let completionCheckbox = UIButton()
    
    var toggleCompletion: (() -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        taskNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        taskDescriptionLabel.font = UIFont.systemFont(ofSize: 14)
        taskDescriptionLabel.textColor = .gray
        
        completionCheckbox.setImage(UIImage(systemName: "square"), for: .normal)
        completionCheckbox.setImage(UIImage(systemName: "checkmark.square"), for: .selected)
        completionCheckbox.addTarget(self, action: #selector(didTapCheckbox), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [completionCheckbox, taskNameLabel, taskDescriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            completionCheckbox.widthAnchor.constraint(equalToConstant: 24),
            completionCheckbox.heightAnchor.constraint(equalToConstant: 24),
            
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    @objc private func didTapCheckbox() {
        toggleCompletion?()
    }
    
    func configure(with task: Task) {
        taskNameLabel.text = task.name
        taskDescriptionLabel.text = task.description
        completionCheckbox.isSelected = task.isCompleted
    }
}
