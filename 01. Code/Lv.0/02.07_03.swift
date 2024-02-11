import Foundation

/*
 제목: 배열의 유사도
 난도: Lv.0 / 완료한 사람: 약 25,000명 / 정답률: 89%
 
 [문제]
 두 배열이 얼마나 유사한지 확인해보려고 합니다. 문자열 배열 s1과 s2가 주어질 때 같은 원소의 개수를 return하도록 solution 함수를 완성해주세요.
 
 [제한]
 1 ≤ s1, s2의 길이 ≤ 100
 1 ≤ s1, s2의 원소의 길이 ≤ 10
 s1과 s2의 원소는 알파벳 소문자로만 이루어져 있습니다
 s1과 s2는 각각 중복된 원소를 갖지 않습니다.
 
 [입출력 예]
 s1    s2    result
 ["a", "b", "c"]    ["com", "b", "d", "p", "c"]    2
 ["n", "omg"]    ["m", "dot"]    0
 */

func solution(_ s1:[String], _ s2:[String]) -> Int {
    var result = 0
    for i in s1 {
        for j in s2 {
            if i == j {
                result += 1
            }
        }
    }
    return result
}

print("")
solution(["a", "b", "c"], ["com", "b", "d", "p", "c"])

/*
 [결과]
 정확성  테스트
 테스트 1 〉    통과 (0.05ms, 16.4MB)
 테스트 2 〉    통과 (0.03ms, 16.2MB)
 테스트 3 〉    통과 (0.03ms, 16.4MB)
 테스트 4 〉    통과 (0.02ms, 16.4MB)
 테스트 5 〉    통과 (0.03ms, 16MB)
 테스트 6 〉    통과 (0.02ms, 16.2MB)
 테스트 7 〉    통과 (0.03ms, 16.3MB)
 테스트 8 〉    통과 (0.03ms, 16.5MB)
 */
