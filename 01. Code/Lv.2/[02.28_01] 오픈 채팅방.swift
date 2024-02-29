import Foundation

/*
 제목: 오픈채팅방
 난도: Lv.2 / 완료한 사람: 약 31,000명 / 정답률: 57%
 기출문제: 2019 KAKAO BLIND RECRUITMENT
 
 [문제]
 카카오톡 오픈채팅방에서는 친구가 아닌 사람들과 대화를 할 수 있는데, 본래 닉네임이 아닌 가상의 닉네임을 사용하여 채팅방에 들어갈 수 있다.

 신입사원인 김크루는 카카오톡 오픈 채팅방을 개설한 사람을 위해, 다양한 사람들이 들어오고, 나가는 것을 지켜볼 수 있는 관리자창을 만들기로 했다. 채팅방에 누군가 들어오면 다음 메시지가 출력된다.

 "[닉네임]님이 들어왔습니다."

 채팅방에서 누군가 나가면 다음 메시지가 출력된다.

 "[닉네임]님이 나갔습니다."

 채팅방에서 닉네임을 변경하는 방법은 다음과 같이 두 가지이다.

 채팅방을 나간 후, 새로운 닉네임으로 다시 들어간다.
 채팅방에서 닉네임을 변경한다.
 닉네임을 변경할 때는 기존에 채팅방에 출력되어 있던 메시지의 닉네임도 전부 변경된다.

 예를 들어, 채팅방에 "Muzi"와 "Prodo"라는 닉네임을 사용하는 사람이 순서대로 들어오면 채팅방에는 다음과 같이 메시지가 출력된다.

 "Muzi님이 들어왔습니다."
 "Prodo님이 들어왔습니다."

 채팅방에 있던 사람이 나가면 채팅방에는 다음과 같이 메시지가 남는다.

 "Muzi님이 들어왔습니다."
 "Prodo님이 들어왔습니다."
 "Muzi님이 나갔습니다."

 Muzi가 나간후 다시 들어올 때, Prodo 라는 닉네임으로 들어올 경우 기존에 채팅방에 남아있던 Muzi도 Prodo로 다음과 같이 변경된다.

 "Prodo님이 들어왔습니다."
 "Prodo님이 들어왔습니다."
 "Prodo님이 나갔습니다."
 "Prodo님이 들어왔습니다."

 채팅방은 중복 닉네임을 허용하기 때문에, 현재 채팅방에는 Prodo라는 닉네임을 사용하는 사람이 두 명이 있다. 이제, 채팅방에 두 번째로 들어왔던 Prodo가 Ryan으로 닉네임을 변경하면 채팅방 메시지는 다음과 같이 변경된다.

 "Prodo님이 들어왔습니다."
 "Ryan님이 들어왔습니다."
 "Prodo님이 나갔습니다."
 "Prodo님이 들어왔습니다."

 채팅방에 들어오고 나가거나, 닉네임을 변경한 기록이 담긴 문자열 배열 record가 매개변수로 주어질 때, 모든 기록이 처리된 후, 최종적으로 방을 개설한 사람이 보게 되는 메시지를 문자열 배열 형태로 return 하도록 solution 함수를 완성하라.

 
 [제한]
 record는 다음과 같은 문자열이 담긴 배열이며, 길이는 1 이상 100,000 이하이다.
 다음은 record에 담긴 문자열에 대한 설명이다.
 모든 유저는 [유저 아이디]로 구분한다.
 [유저 아이디] 사용자가 [닉네임]으로 채팅방에 입장 - "Enter [유저 아이디] [닉네임]" (ex. "Enter uid1234 Muzi")
 [유저 아이디] 사용자가 채팅방에서 퇴장 - "Leave [유저 아이디]" (ex. "Leave uid1234")
 [유저 아이디] 사용자가 닉네임을 [닉네임]으로 변경 - "Change [유저 아이디] [닉네임]" (ex. "Change uid1234 Muzi")
 첫 단어는 Enter, Leave, Change 중 하나이다.
 각 단어는 공백으로 구분되어 있으며, 알파벳 대문자, 소문자, 숫자로만 이루어져있다.
 유저 아이디와 닉네임은 알파벳 대문자, 소문자를 구별한다.
 유저 아이디와 닉네임의 길이는 1 이상 10 이하이다.
 채팅방에서 나간 유저가 닉네임을 변경하는 등 잘못 된 입력은 주어지지 않는다.

 
 [입출력 예]
 record    result
 ["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]    ["Prodo님이 들어왔습니다.", "Ryan님이 들어왔습니다.", "Prodo님이 나갔습니다.", "Prodo님이 들어왔습니다."]
 */

