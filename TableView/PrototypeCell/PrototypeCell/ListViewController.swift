//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by Rondo on 5/20/26.
//

import UIKit

class ListViewController: UITableViewController {

    /* 튜플 아이템으로 구성된 데이터 세트 */
    var dataset = [
        ("다크나이트", "영웅물에 철학에 음악까지 더해져 예술이 되다.", "2008-09-04", 8.95),
        ("호우시절", "때를 알고 내리는 좋은 비", "2009-10-08", 7.31),
        ("말할 수 없는 비밀", "여기서 너까지 다섯 걸음", "2015-05-07", 9.19)
    ]

    /* 테이블 뷰를 구성할 리스트 데이터 */
    lazy var list: [MovieVO] = {
        var datalist = [MovieVO]()

        for (title, desc, opendate, rating) in self.dataset {
            let mvo = MovieVO()

            mvo.title = title
            mvo.description = desc
            mvo.opendate = opendate
            mvo.rating = rating

            datalist.append(mvo)
        }

        return datalist
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
    }


    /* 생성할 목록의 길이를 반환하는 메서드 */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }

    /* 셀 객체를 생성하여 콘텐츠를 구성한 다음 반환하는 메서드 */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /* 주어진 행에 맞는 데이터 소스를 읽어온다. */
        let row = self.list[indexPath.row]

        /* 테이블 셀 객체를 직접 생성하는 대신 큐로부터 가져옴 */
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
        cell.textLabel?.text = row.title

        /* 서브 타이틀에 데이터 연결 */
        cell.detailTextLabel?.text = row.description

        return cell
    }

    /* 사용자가 셀을 선택했을 때 실행할 액션을 정의하는 메서드 */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row)번째 행입니다.")
    }

}
