import Foundation

/*
 제목: 모음 제거
 난도: Lv.0 / 완료한 사람: 약 22,000명 / 정답률: 89%
 
 [문제]
 영어에선 a, e, i, o, u 다섯 가지 알파벳을 모음으로 분류합니다. 문자열 my_string이 매개변수로 주어질 때 모음을 제거한 문자열을 return하도록 solution 함수를 완성해주세요.
 
 [제한]
 my_string은 소문자와 공백으로 이루어져 있습니다.
 1 ≤ my_string의 길이 ≤ 1,000
 
 [입출력 예]
 my_string    result
 "bus"    "bs"
 "nice to meet you"    "nc t mt y"
 */



func solution(_ my_string:String) -> String {
    var result = ""
    my_string.map {
        switch $0 {
        case "a":
            break
        case "e":
            break
        case "i":
            break
        case "o":
            break
        case "u":
            break
        default:
            result += "\($0)"
        }
    }
    return result
}

print(solution("nice to meet you"))


/*
 [결과]
 정확성  테스트
 테스트 1 〉    통과 (0.02ms, 16.1MB)
 테스트 2 〉    통과 (0.02ms, 16MB)
 테스트 3 〉    통과 (0.03ms, 16.2MB)
 테스트 4 〉    통과 (0.05ms, 16.1MB)
 테스트 5 〉    통과 (0.03ms, 15.7MB)
 테스트 6 〉    통과 (0.05ms, 16.2MB)
 */
