import Foundation

/*
 제목: [3차] 압축
 난도: Lv.2 / 완료한 사람: 약 12,000명 / 정답률: 60%
 기출문제: 2018 KAKAO BLIND RECRUITMENT
 
 [문제]
 신입사원 어피치는 카카오톡으로 전송되는 메시지를 압축하여 전송 효율을 높이는 업무를 맡게 되었다. 
 메시지를 압축하더라도 전달되는 정보가 바뀌어서는 안 되므로,
 압축 전의 정보를 완벽하게 복원 가능한 무손실 압축 알고리즘을 구현하기로 했다.

 어피치는 여러 압축 알고리즘 중에서 성능이 좋고 구현이 간단한 LZW(Lempel–Ziv–Welch) 압축을 구현하기로 했다.
 LZW 압축은 1983년 발표된 알고리즘으로, 이미지 파일 포맷인 GIF 등 다양한 응용에서 사용되었다.

 LZW 압축은 다음 과정을 거친다.
 
 길이가 1인 모든 단어를 포함하도록 사전을 초기화한다.
 사전에서 현재 입력과 일치하는 가장 긴 문자열 w를 찾는다.
 w에 해당하는 사전의 색인 번호를 출력하고, 입력에서 w를 제거한다.
 입력에서 처리되지 않은 다음 글자가 남아있다면(c), w+c에 해당하는 단어를 사전에 등록한다.
 단계 2로 돌아간다.
 압축 알고리즘이 영문 대문자만 처리한다고 할 때, 사전은 다음과 같이 초기화된다. 사전의 색인 번호는 정수값으로 주어지며, 1부터 시작한다고 하자.

 색인 번호    1    2    3    ...    24    25    26
 단어    A    B    C    ...    X    Y    Z
 예를 들어 입력으로 KAKAO가 들어온다고 하자.

 현재 사전에는 KAKAO의 첫 글자 K는 등록되어 있으나, 
 두 번째 글자까지인 KA는 없으므로,
 첫 글자 K에 해당하는 색인 번호 11을 출력하고,
 다음 글자인 A를 포함한 KA를 사전에 27 번째로 등록한다.
 두 번째 글자 A는 사전에 있으나,
 세 번째 글자까지인 AK는 사전에 없으므로,
 A의 색인 번호 1을 출력하고,
 AK를 사전에 28 번째로 등록한다.
 세 번째 글자에서 시작하는 KA가 사전에 있으므로, 
 KA에 해당하는 색인 번호 27을 출력하고,
 다음 글자 O를 포함한 KAO를 29 번째로 등록한다.
 마지막으로 처리되지 않은 글자 O에 해당하는 색인 번호 15를 출력한다.
 
 현재 입력(w)    다음 글자(c)    출력    사전 추가(w+c)
 K    A    11    27: KA
 A    K    1    28: AK
 KA    O    27    29: KAO
 O        15
 이 과정을 거쳐 다섯 글자의 문장 KAKAO가 4개의 색인 번호 [11, 1, 27, 15]로 압축된다.

 입력으로 TOBEORNOTTOBEORTOBEORNOT가 들어오면 다음과 같이 압축이 진행된다.

 현재 입력(w)    다음 글자(c)    출력    사전 추가(w+c)
 T    O    20    27: TO
 O    B    15    28: OB
 B    E    2    29: BE
 E    O    5    30: EO
 O    R    15    31: OR
 R    N    18    32: RN
 N    O    14    33: NO
 O    T    15    34: OT
 T    T    20    35: TT
 TO    B    27    36: TOB
 BE    O    29    37: BEO
 OR    T    31    38: ORT
 TOB    E    36    39: TOBE
 EO    R    30    40: EOR
 RN    O    32    41: RNO
 OT        34

 
 [제한]
 입력 형식
 입력으로 영문 대문자로만 이뤄진 문자열 msg가 주어진다. msg의 길이는 1 글자 이상, 1000 글자 이하이다.

 출력 형식
 주어진 문자열을 압축한 후의 사전 색인 번호를 배열로 출력하라.
 
 [입출력 예]
 msg    answer
 KAKAO    [11, 1, 27, 15]
 TOBEORNOTTOBEORTOBEORNOT    [20, 15, 2, 5, 15, 18, 14, 15, 20, 27, 29, 31, 36, 30, 32, 34]
 ABABABABABABABAB    [1, 2, 27, 29, 28, 31, 30]
 */
