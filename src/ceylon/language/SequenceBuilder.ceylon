"Builder utility for constructing immutable 
 [[sequences|Sequential]] by incrementally appending 
 elements. A newly-instantiated `SequenceBuilder` produces
 the [[empty sequence|empty]] `[]`."
see (`class SequenceAppender`, 
     `function concatenate`, 
     `class Singleton`)
shared native class SequenceBuilder<Element>() {
    
    "The resulting sequence. If no elements have been 
     appended, the [[empty sequence|empty]] `[]`."
    shared native default Element[] sequence;
    
    "Append an [[element]] to the sequence and return this 
     builder"
    shared native default SequenceBuilder<Element> append(Element element);
    
    "Append multiple [[elements]] to the sequence and return 
     this builder"
    shared native default SequenceBuilder<Element> appendAll({Element*} elements);
    
    "The size of the resulting [[sequence]]."
    shared Integer size => sequence.size;
    
    "Determine if the resulting [[sequence]] is empty."
    shared Boolean empty => size==0;
    
}

"Builder utility for constructing nonempty 
 [[sequences|Sequential]] by incrementally appending 
 elements. A newly-instantiated `SequenceAppender` produces
 a nonempty sequence containing the given initial 
 [[elements]]."
see (`class SequenceBuilder`)
shared native class SequenceAppender<Element>({Element+} elements) 
        extends SequenceBuilder<Element>() {
    
    "The resulting nonempty sequence. If no elements have 
     been appended, a nonempty sequence containing the given 
     initial [[elements]]."
    shared actual native [Element+] sequence;
    
    shared actual SequenceAppender<Element> append(Element element) {
        super.append(element);
        return this;
    }
    
    shared actual SequenceAppender<Element> appendAll({Element*} element) {
        super.appendAll(element);
        return this;
    }
    
}