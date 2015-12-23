package com.mellisuga.function;

import java.io.*;
import java.awt.*;
import java.awt.image.*;
import java.awt.Graphics;
import java.awt.color.ColorSpace;

import javax.imageio.ImageIO;

public class ImageCut {

	/**
	 * 图像切割（改） *
	 * 
	 * @param srcImageFile 源图像地址
	 * @param dirImageFile 新图像地址
	 * @param x 目标切片起点x坐标
	 * @param y 目标切片起点y坐标
	 * @param destWidth 目标切片宽度
	 * @param destHeight 目标切片高度
	 */
	public static void abscut(String srcImageFile, String dirImageFile, int x,
			int y, int destWidth, int destHeight) {
		
		try {
			Image img;
			ImageFilter cropFilter;
			
			// 读取源图像
			BufferedImage bi = ImageIO.read(new File(srcImageFile));
			
			// 源图宽度
			int srcWidth = bi.getWidth(); 
			// 源图高度
			int srcHeight = bi.getHeight(); 
			
			if (srcWidth >= destWidth && srcHeight >= destHeight) {
				Image image = bi.getScaledInstance(srcWidth, srcHeight,
						Image.SCALE_DEFAULT);
				// 改进的想法:是否可用多线程加快切割速度
				// 四个参数分别为图像起点坐标和宽高
				// 即: CropImageFilter(int x,int y,int width,int height)
				cropFilter = new CropImageFilter(x, y, destWidth, destHeight);
				img = Toolkit.getDefaultToolkit()
						.createImage(new FilteredImageSource(image.getSource(), cropFilter));
				BufferedImage tag = new BufferedImage(destWidth, destHeight, BufferedImage.TYPE_INT_RGB);
				Graphics g = tag.getGraphics();
				// 绘制缩小后的图
				g.drawImage(img, 0, 0, null); 
				g.dispose();
				// 输出为文件
				ImageIO.write(tag, "JPEG", new File(dirImageFile));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 缩放图像长度到400px
	 * 
	 * @param srcImageFile 源图像文件地址
	 * @param result 缩放后的图像地址
	 */
	public static void scale(String srcImageFile, String result) {
		try {
			// 读入文件
			BufferedImage src = ImageIO.read(new File(srcImageFile)); 
			
			// 得到源图宽
			int width = src.getWidth(); 
			// 得到源图长
			int height = src.getHeight(); 
			
			height = height * 400 / width;
			width = 400;
			
			Image image = src.getScaledInstance(width, height, Image.SCALE_DEFAULT);
			BufferedImage tag = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
			Graphics g = tag.getGraphics();
			// 绘制缩小后的图
			g.drawImage(image, 0, 0, null); 
			g.dispose();
			// 输出到文件流
			ImageIO.write(tag, "JPEG", new File(result));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 缩放图像
	 * 
	 * @param srcImageFile 源图像文件地址
	 * @param result 缩放后的图像地址
	 * @param scale 缩放比例
	 * @param flag 缩放选择:true 放大; false 缩小;
	 */
	public static void scale(String srcImageFile, String result, int scale,
			boolean flag) {
		try {
			// 读入文件
			BufferedImage src = ImageIO.read(new File(srcImageFile)); 
			
			// 得到源图宽
			int width = src.getWidth(); 
			// 得到源图长
			int height = src.getHeight(); 
			
			if (flag) {
				// 放大
				width = width * scale;
				height = height * scale;
			} else {
				// 缩小
				width = width / scale;
				
				height = height / scale;
		}
			
			Image image = src.getScaledInstance(width, height, Image.SCALE_DEFAULT);
			BufferedImage tag = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
			Graphics g = tag.getGraphics();
			// 绘制缩小后的图
			g.drawImage(image, 0, 0, null); 
			g.dispose();
			// 输出到文件流
			ImageIO.write(tag, "JPEG", new File(result));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 重新生成按指定宽度和高度的图像
	 * 
	 * @param srcImageFile 源图像文件地址
	 * @param result 新的图像地址
	 * @param _width 设置新的图像宽度
	 * @param _height 设置新的图像高度
	 */
	public static void scale(String srcImageFile, String result, int _width,
			int _height) {
		scale(srcImageFile, result, _width, _height, 0, 0);
	}

	public static void scale(String srcImageFile, String result, int _width,
			int _height, int x, int y) {
		try {

			// 读入文件
			BufferedImage src = ImageIO.read(new File(srcImageFile)); 

			// 得到源图宽
			int width = src.getWidth(); 
			// 得到源图长
			int height = src.getHeight(); 

			if (width > _width) {
				width = _width;
			}
			if (height > _height) {
				height = _height;
			}
			Image image = src.getScaledInstance(width, height, Image.SCALE_DEFAULT);
			BufferedImage tag = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
			Graphics g = tag.getGraphics();
			// 绘制缩小后的图
			g.drawImage(image, x, y, null); 
			g.dispose();
			// 输出到文件流
			ImageIO.write(tag, "JPEG", new File(result));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 图像类型转换 GIF->JPG GIF->PNG PNG->JPG PNG->GIF(X)
	 */
	public static void convert(String source, String result) {
		try {
			File f = new File(source);
			f.canRead();
			f.canWrite();
			BufferedImage src = ImageIO.read(f);
			ImageIO.write(src, "JPG", new File(result));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 彩色转为黑白
	 * 
	 * @param source
	 * @param result
	 */
	public static void gray(String source, String result) {
		try {
			BufferedImage src = ImageIO.read(new File(source));
			ColorSpace cs = ColorSpace.getInstance(ColorSpace.CS_GRAY);
			ColorConvertOp op = new ColorConvertOp(cs, null);
			src = op.filter(src, null);
			ImageIO.write(src, "JPEG", new File(result));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
