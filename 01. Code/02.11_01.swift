import Foundation

/*
 제목: 숨어있는 숫자의 덧셈 (1)
 난도: Lv.0 / 완료한 사람: 약 21,000명 / 정답률: 89%
 
 [문제]
 문자열 my_string이 매개변수로 주어집니다. my_string안의 모든 자연수들의 합을 return하도록 solution 함수를 완성해주세요.
 
 [제한]
 1 ≤ my_string의 길이 ≤ 1,000
 my_string은 소문자, 대문자 그리고 한자리 자연수로만 구성되어있습니다.
 
 [입출력 예]
 my_string    result
 "aAb1B2cC34oOp"    10
 "1a2b3c4d123"    16
 */

func solution(_ my_string:String) -> Int {
    var result = 0
    my_string.map {
        if let check = Int(String($0)){ result += check }
    }
    return result
}

print("A = \(solution("aAb1B2cC34oOp"))")


/*
 [결과]
 정확성  테스트
 테스트 1 〉    통과 (0.04ms, 16.2MB)
 테스트 2 〉    통과 (0.05ms, 16.3MB)
 테스트 3 〉    통과 (0.07ms, 16.6MB)
 테스트 4 〉    통과 (0.06ms, 16.2MB)
 테스트 5 〉    통과 (0.04ms, 16.3MB)
 테스트 6 〉    통과 (0.04ms, 16.2MB)
 */
