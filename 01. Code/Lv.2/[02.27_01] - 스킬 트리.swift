import Foundation

/*
 제목: 스킬 트리
 난도: Lv.2 / 완료한 사람: 약 22,000명 / 정답률: 58%
 기출문제: Summer/Winter Coding(~2018)
 
 [문제]
 선행 스킬이란 어떤 스킬을 배우기 전에 먼저 배워야 하는 스킬을 뜻합니다.

 예를 들어 선행 스킬 순서가 스파크 → 라이트닝 볼트 → 썬더일때, 썬더를 배우려면 먼저 라이트닝 볼트를 배워야 하고, 라이트닝 볼트를 배우려면 먼저 스파크를 배워야 합니다.

 위 순서에 없는 다른 스킬(힐링 등)은 순서에 상관없이 배울 수 있습니다. 따라서 스파크 → 힐링 → 라이트닝 볼트 → 썬더와 같은 스킬트리는 가능하지만, 썬더 → 스파크나 라이트닝 볼트 → 스파크 → 힐링 → 썬더와 같은 스킬트리는 불가능합니다.

 선행 스킬 순서 skill과 유저들이 만든 스킬트리1를 담은 배열 skill_trees가 매개변수로 주어질 때, 가능한 스킬트리 개수를 return 하는 solution 함수를 작성해주세요.

 
 [제한]
 스킬은 알파벳 대문자로 표기하며, 모든 문자열은 알파벳 대문자로만 이루어져 있습니다.
 스킬 순서와 스킬트리는 문자열로 표기합니다.
 예를 들어, C → B → D 라면 "CBD"로 표기합니다
 선행 스킬 순서 skill의 길이는 1 이상 26 이하이며, 스킬은 중복해 주어지지 않습니다.
 skill_trees는 길이 1 이상 20 이하인 배열입니다.
 skill_trees의 원소는 스킬을 나타내는 문자열입니다.
 skill_trees의 원소는 길이가 2 이상 26 이하인 문자열이며, 스킬이 중복해 주어지지 않습니다.

 
 [입출력 예]
 skill    skill_trees    return
 "CBD"    ["BACDE", "CBADF", "AECB", "BDA"]    2
 */

/*
 skill 의 순서로 배워야하는데
 skillTrees 를 짰는데 이중 사용 가능한건?
 만약 skill에 없으면 그냥 사용가능
 */

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var result = 0//skill_trees.count
    var skill = Array(skill)

    skill_trees.forEach {
        let array = Array($0)
        var skillCon = [Character]()
        for i in array {
            if skill.contains(i) {
                skillCon.append(i)
            }
        }
        
        var beforeSkill = ""
        
        if skillCon.isEmpty || skill == skillCon {
            result += 1
            return }
        else {
            if skill[0] == skillCon[0] {
                if String(skill).contains(String(skillCon)) {
                    result += 1
                    return
                }
            }

        }
    }
    return result
}


print("A = \(solution("CBD", ["BACDE", "CBADF", "AECB", "BDA"]))")



/*
 [결과]
 정확성  테스트
 테스트 1 〉    통과 (0.21ms, 16.1MB)
 테스트 2 〉    통과 (0.17ms, 16.4MB)
 테스트 3 〉    통과 (0.18ms, 16.4MB)
 테스트 4 〉    통과 (0.18ms, 16.3MB)
 테스트 5 〉    통과 (0.19ms, 16.5MB)
 테스트 6 〉    통과 (0.16ms, 16.3MB)
 테스트 7 〉    통과 (0.20ms, 16.3MB)
 테스트 8 〉    통과 (0.19ms, 16.3MB)
 테스트 9 〉    통과 (0.22ms, 16.3MB)
 테스트 10 〉    통과 (0.20ms, 16.5MB)
 테스트 11 〉    통과 (0.24ms, 16.4MB)
 테스트 12 〉    통과 (0.50ms, 16.1MB)
 테스트 13 〉    통과 (0.24ms, 16.1MB)
 테스트 14 〉    통과 (0.17ms, 16.3MB)
  */

/*
 [해설]
 만약 안되면 다음날 하던가 로직을 단순화 시킬 필요가 있다고 생각함
 */
