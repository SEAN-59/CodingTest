import Foundation

/*
 제목: 옹알이
 난도: Lv.0 / 완료한 사람: 약 18,000명 / 정답률: 34%
 
 [문제]
 머쓱이는 태어난 지 6개월 된 조카를 돌보고 있습니다. 조카는 아직 "aya", "ye", "woo", "ma" 네 가지 발음을 최대 한 번씩 사용해 조합한(이어 붙인) 발음밖에 하지 못합니다. 문자열 배열 babbling이 매개변수로 주어질 때, 머쓱이의 조카가 발음할 수 있는 단어의 개수를 return하도록 solution 함수를 완성해주세요.
 
 [제한]
 1 ≤ babbling의 길이 ≤ 100
 1 ≤ babbling[i]의 길이 ≤ 15
 babbling의 각 문자열에서 "aya", "ye", "woo", "ma"는 각각 최대 한 번씩만 등장합니다.
 즉, 각 문자열의 가능한 모든 부분 문자열 중에서 "aya", "ye", "woo", "ma"가 한 번씩만 등장합니다.
 문자열은 알파벳 소문자로만 이루어져 있습니다.
 
 [입출력 예]
 babbling    result
 ["aya", "yee", "u", "maa", "wyeoo"]    1
 ["ayaye", "uuuma", "ye", "yemawoo", "ayaa"]    3
 */

func solution(_ babbling:[String]) -> Int {
    var result = 0
    let checkArray = ["aya", "ye", "woo", "ma"]
    
    babbling.map {
        var check = ""
        $0.map {
            check.append($0)
            checkArray.forEach {
                if check.contains($0) && $0.count == check.count {
                    check = ""
                    return
                }
            }
        }
        if check == "" { result += 1 }
    }
    return result
}


print("A = \(solution(["ayaye", "uuuma", "ye", "yemawoo", "ayaa"]))")


/*
 [결과]
 정확성  테스트
 테스트 1 〉    통과 (1.50ms, 16.4MB)
 테스트 2 〉    통과 (8.75ms, 16.5MB)
 테스트 3 〉    통과 (9.86ms, 16.3MB)
 테스트 4 〉    통과 (3.57ms, 16.2MB)
 테스트 5 〉    통과 (6.57ms, 16.4MB)
 테스트 6 〉    통과 (2.58ms, 16.5MB)
 테스트 7 〉    통과 (3.07ms, 16.3MB)
 테스트 8 〉    통과 (3.72ms, 16.4MB)
 테스트 9 〉    통과 (2.77ms, 16.3MB)
 테스트 10 〉    통과 (0.83ms, 16.5MB)
 테스트 11 〉    통과 (0.30ms, 16.3MB)
 테스트 12 〉    통과 (0.08ms, 16.4MB)
 테스트 13 〉    통과 (0.33ms, 16.1MB)
 테스트 14 〉    통과 (0.48ms, 16.3MB)
 테스트 15 〉    통과 (0.45ms, 16.3MB)
 테스트 16 〉    통과 (0.36ms, 16.4MB)
 테스트 17 〉    통과 (0.72ms, 16.4MB)
 */
