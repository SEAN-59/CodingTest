import Foundation

/*
 제목: 괄호 회전하기
 난도: Lv.2 / 완료한 사람: 약 15,000명 / 정답률: 65%
 기출문제: 월간 코드 챌린지 시즌 2
 
 [문제]
 다음 규칙을 지키는 문자열을 올바른 괄호 문자열이라고 정의합니다.

 (), [], {} 는 모두 올바른 괄호 문자열입니다.
 만약 A가 올바른 괄호 문자열이라면, (A), [A], {A} 도 올바른 괄호 문자열입니다.
 예를 들어, [] 가 올바른 괄호 문자열이므로, ([]) 도 올바른 괄호 문자열입니다.
 만약 A, B가 올바른 괄호 문자열이라면, AB 도 올바른 괄호 문자열입니다. 
 예를 들어, {} 와 ([]) 가 올바른 괄호 문자열이므로, {}([]) 도 올바른 괄호 문자열입니다.
 대괄호, 중괄호, 그리고 소괄호로 이루어진 문자열 s가 매개변수로 주어집니다.
 이 s를 왼쪽으로 x (0 ≤ x < (s의 길이)) 칸만큼 회전시켰을 때 s가 올바른 괄호 문자열이 되게 하는 x의 개수를 return 하도록 solution 함수를 완성해주세요.
 
 [제한]
 s의 길이는 1 이상 1,000 이하입니다.
 
 [입출력 예]
 s    result
 "[](){}"    3
 "}]()[{"    2
 "[)(]"    0
 "}}}"    0

 
 */


func solution(_ s:String) -> Int {
    enum Bracket: Int{
        case small = 0
        case middle = 1
        case big = 2
    }
    var s = s
    var result = 0
    
    let check = { (_ s: String) -> Bool in
        var stack = [Bracket]()
        
        for i in s {
            switch i {
            case "(":
                stack.append(.small)
            case "{":
                stack.append(.middle)
            case "[":
                stack.append(.big)
            case ")":
                if stack.isEmpty { return false }
                else {
                    if stack.last == .small { stack.popLast() } else { return false }
                }
            case "}":
                if stack.isEmpty { return false }
                else {
                    if stack.last == .middle { stack.popLast() } else { return false }
                }
            case "]":
                if stack.isEmpty { return false }
                else {
                    if stack.last == .big { stack.popLast() } else { return false }
                }
            default:
                break
            }
        }
        if stack.isEmpty { return true } else { return false }
    }
    
    let lotation = { (_ s: String) -> String in
        var s = s + "\(s.first!)"
        s.removeFirst()
        return s
    }
    
    for i in 0..<s.count {
        if check(s) { result += 1 }
        s = lotation(s)
    }
    return result
}

print("A = \(solution("[](){}"))")

/*
 [결과]
 정확성  테스트
 테스트 1 〉    통과 (33.86ms, 16.4MB)
 테스트 2 〉    통과 (26.72ms, 16.2MB)
 테스트 3 〉    통과 (21.24ms, 16.1MB)
 테스트 4 〉    통과 (48.84ms, 16.4MB)
 테스트 5 〉    통과 (69.17ms, 16.4MB)
 테스트 6 〉    통과 (60.89ms, 16.2MB)
 테스트 7 〉    통과 (64.65ms, 16.3MB)
 테스트 8 〉    통과 (51.59ms, 16.4MB)
 테스트 9 〉    통과 (102.43ms, 16.3MB)
 테스트 10 〉    통과 (127.95ms, 16.4MB)
 테스트 11 〉    통과 (188.20ms, 16.3MB)
 테스트 12 〉    통과 (0.03ms, 16.2MB)
 테스트 13 〉    통과 (0.05ms, 16.3MB)
 테스트 14 〉    통과 (0.04ms, 16.5MB)
 */

/*
 [해설]
 */
