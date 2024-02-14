import Foundation

/*
 제목: 숫자 문자열과 영단어
 난도: Lv.1 / 완료한 사람: 약 46,000명 / 정답률: 70%
 기출문제: 2021 카카오 채용연계형 인턴십
 
 [문제]
 네오와 프로도가 숫자놀이를 하고 있습니다. 네오가 프로도에게 숫자를 건넬 때 일부 자릿수를 영단어로 바꾼 카드를 건네주면 프로도는 원래 숫자를 찾는 게임입니다.

 다음은 숫자의 일부 자릿수를 영단어로 바꾸는 예시입니다.

 1478 → "one4seveneight"
 234567 → "23four5six7"
 10203 → "1zerotwozero3"
 이렇게 숫자의 일부 자릿수가 영단어로 바뀌어졌거나, 혹은 바뀌지 않고 그대로인 문자열 s가 매개변수로 주어집니다. s가 의미하는 원래 숫자를 return 하도록 solution 함수를 완성해주세요.

 참고로 각 숫자에 대응되는 영단어는 다음 표와 같습니다.

 숫자    영단어
 0    zero
 1    one
 2    two
 3    three
 4    four
 5    five
 6    six
 7    seven
 8    eight
 9    nine
 
 [제한]
 1 ≤ s의 길이 ≤ 50
 s가 "zero" 또는 "0"으로 시작하는 경우는 주어지지 않습니다.
 return 값이 1 이상 2,000,000,000 이하의 정수가 되는 올바른 입력만 s로 주어집니다.

 
 [입출력 예]
 s    result
 "one4seveneight"    1478
 "23four5six7"    234567
 "2three45sixseven"    234567
 "123"    123
 */

func solution(_ s:String) -> Int {
    var result = ""
    var dict = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    var str = ""
    
    let array = s.map { "\($0)" }
    for i in array {
        if let num = Int(i) {
            if str != "" {
                if let index = dict.firstIndex(of: str){
                    result += "\(index)"
                    str = ""
                }
            }
            result += "\(num)"
        }
        else {
            str += i
            if let index = dict.firstIndex(of: str) {
                result += "\(index)"
                str = ""
            }
        }
    }
    return Int(result)!
}

print("A = \(solution("one4seveneight"))")
print("A = \(solution("123"))")



/*
 [결과]
 정확성  테스트
 테스트 1 〉    통과 (0.10ms, 16.2MB)
 테스트 2 〉    통과 (0.11ms, 16.2MB)
 테스트 3 〉    통과 (0.07ms, 16.3MB)
 테스트 4 〉    통과 (0.08ms, 16.2MB)
 테스트 5 〉    통과 (0.08ms, 16.2MB)
 테스트 6 〉    통과 (0.15ms, 16.1MB)
 테스트 7 〉    통과 (0.16ms, 16.3MB)
 테스트 8 〉    통과 (0.09ms, 16.4MB)
 테스트 9 〉    통과 (0.22ms, 16.3MB)
 테스트 10 〉    통과 (0.06ms, 16.1MB)
 */

/*
 [해설]
 많이 써봐야 코테는 확실히 바로 생각이 남
 */
