package com.kh.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class PCImageRenamePolicy implements FileRenamePolicy{

	@Override
	public File rename(File imageFile) {
		String originName = imageFile.getName();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String currentTime = sdf.format(new Date());
		int ranNum = (int)(Math.random() * 9000 + 1000);
		int dot = originName.lastIndexOf(".");
		String ext = originName.substring(dot);
		String fileName = currentTime + ranNum + ext;
		return new File(imageFile.getParent(), fileName);
	}
	
}
