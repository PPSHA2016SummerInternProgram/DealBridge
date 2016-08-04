package com.pp;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.util.IOUtils;

import java.io.Reader;
import java.io.StringReader;

/**
 * Created by chaorshi on 2016/7/29.
 */
public class MyIKAnalyzer extends Analyzer {
    protected TokenStreamComponents createComponents(String s) {
        Reader reader = null;
        try {
            reader = new StringReader(s);
            MyIKTokenizer it = new MyIKTokenizer(reader);
            return new Analyzer.TokenStreamComponents(it);
        } finally {
            IOUtils.closeWhileHandlingException(reader);
        }
    }
}
