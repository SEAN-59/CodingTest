import Foundation

/*
 제목: 신고 결과 받기
 난도: Lv.1 / 완료한 사람: 약 31,000명 / 정답률: 37%
 기출문제: 2022 KAKAO BLIND RECRUITMENT
 
 [문제]
 신입사원 무지는 게시판 불량 이용자를 신고하고 처리 결과를 메일로 발송하는 시스템을 개발하려 합니다. 무지가 개발하려는 시스템은 다음과 같습니다.

 각 유저는 한 번에 한 명의 유저를 신고할 수 있습니다.
 신고 횟수에 제한은 없습니다. 서로 다른 유저를 계속해서 신고할 수 있습니다.
 한 유저를 여러 번 신고할 수도 있지만, 동일한 유저에 대한 신고 횟수는 1회로 처리됩니다.
 k번 이상 신고된 유저는 게시판 이용이 정지되며, 해당 유저를 신고한 모든 유저에게 정지 사실을 메일로 발송합니다.
 유저가 신고한 모든 내용을 취합하여 마지막에 한꺼번에 게시판 이용 정지를 시키면서 정지 메일을 발송합니다.
 다음은 전체 유저 목록이 ["muzi", "frodo", "apeach", "neo"]이고, k = 2(즉, 2번 이상 신고당하면 이용 정지)인 경우의 예시입니다.

 유저 ID    유저가 신고한 ID    설명
 "muzi"    "frodo"    "muzi"가 "frodo"를 신고했습니다.
 "apeach"    "frodo"    "apeach"가 "frodo"를 신고했습니다.
 "frodo"    "neo"    "frodo"가 "neo"를 신고했습니다.
 "muzi"    "neo"    "muzi"가 "neo"를 신고했습니다.
 "apeach"    "muzi"    "apeach"가 "muzi"를 신고했습니다.
 각 유저별로 신고당한 횟수는 다음과 같습니다.

 유저 ID    신고당한 횟수
 "muzi"    1
 "frodo"    2
 "apeach"    0
 "neo"    2
 위 예시에서는 2번 이상 신고당한 "frodo"와 "neo"의 게시판 이용이 정지됩니다. 이때, 각 유저별로 신고한 아이디와 정지된 아이디를 정리하면 다음과 같습니다.

 유저 ID    유저가 신고한 ID    정지된 ID
 "muzi"    ["frodo", "neo"]    ["frodo", "neo"]
 "frodo"    ["neo"]    ["neo"]
 "apeach"    ["muzi", "frodo"]    ["frodo"]
 "neo"    없음    없음
 따라서 "muzi"는 처리 결과 메일을 2회, "frodo"와 "apeach"는 각각 처리 결과 메일을 1회 받게 됩니다.

 이용자의 ID가 담긴 문자열 배열 id_list, 각 이용자가 신고한 이용자의 ID 정보가 담긴 문자열 배열 report, 정지 기준이 되는 신고 횟수 k가 매개변수로 주어질 때, 각 유저별로 처리 결과 메일을 받은 횟수를 배열에 담아 return 하도록 solution 함수를 완성해주세요.


 
 [제한]
 2 ≤ id_list의 길이 ≤ 1,000
 1 ≤ id_list의 원소 길이 ≤ 10
 id_list의 원소는 이용자의 id를 나타내는 문자열이며 알파벳 소문자로만 이루어져 있습니다.
 id_list에는 같은 아이디가 중복해서 들어있지 않습니다.
 1 ≤ report의 길이 ≤ 200,000
 3 ≤ report의 원소 길이 ≤ 21
 report의 원소는 "이용자id 신고한id"형태의 문자열입니다.
 예를 들어 "muzi frodo"의 경우 "muzi"가 "frodo"를 신고했다는 의미입니다.
 id는 알파벳 소문자로만 이루어져 있습니다.
 이용자id와 신고한id는 공백(스페이스)하나로 구분되어 있습니다.
 자기 자신을 신고하는 경우는 없습니다.
 1 ≤ k ≤ 200, k는 자연수입니다.
 return 하는 배열은 id_list에 담긴 id 순서대로 각 유저가 받은 결과 메일 수를 담으면 됩니다.

 
 [입출력 예]
 id_list    report    k    result
 ["muzi", "frodo", "apeach", "neo"]    ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"]    2    [2,1,1,0]
 ["con", "ryan"]    ["ryan con", "ryan con", "ryan con", "ryan con"]    3    [0,0]
 */

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var result = [Int].init(repeating: 0, count: id_list.count)
    var report = Set(report)
    
    var id = [String: [String]]()
    var count = [String: Int]()
    var bad = [String]()

    report.forEach {
        let array = $0.split(separator: " ")

        if let value = id["\(array[0])"],!value.contains("\(array[1])") { id["\(array[0])"]!.append("\(array[1])") }
        else { id["\(array[0])"] = ["\(array[1])"] }
        
        if let cntValue = count["\(array[1])"] {
            count["\(array[1])"] = cntValue+1
        }
        else { count["\(array[1])"] = 1 }
    }
    
    count.forEach { if $0.value >= k { bad.append($0.key) } }
    
    id.forEach {
        var count = { (value: [String]) -> Int in
            var total = bad
            total.append(contentsOf: value)
            return (bad.count + value.count) - Set(total).count
        }
        for i in 0 ..< id_list.count { if id_list[i] == $0.key { result[i] = count($0.value) } }
    }
    
    return result
}

