package tmp.dao;

import com.alibaba.fastjson.JSON;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import tmp.entity.ComponentHistory;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)        //表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class ComponentHistoryMapperTest {
    @Autowired(required = false)
    private ComponentHistoryMapper componentHistoryMapper;

    @Test
    public void testInsert() throws Exception {
        ComponentHistory componentHistory = new ComponentHistory();
        componentHistory.setUid("order129");
        componentHistory.setTrustorUid("component1");
        componentHistory.setTrusteeUid("component2");
        componentHistory.setTrustValue(new BigDecimal(0.22));
        componentHistory.setActionTime(new Date());
        componentHistory.setActionType(1);
        componentHistoryMapper.insert(componentHistory);
    }

    @Test
    public void testSelectByTrustorAndTrusteeUid() throws Exception {
        List<ComponentHistory> componentHistories = componentHistoryMapper.selectByTrustorAndTrusteeUid("component1", "component2",null);
        System.out.println(componentHistories);
    }
}