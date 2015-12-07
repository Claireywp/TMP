<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="org.jfree.data.general.DefaultPieDataset"%>
<%@ page import="org.jfree.data.category.CategoryDataset" %>
<%@ page import="org.jfree.data.category.DefaultCategoryDataset" %>
<%@ page import="org.jfree.chart.JFreeChart"%>
<%@ page import="org.jfree.chart.plot.PiePlot"%>
<%@ page import="org.jfree.chart.ChartRenderingInfo"%>
<%@ page import="org.jfree.chart.servlet.ServletUtilities"%>
<%@ page import="org.jfree.chart.urls.StandardPieURLGenerator"%>
<%@ page import="org.jfree.chart.entity.StandardEntityCollection"%>
<%@ page import="org.jfree.chart.encoders.SunPNGEncoderAdapter"%>
<%@ page import="org.jfree.chart.StandardChartTheme"%>
<%@ page import="org.jfree.chart.ChartFactory"%>
<%@ page import="org.jfree.chart.plot.CategoryPlot"%>
<%@ page import="org.jfree.chart.plot.PlotOrientation"%>
<%@ page import="org.jfree.chart.axis.CategoryAxis"%>
<%@ page import="org.jfree.chart.renderer.category.BarRenderer"%>
<%@ page import="org.jfree.chart.labels.StandardCategoryItemLabelGenerator"%>
<%@ page import="java.awt.Font"%>
<%@ page import="java.awt.Color"%>
<%@ page import="tmp.entity.AbstractReputation" %>
<HTML>
<HEAD>
    <TITLE>Welcome to Jfreechart !</TITLE>
</HEAD>
<BODY>
<div align="center">
    <form action="/query/queryReputation.do" >
        <label>
            <select name="entityType">
                <option value="1">���</option>
                <option value="2">�⻧</option>
                <option value="3">�Ʒ����ṩ��</option>
            </select>
        </label>
        <input name="entityUid" type="text" placeholder="��������������ʵ���UID"/>
        <input type="submit" value="��ѯ"/><br/>
    </form>
</div>
<%--<%--%>
    <%--//ʵ�ֱ�״ͼ--%>
    <%--DefaultPieDataset data = new DefaultPieDataset();--%>
    <%--data.setValue("����", 500);--%>
    <%--data.setValue("����", 580);--%>
    <%--data.setValue("����", 828);--%>

    <%--PiePlot plot = new PiePlot(data);--%>
    <%--JFreeChart chart = new JFreeChart("", JFreeChart.DEFAULT_TITLE_FONT, plot, true);--%>

    <%--chart.setBackgroundPaint(java.awt.Color.white);  //��ѡ������ͼƬ����ɫ--%>
    <%--chart.setTitle("Welcome to Jfreechart !"); //��ѡ������ͼƬ����--%>

    <%--ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());--%>

    <%--//500��ͼƬ���ȣ�300��ͼƬ�߶�--%>
    <%--String filename = ServletUtilities.saveChartAsPNG(chart, 800, 500, info, session);--%>
    <%--String graphURL = request.getContextPath() + "/servlet/DisplayChart?filename=" + filename;--%>
