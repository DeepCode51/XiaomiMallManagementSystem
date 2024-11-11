package beans;

public class Tools {

	
	public static String charConvert(String strResource){
		if(strResource!=null){
			try{
				String str=strResource;
				byte[] tempString=str.getBytes("iso-8859-1");
				str=new String(tempString,"utf-8");
				return str;
			}catch(Exception e){
				System.out.println(e);
				return "";
			}
		}else{
			return "";
		}
		
	}

}
