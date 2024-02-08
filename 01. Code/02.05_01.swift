import Foundation

/*
 제목: 머쓱이보다 키 큰 사람
 난도: Lv.0 / 완료한 사람: 약 32,000명 / 정답률: 90%
 [문제]
 머쓱이는 학교에서 키 순으로 줄을 설 때 몇 번째로 서야 하는지 궁금해졌습니다. 머쓱이네 반 친구들의 키가 담긴 정수 배열 array와 머쓱이의 키 height가 매개변수로 주어질 때, 머쓱이보다 키 큰 사람 수를 return 하도록 solution 함수를 완성해보세요.
 
 [제한]
 1 ≤ array의 길이 ≤ 100
 1 ≤ height ≤ 200
 1 ≤ array의 원소 ≤ 200
 
 [입출력 예]
 array    height    result
 [149, 180, 192, 170]    167    3
 [180, 120, 140]    190    0
 */

func solution(_ array:[Int], _ height:Int) -> Int {
    var result = 0
    for i in array {
        if height < i {
            result += 1
        }
    }
    return result
}
/*
 [결과]
 정확성  테스트
 테스트 1 〉    통과 (0.02ms, 16.5MB)
 테스트 2 〉    통과 (0.02ms, 16.3MB)
 테스트 3 〉    통과 (0.02ms, 16.4MB)
 테스트 4 〉    통과 (0.04ms, 16.5MB)
 */