//A~Z = 65~90
func solution(_ msg:String) -> [Int] {
    var result = [Int]()
    var beforeWord = ""
    var beforeIndex = 0
    var wordDict = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]

    for i in msg {
        let msgStr = "\(i)"
        beforeWord += msgStr
        if wordDict.contains(beforeWord) {
            // 포함되어 있으니까 index 에 추가해주고 넘기는 거임
            beforeIndex = wordDict.firstIndex(of: beforeWord)! + 1
        }
        else {
            // 안포함되어 있으니까 이제 처리를 해볼까
            wordDict.append(beforeWord)
            result.append(beforeIndex)
            beforeWord = msgStr
            beforeIndex = wordDict.firstIndex(of: msgStr)! + 1
        }
    }
    result.append(beforeIndex)

    return result
}
//print("A = \(solution("KAKAO"))")
//print("A = \(solution("TOBEORNOTTOBEORTOBEORNOT"))")
print("A = \(solution("ABABABABABABABAB"))")






/*
 [결과]
 정확성  테스트
 테스트 1 〉    통과 (0.07ms, 16.3MB)
 테스트 2 〉    통과 (0.18ms, 16.3MB)
 테스트 3 〉    통과 (0.25ms, 16.3MB)
 테스트 4 〉    통과 (7.54ms, 16.6MB)
 테스트 5 〉    통과 (0.39ms, 16.6MB)
 테스트 6 〉    통과 (16.35ms, 16.4MB)
 테스트 7 〉    통과 (18.03ms, 16.4MB)
 테스트 8 〉    통과 (12.74ms, 16.4MB)
 테스트 9 〉    통과 (0.05ms, 16.4MB)
 테스트 10 〉    통과 (12.71ms, 16.6MB)
 테스트 11 〉    통과 (8.49ms, 16.6MB)
 테스트 12 〉    통과 (14.41ms, 16.5MB)
 테스트 13 〉    통과 (50.68ms, 16.5MB)
 테스트 14 〉    통과 (31.80ms, 16.2MB)
 테스트 15 〉    통과 (28.69ms, 16.4MB)
 테스트 16 〉    통과 (24.67ms, 16.4MB)
 테스트 17 〉    통과 (30.35ms, 16.4MB)
 테스트 18 〉    통과 (5.81ms, 16.4MB)
 테스트 19 〉    통과 (4.78ms, 16.3MB)
 테스트 20 〉    통과 (18.85ms, 16.2MB)
 
 */

/*
 [해설]
 어휴.. 비문학 진짜..
 */

/*
 KAKAO
 입력 [dict] [result]
 K 가 들어올거임 근데 이건 처음 들어오는거고 일단 dict 에는 있으니까 넘기는거임
 A 가 다음에 들어올거임 근데 전에 dict에 있던 입력이 들어왔으니 그 입력에 KA라고 저장을 하는거임 근데 얘는 dict 에 없으니까
 얘를 dict에 저장을 할거임 저장을 하게 되면 중요한건 그 앞에 dict에 있던 값의 인덱스를 result에 넣어줘야 하는거임
 그럼 11이 result 에 저장을 할거임
 그리고 dict에 저장을 하는 작업을 하게 되면 beforeChar 에 있던 값을 이번에 들어온 A 로 바꿔주는 작업도 진행을 할거고 index에도 A에 해당하는 값을 넣을 예정임
 
 */
