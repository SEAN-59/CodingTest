import Foundation

/*
 제목: 세균 증식
 난도: Lv.0 / 완료한 사람: 약 24,000명 / 정답률: 89%
 
 [문제]
 어떤 세균은 1시간에 두배만큼 증식한다고 합니다. 처음 세균의 마리수 n과 경과한 시간 t가 매개변수로 주어질 때 t시간 후 세균의 수를 return하도록 solution 함수를 완성해주세요.
 
 [제한]
 1 ≤ n ≤ 10
 1 ≤ t ≤ 15
 
 [입출력 예]
 n    t    result
 2    10    2048
 7    15    229,376
 */

func solution(_ n:Int, _ t:Int) -> Int {
    var result = n
    for i in 0..<t {
        result *= 2
    }
    return result
}

print(solution(2, 10))


/*
 [결과]
 정확성  테스트
 테스트 1 〉    통과 (0.01ms, 16.3MB)
 테스트 2 〉    통과 (0.01ms, 16.1MB)
 테스트 3 〉    통과 (0.01ms, 16.3MB)
 테스트 4 〉    통과 (0.01ms, 16.5MB)
 테스트 5 〉    통과 (0.00ms, 16.2MB)
 테스트 6 〉    통과 (0.01ms, 16.5MB)
 테스트 7 〉    통과 (0.01ms, 16.1MB)
 테스트 8 〉    통과 (0.01ms, 16.1MB)
 */
