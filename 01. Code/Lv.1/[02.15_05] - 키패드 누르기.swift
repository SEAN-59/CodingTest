import Foundation

/*
 제목: 키패드 누르기
 난도: Lv.1 / 완료한 사람: 약 33,000명 / 정답률: 51%
 기출문제: 2020 카카오 인턴십
 
 [문제]
 스마트폰 전화 키패드의 각 칸에 다음과 같이 숫자들이 적혀 있습니다.

 kakao_phone1.png

 이 전화 키패드에서 왼손과 오른손의 엄지손가락만을 이용해서 숫자만을 입력하려고 합니다.
 맨 처음 왼손 엄지손가락은 * 키패드에 오른손 엄지손가락은 # 키패드 위치에서 시작하며, 엄지손가락을 사용하는 규칙은 다음과 같습니다.

 엄지손가락은 상하좌우 4가지 방향으로만 이동할 수 있으며 키패드 이동 한 칸은 거리로 1에 해당합니다.
 왼쪽 열의 3개의 숫자 1, 4, 7을 입력할 때는 왼손 엄지손가락을 사용합니다.
 오른쪽 열의 3개의 숫자 3, 6, 9를 입력할 때는 오른손 엄지손가락을 사용합니다.
 가운데 열의 4개의 숫자 2, 5, 8, 0을 입력할 때는 두 엄지손가락의 현재 키패드의 위치에서 더 가까운 엄지손가락을 사용합니다.
 4-1. 만약 두 엄지손가락의 거리가 같다면, 오른손잡이는 오른손 엄지손가락, 왼손잡이는 왼손 엄지손가락을 사용합니다.
 순서대로 누를 번호가 담긴 배열 numbers, 왼손잡이인지 오른손잡이인 지를 나타내는 문자열 hand가 매개변수로 주어질 때, 각 번호를 누른 엄지손가락이 왼손인 지 오른손인 지를 나타내는 연속된 문자열 형태로 return 하도록 solution 함수를 완성해주세요.
 
 [제한]
 numbers 배열의 크기는 1 이상 1,000 이하입니다.
 numbers 배열 원소의 값은 0 이상 9 이하인 정수입니다.
 hand는 "left" 또는 "right" 입니다.
 "left"는 왼손잡이, "right"는 오른손잡이를 의미합니다.
 왼손 엄지손가락을 사용한 경우는 L, 오른손 엄지손가락을 사용한 경우는 R을 순서대로 이어붙여 문자열 형태로 return 해주세요.
 
 [입출력 예]
 numbers    hand    result
 [1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5]    "right"    "LRLLLRLLRRL"
 [7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2]    "left"    "LRLLRRLLLRR"
 [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]    "right"    "LLRLLRLLRL"
 */
/*
 1 2 3 (0,3) (1,3) (2,3)
 4 5 6 (0,2) (1,2) (2,2)
 7 8 9 (0,1) (1,1) (2,1)
 * 0 # (0,0) (1,0) (2,0)
 
 
 (0,3) -> (1,2) = 2
 0-1 + 3-2
 (0,3) -> (1,1) = 3
 0-1 + 3-1
 (1,2) -> (1,1) = 1
 1-1 + 2-1 = 1
 */
func solution(_ numbers:[Int], _ hand:String) -> String {
    var result = ""
    var location = (10,11)
    let value = [(1,0), (0,3), (1,3), (2,3), (0,2), (1,2), (2,2), (0,1), (1,1), (2,1), (0,0), (2,0)]
    numbers.forEach {
        if $0 == 1 || $0 == 4 || $0 == 7 {
            location.0 = $0
            result += "L"
        }
        else if $0 == 3 || $0 == 6 || $0 == 9 {
            location.1 = $0
            result += "R"
        }
        else {
            let compare = (
                (value[$0].0 - value[location.0].0 > 0 ? value[$0].0 - value[location.0].0 : (value[$0].0 - value[location.0].0) * -1) + (value[$0].1 - value[location.0].1 > 0 ? value[$0].1 - value[location.0].1 : (value[$0].1 - value[location.0].1) * -1),
                (value[$0].0 - value[location.1].0 > 0 ? value[$0].0 - value[location.1].0 : (value[$0].0 - value[location.1].0) * -1) + (value[$0].1 - value[location.1].1 > 0 ? value[$0].1 - value[location.1].1 : (value[$0].1 - value[location.1].1) * -1)
                )
            if compare.0 > compare.1 {
                location.1 = $0
                result += "R"
            }
            else if compare.0 < compare.1 {
                location.0 = $0
                result += "L"
            }
            else {
                if hand == "right" {
                    location.1 = $0
                    result += "R"
                }
                else {
                    location.0 = $0
                    result += "L"
                }
            }
        }
    }
    return result
}


print("A = \(solution([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5],"right"))")



/*
 [결과]
 정확성  테스트
 테스트 1 〉    통과 (0.04ms, 16.4MB)
 테스트 2 〉    통과 (0.04ms, 16.2MB)
 테스트 3 〉    통과 (0.04ms, 16.2MB)
 테스트 4 〉    통과 (0.03ms, 16.4MB)
 테스트 5 〉    통과 (0.04ms, 16.5MB)
 테스트 6 〉    통과 (0.04ms, 16.2MB)
 테스트 7 〉    통과 (0.03ms, 16.5MB)
 테스트 8 〉    통과 (0.03ms, 16.2MB)
 테스트 9 〉    통과 (0.03ms, 16.5MB)
 테스트 10 〉    통과 (0.05ms, 16.3MB)
 테스트 11 〉    통과 (0.04ms, 16.4MB)
 테스트 12 〉    통과 (0.03ms, 16.4MB)
 테스트 13 〉    통과 (0.10ms, 16.3MB)
 테스트 14 〉    통과 (0.14ms, 16.2MB)
 테스트 15 〉    통과 (0.25ms, 16.4MB)
 테스트 16 〉    통과 (0.22ms, 16.3MB)
 테스트 17 〉    통과 (0.26ms, 16.4MB)
 테스트 18 〉    통과 (0.48ms, 16.4MB)
 테스트 19 〉    통과 (0.50ms, 16.3MB)
 테스트 20 〉    통과 (0.53ms, 16.4MB)
 */

/*
 [해설]
 OK
 */
