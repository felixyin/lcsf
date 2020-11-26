package com.hzc.vo;

import com.hzc.model.HisPaper;
import com.hzc.model.HisPaperItem;
import com.hzc.model.LpOption;

import java.util.List;

/**
 * Created by yue on 2015/7/25.
 */
public class HisPaperItemVO extends HisPaperItem {
    private List<LpOption> options;
    public List<LpOption> getOptions() {
        return options;
    }

    public void setOptions(List<LpOption> options) {
        this.options = options;
    }
    private List<HisPaper> papers;
    public List<HisPaper> getPapers() {
        return papers;
    }

    public void setPapers(List<HisPaper> papers) {
        this.papers = papers;
    }
}
