package com.mellisuga.function;

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
