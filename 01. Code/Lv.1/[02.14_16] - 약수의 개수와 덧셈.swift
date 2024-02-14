import Foundation

/*
 제목: 약수의 개수와 덧셈
 난도: Lv.1 / 완료한 사람: 약 37,000명 / 정답률: 83%
 기출문제: 월간 코드 챌린지 시즌2
 
 [문제]
 두 정수 left와 right가 매개변수로 주어집니다. left부터 right까지의 모든 수들 중에서, 약수의 개수가 짝수인 수는 더하고, 약수의 개수가 홀수인 수는 뺀 수를 return 하도록 solution 함수를 완성해주세요.
 
 [제한]
 1 ≤ left ≤ right ≤ 1,000
 
 [입출력 예]
 left    right    result
 13    17    43
 24    27    52
 */

func solution(_ left:Int, _ right:Int) -> Int {
    var result = 0
    let count = { (_ num : Int) -> Int in
        var array = [Int]()
        var sqrtNum = Int(sqrt(Double(num)))
        for i in 1 ... sqrtNum {
            if num % i == 0 {
                array.append(i)
                array.append(num/i)
            }
        }
        return Set(array).count
    }
    
    
    for i in left ... right {
        if count(i) % 2 == 0 {
            result += i
        }
        else {
            result -= i
        }
    }
    return result
}

print("A = \(solution(13, 17))")


/*
 [결과]
 정확성  테스트
 테스트 1 〉    통과 (2.87ms, 16.1MB)
 테스트 2 〉    통과 (1.41ms, 16.7MB)
 테스트 3 〉    통과 (1.86ms, 16.5MB)
 테스트 4 〉    통과 (0.22ms, 16.4MB)
 테스트 5 〉    통과 (2.39ms, 16.4MB)
 테스트 6 〉    통과 (0.43ms, 16.4MB)
 테스트 7 〉    통과 (0.23ms, 16.5MB)
 */

/*
 [해설]
 약수 구하기 심화
 */
