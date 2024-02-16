import Foundation

/*
 제목: 가장 많이 받은 선물
 난도: Lv.1 / 완료한 사람: 약 2600명 / 정답률: 22%
 기출문제: 2024 KAKAO WINTER INTERNSHIP
 
 [문제]
 선물을 직접 전하기 힘들 때 카카오톡 선물하기 기능을 이용해 축하 선물을 보낼 수 있습니다.
 당신의 친구들이 이번 달까지 선물을 주고받은 기록을 바탕으로 다음 달에 누가 선물을 많이 받을지 예측하려고 합니다.

 두 사람이 선물을 주고받은 기록이 있다면, 이번 달까지 두 사람 사이에 더 많은 선물을 준 사람이 다음 달에 선물을 하나 받습니다.
 예를 들어 A가 B에게 선물을 5번 줬고, B가 A에게 선물을 3번 줬다면 다음 달엔 A가 B에게 선물을 하나 받습니다.
 
 두 사람이 선물을 주고받은 기록이 하나도 없거나 주고받은 수가 같다면, 선물 지수가 더 큰 사람이 선물 지수가 더 작은 사람에게 선물을 하나 받습니다.
 
 선물 지수는 이번 달까지 자신이 친구들에게 준 선물의 수에서 받은 선물의 수를 뺀 값입니다.
 예를 들어 A가 친구들에게 준 선물이 3개고 받은 선물이 10개라면 A의 선물 지수는 -7입니다. B가 친구들에게 준 선물이 3개고 받은 선물이 2개라면 B의 선물 지수는 1입니다. 만약 A와 B가 선물을 주고받은 적이 없거나 정확히 같은 수로 선물을 주고받았다면, 다음 달엔 B가 A에게 선물을 하나 받습니다.
 
 만약 두 사람의 선물 지수도 같다면 다음 달에 선물을 주고받지 않습니다.
 위에서 설명한 규칙대로 다음 달에 선물을 주고받을 때, 당신은 선물을 가장 많이 받을 친구가 받을 선물의 수를 알고 싶습니다.

 친구들의 이름을 담은 1차원 문자열 배열 friends 이번 달까지 친구들이 주고받은 선물 기록을 담은 1차원 문자열 배열 gifts가 매개변수로 주어집니다. 이때, 다음달에 가장 많은 선물을 받는 친구가 받을 선물의 수를 return 하도록 solution 함수를 완성해 주세요.

 
 [제한]
 2 ≤ friends의 길이 = 친구들의 수 ≤ 50
 friends의 원소는 친구의 이름을 의미하는 알파벳 소문자로 이루어진 길이가 10 이하인 문자열입니다.
 이름이 같은 친구는 없습니다.
 1 ≤ gifts의 길이 ≤ 10,000
 gifts의 원소는 "A B"형태의 문자열입니다. A는 선물을 준 친구의 이름을 B는 선물을 받은 친구의 이름을 의미하며 공백 하나로 구분됩니다.
 A와 B는 friends의 원소이며 A와 B가 같은 이름인 경우는 존재하지 않습니다.

 
 [입출력 예]
 friends    gifts    result
 ["muzi", "ryan", "frodo", "neo"]    ["muzi frodo", "muzi frodo", "ryan muzi", "ryan muzi", "ryan muzi", "frodo muzi", "frodo ryan", "neo muzi"]    2
 ["joy", "brad", "alessandro", "conan", "david"]    ["alessandro brad", "alessandro joy", "alessandro conan", "david alessandro", "alessandro david"]    4
 ["a", "b", "c"]    ["a b", "b a", "c a", "a c", "a c", "c a"]    0
 */

/*
 특이사항 1. 주고받은 기록 있다? (많이)가 (적게)에게 한개 더 받음
 특이사항 2. 주고 받은 기록 없거나 같다? (선물지수 큰)사람이 (적은) 사람에게 한개 받음
 특이사항 3. 둘이 선물지수까지 같다? 그럼 둘 다 안 받음
 */
