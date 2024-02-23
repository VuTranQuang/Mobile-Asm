//
//  DropdownView.swift
//  Mobile-Asm
//
//  Created by tran.quang.vu on 23/02/2024.
//

import UIKit

class DropdownView: UIView {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data: [String] = []
    var onSelectedRow:(_ data: String) -> Void = {_ in}
    
    var contentView: UIView?
    let nibName = "DropdownView"
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "ValuesCell", bundle: nil), forCellReuseIdentifier: "ValuesCell")
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}

extension DropdownView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.onSelectedRow(data[indexPath.row])
    }
}

extension DropdownView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ValuesCell", for: indexPath) as! ValuesCell
        cell.setData(data[indexPath.row])
        return cell
    }
}
