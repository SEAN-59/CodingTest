import Foundation

/*
 제목: 서울에서 김서방 찾기
 난도: Lv.1 / 완료한 사람: 약 58,000명 / 정답률: 85%
 
 [문제]
 String형 배열 seoul의 element중 "Kim"의 위치 x를 찾아, "김서방은 x에 있다"는 String을 반환하는 함수, solution을 완성하세요. seoul에 "Kim"은 오직 한 번만 나타나며 잘못된 값이 입력되는 경우는 없습니다.
 
 [제한]
 seoul은 길이 1 이상, 1000 이하인 배열입니다.
 seoul의 원소는 길이 1 이상, 20 이하인 문자열입니다.
 "Kim"은 반드시 seoul 안에 포함되어 있습니다.
 
 [입출력 예]
 ["Jane", "Kim"]    "김서방은 1에 있다"
 */

func solution(_ seoul:[String]) -> String {
    return "김서방은 \(seoul.firstIndex(of: "Kim")!)에 있다"
}

print("A = \(solution(["Jane", "Kim"]))")


/*
 [결과]
 정확성  테스트
 테스트 1 〉    통과 (0.03ms, 16.6MB)
 테스트 2 〉    통과 (0.02ms, 16.2MB)
 테스트 3 〉    통과 (0.04ms, 16.4MB)
 테스트 4 〉    통과 (0.03ms, 16.1MB)
 테스트 5 〉    통과 (0.02ms, 16.2MB)
 테스트 6 〉    통과 (0.04ms, 16.2MB)
 테스트 7 〉    통과 (0.02ms, 16.5MB)
 테스트 8 〉    통과 (0.02ms, 16.4MB)
 테스트 9 〉    통과 (0.02ms, 16.3MB)
 테스트 10 〉    통과 (0.02ms, 16.5MB)
 테스트 11 〉    통과 (0.05ms, 16.4MB)
 테스트 12 〉    통과 (0.02ms, 16.4MB)
 테스트 13 〉    통과 (0.06ms, 16.5MB)
 테스트 14 〉    통과 (0.09ms, 16.2MB)
 */

/*
 [해설]
 레벨 1도 기출 문제 유형만 풀고 나머지는 스킵하는걸로 0이랑 차이가 없네
 */
