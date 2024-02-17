import Foundation

/*
 제목: 이진 변환 반복하기
 난도: Lv.2 / 완료한 사람: 약 24,000명 / 정답률: 77%
 기출문제: 월간 코드 챌린지 시즌1
 
 [문제]
 0과 1로 이루어진 어떤 문자열 x에 대한 이진 변환을 다음과 같이 정의합니다.

 x의 모든 0을 제거합니다.
 x의 길이를 c라고 하면, x를 "c를 2진법으로 표현한 문자열"로 바꿉니다.
 예를 들어, x = "0111010"이라면, x에 이진 변환을 가하면 x = "0111010" -> "1111" -> "100" 이 됩니다.

 0과 1로 이루어진 문자열 s가 매개변수로 주어집니다. s가 "1"이 될 때까지 계속해서 s에 이진 변환을 가했을 때, 이진 변환의 횟수와 변환 과정에서 제거된 모든 0의 개수를 각각 배열에 담아 return 하도록 solution 함수를 완성해주세요.

 
 [제한]
 s의 길이는 1 이상 150,000 이하입니다.
 s에는 '1'이 최소 하나 이상 포함되어 있습니다.

 
 [입출력 예]
 s    result
 "110010101001"    [3,8]
 "01110"    [3,3]
 "1111111"    [4,1]
 */
func solution(_ s:String) -> [Int] {
    var result = [0,0];
    var strResult = s

    let check = { (str: String) -> (String,Int) in
        var result = ("",0)
        var strArray = [String]()
        let array = str.filter {
            if let num = Int("\($0)"), num == 1 {
                return true
            }
            return false
        }
        result.1 = str.count - array.count
        
        var count = array.count
        while (count > 1) {
            strArray.append("\(count % 2)")
            count = count/2
        }
        strArray.append("\(count)")
        result.0 = strArray.joined(separator: "")
        return result
    }
    
    while (strResult != "1") {
        let first = strResult.count
        let change = check(strResult)
        strResult = change.0
        result[1] += change.1
        result[0] += 1
    }
    return result
}


print("A = \(solution("110010101001"))")

/*
 [결과]
 정확성  테스트
 테스트 1 〉    통과 (0.20ms, 16.4MB)
 테스트 2 〉    통과 (58.16ms, 16.8MB)
 테스트 3 〉    통과 (0.12ms, 16.4MB)
 테스트 4 〉    통과 (0.11ms, 16.3MB)
 테스트 5 〉    통과 (0.12ms, 16.2MB)
 테스트 6 〉    통과 (0.59ms, 16.5MB)
 테스트 7 〉    통과 (0.88ms, 16.4MB)
 테스트 8 〉    통과 (0.45ms, 16.4MB)
 테스트 9 〉    통과 (41.67ms, 17.4MB)
 테스트 10 〉    통과 (60.35ms, 16.8MB)
 테스트 11 〉    통과 (51.62ms, 16.7MB)
 */

/*
 [해설]
 음... 성공률 높은 것들은 레벨 1이랑 막 엄청 큰 차이가 나거나 하지는 않는것 같네
 */
