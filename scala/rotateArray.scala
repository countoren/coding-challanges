//https://leetcode.com/problems/rotate-array/
object Solution {
    def gcd(a: Int, b: Int):Int = 
        b match {
            case 0        => a
            case x if x>a => gcd(x,a)
            case x        => gcd(x, a%x)
        }
        def tailIndexes : ( Int, Int, Int) => LazyList[Int] = 
             (m, s, e) => LazyList.range(e-s,e)  #::: (if  (m>s) tailIndexes(m-s,s,e) else tailIndexes((m-(s%m)).max(1), (s%m).max(1), e))
    def swapIndexes : (Int, Int) => LazyList[(Int,Int)] = 
        (s, e) => LazyList.range(0,e-gcd(s,e)).zip(tailIndexes(e-s,s,e))
              

    def rotate(nums: Array[Int], k: Int): Unit = {
        val steps = k % nums.length
        if (steps != 0) 
         swapIndexes(steps,nums.length).foreach(
             is => {
                 var t = nums(is._1)
                 nums(is._1) = nums(is._2)
                 nums(is._2) = t           
             } 
        )
    }
}
