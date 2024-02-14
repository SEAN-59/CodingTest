import Foundation

/*
 제목: 문자열을 정수로 바꾸기
 난도: Lv.1 / 완료한 사람: 약 61,000명 / 정답률: 87%
 
 [문제]
 문자열 s를 숫자로 변환한 결과를 반환하는 함수, solution을 완성하세요.
 
 [제한]
 s의 길이는 1 이상 5이하입니다.
 s의 맨앞에는 부호(+, -)가 올 수 있습니다.
 s는 부호와 숫자로만 이루어져있습니다.
 s는 "0"으로 시작하지 않습니다.
 
 [입출력 예]
 s result
 "1234" 1234
 "-1234" -1234
 "+1234" 1234
 */

func solution(_ s:String) -> Int {
    var result = 0
    var sign: Bool = true
    
//    let array = s.map {
//        if $0 == "+" || $0 == "-" {
//            if $0 == "-" { sign = false }
//            return 0
//        }
//        else { return Int("\($0)")! }
//    }
    var array = s.map{"\($0)"}
    if array[0] == "+" || array[0] == "-" {
        if array[0] == "-" { sign = false}
        array.remove(at: 0)
    }
    
    for i in 0 ..< array.count {
        guard let num = Int(array[i]) else { return 0 }
        result += num * Int("\(pow(10, array.count - i - 1))")!
//        result += array[i] * Int("\(pow(10, array.count - i - 1))")!
    }
    
    return sign ? result : result * -1
}

print("A = \(solution("+1234"))")
print("A = \(solution("-1234"))")
print("A = \(solution("1234"))")


/*
 [결과]
 정확성  테스트
 테스트 1 〉    통과 (0.08ms, 16.6MB)
 테스트 2 〉    통과 (0.10ms, 16.5MB)
 테스트 3 〉    통과 (0.08ms, 16.2MB)
 테스트 4 〉    통과 (0.09ms, 16.6MB)
 테스트 5 〉    통과 (0.08ms, 16.5MB)
 테스트 6 〉    통과 (0.08ms, 16.5MB)
 테스트 7 〉    통과 (0.07ms, 16.5MB)
 테스트 8 〉    통과 (0.07ms, 16.5MB)
 테스트 9 〉    통과 (0.09ms, 16.2MB)
 테스트 10 〉    통과 (0.11ms, 16.2MB)
 테스트 11 〉    통과 (0.10ms, 16.3MB)
 테스트 12 〉    통과 (0.07ms, 16.5MB)
 테스트 13 〉    통과 (0.08ms, 16.3MB)
 테스트 14 〉    통과 (0.07ms, 16.3MB)
 테스트 15 〉    통과 (0.08ms, 16.3MB)
 */

/*
 [해설]
 아니 map 에 싹 해서 하면 개 편한데 프로그래머스에서 안되게 하네..
 reduce 쓰거나 해도 될거 같은데 map도 인식 제대로 못하는데 reduce가 될리가..
 */
