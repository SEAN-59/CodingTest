import Foundation

/*
 제목: 문자 반복 출력하기
 난도: Lv.0 / 완료한 사람: 약 26,000명 / 정답률: 89%
 
 [문제]
 문자열 my_string과 정수 n이 매개변수로 주어질 때, my_string에 들어있는 각 문자를 n만큼 반복한 문자열을 return 하도록 solution 함수를 완성해보세요.
 
 [제한]
 2 ≤ my_string 길이 ≤ 5
 2 ≤ n ≤ 10
 "my_string"은 영어 대소문자로 이루어져 있습니다.
 
 [입출력 예]
 my_string    n    result
 "hello"    3    "hhheeellllllooo"
 
 */

func solution(_ my_string:String, _ n:Int) -> String {
    var result = ""
    my_string.map { for i in 0 ..< n { result += String($0) } }
    return result
}

print("")
solution("hello", 3)

/*
 [결과]
 정확성  테스트
 테스트 1 〉    통과 (0.02ms, 16.4MB)
 테스트 2 〉    통과 (0.02ms, 16.4MB)
 테스트 3 〉    통과 (0.02ms, 16.2MB)
 테스트 4 〉    통과 (0.02ms, 16.5MB)
 */
