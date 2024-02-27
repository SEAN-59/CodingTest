import Foundation

/*
 제목: 방문 길이
 난도: Lv.2 / 완료한 사람: 약 12,000명 / 정답률: 58%
 기출문제: Summer/Winter Coding(~2018)
 
 [문제]
 게임 캐릭터를 4가지 명령어를 통해 움직이려 합니다. 명령어는 다음과 같습니다.

 U: 위쪽으로 한 칸 가기

 D: 아래쪽으로 한 칸 가기

 R: 오른쪽으로 한 칸 가기

 L: 왼쪽으로 한 칸 가기

 캐릭터는 좌표평면의 (0, 0) 위치에서 시작합니다. 좌표평면의 경계는 왼쪽 위(-5, 5), 왼쪽 아래(-5, -5), 오른쪽 위(5, 5), 오른쪽 아래(5, -5)로 이루어져 있습니다.

 방문길이1_qpp9l3.png

 예를 들어, "ULURRDLLU"로 명령했다면

 방문길이2_lezmdo.png

 1번 명령어부터 7번 명령어까지 다음과 같이 움직입니다.
 방문길이3_sootjd.png

 8번 명령어부터 9번 명령어까지 다음과 같이 움직입니다.
 방문길이4_hlpiej.png

 이때, 우리는 게임 캐릭터가 지나간 길 중 캐릭터가 처음 걸어본 길의 길이를 구하려고 합니다. 예를 들어 위의 예시에서 게임 캐릭터가 움직인 길이는 9이지만, 캐릭터가 처음 걸어본 길의 길이는 7이 됩니다. (8, 9번 명령어에서 움직인 길은 2, 3번 명령어에서 이미 거쳐 간 길입니다)

 단, 좌표평면의 경계를 넘어가는 명령어는 무시합니다.

 예를 들어, "LULLLLLLU"로 명령했다면

 방문길이5_nitjwj.png

 1번 명령어부터 6번 명령어대로 움직인 후, 7, 8번 명령어는 무시합니다. 다시 9번 명령어대로 움직입니다.
 방문길이6_nzhumd.png

 이때 캐릭터가 처음 걸어본 길의 길이는 7이 됩니다.

 명령어가 매개변수 dirs로 주어질 때, 게임 캐릭터가 처음 걸어본 길의 길이를 구하여 return 하는 solution 함수를 완성해 주세요.

 
 [제한]
 dirs는 string형으로 주어지며, 'U', 'D', 'R', 'L' 이외에 문자는 주어지지 않습니다.
 dirs의 길이는 500 이하의 자연수입니다.
 
 [입출력 예]
 dirs    answer
 "ULURRDLLU"    7
 "LULLLLLLU"    7
 */

/*
 
 */

func solution(_ dirs:String) -> Int {
    var nowLoc = (0,0)
    var count = 0
    var pathDict: [String:(Int,Int)] = ["0": (0,0)]
    var pathCollect = [String]()
    dirs.forEach {
        let str = "\($0)"
        let beforeLoc = nowLoc
        var beforePath = "", nowPath = ""
        print("firstInput : \(str), \(nowLoc)")
        
        switch str {
        case "U":
            nowLoc.1 += 1
        case "D":
            nowLoc.1 -= 1
        case "R":
            nowLoc.0 += 1
        case "L":
            nowLoc.0 -= 1
        default: break
        }
        
        if (nowLoc.0 <= 5 && nowLoc.0 >= -5) && (nowLoc.1 <= 5 && nowLoc.1 >= -5)  {
            print("End Swi : \(nowLoc), \(beforeLoc)")
            
            pathDict.keys.forEach {
                let d = pathDict[$0]!
                if d == beforeLoc { beforePath = $0 }
                if d == nowLoc { nowPath = $0 }
            }
            
            print("CHECK PATH: \(beforePath) \(nowPath)")
            if pathCollect.contains("\(beforePath)\(nowPath)") || pathCollect.contains("\(nowPath)\(beforePath)") { return }
            
            else {
                if nowPath == "" {
                    count += 1
                    nowPath = "\(count)"
                }
                
                pathDict[nowPath] = nowLoc
                pathCollect.append("\(beforePath)\(nowPath)")
            }
        }
        
        else {
            nowLoc = beforeLoc
        }
        print("Col: \(pathCollect)")
        print("Dic: \(pathDict)")
        print("++++++++++++++++++++++++")
    }
    return pathCollect.count
}


print("A = \(solution("LUUUUULRDDDDDR"))")
//print("A = \(solution("LULLLLLLU"))")
//print("A = \(solution("UDLRDURL"))") // 4
//print("A = \(solution("RRRRRRRRRRRRRRRRRRRRRUUUUUUUUUUUUULU"))") //11
//print("A = \(solution("LURDLURDLURDLURDRULD"))") //7
//print("A = \(solution("UUUUDUDUDUUU"))") // 5
//print("A = \(solution("LLLLRLRLRLL"))") // 5


/*
 [결과]
 정확성  테스트
  */

/*
 [해설]
 이거 이해가 안되네 올라온 반례들도 다 통과되고 로직적으로도 이상 없는거 같은데 뭐가 문제임?
 */
