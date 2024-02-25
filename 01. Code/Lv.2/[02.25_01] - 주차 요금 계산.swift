import Foundation

/*
 제목: 주차 요금 계산
 난도: Lv.2 / 완료한 사람: 약 15,000명 / 정답률: 58%
 기출문제: 2022 KAKAO BLIND RECRUITMENT
 
 [문제]
 주차장의 요금표와 차량이 들어오고(입차) 나간(출차) 기록이 주어졌을 때, 차량별로 주차 요금을 계산하려고 합니다. 아래는 하나의 예시를 나타냅니다.

 요금표
 기본 시간(분)    기본 요금(원)    단위 시간(분)    단위 요금(원)
 180    5000    10    600
  

 입/출차 기록
 시각(시:분)    차량 번호    내역
 05:34    5961    입차
 06:00    0000    입차
 06:34    0000    출차
 07:59    5961    출차
 07:59    0148    입차
 18:59    0000    입차
 19:09    0148    출차
 22:59    5961    입차
 23:00    5961    출차
  

 자동차별 주차 요금
 차량 번호    누적 주차 시간(분)    주차 요금(원)
 0000    34 + 300 = 334    5000 + ⌈(334 - 180) / 10⌉ x 600 = 14600
 0148    670    5000 +⌈(670 - 180) / 10⌉x 600 = 34400
 5961    145 + 1 = 146    5000
 
 어떤 차량이 입차된 후에 출차된 내역이 없다면, 23:59에 출차된 것으로 간주합니다.
 0000번 차량은 18:59에 입차된 이후, 출차된 내역이 없습니다. 
 따라서, 23:59에 출차된 것으로 간주합니다.
 00:00부터 23:59까지의 입/출차 내역을 바탕으로 차량별 누적 주차 시간을 계산하여 요금을 일괄로 정산합니다.
 누적 주차 시간이 기본 시간이하라면, 기본 요금을 청구합니다.
 누적 주차 시간이 기본 시간을 초과하면, 기본 요금에 더해서, 초과한 시간에 대해서 단위 시간 마다 단위 요금을 청구합니다.
 
 초과한 시간이 단위 시간으로 나누어 떨어지지 않으면, 올림합니다.
 ⌈a⌉ : a보다 작지 않은 최소의 정수를 의미합니다. 즉, 올림을 의미합니다.
 
 주차 요금을 나타내는 정수 배열 fees, 
 자동차의 입/출차 내역을 나타내는 문자열 배열 records가 매개변수로 주어집니다.
 차량 번호가 작은 자동차부터 청구할 주차 요금을 차례대로 정수 배열에 담아서 return 하도록 solution 함수를 완성해주세요

 
 [제한]
 fees의 길이 = 4

 fees[0] = 기본 시간(분)
 1 ≤ fees[0] ≤ 1,439
 fees[1] = 기본 요금(원)
 0 ≤ fees[1] ≤ 100,000
 fees[2] = 단위 시간(분)
 1 ≤ fees[2] ≤ 1,439
 fees[3] = 단위 요금(원)
 1 ≤ fees[3] ≤ 10,000
 1 ≤ records의 길이 ≤ 1,000

 records의 각 원소는 "시각 차량번호 내역" 형식의 문자열입니다.
 시각, 차량번호, 내역은 하나의 공백으로 구분되어 있습니다.
 시각은 차량이 입차되거나 출차된 시각을 나타내며, HH:MM 형식의 길이 5인 문자열입니다.
 HH:MM은 00:00부터 23:59까지 주어집니다.
 잘못된 시각("25:22", "09:65" 등)은 입력으로 주어지지 않습니다.
 차량번호는 자동차를 구분하기 위한, `0'~'9'로 구성된 길이 4인 문자열입니다.
 내역은 길이 2 또는 3인 문자열로, IN 또는 OUT입니다. IN은 입차를, OUT은 출차를 의미합니다.
 records의 원소들은 시각을 기준으로 오름차순으로 정렬되어 주어집니다.
 records는 하루 동안의 입/출차된 기록만 담고 있으며, 입차된 차량이 다음날 출차되는 경우는 입력으로 주어지지 않습니다.
 같은 시각에, 같은 차량번호의 내역이 2번 이상 나타내지 않습니다.
 마지막 시각(23:59)에 입차되는 경우는 입력으로 주어지지 않습니다.
 아래의 예를 포함하여, 잘못된 입력은 주어지지 않습니다.
 주차장에 없는 차량이 출차되는 경우
 주차장에 이미 있는 차량(차량번호가 같은 차량)이 다시 입차되는 경우
 
 [입출력 예]
 fees    records    result
 [180, 5000, 10, 600]    ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"]    [14600, 34400, 5000]
 [120, 0, 60, 591]    ["16:00 3961 IN","16:00 0202 IN","18:00 3961 OUT","18:00 0202 OUT","23:58 3961 IN"]    [0, 591]
 [1, 461, 1, 10]    ["00:00 1234 IN"]    [14841]
 */

