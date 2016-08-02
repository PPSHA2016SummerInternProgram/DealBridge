package com.pp;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.Term;
import org.apache.lucene.search.*;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

import java.io.IOException;
import java.nio.file.Paths;

/**
 * Created by chaorshi on 2016/7/29.
 */
public class IndexSearch {
    public static void search(Analyzer analyzer, String indexDir) {
        Directory directory = null;
        long begin = System.currentTimeMillis();

        try {
            directory = FSDirectory.open(Paths.get(indexDir));
            DirectoryReader indexReader = DirectoryReader.open(directory);
            IndexSearcher indexSearcher = new IndexSearcher(indexReader);

            // search by term
            Query query = new TermQuery(new Term("merchant_description", "新概念"));

            // search with specific parser
            //confused, since QueryParser not found in Lucene 6.0
            //QueryParser parser = new QueryParser();

            // and-or search doesn't work ether
            // BooleanQuery bQuery = new BooleanQuery();

            // search within range
//            Term beginTime = new Term("time", "200001");
//            Term endTime = new Term("time", "200005");
//            TermRangeQuery rangeQuery = new TermRangeQuery();

            // search with prefix
//            Term pre1 = new Term("name", "wor");
//            PrefixQuery prefixQuery = new PrefixQuery(pre1);

            // search with phase

            // search with multi-phase Query


            TopDocs topDocs = indexSearcher.search(query, 10);
            long end = System.currentTimeMillis();
            System.out.println("time consumed on searching " + String.valueOf(end - begin) + " ms");
            for(int i = 0; i < topDocs.scoreDocs.length; i++) {
                Document firstHit = indexSearcher.doc(topDocs.scoreDocs[i].doc);
                System.out.print("bank_name " + firstHit.get("bank_name"));
                System.out.println(" merchant_description " + firstHit.get("merchant_description"));
            }
            directory.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        search(new MyIKAnalyzer(), "/data/eric/test/lucene-test/index");
    }
}
