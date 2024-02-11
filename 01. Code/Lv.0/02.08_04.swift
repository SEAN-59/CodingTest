import Foundation

/*
 제목: 짝수는 싫어요
 난도: Lv.0 / 완료한 사람: 약 29,000명 / 정답률: 89%
 
 [문제]
 정수 n이 매개변수로 주어질 때, n 이하의 홀수가 오름차순으로 담긴 배열을 return하도록 solution 함수를 완성해주세요.
 
 [제한]
 1 ≤ n ≤ 100
 
 [입출력 예]
 n    result
 10    [1, 3, 5, 7, 9]
 15    [1, 3, 5, 7, 9, 11, 13, 15]
 */



func solution(_ n:Int) -> [Int] {
    var result = [Int]()
    for i in 1 ... n {
        if i % 2 != 0 { result.append(i)}
    }
    return result
}

print(solution(10))


/*
 [결과]
 정확성  테스트
 테스트 1 〉    통과 (0.02ms, 16.3MB)
 테스트 2 〉    통과 (0.03ms, 16.4MB)
 테스트 3 〉    통과 (0.03ms, 16.5MB)
 테스트 4 〉    통과 (0.04ms, 16.2MB)
 테스트 5 〉    통과 (0.02ms, 16.2MB)
 테스트 6 〉    통과 (0.04ms, 16MB)
 테스트 7 〉    통과 (0.03ms, 16.3MB)
 테스트 8 〉    통과 (0.03ms, 16.2MB)
 */
