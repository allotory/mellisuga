package com.mellisuga.function;

/**
 *  威尔逊区间算法
 *  	u 为加权赞同票数，
 *  	v 为加权反对票数，
 *  	z_alpha 为参数， 暂定2.2，(5~10好一点，吗)
 * 
 *  n = u + v;
 *  p = u / n;
 *  
 *  score = (p + z*z/2n - (z/2n)*Math.sqrt(4n*(1 - p)*p + z*z)) 
 *  			/ (1 + z*z/n)
 *  
 *  z设置得越高，绝对赞同数就越重要，反之设置较低时，赞同率就越重要。
 *  当z等于0时，赞同率将起到全部作用。
 *  比如一个1000赞，100反对的回答，当z等于0.73时，其分数将完全等于一个1赞0反对的回答。
 *  
 *  当z增大时，绝对赞同数起的作用就开始增大。
 *  两个回答，前者100赞30反对，后者70赞0反对，那么当z小于21时，后者排名靠前，当大于21时，前者排名靠前。
 */
public class WilsonScoreInterval {

	public static double getWSI(int u, int v) {
		
		double z = 2.2;
		
		double n = u + v;
		double p = u / n;
		  
		double score = (p + z*z/(2*n) - (z/(2*n))*Math.sqrt(4*n*(1 - p)*p + z*z)) 
		 			/ (1 + z*z/n);
		return score;
	}
	
	public static void main(String args[]) {
		// 当z增大时，绝对赞同数起的作用就开始增大。
		// 两个回答，前者100赞30反对，后者70赞0反对，
		// 那么当z小于21时，后者排名靠前，当大于21时，前者排名靠前。
		System.out.println(WilsonScoreInterval.getWSI(100, 30));
		System.out.println(WilsonScoreInterval.getWSI(70, 0));
	}
}
