import Foundation

/*
 제목: 소수 만들기
 난도: Lv.1 / 완료한 사람: 약 34,000명 / 정답률: 62%
 기출문제: Summer/Winter Coding(~2018)
 
 [문제]
 주어진 숫자 중 3개의 수를 더했을 때 소수가 되는 경우의 개수를 구하려고 합니다. 숫자들이 들어있는 배열 nums가 매개변수로 주어질 때, nums에 있는 숫자들 중 서로 다른 3개를 골라 더했을 때 소수가 되는 경우의 개수를 return 하도록 solution 함수를 완성해주세요.
 
 [제한]
 nums에 들어있는 숫자의 개수는 3개 이상 50개 이하입니다.
 nums의 각 원소는 1 이상 1,000 이하의 자연수이며, 중복된 숫자가 들어있지 않습니다.
 
 [입출력 예]
 nums    result
 [1,2,3,4]    1
 [1,2,7,6,4]    4
 */


func solution(_ nums:[Int]) -> Int {
    var result = 0
    var nums = (nums,nums,nums)
    var array = [Int]()
    
    let findValue = { (_ num: Int) -> Bool in
        var value = Int(sqrt(Double(num)))
        if value == 1 { return true }
        for i in 2 ... value {
            if num % i == 0 { return false }
        }
        return true
    }
    
    let sum = { (_ first: Int, _ second: Int, _ third: Int) -> Int in
        return first + second + third
    }
    nums.2.removeFirst()
    var num2: [Int] = nums.2
    for i in nums.0 {
        nums.1.removeFirst()
        if nums.1.isEmpty { break }
        if nums.2.isEmpty {
            num2.removeFirst()
            nums.2 = num2
        }
        for j in nums.1 {
            nums.2.removeFirst()
            if nums.2.isEmpty { break }
            for k in nums.2 {
                array.append(sum(i,j,k))
            }
        }
    }
    array.forEach { if findValue($0) {result += 1}}
    return result
}

//print("A = \(solution(6, [46, 33, 33 ,22, 31, 50], [27 ,56, 19, 14, 14, 10]))")
print("A = \(solution([13,100,900]))")
//print("A = \(solution([1, 2, 7, 6, 4]))")

/*
 [결과]
 정확성  테스트
 테스트 1 〉    통과 (1.39ms, 16.5MB)
 테스트 2 〉    통과 (1.82ms, 16.6MB)
 테스트 3 〉    통과 (0.57ms, 16.4MB)
 테스트 4 〉    통과 (0.40ms, 16.5MB)
 테스트 5 〉    통과 (3.64ms, 16.6MB)
 테스트 6 〉    통과 (2.53ms, 16.7MB)
 테스트 7 〉    통과 (0.21ms, 16.4MB)
 테스트 8 〉    통과 (10.13ms, 16.5MB)
 테스트 9 〉    통과 (0.65ms, 16.5MB)
 테스트 10 〉    통과 (6.19ms, 16.6MB)
 테스트 11 〉    통과 (0.14ms, 16.3MB)
 테스트 12 〉    통과 (0.10ms, 16.5MB)
 테스트 13 〉    통과 (0.28ms, 16.5MB)
 테스트 14 〉    통과 (0.12ms, 16.6MB)
 테스트 15 〉    통과 (0.16ms, 16.4MB)
 테스트 16 〉    통과 (6.60ms, 16.4MB)
 테스트 17 〉    통과 (11.76ms, 16.5MB)
 테스트 18 〉    통과 (0.21ms, 16.2MB)
 테스트 19 〉    통과 (0.06ms, 16.5MB)
 테스트 20 〉    통과 (15.70ms, 16.5MB)
 테스트 21 〉    통과 (14.17ms, 16.4MB)
 테스트 22 〉    통과 (2.12ms, 16.3MB)
 테스트 23 〉    통과 (0.06ms, 16.3MB)
 테스트 24 〉    통과 (11.92ms, 16.7MB)
 테스트 25 〉    통과 (11.00ms, 16.8MB)
 테스트 26 〉    통과 (0.07ms, 16.2MB)
 */

/*
 [해설]
 많이 써봐야 코테는 확실히 바로 생각이 남
 */
