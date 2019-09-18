package com.frees.workdaily.util;

/**
 * 拼装 html样式
 * 
 * @author dengping
 * @date 2019/9/17 18:15
 */
public final class HtmlStyleUtil {

    public static final String OVERSTRIKING_BEGIN = "<b>";
    public static final String OVERSTRIKING_EDN = "</b>";

    public static final String UNDERLINE_BEGIN = "<u>";
    public static final String UNDERLINE_EDN = "</u>";

    public static final String BLANK = "&nbsp;";
    public static final String BR = "<BR>";

    private HtmlStyleUtil() { }

    /**
     * 加粗
     * 
     * @param str
     * @return
     */
    public static String overstriking(String str) {
        return OVERSTRIKING_BEGIN + str + OVERSTRIKING_EDN;
    }

    /**
     * 下划线
     * 
     * @param str
     * @return
     */
    public static String underline(String str) {
        return UNDERLINE_BEGIN + str + UNDERLINE_EDN;
    }

}
