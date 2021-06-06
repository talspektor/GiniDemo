//
//  ViewController.swift
//  GiniDemo
//
//  Created by Tal talspektor on 04/06/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    private var viewModel = ViewModel()
    private let minimumInteritemSpacingForSection = CGFloat(20)
    private let bigCellSize = CGSize(width: UIScreen.main.bounds.width / 3 - 30, height: 100.0)
    private let smallCellSize = CGSize(width: UIScreen.main.bounds.width / 3 - 30, height: 50.0)
    private let targerDevider = 7

    override func viewDidLoad() {
        super.viewDidLoad()
        registercells()
        viewModel.getNumbers { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }

    private func registercells() {
        collectionView.register(RedCollectionViewCell.nib, forCellWithReuseIdentifier: RedCollectionViewCell.identifier)
        collectionView.register(OrangeCollectionViewCell.nib, forCellWithReuseIdentifier: OrangeCollectionViewCell.identifier)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numbers.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let number = viewModel.numbers[indexPath.row].number
        if number.isMultiple(of: targerDevider) {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RedCollectionViewCell.identifier, for: indexPath) as? BaseCell else { return UICollectionViewCell()}
            cell.configur(color: .red, text: String(number))
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OrangeCollectionViewCell.identifier, for: indexPath) as? BaseCell else { return UICollectionViewCell()}
            cell.configur(color: .orange, text: String(number))
            return cell
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if viewModel.numbers[indexPath.row].number.isMultiple(of: targerDevider) {
            return bigCellSize
        }
        return smallCellSize
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInteritemSpacingForSection
    }
}
