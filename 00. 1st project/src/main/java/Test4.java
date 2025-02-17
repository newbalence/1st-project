import java.util.regex.Pattern;

public class Test4 {

	public static void main(String[] args) {
		String t = "D:\\team\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\00. 1st project\\upload";
		System.out.println(t);
		t = t.replace("\\", "\\\\");
		System.out.println(t);
		
		boolean b = Pattern.matches("([^\\s]+(\\.(?i)(png|jpg|gif|bmp|jpeg|tiff|PNG|JPG|GIF|BMP|JPEG|TIFF))?)", "test.GIF");
		System.out.println(b);
	}

}
