import Foundation

/*
 제목: [1차] 캐시
 난도: Lv.2 / 완료한 사람: 약 18,000명 / 정답률: 64%
 2018 KAKAO BLIND RECRUITMENT
 
 [문제]
 지도개발팀에서 근무하는 제이지는 지도에서 도시 이름을 검색하면 해당 도시와 관련된 맛집 게시물들을 데이터베이스에서 읽어 보여주는 서비스를 개발하고 있다.
 이 프로그램의 테스팅 업무를 담당하고 있는 어피치는 서비스를 오픈하기 전 각 로직에 대한 성능 측정을 수행하였는데, 제이지가 작성한 부분 중 데이터베이스에서 게시물을 가져오는 부분의 실행시간이 너무 오래 걸린다는 것을 알게 되었다.
 어피치는 제이지에게 해당 로직을 개선하라고 닦달하기 시작하였고, 제이지는 DB 캐시를 적용하여 성능 개선을 시도하고 있지만 캐시 크기를 얼마로 해야 효율적인지 몰라 난감한 상황이다.

 어피치에게 시달리는 제이지를 도와, DB 캐시를 적용할 때 캐시 크기에 따른 실행시간 측정 프로그램을 작성하시오.

 [제한]
 <입력 형식>
 캐시 크기(cacheSize)와 도시이름 배열(cities)을 입력받는다.
 cacheSize는 정수이며, 범위는 0 ≦ cacheSize ≦ 30 이다.
 cities는 도시 이름으로 이뤄진 문자열 배열로, 최대 도시 수는 100,000개이다.
 각 도시 이름은 공백, 숫자, 특수문자 등이 없는 영문자로 구성되며, 대소문자 구분을 하지 않는다. 도시 이름은 최대 20자로 이루어져 있다.
 <출력 형식>
 입력된 도시이름 배열을 순서대로 처리할 때, "총 실행시간"을 출력한다.
 <조건>
 캐시 교체 알고리즘은 LRU(Least Recently Used)를 사용한다.
 cache hit일 경우 실행시간은 1이다.
 cache miss일 경우 실행시간은 5이다.
 
 [입출력 예]
 캐시크기(cacheSize)    도시이름(cities)    실행시간
 3    ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"]    50
 3    ["Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul"]    21
 2    ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]    60
 5    ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]    52
 2    ["Jeju", "Pangyo", "NewYork", "newyork"]    16
 0    ["Jeju", "Pangyo", "Seoul", "NewYork", "LA"]    25

 2    ["Jeju", "Pangyo", "NewYork", "newyork"]
 = 제주        : 5
 = 제주 판교    : 5
 = 판교 뉴욕    : 5
 = 판교 뉴욕    : 1
 = 16
 
 3 [ "seoul", "seoul", "seoul", "tokyo", "seoul", "tokyo" ]
 = 서울       : 5
 = 서울       : 1
 = 서울       : 1
 = 서울 도쿄   : 5
 = 서울 도쿄   : 1
 = 서울 도쿄   : 1
 */

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var queue = [String]()
    var count = 0
    if cacheSize > 0 {
        cities.forEach {
            let s = $0.uppercased()
            if queue.contains(s) {
                count += 1
                queue.remove(at: queue.firstIndex(of: s)!)
                queue.append(s)
            }
            else {
                count += 5
                if queue.count >= cacheSize {
                    queue.removeFirst()
                    queue.append(s)
                }
                else { queue.append(s) }
            }
        }
        return count
    }
    else { return cities.count*5}
}

//print("A = \(solution(3,["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"]))")
//print("A = \(solution(2,["Jeju", "Pangyo", "NewYork", "newyork"]))")
//print("A = \(solution(3,[ "seoul", "seoul", "seoul", "tokyo", "seoul", "tokyo" ]))")
//print("A = \(solution(3,[ "seoul", "seoul"]))")
print("A = \(solution(4,[ "1","2","3","4","2"]))")


/*
 [결과]
 정확성  테스트
 테스트 1 〉    통과 (0.07ms, 16.5MB)
 테스트 2 〉    통과 (0.05ms, 16.5MB)
 테스트 3 〉    통과 (0.10ms, 16.3MB)
 테스트 4 〉    통과 (0.10ms, 16.4MB)
 테스트 5 〉    통과 (0.09ms, 16.6MB)
 테스트 6 〉    통과 (0.01ms, 16.3MB)
 테스트 7 〉    통과 (0.02ms, 16.3MB)
 테스트 8 〉    통과 (0.09ms, 16.4MB)
 테스트 9 〉    통과 (0.08ms, 16.3MB)
 테스트 10 〉    통과 (0.37ms, 16.6MB)
 테스트 11 〉    통과 (733.09ms, 21.7MB)
 테스트 12 〉    통과 (0.24ms, 16.5MB)
 테스트 13 〉    통과 (0.42ms, 16.4MB)
 테스트 14 〉    통과 (0.66ms, 16.6MB)
 테스트 15 〉    통과 (1.01ms, 16.7MB)
 테스트 16 〉    통과 (0.91ms, 16.6MB)
 테스트 17 〉    통과 (0.02ms, 16.5MB)
 테스트 18 〉    통과 (3.80ms, 16.2MB)
 테스트 19 〉    통과 (5.90ms, 16.4MB)
 테스트 20 〉    통과 (6.71ms, 16.5MB)
 */

/*
 [해설]
 문제가 요구하는게 오로지 그 기능 하나 뿐인지도 파악 할 것
 */
