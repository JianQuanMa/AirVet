//
//  AddTaskViewController.swift
//  AirVet
//
//  Created by Jian Ma on 8/27/24.
//

import UIKit

class AddTaskViewController: UIViewController {
    private let nameTextField = UITextField()
    private let descriptionTextView = UITextView()
    private let addButton = UIButton(type: .system)
    private let viewModel: TaskListViewModel
    
    init(viewModel: TaskListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = "Add Task"
        view.backgroundColor = .white
        
        nameTextField.placeholder = "Task Name"
        nameTextField.borderStyle = .roundedRect
        
        descriptionTextView.layer.borderColor = UIColor.gray.cgColor
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.cornerRadius = 8
        
        addButton.setTitle("Add Task", for: .normal)
        addButton.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [nameTextField, descriptionTextView, addButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        ])
    }
    
    @objc private func didTapAddButton() {
        guard let name = nameTextField.text, !name.isEmpty,
              let description = descriptionTextView.text, !description.isEmpty else {
            // Handle empty fields (e.g., show an alert)
            return
        }
        
        let newTask = Task(name: name, description: description, isCompleted: false)
        viewModel.addTask(newTask)
        dismiss(animated: true, completion: nil)
    }
}
