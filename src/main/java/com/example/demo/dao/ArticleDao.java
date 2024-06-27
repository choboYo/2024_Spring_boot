package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.vo.Article;

@Mapper
public interface ArticleDao {
	
	@Insert("""
			INSERT INTO article
				SET regDate = NOW()
					, updateDate = NOW()
					, memberId = #{memberId}
					, title = #{title}
					, `body` = #{body}
			""")
	public void writeArticle(int memberId, String title, String body);

	@Select("""
			SELECT A.*, M.nickname `writerName`
				FROM article A
				INNER JOIN `member` M
				ON A.memberId = M.id
				WHERE A.boardId = #{boardId}
				ORDER BY A.id DESC
			""")
	public List<Article> getArticles(int boardId);
	
	@Select("""
			SELECT A.*, M.nickname `writerName`
				FROM article A
				INNER JOIN `member` M
				ON A.memberId = M.id
				WHERE A.id = #{id}
			""")
	public Article forPrintArticle(int id);
	
	@Select("""
			SELECT *
				FROM article
				WHERE id = #{id}
			""")
	public Article getArticleById(int id);

	@Update("""
			<script>
			UPDATE article
				SET updateDate = NOW()
					, title = #{title}
					, `body` = #{body}
				WHERE id = #{id}
			</script>
			""")
	public void modifyArticle(int id, String title, String body);

	@Delete("""
			DELETE FROM article
				WHERE id = #{id}
			""")
	public void deleteArticle(int id);

	@Select("SELECT LAST_INSERT_ID()")
	public int getLastInsertId();

	@Select("""
			SELECT `name`
				FROM board
				WHERE id = #{boardId}
			""")
	public String getBoardNameById(int boardId);

}