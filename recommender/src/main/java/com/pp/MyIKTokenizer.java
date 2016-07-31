package com.pp;

import org.apache.lucene.analysis.Tokenizer;
import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;
import org.apache.lucene.analysis.tokenattributes.OffsetAttribute;
import org.apache.lucene.analysis.tokenattributes.TypeAttribute;
import org.wltea.analyzer.core.IKSegmenter;
import org.wltea.analyzer.core.Lexeme;

import java.io.IOException;
import java.io.Reader;

/**
 * Created by chaorshi on 2016/7/29.
 */
public class MyIKTokenizer extends Tokenizer{
    private IKSegmenter _IKImplement;
    private final CharTermAttribute termAtt;
    private final OffsetAttribute offsetAttr;
    private final TypeAttribute typeAttr;
    private int endPosition;

    public MyIKTokenizer(Reader in) {
        this(in, false);
    }

    public MyIKTokenizer(Reader in, boolean useSmart) {
        offsetAttr = addAttribute(OffsetAttribute.class);
        termAtt = addAttribute(CharTermAttribute.class);
        typeAttr = addAttribute(TypeAttribute.class);
        _IKImplement = new IKSegmenter(input, useSmart);
    }
    public boolean incrementToken() throws IOException {
        clearAttributes();
        Lexeme nextLexeme = _IKImplement.next();
        if(nextLexeme != null) {
            termAtt.append(nextLexeme.getLexemeText());
            termAtt.setLength(nextLexeme.getLength());
            offsetAttr.setOffset(nextLexeme.getBeginPosition(), nextLexeme.getEndPosition());
            endPosition = nextLexeme.getEndPosition();
            typeAttr.setType(nextLexeme.getLexemeText());
            return true;
        }
        return false;
    }
    public void reset() throws IOException {
        super.reset();
        _IKImplement.reset(input);
    }
    public final void end() {
        int finalOffset = correctOffset(this.endPosition);
        offsetAttr.setOffset(finalOffset, finalOffset);
    }
}
