package tmp.service;

import tmp.entity.Component;
import tmp.entity.Renter;

import java.math.BigDecimal;

/**
 * Created by shining.cui on 2015/11/6.
 */
public interface CompToCompTrustService {
    //计算组件对组件的全局信任
    public BigDecimal calcCompToCompTrust(Component trustor, Component trustee);

    //计算组件对组件的直接信任
    public BigDecimal calcCompToCompDirectTrust(Component trustor, Component trustee);

    //计算组件对组件的间接信任
    public BigDecimal calcCompToCompIndirectTrust(Component trustor, Component trustee);
}