<%--%>--%>
<%
    Object reputations = request.getAttribute("reputations");
    if (reputations !=null) {
        ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
        //��ʾ��״ͼ
        DefaultCategoryDataset mDataset = new DefaultCategoryDataset();
        for (AbstractReputation reputation : reputations) {

        }
        mDataset.addValue(2000, "�廪��ѧ", "������");
        mDataset.addValue(1500, "�廪��ѧ", "�о���");
        mDataset.addValue(1000, "�廪��ѧ", "��ʿ��");
        mDataset.addValue(900, "�廪��ѧ", "��ʦ");
        mDataset.addValue(800, "�廪��ѧ", "������");
        mDataset.addValue(300, "�廪��ѧ", "����");
        mDataset.addValue(600, "�廪��ѧ", "������Ա");
        mDataset.addValue(400, "�廪��ѧ", "������Ա");

        //����������ʽ
        StandardChartTheme mChartTheme = new StandardChartTheme("CN");
        //����ͼ�����
        mChartTheme.setExtraLargeFont(new Font("����", Font.BOLD, 20));
        //������������
        mChartTheme.setLargeFont(new Font("����", Font.PLAIN, 15));
        //����ͼ������
        mChartTheme.setRegularFont(new Font("����", Font.PLAIN, 15));
        //Ӧ������
        ChartFactory.setChartTheme(mChartTheme);

        JFreeChart mChart = ChartFactory.createBarChart3D(
                "ѧУ��Ա�ֲ�ͼ",
                "����",
                "����",
                mDataset,
                PlotOrientation.VERTICAL,
                true,
                true,true);
        //�����ڲ�����
        CategoryPlot mPlot = (CategoryPlot)mChart.getPlot();
        CategoryAxis mDomainAxis = mPlot.getDomainAxis();
        //������״ͼ����x������ˣ���y�ᣩ�ľ���ٷֱ�10%
        //mDomainAxis.setLowerMargin(0.1);
        mDomainAxis.setUpperMargin(0.1);
        //������ʾ��ֵ
        BarRenderer mRenderer = new BarRenderer();
        mRenderer.setItemLabelGenerator(new StandardCategoryItemLabelGenerator());
        mRenderer.setItemLabelFont(new Font("����", Font.PLAIN, 15));
        mRenderer.setItemLabelsVisible(true);
        mPlot.setRenderer(mRenderer);

        //500��ͼƬ���ȣ�300��ͼƬ�߶�
        String filenamebar = ServletUtilities.saveChartAsPNG(mChart, 800, 500, info, session);
        String graphURLbar = request.getContextPath() + "/servlet/DisplayChart?filename=" + filenamebar;


%>

<%--<%--%>
    <%--//ʵ������ͼ--%>
    <%--DefaultCategoryDataset mDatasetline = new DefaultCategoryDataset();--%>
    <%--mDatasetline.addValue(1, "First", "2013");--%>
    <%--mDatasetline.addValue(3, "First", "2014");--%>
    <%--mDatasetline.addValue(2, "First", "2015");--%>
    <%--mDatasetline.addValue(6, "First", "2016");--%>
    <%--mDatasetline.addValue(5, "First", "2017");--%>
    <%--mDatasetline.addValue(12, "First", "2018");--%>
    <%--mDatasetline.addValue(14, "Second", "2013");--%>
    <%--mDatasetline.addValue(13, "Second", "2014");--%>
    <%--mDatasetline.addValue(12, "Second", "2015");--%>
    <%--mDatasetline.addValue(9, "Second", "2016");--%>
    <%--mDatasetline.addValue(5, "Second", "2017");--%>
    <%--mDatasetline.addValue(7, "Second", "2018");--%>

    <%--StandardChartTheme mChartThemeline = new StandardChartTheme("CN");--%>
    <%--mChartThemeline.setLargeFont(new Font("����", Font.BOLD, 20));--%>
    <%--mChartThemeline.setExtraLargeFont(new Font("����", Font.PLAIN, 15));--%>
    <%--mChartThemeline.setRegularFont(new Font("����", Font.PLAIN, 15));--%>
    <%--ChartFactory.setChartTheme(mChartThemeline);--%>

    <%--JFreeChart mChartline = ChartFactory.createLineChart(--%>
            <%--"����ͼ",--%>
            <%--"���",--%>
            <%--"����",--%>
            <%--mDatasetline,--%>
            <%--PlotOrientation.VERTICAL,--%>
            <%--true,--%>
            <%--true,--%>
            <%--false);--%>

    <%--CategoryPlot mPlotline = (CategoryPlot)mChart.getPlot();--%>
    <%--mPlotline.setBackgroundPaint(Color.LIGHT_GRAY);--%>
    <%--mPlotline.setRangeGridlinePaint(Color.BLUE);//�����ײ�������--%>
    <%--mPlotline.setOutlinePaint(Color.RED);//�߽���--%>

    <%--//500��ͼƬ���ȣ�300��ͼƬ�߶�--%>
    <%--String filenameline = ServletUtilities.saveChartAsPNG(mChartline, 800, 500, info, session);--%>
    <%--String graphURLline = request.getContextPath() + "/servlet/DisplayChart?filename=" + filenameline;--%>
<%--%>--%>



<P ALIGN="CENTER">
    <img src="<%= graphURLbar %>" width=500 height=300 border=0 usemap="#<%= filenamebar %>">
    <%--<img src="<%= graphURL %>" width=500 height=300 border=0 usemap="#<%= filename %>">--%>
    <%--<img src="<%= graphURLline %>" width=500 height=300 border=0 usemap="#<%= filenameline %>">--%>
</P>
<%}%>
</BODY>
</HTML>