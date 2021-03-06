package tmp.controller;

import com.google.common.collect.Lists;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import tmp.bo.ReputationData;
import tmp.dao.ComponentHistoryMapper;
import tmp.dao.ComponentReputationMapper;
import tmp.dao.ComponentTrustValueMapper;
import tmp.dao.ProviderTrustValueMapper;
import tmp.dao.RenterHistoryMapper;
import tmp.dao.RenterReputationMapper;
import tmp.dao.RenterTrustValueMapper;
import tmp.entity.ComponentHistory;
import tmp.entity.ComponentReputation;
import tmp.entity.ComponentTrustValue;
import tmp.entity.ProviderTrustValue;
import tmp.entity.RenterHistory;
import tmp.entity.RenterReputation;
import tmp.entity.RenterTrustValue;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/query")
public class QueryHistoryController {
    @Resource
    private ComponentHistoryMapper componentHistoryMapper;
    @Resource
    private RenterHistoryMapper renterHistoryMapper;
    @Resource
    private ComponentTrustValueMapper componentTrustValueMapper;
    @Resource
    private RenterTrustValueMapper renterTrustValueMapper;
    @Resource
    private ComponentReputationMapper componentReputationMapper;
    @Resource
    private RenterReputationMapper renterReputationMapper;
    @Resource
    private ProviderTrustValueMapper providerTrustValueMapper;
    @RequestMapping("/queryHistory")
    public ModelAndView queryHistory(Integer entityType, String trustorUid,String trusteeUid,Integer actionType) {
        //如果是组件，查询组件交互历史
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("queryHistory");
        if (entityType == 1) {
            List<ComponentHistory> componentHistories = componentHistoryMapper.selectByTrustorAndTrusteeUid(trustorUid, trusteeUid, actionType);
            modelAndView.addObject("historyList",componentHistories);
        } else if (entityType == 2) {
            //  如果是租户，查询租户交互历史
            List<RenterHistory> renterHistories = renterHistoryMapper.selectByTrustorAndTrusteeUid(trustorUid, trusteeUid, actionType);
            modelAndView.addObject("historyList",renterHistories);
        }
        return modelAndView;
    }

    @RequestMapping("/queryTrustValue")
    public ModelAndView queryTrustValue(Integer entityType, String trustorUid,String trusteeUid,Integer actionType) {
        //如果是组件，查询组件信任
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("queryTrustValue");
        if (entityType == 1) {
            List<ComponentTrustValue> componentTrustValues = componentTrustValueMapper.selectByTrustorAndTrusteeUid(trustorUid, trusteeUid, actionType);
            modelAndView.addObject("trustValues",componentTrustValues);
        } else if (entityType == 2) {
            //  如果是租户，查询租户信任信息
            List<RenterTrustValue> renterTrustValues = renterTrustValueMapper.selectByTrustorAndTrusteeUid(trustorUid, trusteeUid, actionType);
            modelAndView.addObject("trustValues",renterTrustValues);
        }
        return modelAndView;
    }

    @RequestMapping("/queryReputation")
    public ModelAndView queryReputation(Integer entityType, String entityUid) {
        //如果是组件，查询组件信任
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("queryReputation");
        List<BigDecimal> reputationList = Lists.newArrayList();
        ReputationData reputationData = new ReputationData();
        reputationData.setEntityUid(entityUid);
        reputationData.setReputationType(entityType);
        if (entityType == 1) {
            List<ComponentReputation> componentReputations = componentReputationMapper.queryReputationListByComponentUid(entityUid);
            for (ComponentReputation reputation : componentReputations) {
                BigDecimal reputationValue = reputation.getReputationValue();
                reputationList.add(reputationValue);
            }
        } else if (entityType == 2) {
            //  如果是租户，查询租户信任信息
            List<RenterReputation> renterReputations = renterReputationMapper.queryReputationListByRenterUid(entityUid);
            for (RenterReputation reputation : renterReputations) {
                BigDecimal reputationValue = reputation.getReputationValue();
                reputationList.add(reputationValue);
            }
        }else if (entityType == 3) {
            List<ProviderTrustValue> providerTrustValues = providerTrustValueMapper.queryReputationListByProviderUid(entityUid);
            for (ProviderTrustValue reputation : providerTrustValues) {
                BigDecimal reputationValue = reputation.getTrustValue();
                reputationList.add(reputationValue);
            }
        }
        reputationData.setReputationList(reputationList);
        modelAndView.addObject("reputationData",reputationData);
        return modelAndView;
    }
}