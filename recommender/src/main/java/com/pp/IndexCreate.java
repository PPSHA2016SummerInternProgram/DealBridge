package com.pp;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.wltea.analyzer.lucene.IKAnalyzer;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by chaorshi on 2016/7/28.
 */
public class IndexCreate {
    public static void create(Analyzer analyzer, String indexDir) {
        Directory directory = null;
        long begin = System.currentTimeMillis();
        try {
            Path path = Paths.get(indexDir);
            directory = FSDirectory.open(path);
            File indexFile = path.toFile();
            if(!indexFile.exists()) {
                indexFile.mkdirs();
            }
            IndexWriterConfig config = new IndexWriterConfig(analyzer);
            IndexWriter indexWriter = new IndexWriter(directory, config);

            Connection conn = DBSource.getInstance().getConnection();
            String sql = "select bank_name, summary, merchant_description from discount";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Document doc = new Document();
                doc.add(new TextField("bank_name", rs.getString("bank_name"), Field.Store.YES));
                doc.add(new TextField("summary", rs.getString("summary"), Field.Store.YES));
                doc.add(new TextField("merchant_description", rs.getString("merchant_description"), Field.Store.YES));
                indexWriter.addDocument(doc);
            }
            indexWriter.commit();
            indexWriter.close();
            rs.close();
            System.out.println("Index create time is " + String.valueOf(System.currentTimeMillis() - begin));
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {
        create(new MyIKAnalyzer(), "/data/eric/test/lucene-test/index");
    }
}
