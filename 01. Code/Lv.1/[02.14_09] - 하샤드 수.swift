import Foundation

/*
 제목: 하샤드 수
 난도: Lv.1 / 완료한 사람: 약 53,000명 / 정답률: 87%
 
 [문제]
 양의 정수 x가 하샤드 수이려면 x의 자릿수의 합으로 x가 나누어져야 합니다. 
 예를 들어 18의 자릿수 합은 1+8=9이고, 18은 9로 나누어 떨어지므로 18은 하샤드 수입니다. 자연수 x를 입력받아 x가 하샤드 수인지 아닌지 검사하는 함수, solution을 완성해주세요.
 
 [제한]
 x는 1 이상, 10000 이하인 정수입니다.
 
 [입출력 예]
 x    return
 10    true
 12    true
 11    false
 13    false
 */

func solution(_ x:Int) -> Bool {
    return x % ("\(x)".map{Int("\($0)")!}.reduce(0){$0+$1}) == 0  ? true : false
}
print("A = \(solution(10))")


/*
 [결과]
 정확성  테스트
 테스트 1 〉    통과 (0.05ms, 16.4MB)
 테스트 2 〉    통과 (0.06ms, 16.6MB)
 테스트 3 〉    통과 (0.06ms, 16.3MB)
 테스트 4 〉    통과 (0.05ms, 16.2MB)
 테스트 5 〉    통과 (0.08ms, 16.3MB)
 테스트 6 〉    통과 (0.06ms, 16.2MB)
 테스트 7 〉    통과 (0.05ms, 16.4MB)
 테스트 8 〉    통과 (0.05ms, 16.3MB)
 테스트 9 〉    통과 (0.05ms, 16.4MB)
 테스트 10 〉    통과 (0.06ms, 16.3MB)
 테스트 11 〉    통과 (0.05ms, 16.3MB)
 테스트 12 〉    통과 (0.06ms, 16.1MB)
 테스트 13 〉    통과 (0.06ms, 16.6MB)
 테스트 14 〉    통과 (0.06ms, 16.6MB)
 테스트 15 〉    통과 (0.10ms, 16.5MB)
 테스트 16 〉    통과 (0.05ms, 16.3MB)
 테스트 17 〉    통과 (0.05ms, 16.2MB)
 */

/*
 [해설]
 이런 쉬운건 고차함수 범벅으로 풀면 그냥 쉽게 한줄로 끝남
 */
