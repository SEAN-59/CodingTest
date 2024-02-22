import Foundation

/*
 제목: k진수에서 소수 개수 구하기
 난도: Lv.2 / 완료한 사람: 약 13,000명 / 정답률: 61%
 기출문제: 2022 KAKAO BLIND RECRUITMENT
 
 [문제]
 양의 정수 n이 주어집니다. 이 숫자를 k진수로 바꿨을 때, 변환된 수 안에 아래 조건에 맞는 소수(Prime number)가 몇 개인지 알아보려 합니다.

 0P0처럼 소수 양쪽에 0이 있는 경우
 P0처럼 소수 오른쪽에만 0이 있고 왼쪽에는 아무것도 없는 경우
 0P처럼 소수 왼쪽에만 0이 있고 오른쪽에는 아무것도 없는 경우
 P처럼 소수 양쪽에 아무것도 없는 경우
 단, P는 각 자릿수에 0을 포함하지 않는 소수입니다.
 예를 들어, 101은 P가 될 수 없습니다.
 예를 들어, 437674을 3진수로 바꾸면 211020101011입니다. 여기서 찾을 수 있는 조건에 맞는 소수는 왼쪽부터 순서대로 211, 2, 11이 있으며, 총 3개입니다. (211, 2, 11을 k진법으로 보았을 때가 아닌, 10진법으로 보았을 때 소수여야 한다는 점에 주의합니다.) 211은 P0 형태에서 찾을 수 있으며, 2는 0P0에서, 11은 0P에서 찾을 수 있습니다.

 정수 n과 k가 매개변수로 주어집니다. n을 k진수로 바꿨을 때, 변환된 수 안에서 찾을 수 있는 위 조건에 맞는 소수의 개수를 return 하도록 solution 함수를 완성해 주세요.

 8421
 0110 = 6
 931
 211
 
 1+
 01
 23
 45
 67
 
 012 1
 345 1
 678 2
= 1 + 4 + 7
 
 소수는 1은 포함 안함
 
 [제한]
 1 ≤ n ≤ 1,000,000
 3 ≤ k ≤ 10
012 / 345 / 678
 121
 
 012 012
 
 1(자리 *4) 1(자리 * 2) 1(자리 * 1)
 [입출력 예]
 n    k    result
 437674    3    3
 110011    10    2
 */

func solution(_ n:Int, _ k:Int) -> Int {
    var strNum = ""
    var count = 0
    
    let makeDigit = { (_ n2:Int, _ k:Int) -> String in
        var result = ""
        var n = n2
        while (n>0) {
            if n > k {
                result = "\(n % k)"+result
                n /= k
            }
            else {
                result = "\(n)"+result
                n = 0
            }
        }
        
        return result
    }
    
    let checkPrime = { (_ str: String, _ k:Int) -> Bool in
        if str == "2" { return true}
        var value = Int(str)!
        let sqr = Int(sqrt(Double(value)))
        
        for i in 2 ... sqr {
            if value / i == 0 { return false }
        }
        return true
    }
    
    makeDigit(n,k).forEach {
        if $0 != "0" { strNum += "\($0)"}
        else if strNum != "" {
            if strNum != "1" {
                if checkPrime(strNum,k) { count+=1 }
            }
            strNum = ""
        }

    }
    
    if strNum != "1" { if checkPrime(strNum,k) { count+=1 } }
    
    return count
}

//print("A = \(solution(437673, 3))")
//print("A = \(solution(437674, 3))")
print("A = \(solution(4, 10))")



/*
 [결과]
 정확성  테스트
 
 */

/*
 [해설]
 이름 지정할때 미리 존재하는거로 지정하면 안될 가능성이 존재
 */