/*
 [
 "05:34 5961 IN", = 334
 "06:00 0000 IN", = 300
 "06:34 0000 OUT",= 394
 "07:59 5961 OUT",= 479
 "07:59 0148 IN", = 479
 "18:59 0000 IN", = 1139
 "19:09 0148 OUT",= 1149
 "22:59 5961 IN", = 1379
 "23:00 5961 OUT" = 1380
 1380+59 = 1439
 ]
 

 5961 = 334 ~ 479               = 145 <= 180 = 5000
 0000 = 300 ~ 394 + 1139 ~ 1439 = 94 <= 180  = 5000
                                = 300 > 180 = 119(11.9) * 600 =
 0148 = 479 ~ 1149
 
 */


func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    //fees = [기본 시간, 기본 요금, 단위 시간, 단위 요금]
    var result = [Int]()
    var outCarPrice = [String: Int]()
    var parkingSys = [String: Int]()
    var parkingTime = [String: Int]()
    
    records.forEach {
        let carInfo = $0.split(separator:" ")
        let carTime = "\(carInfo[0])".split(separator: ":")
        let timeMin = (Int("\(carTime[0])")! * 60) + Int("\(carTime[1])")!
        let carNum = "\(carInfo[1])", carType = "\(carInfo[2])"
        
        if carType == "IN" {
            parkingSys[carNum] = timeMin
        }
        else if carType == "OUT" {
            
            let inTime = parkingSys[carNum]!
            var tValue = 0
            var price = 0
            
            if let t = parkingTime[carNum] {
                tValue = timeMin - inTime + t
            }
            else {
                tValue = timeMin - inTime
            }
            
            if tValue <= fees[0] {
                price = fees[1]
            }
            else {
                let subFeesTime = tValue - fees[0]
                let subFees = (subFeesTime/fees[2] + (subFeesTime%fees[2] > 0 ? 1 : 0)) * fees[3]
                price = fees[1] + subFees
            }

            outCarPrice[carNum] = price
            
            if let t = parkingTime[carNum] {
                parkingTime[carNum] = t + (timeMin - inTime)
            }
            else {
                parkingTime[carNum] = timeMin - inTime
            }
            
            parkingSys[carNum] = nil
        }
    }
    if !parkingSys.isEmpty {
        parkingSys.keys.forEach {
            let inTime = parkingSys[$0]!
            var tValue = 0
            var price = 0
            
            if let t = parkingTime[$0] {
                tValue = ((23*60)+59) - inTime + t
            }
            else {
                tValue = ((23*60)+59) - inTime
            }
            
            if tValue <= fees[0] {
                price = fees[1]
            }
            else {
                let subFeesTime = tValue - fees[0]
                let subFees = (subFeesTime/fees[2] + (subFeesTime%fees[2] > 0 ? 1 : 0)) * fees[3]
                price = fees[1] + subFees
            }
            outCarPrice[$0] = price
        }
    }
    
    
    outCarPrice.keys.sorted().forEach { result.append(outCarPrice[$0]!) }
    
    return result
}

//print("A = \(solution([180, 5000, 10, 600], ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"]))")


print("A = \(solution([1, 461, 1, 10], ["00:00 1234 IN"]))")



/*
 [결과]
 정확성  테스트
 테스트 1 〉    통과 (0.23ms, 16.7MB)
 테스트 2 〉    통과 (0.25ms, 16.6MB)
 테스트 3 〉    통과 (0.31ms, 16.5MB)
 테스트 4 〉    통과 (0.66ms, 16.5MB)
 테스트 5 〉    통과 (1.34ms, 16.5MB)
 테스트 6 〉    통과 (1.24ms, 16.3MB)
 테스트 7 〉    통과 (7.84ms, 16.5MB)
 테스트 8 〉    통과 (5.94ms, 16.3MB)
 테스트 9 〉    통과 (1.07ms, 16.5MB)
 테스트 10 〉    통과 (12.61ms, 16.4MB)
 테스트 11 〉    통과 (19.59ms, 16.7MB)
 테스트 12 〉    통과 (9.82ms, 16.9MB)
 테스트 13 〉    통과 (0.34ms, 16.6MB)
 테스트 14 〉    통과 (0.21ms, 16.7MB)
 테스트 15 〉    통과 (0.16ms, 16.6MB)
 테스트 16 〉    통과 (0.16ms, 16.4MB)
 */

/*
 [해설]
 .split(separator: "") 는 저장이 SubString이니까 String으로 쓰고 싶으면 따로 처리 해야함
 명령어들은 자주 쓰다보면 외워지겠지...?
 */
