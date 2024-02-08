import Foundation

/*
 제목: 중복된 숫자 개수
 난도: Lv.0 / 완료한 사람: 약 32,000명 / 정답률: 90%
 [문제]
 정수가 담긴 배열 array와 정수 n이 매개변수로 주어질 때, array에 n이 몇 개 있는 지를 return 하도록 solution 함수를 완성해보세요.
 [제한]
 1 ≤ array의 길이 ≤ 100
 0 ≤ array의 원소 ≤ 1,000
 0 ≤ n ≤ 1,000
 
 [입출력 예]
 array    n    result
 [1, 1, 2, 3, 4, 5]    1    2
 [0, 2, 3, 4]    1    0
 
 */


func solution(_ array:[Int], _ n:Int) -> Int {
    return array.filter{ $0==n }.count
}

solution([0, 2, 3, 4], 1)

/*
 [결과]
 정확성  테스트
 테스트 1 〉    통과 (0.03ms, 16.6MB)
 테스트 2 〉    통과 (0.03ms, 16.5MB)
 테스트 3 〉    통과 (0.04ms, 16.2MB)
 테스트 4 〉    통과 (0.04ms, 16.5MB)
 테스트 5 〉    통과 (0.04ms, 16.3MB)
 테스트 6 〉    통과 (0.03ms, 16.4MB)
 */