/*
 a,b,c => a b / a c / b a
 이래 있으면
 a > b / a > c / b > a
 관계 = a:b / a:c /
 계산 1: 선물 = a:0 / b:1 / c:1
 계산 2
    관계비교 = a:b = a나 b가 준 기록이 있음 > 비교 = 1:1 > 같으니 선물지수 비교 2:1 즉 a 의 선물개수 증가
    관계비교 = a:c = a나 c가 준 기록이 있음 > 비교 = 1:0 > 다르니 a의 선물개수 증가
    관계비교 = b:c = b나 c가 준 기록이 없음 > 선물지수 비교 0:0 둘다 증가 안함
 계산 3: 최종 선물 = a:2 / b:1 / c:1
 결과: 2
 */

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    enum comp {
        case big
        case small
        case same
    }
    var result = 0
    var sendCount = [String: Int](), receiveCount = [String: Int](), totalCount = [String: Int]()
    var id = [String: [String: Int]]()
    let compare = { (_ first: Int,_ second: Int) -> comp in
        if first > second {return .big}
        else if first < second {return .small}
        else {return .same}
    }
    
    gifts.forEach {
        let array = $0.split(separator: " ")
        let sender = "\(array[0])", receiver = "\(array[1])"

        if let value = id[sender] {
            if value.keys.contains(receiver) { id[sender]![receiver]! += 1 }
            else { id[sender]![receiver] = 1 }
            sendCount[sender]! += 1
            if let receive = receiveCount[receiver] { receiveCount[receiver]! += 1 }
            else {  receiveCount[receiver] = 1}
        }
        
        else {
            id[sender] = [receiver:1]
            sendCount[sender] = 1
            if let receive = receiveCount[receiver] { receiveCount[receiver]! += 1 }
            else {  receiveCount[receiver] = 1}
        }
    }
    for i in 0 ..< friends.count {
        for j in i+1 ..< friends.count {
            let a = id[friends[i]] ?? [String: Int]()
            let b = id[friends[j]] ?? [String: Int]()
            var check = (0,0)
            if let checkA = a[friends[j]] { check.0 = checkA }
            if let checkB = b[friends[i]] { check.1 = checkB }

            switch compare(check.0, check.1) {
            case .big:
                if let total = totalCount[friends[i]] { totalCount[friends[i]]! += 1 }
                else { totalCount[friends[i]] = 1 }
                
            case .small:
                if let total = totalCount[friends[j]] { totalCount[friends[j]]! += 1 }
                else { totalCount[friends[j]] = 1 }
            case .same:
                check.0 = (sendCount[friends[i]] ?? 0) - (receiveCount[friends[i]] ?? 0)
                check.1 = (sendCount[friends[j]] ?? 0) - (receiveCount[friends[j]] ?? 0)
                switch compare(check.0, check.1) {
                case .big:
                    if let total = totalCount[friends[i]] { totalCount[friends[i]]! += 1 }
                    else { totalCount[friends[i]] = 1 }
                case .small:
                    if let total = totalCount[friends[j]] { totalCount[friends[j]]! += 1 }
                    else { totalCount[friends[j]] = 1 }
                case .same:
                    break
                }
            }
        }
    }
    totalCount.forEach{
        if result < $0.value { result = $0.value}
    }
    return result
}

//print("A = \(solution(["muzi", "ryan", "frodo", "neo"], ["muzi frodo", "muzi frodo", "ryan muzi", "ryan muzi", "ryan muzi", "frodo muzi", "frodo ryan", "neo muzi"]))")
print("A = \(solution(["joy", "brad", "alessandro", "conan", "david"], ["alessandro brad", "alessandro joy", "alessandro conan", "david alessandro", "alessandro david"]))")
//print("A = \(solution(["a", "b", "c"], ["a b", "b a", "c a", "a c", "a c", "c a"]))")
//print("A = \(solution(["a", "b", "c"], ["a b"]))")
/*
 [결과]
 정확성  테스트
 테스트 1 〉    통과 (0.34ms, 16.4MB)
 테스트 2 〉    통과 (0.64ms, 16.4MB)
 테스트 3 〉    통과 (0.56ms, 16.5MB)
 테스트 4 〉    통과 (0.34ms, 16.5MB)
 테스트 5 〉    통과 (9.12ms, 16.6MB)
 테스트 6 〉    통과 (0.89ms, 16.5MB)
 테스트 7 〉    통과 (5.50ms, 16.7MB)
 테스트 8 〉    통과 (5.47ms, 16.6MB)
 테스트 9 〉    통과 (23.02ms, 16.7MB)
 테스트 10 〉    통과 (31.63ms, 16.9MB)
 테스트 11 〉    통과 (26.92ms, 16.7MB)
 테스트 12 〉    통과 (20.72ms, 16.5MB)
 테스트 13 〉    통과 (51.63ms, 17.1MB)
 테스트 14 〉    통과 (48.77ms, 17.1MB)
 테스트 15 〉    통과 (52.61ms, 16.8MB)
 테스트 16 〉    통과 (54.65ms, 17.2MB)
 테스트 17 〉    통과 (0.38ms, 16.5MB)
 테스트 18 〉    통과 (24.30ms, 16.7MB)
 테스트 19 〉    통과 (49.71ms, 16.9MB)
 테스트 20 〉    통과 (11.94ms, 16.5MB)
 */

/*
 [해설]
 진심 코테 이제는 그냥 비문학임. 문장 조금만 이해 실패하면 바로 나락 감
 */
