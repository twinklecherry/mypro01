package com.spring5.mypro01.board.vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component("boardVO")
public class BoardVO {

	private int boardNO;
	private String title;
	private String content;
	private String imageFileName;
	private Timestamp writeDate;
	private String id;
	private String delFlag;
	
	public BoardVO() {
	}

	public BoardVO(int boardNO, String title, String content, Timestamp writeDate, String id) {
		this.boardNO = boardNO;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
		this.id = id;
	}

	public BoardVO(int boardNO, String title, String content, String imageFileName, Timestamp writeDate, String id) {
		this.boardNO = boardNO;
		this.title = title;
		this.content = content;
		this.imageFileName = imageFileName;
		this.writeDate = writeDate;
		this.id = id;
	}

	public BoardVO(int boardNO, String title, String content, String imageFileName, Timestamp writeDate, String id,
			String delFlag) {
		super();
		this.boardNO = boardNO;
		this.title = title;
		this.content = content;
		this.imageFileName = imageFileName;
		this.writeDate = writeDate;
		this.id = id;
		this.delFlag = delFlag;
	}

	public int getBoardNO() {
		return boardNO;
	}

	public void setBoardNO(int boardNO) {
		this.boardNO = boardNO;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public Timestamp getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + boardNO;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((delFlag == null) ? 0 : delFlag.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((imageFileName == null) ? 0 : imageFileName.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		result = prime * result + ((writeDate == null) ? 0 : writeDate.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BoardVO other = (BoardVO) obj;
		if (boardNO != other.boardNO)
			return false;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (delFlag == null) {
			if (other.delFlag != null)
				return false;
		} else if (!delFlag.equals(other.delFlag))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (imageFileName == null) {
			if (other.imageFileName != null)
				return false;
		} else if (!imageFileName.equals(other.imageFileName))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		if (writeDate == null) {
			if (other.writeDate != null)
				return false;
		} else if (!writeDate.equals(other.writeDate))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "BoardVO [boardNO=" + boardNO + ", title=" + title + ", content=" + content + ", imageFileName="
				+ imageFileName + ", writeDate=" + writeDate + ", id=" + id + ", delFlag=" + delFlag + "]";
	}
	
}