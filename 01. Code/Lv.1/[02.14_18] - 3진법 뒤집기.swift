import Foundation

/*
 제목: 3진법 뒤집기
 난도: Lv.1 / 완료한 사람: 약 35,000명 / 정답률: 76%
 기출문제: 월간 코드 챌린지 시즌 1
 
 [문제]
 자연수 n이 매개변수로 주어집니다. n을 3진법 상에서 앞뒤로 뒤집은 후, 이를 다시 10진법으로 표현한 수를 return 하도록 solution 함수를 완성해주세요.
 
 [제한]
 n은 1 이상 100,000,000 이하인 자연수입니다.

 
 [입출력 예]
 n    result
 45    7
 125    229
 */

func solution(_ n:Int) -> Int {
    var result = 0
    var third = n
    var array = [Int]()
    while (third > 0) {
        array.append(third % 3)
        third = third / 3
    }
    array = array.reversed()
    for i in 0 ..< array.count {
        if array[i] == 0 { continue }
        else { result += array[i] * Int("\(pow(3, i))")! }
    }

    return result
}

print("A = \(solution(125))")


/*
 [결과]
 정확성  테스트
 테스트 1 〉    통과 (0.11ms, 16.6MB)
 테스트 2 〉    통과 (0.16ms, 16.7MB)
 테스트 3 〉    통과 (0.12ms, 16.5MB)
 테스트 4 〉    통과 (0.14ms, 16.4MB)
 테스트 5 〉    통과 (0.08ms, 16.4MB)
 테스트 6 〉    통과 (0.09ms, 16.6MB)
 테스트 7 〉    통과 (0.09ms, 16.3MB)
 테스트 8 〉    통과 (0.10ms, 16.6MB)
 테스트 9 〉    통과 (0.11ms, 16.5MB)
 테스트 10 〉    통과 (0.10ms, 16.4MB)
 */

/*
 [해설]
 약간 0레벨 총집합 느낌 이었음
 */
