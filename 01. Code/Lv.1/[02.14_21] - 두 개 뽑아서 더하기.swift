import Foundation

/*
 제목: 두 개 뽑아서 더하기
 난도: Lv.1 / 완료한 사람: 약 45,000명 / 정답률: 70%
 기출문제: 월간 코드 챌린지 시즌 1
 
 [문제]
 정수 배열 numbers가 주어집니다. numbers에서 서로 다른 인덱스에 있는 두 개의 수를 뽑아 더해서 만들 수 있는 모든 수를 배열에 오름차순으로 담아 return 하도록 solution 함수를 완성해주세요.
 
 [제한]
 numbers의 길이는 2 이상 100 이하입니다.
 numbers의 모든 수는 0 이상 100 이하입니다.

 
 [입출력 예]
 numbers    result
 [2,1,3,4,1]    [2,3,4,5,6,7]
 [5,0,2,7]    [2,5,7,9,12]
 */

func solution(_ numbers:[Int]) -> [Int] {
    var result = [Int]()
    var numberArray: [Int] = numbers
    var slice = numbers
    
    let sum = { (_ start: Int, _ group: [Int]) -> [Int] in
        var result = [Int]()
        group.forEach { result.append($0 + start) }
        return result
    }
    
    for i in numberArray {
        slice.removeFirst()
        if slice.isEmpty { break }
        result += sum(i, slice)
    }
    return Array(Set(result)).sorted()
}

print("A = \(solution([2,1,3,4,1]))")
//print("A = \(solution([5,0,2,7]))")



/*
 [결과]
 정확성  테스트
 테스트 1 〉    통과 (0.18ms, 16.5MB)
 테스트 2 〉    통과 (0.17ms, 16.6MB)
 테스트 3 〉    통과 (0.18ms, 16.7MB)
 테스트 4 〉    통과 (0.18ms, 16.4MB)
 테스트 5 〉    통과 (0.23ms, 16.4MB)
 테스트 6 〉    통과 (0.75ms, 16.6MB)
 테스트 7 〉    통과 (2.08ms, 16.7MB)
 테스트 8 〉    통과 (1.68ms, 16.5MB)
 테스트 9 〉    통과 (1.58ms, 16.6MB)
 */

/*
 [해설]
 많이 써봐야 코테는 확실히 바로 생각이 남
 */
