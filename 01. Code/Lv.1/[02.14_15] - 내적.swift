import Foundation

/*
 제목: 내적
 난도: Lv.1 / 완료한 사람: 약 47,000명 / 정답률: 84%
 기출문제: 월간 코드 챌린지 시즌1
 
 [문제]
 길이가 같은 두 1차원 정수 배열 a, b가 매개변수로 주어집니다. a와 b의 내적을 return 하도록 solution 함수를 완성해주세요.

 이때, a와 b의 내적은 a[0]*b[0] + a[1]*b[1] + ... + a[n-1]*b[n-1] 입니다. (n은 a, b의 길이)
 
 [제한]
 a, b의 길이는 1 이상 1,000 이하입니다.
 a, b의 모든 수는 -1,000 이상 1,000 이하입니다.
 
 [입출력 예]
 a    b    result
 [1,2,3,4]    [-3,-1,0,2]    3
 [-1,0,1]    [1,0,-1]    -2
 */

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var result = 0
    for i in 0 ..< a.count { result += a[i]*b[i] }
    return result
}

print("A = \(solution([1,2,3,4], [-3,-1,0,2]))")


/*
 [결과]
 정확성  테스트
 테스트 1 〉    통과 (0.03ms, 16.2MB)
 테스트 2 〉    통과 (0.02ms, 16.2MB)
 테스트 3 〉    통과 (0.01ms, 16.4MB)
 테스트 4 〉    통과 (0.01ms, 16.3MB)
 테스트 5 〉    통과 (0.02ms, 16.7MB)
 테스트 6 〉    통과 (0.02ms, 16.4MB)
 테스트 7 〉    통과 (0.02ms, 16.5MB)
 테스트 8 〉    통과 (0.02ms, 16.4MB)
 테스트 9 〉    통과 (0.02ms, 16.3MB)
 */

/*
 [해설]
 1은 1인가..
 */
