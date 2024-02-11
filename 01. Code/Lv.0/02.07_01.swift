import Foundation

/*
 제목: 문자열안에 문자열
 난도: Lv.0 / 완료한 사람: 약 24,000명 / 정답률: 89%
 
 [문제]
 문자열 str1, str2가 매개변수로 주어집니다. str1 안에 str2가 있다면 1을 없다면 2를 return하도록 solution 함수를 완성해주세요.
 
 [제한]
 1 ≤ str1의 길이 ≤ 100
 1 ≤ str2의 길이 ≤ 100
 문자열은 알파벳 대문자, 소문자, 숫자로 구성되어 있습니다.
 
 [입출력 예]
 str1    str2    result
 "ab6CDE443fgh22iJKlmn1o"    "6CD"    1
 "ppprrrogrammers"    "pppp"    2
 "AbcAbcA"    "AAA"    2
 
 */

func solution(_ str1:String, _ str2:String) -> Int {
    if str1.contains(str2) {return 1 }
    else { return 2 }
}

print("")
solution("ab6CDE443fgh22iJKlmn1o", "6CD")

/*
 [결과]
 정확성  테스트
 테스트 1 〉    통과 (0.16ms, 16.4MB)
 테스트 2 〉    통과 (0.01ms, 16.4MB)
 테스트 3 〉    통과 (0.02ms, 16.3MB)
 테스트 4 〉    통과 (0.02ms, 16.5MB)
 테스트 5 〉    통과 (0.02ms, 16.3MB)
 테스트 6 〉    통과 (0.01ms, 16.4MB)
 테스트 7 〉    통과 (0.27ms, 16.3MB)
 테스트 8 〉    통과 (0.01ms, 16.4MB)
 테스트 9 〉    통과 (0.01ms, 16.5MB)
 테스트 10 〉    통과 (0.01ms, 16.4MB)
 테스트 11 〉    통과 (0.01ms, 16MB)
 */
