package com.vani;

import com.vani.dao.Impl.BaseDaoBean;
import com.vani.model.TrHistory;
import com.vani.model.UserVO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.inject.Inject;
import java.util.List;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MyBatisTest extends BaseDaoBean {

    @Inject
    private SqlSessionFactory sqlSessionFactory;

    @Test
    public void testFactory(){
        System.out.println(sqlSessionFactory);
    }

    @Test
    public void testSession() throws Exception{
        try(SqlSession session = sqlSessionFactory.openSession()){
            System.out.println(session);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Test
    public void findTrHistory() throws Exception{
        List<Map<String, Object>> result = getSqlSession().selectList("com.vani.mapper.trHistoryMapper.findTrHistory");
        System.out.println(result);
    }

    @Test
    public void findUser() throws Exception{
        List<Map<String, Object>> result = getSqlSession().selectList("com.vani.mapper.userMapper.findUser");
        System.out.println(result);
    }
}
