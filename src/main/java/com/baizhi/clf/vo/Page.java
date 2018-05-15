package com.baizhi.clf.vo;

/**
 * Created by Administrator on 2018/3/21.
 */
public class Page {

    //当前页面的下标
    private Integer pageIndex;
    //查询的起始下标
    private Integer startIndex;
    //每页展示的条数
    private Integer pageRows;
    //总共页面数
    private Integer endPage;
    //总共条数
    private Integer totalRows;

    public Page() {
    }

    public Page(Integer pageIndex){
        this(pageIndex,15);
    }
    public Page(Integer pageIndex, Integer pageRows) {
        this.pageIndex = pageIndex;
        this.pageRows = pageRows;
        this.startIndex = (pageIndex-1)*pageRows;
    }

    public Integer getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(Integer pageIndex) {
        this.pageIndex = pageIndex;
    }

    public Integer getStartIndex() {
        return startIndex;
    }

    public void setStartIndex(Integer startIndex) {
        this.startIndex = startIndex;
    }

    public Integer getPageRows() {
        return pageRows;
    }

    public void setPageRows(Integer pageRows) {
        this.pageRows = pageRows;
    }

    public Integer getEndPage() {
        return endPage;
    }

    public void setEndPage(Integer endPage) {
        this.endPage = endPage;
    }

    public Integer getTotalRows() {
        return totalRows;
    }

    public void setTotalRows(Integer totalRows) {
        this.totalRows = totalRows;
        int flag = totalRows%pageRows;
        this.endPage = flag == 0 ? totalRows/pageRows : totalRows/pageRows+1;
    }
}
