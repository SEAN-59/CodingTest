import Foundation

/*
 제목: 음양 더하기
 난도: Lv.1 / 완료한 사람: 약 49,000명 / 정답률: 85%
 
 [문제]
 어떤 정수들이 있습니다. 이 정수들의 절댓값을 차례대로 담은 정수 배열 absolutes와 이 정수들의 부호를 차례대로 담은 불리언 배열 signs가 매개변수로 주어집니다. 실제 정수들의 합을 구하여 return 하도록 solution 함수를 완성해주세요.
 
 [제한]
 absolutes의 길이는 1 이상 1,000 이하입니다.
 absolutes의 모든 수는 각각 1 이상 1,000 이하입니다.
 signs의 길이는 absolutes의 길이와 같습니다.
 signs[i] 가 참이면 absolutes[i] 의 실제 정수가 양수임을, 그렇지 않으면 음수임을 의미합니다.
 
 [입출력 예]
 absolutes    signs    result
 [4,7,12]    [true,false,true]    9
 [1,2,3]    [false,false,true]    0
 */

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var result = 0
    for i in 0 ..< absolutes.count {
        result += signs[i] ? absolutes[i] : absolutes[i] * -1
    }
    return result
}
print("A = \(solution([4,7,12], [true,false,true]))")


/*
 [결과]
 정확성  테스트
 테스트 1 〉    통과 (0.03ms, 16.4MB)
 테스트 2 〉    통과 (0.03ms, 16.6MB)
 테스트 3 〉    통과 (0.03ms, 16.5MB)
 테스트 4 〉    통과 (0.03ms, 16.4MB)
 테스트 5 〉    통과 (0.03ms, 16.4MB)
 테스트 6 〉    통과 (0.04ms, 16.5MB)
 테스트 7 〉    통과 (0.04ms, 16.3MB)
 테스트 8 〉    통과 (0.04ms, 16.5MB)
 테스트 9 〉    통과 (0.03ms, 16.6MB)
 */

/*
 [해설]
 아.. 이거 뭔가 2개를 동시에 뽀짝뽀짝 하는게 있을거 같은디..
 */
