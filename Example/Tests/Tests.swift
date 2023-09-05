import XCTest
import PKJSON
import RxSwift
import RxRelay

let json = """
{
"name": "张三",
"date": "2023-07-28T16:06:26+08:00",
"job": {
    "name": "工人",
    "salary": 10000.5
    }
}
"""

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
        struct Job: PKJson {
            
            @JsonKey var name = ""
            @JsonKey var salary: Double = 0 {
                didSet {
                    print("new value")
                }
            }
        }

        struct Person: PKJson {
            
#if canImport(RxRelay)
            @JsonKey
            var name: BehaviorRelay<String> = .init(value: "")
#else
            @JsonKey
            var name: String = ""
#endif
            
            @JsonKey
            var date = Date()
            
            @JsonKey var job = Job()
        }
        
        
        let person = Person()
#if canImport(RxRelay)
        let disposeBag = DisposeBag()
        person.name.subscribe { name in
            print(name)
        }.disposed(by: disposeBag)
#endif
        person.update(from: json)
        print(person)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
