import Foundation

/*
 제목: 콜라츠 추측
 난도: Lv.1 / 완료한 사람: 약 50,000명 / 정답률: 85%
 
 [문제]
 1937년 Collatz란 사람에 의해 제기된 이 추측은, 주어진 수가 1이 될 때까지 다음 작업을 반복하면, 모든 수를 1로 만들 수 있다는 추측입니다. 작업은 다음과 같습니다.

 1-1. 입력된 수가 짝수라면 2로 나눕니다.
 1-2. 입력된 수가 홀수라면 3을 곱하고 1을 더합니다.
 2. 결과로 나온 수에 같은 작업을 1이 될 때까지 반복합니다.
 
 예를 들어, 주어진 수가 6이라면 6 → 3 → 10 → 5 → 16 → 8 → 4 → 2 → 1 이 되어 총 8번 만에 1이 됩니다. 위 작업을 몇 번이나 반복해야 하는지 반환하는 함수, solution을 완성해 주세요. 단, 주어진 수가 1인 경우에는 0을, 작업을 500번 반복할 때까지 1이 되지 않는다면 –1을 반환해 주세요.

 
 [제한]
 입력된 수, num은 1 이상 8,000,000 미만인 정수입니다.
 
 [입출력 예]
 n    result
 6    8
 16    4
 626331    -1
 */

func collatz(_ num: Int, _ count: Int) -> Int {
    var result = count
    if count > 500 { return -1 }
    if num == 1 { return result - 1 }
    if num % 2 == 0 { result = collatz(num/2, count+1) }
    else { result = collatz((num * 3) + 1, count+1) }
    return result
}

func solution(_ num:Int) -> Int {
    return collatz(num, 1)
}

print("A = \(solution(6))")
print("A = \(solution(626331))")


/*
 [결과]
 정확성  테스트
 테스트 1 〉    통과 (0.01ms, 16.2MB)
 테스트 2 〉    통과 (0.01ms, 16.2MB)
 테스트 3 〉    통과 (0.01ms, 16.3MB)
 테스트 4 〉    통과 (0.01ms, 16.5MB)
 테스트 5 〉    통과 (0.03ms, 16.4MB)
 테스트 6 〉    통과 (0.01ms, 16.4MB)
 테스트 7 〉    통과 (0.04ms, 16.4MB)
 테스트 8 〉    통과 (0.01ms, 16.4MB)
 테스트 9 〉    통과 (0.02ms, 16.2MB)
 테스트 10 〉    통과 (0.03ms, 16.4MB)
 테스트 11 〉    통과 (0.03ms, 16.5MB)
 테스트 12 〉    통과 (0.01ms, 16.3MB)
 테스트 13 〉    통과 (0.01ms, 16.2MB)
 테스트 14 〉    통과 (0.01ms, 16.3MB)
 테스트 15 〉    통과 (0.01ms, 16.1MB)
 테스트 16 〉    통과 (0.01ms, 16.2MB)
 */

/*
 [해설]
 클로저 변수로 가능할까..?
 */
