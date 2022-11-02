import UIKit
import RSSwiftNetworking
import RSSwiftNetworkingAlamofire

class ViewController: UIViewController {

  private lazy var urlField: UITextField = {
    let textField = UITextField(frame: .zero)
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.font = UIFont.preferredFont(forTextStyle: .body)
    textField.text = "https://jsonplaceholder.typicode.com/todos/1"
    textField.backgroundColor = UIColor.black.withAlphaComponent(0.05)
    textField.layer.cornerRadius = 8.0

    return textField
  }()

  private lazy var makeRequestButton: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setAttributedTitle(
      NSAttributedString(
        string: "Execute Request",
        attributes: [.font: UIFont.preferredFont(forTextStyle: .headline)]
      ),
      for: .normal
    )
    button.addTarget(self, action: #selector(requestButtonTapped), for: .touchUpInside)

    return button
  }()

  private lazy var containerStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [urlField, makeRequestButton])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = 32.0

    return stackView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    setupLayout()
  }

  // MARK: -

  private func setupLayout() {
    view.addSubview(containerStackView)
    NSLayoutConstraint.activate([
      containerStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      containerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      containerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

      urlField.heightAnchor.constraint(equalToConstant: 50),
      makeRequestButton.heightAnchor.constraint(equalToConstant: 50)
    ])
  }

  @objc private func requestButtonTapped() {
    guard let url = URL(string: urlField.text ?? "") else {
        print("Invalid URL")
        return
    }

    makeRequestButton.isEnabled = false
    let apiClient = BaseAPIClient.alamofire
    let mockEndpoint = MockJSONAPIEndpoint(url: url)

    Task { [weak self] in
      let response: RequestResponse<Network.EmptyResponse?> = await apiClient.request(endpoint: mockEndpoint)

      switch response.result {
      case .success:
        self?.showAlertMessage(success: true)
      case .failure(let error):
        self?.showAlertMessage(success: false)
        print("OOPS! \(error)")
      }
    }
  }

  private func showAlertMessage(success: Bool) {
    let alertController = UIAlertController(
      title: "",
      message: success ? "Success ✅" : "Failed ❌",
      preferredStyle: .alert
    )

    alertController.addAction(UIAlertAction(title: "OK", style: .default))

    present(alertController, animated: true)
  }
}

internal struct MockJSONAPIEndpoint: Endpoint {

  let url: URL

  var requestURL: URL { url }

  var method: Network.HTTPMethod { .get }

}
