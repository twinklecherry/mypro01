package com.spring5.mypro01.board.vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component("commentVO")
public class CommentVO {
	
	private int commentNO;
	private int boardNO;
	private String content;
	private Timestamp writeDate;
	private String id;
	
	public CommentVO() {
	}

	public CommentVO(int commentNO, int boardNO, String categoryId, String postId, String content, Timestamp writeDate,
			String id) {
		this.commentNO = commentNO;
		this.boardNO = boardNO;
		this.content = content;
		this.writeDate = writeDate;
		this.id = id;
	}

	public int getCommentNO() {
		return commentNO;
	}

	public void setCommentNO(int commentNO) {
		this.commentNO = commentNO;
	}

	public int getBoardNO() {
		return boardNO;
	}

	public void setBoardNO(int boardNO) {
		this.boardNO = boardNO;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + boardNO;
		result = prime * result + commentNO;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
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
		CommentVO other = (CommentVO) obj;
		if (boardNO != other.boardNO)
			return false;
		if (commentNO != other.commentNO)
			return false;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
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
		return "CommentVO [commentNO=" + commentNO + ", boardNO=" + boardNO + ", content=" + content + ", writeDate="
				+ writeDate + ", id=" + id + "]";
	}

}