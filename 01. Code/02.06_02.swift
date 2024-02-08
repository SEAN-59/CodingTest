import Foundation

/*
 제목: 문자열 뒤집기
 난도: Lv.0 / 완료한 사람: 약 31,000명 / 정답률: 89%
 
 [문제]
 문자열 my_string이 매개변수로 주어집니다. my_string을 거꾸로 뒤집은 문자열을 return하도록 solution 함수를 완성해주세요.
 
 [제한]
 1 ≤ my_string의 길이 ≤ 1,000
 
 [입출력 예]
 my_string    return
 "jaron"    "noraj"
 "bread"    "daerb"
 */

func solution(_ my_string:String) -> String {
    var charArray = [Character]()
    var result = ""
    my_string.map { charArray.insert($0, at: 0) }
    charArray.map { result += "\($0)" }
    return result
}

solution("jaron")

/*
 [결과]
 정확성  테스트
 테스트 1 〉    통과 (0.04ms, 16.3MB)
 테스트 2 〉    통과 (0.04ms, 16.2MB)
 테스트 3 〉    통과 (0.05ms, 16.3MB)
 테스트 4 〉    통과 (0.06ms, 16.2MB)
 테스트 5 〉    통과 (0.04ms, 16.3MB)
 */