/*
 
 */
enum RecordType: String{
    case enter = "님이 들어왔습니다."
    case leave = "님이 나갔습니다."
    case change = ""
}

func solution(_ record:[String]) -> [String] {
    var result = [String]()
    var recordArr = [(RecordType,String)]()
    var userDict = [String: String]()
    record.map {
        let splitOne = $0.split(separator:" ")
        print("INPUT DATA: \(splitOne)")

        if splitOne[0] == "Enter" {
            recordArr.append((.enter,"\(splitOne[1])"))
            if let nickName = userDict["\(splitOne[1])"] {
                print("ENTER | already Have ID: \(splitOne[1]) | nick: \(nickName)")
                if nickName != "\(splitOne[2])" {
                    userDict["\(splitOne[1])"] = "\(splitOne[2])"
                    print("BUT Changed nick name: \(splitOne[2])")
                }
            }
            else {
                userDict["\(splitOne[1])"] = "\(splitOne[2])"
            }
        }
        else if splitOne[0] == "Leave" {
            recordArr.append((.leave,"\(splitOne[1])"))
        }
        else if splitOne[0] == "Change" {
            if let nickName = userDict["\(splitOne[1])"] {
                print("CHANGE | already Have ID: \(splitOne[1]) | nick: \(nickName)")
                userDict["\(splitOne[1])"] = "\(splitOne[2])"
            }
        }
        print("CHECK DATA: \(userDict)")
        print("====")
    }

    print(userDict)
    print(recordArr[0].0.rawValue)
    recordArr.forEach{
        if let nickName = userDict["\($0.1)"] {
            result.append("\(nickName)\($0.0.rawValue)")
        }
    }
    return result
}


print("A = \(solution( ["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]))")



/*
 [결과]
 정확성  테스트
 테스트 1 〉    통과 (0.14ms, 16.1MB)
 테스트 2 〉    통과 (0.16ms, 16.4MB)
 테스트 3 〉    통과 (0.45ms, 16.6MB)
 테스트 4 〉    통과 (0.50ms, 16.2MB)
 테스트 5 〉    통과 (4.10ms, 16.5MB)
 테스트 6 〉    통과 (4.00ms, 16.5MB)
 테스트 7 〉    통과 (3.78ms, 16.6MB)
 테스트 8 〉    통과 (4.15ms, 16.8MB)
 테스트 9 〉    통과 (4.64ms, 16.7MB)
 테스트 10 〉    통과 (4.20ms, 16.7MB)
 테스트 11 〉    통과 (2.31ms, 16.6MB)
 테스트 12 〉    통과 (2.18ms, 16.5MB)
 테스트 13 〉    통과 (3.95ms, 16.7MB)
 테스트 14 〉    통과 (4.57ms, 16.6MB)
 테스트 15 〉    통과 (0.13ms, 16.2MB)
 테스트 16 〉    통과 (0.13ms, 16.5MB)
 테스트 17 〉    통과 (0.46ms, 16.4MB)
 테스트 18 〉    통과 (0.50ms, 16.6MB)
 테스트 19 〉    통과 (4.26ms, 16.8MB)
 테스트 20 〉    통과 (4.23ms, 16.6MB)
 테스트 21 〉    통과 (4.10ms, 16.8MB)
 테스트 22 〉    통과 (6.41ms, 16.7MB)
 테스트 23 〉    통과 (3.97ms, 16.7MB)
 테스트 24 〉    통과 (4.02ms, 16.8MB)
 테스트 25 〉    통과 (393.20ms, 50.1MB)
 테스트 26 〉    통과 (459.50ms, 51.6MB)
 테스트 27 〉    통과 (493.36ms, 52.8MB)
 테스트 28 〉    통과 (528.28ms, 54.3MB)
 테스트 29 〉    통과 (480.12ms, 54.4MB)
 테스트 30 〉    통과 (428.67ms, 49.5MB)
 테스트 31 〉    통과 (421.50ms, 53.1MB)
 테스트 32 〉    통과 (373.39ms, 50.1MB)
  */

/*
 [해설]
 
 */
