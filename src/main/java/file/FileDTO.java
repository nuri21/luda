package file;

public class FileDTO {
	
	// Database Transfer Object 
	
	private int fileIdx;
	private String userID;
	private String writeDate;
	private String fileName;
	private String fileRealName;
	private String fileContents;
	private int fileAvailable;
	
	public int getFileIdx() {
		return fileIdx;
	}
	public void setFileIdx(int fileIdx) {
		this.fileIdx = fileIdx;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileRealName() {
		return fileRealName;
	}
	public void setFileRealName(String fileRealName) {
		this.fileRealName = fileRealName;
	}
	public String getFileContents() {
		return fileContents;
	}
	public void setFileContents(String fileContents) {
		this.fileContents = fileContents;
	}
	public int getFileAvailable() {
		return fileAvailable;
	}
	public void setFileAvailable(int fileAvailable) {
		this.fileAvailable = fileAvailable;
	}
	
	public FileDTO(int fileIdx, String userID, String writeDate, String fileName, String fileRealName,
			String fileContents, int fileAvailable) {
		super();
		this.fileIdx = fileIdx;
		this.userID = userID;
		this.writeDate = writeDate;
		this.fileName = fileName;
		this.fileRealName = fileRealName;
		this.fileContents = fileContents;
		this.fileAvailable = fileAvailable;
	}
	
	

}
