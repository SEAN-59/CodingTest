import Foundation

/*
 제목: 옷가게 할인 받기
 난도: Lv.0 / 완료한 사람: 약 27,000명 / 정답률: 89%
 
 [문제]
 머쓱이네 옷가게는 10만 원 이상 사면 5%, 30만 원 이상 사면 10%, 50만 원 이상 사면 20%를 할인해줍니다.
 구매한 옷의 가격 price가 주어질 때, 지불해야 할 금액을 return 하도록 solution 함수를 완성해보세요.
 
 [제한]
 10 ≤ price ≤ 1,000,000
 price는 10원 단위로(1의 자리가 0) 주어집니다.
 소수점 이하를 버린 정수를 return합니다.
 
 [입출력 예]
 price    result
 150,000    142,500
 580,000    464,000
 */


func solution(_ price:Int) -> Int {
    let price = Double(price)
    if price < 100000 { return Int(price) }
    else if price < 300000 { return Int(price*0.95) }
    else if price < 500000 { return Int(price*0.9) }
    else { return Int(price*0.8) }
}

print(solution(150000))


/*
 [결과]
 정확성  테스트
 테스트 1 〉    통과 (0.01ms, 15.9MB)
 테스트 2 〉    통과 (0.01ms, 16.2MB)
 테스트 3 〉    통과 (0.01ms, 15.9MB)
 테스트 4 〉    통과 (0.01ms, 16.2MB)
 테스트 5 〉    통과 (0.01ms, 15.9MB)
 테스트 6 〉    통과 (0.01ms, 16.4MB)
 테스트 7 〉    통과 (0.01ms, 16.3MB)
 테스트 8 〉    통과 (0.01ms, 16.4MB)
 테스트 9 〉    통과 (0.01ms, 16MB)
 테스트 10 〉    통과 (0.01ms, 16.2MB)
 테스트 11 〉    통과 (0.01ms, 16.3MB)
 테스트 12 〉    통과 (0.01ms, 16MB)
 테스트 13 〉    통과 (0.01ms, 16.4MB)
 테스트 14 〉    통과 (0.01ms, 16.3MB)
 테스트 15 〉    통과 (0.01ms, 16MB)
 테스트 16 〉    통과 (0.01ms, 16MB)
 테스트 17 〉    통과 (0.01ms, 16.2MB)
 테스트 18 〉    통과 (0.01ms, 16.2MB)
 테스트 19 〉    통과 (0.01ms, 16.2MB)
 테스트 20 〉    통과 (0.01ms, 16.3MB)
 */