print("A = \(solution(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2))")
//2,1,1,0
print("A = \(solution(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","apeach neo","muzi neo"], 2))")
//2,0,2,0
print("A = \(solution(["a", "b","c"], ["a b","a c","b a","b c","c b","c a"], 1))")
//2,2,2
print("A = \(solution(["a", "b","c","d"], ["a b", "a b", "c a", "d a", "a b", "c d", "a d", "b c", "b a", "d a"], 2))")
//1,1,2,1
//print("A = \(solution(["con", "ryan"], ["ryan con", "ryan con", "ryan con", "ryan con"], 1))")
//0,1
print("A = \(solution(["muzi", "frodo", "apeach", "neo"], ["muzi frodo", "apeach frodo", "apeach neo", "muzi neo"], 1))")
//2,0,2,0

/*
 [결과]
 정확성  테스트
 테스트 1 〉    통과 (0.17ms, 16.3MB)
 테스트 2 〉    통과 (0.27ms, 16.6MB)
 테스트 3 〉    통과 (3956.02ms, 39.9MB)
 테스트 4 〉    통과 (0.33ms, 16.5MB)
 테스트 5 〉    통과 (0.62ms, 16.3MB)
 테스트 6 〉    통과 (17.96ms, 16.7MB)
 테스트 7 〉    통과 (17.32ms, 16.9MB)
 테스트 8 〉    통과 (21.67ms, 17.1MB)
 테스트 9 〉    통과 (1372.63ms, 27.2MB)
 테스트 10 〉    통과 (1413.92ms, 26.8MB)
 테스트 11 〉    통과 (4427.18ms, 39.8MB)
 테스트 12 〉    통과 (9.68ms, 16.7MB)
 테스트 13 〉    통과 (1.94ms, 16.4MB)
 테스트 14 〉    통과 (1181.20ms, 26.1MB)
 테스트 15 〉    통과 (1206.27ms, 38.1MB)
 테스트 16 〉    통과 (3.89ms, 16.7MB)
 테스트 17 〉    통과 (2.02ms, 16.6MB)
 테스트 18 〉    통과 (10.04ms, 16.6MB)
 테스트 19 〉    통과 (12.58ms, 16.4MB)
 테스트 20 〉    통과 (810.23ms, 26.3MB)
 테스트 21 〉    통과 (1430.54ms, 37.7MB)
 테스트 22 〉    통과 (0.15ms, 16.5MB)
 테스트 23 〉    통과 (0.16ms, 16.5MB)
 테스트 24 〉    통과 (0.14ms, 16.6MB)
 */

/*
 [해설]
 for 문 주의!!!
 */
