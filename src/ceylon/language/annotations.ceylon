import ceylon.language.meta.declaration {
    Module,
    Package,
    Import,
    ClassDeclaration,
    ClassOrInterfaceDeclaration,
    ConstructorDeclaration,
    FunctionDeclaration,
    Declaration,
    ValueDeclaration,
    FunctionOrValueDeclaration
}

"The annotation class for the [[annotation]] meta-annotation."
shared final annotation class AnnotationAnnotation()
        satisfies OptionalAnnotation<AnnotationAnnotation,
                ClassDeclaration|FunctionDeclaration> {}

"Annotation to mark a class as an *annotation class*, or a 
 top-level function as an *annotation constructor*."
see (`interface Annotation`)
shared annotation AnnotationAnnotation annotation()
        => AnnotationAnnotation();

"The annotation class for the [[shared]] annotation."
shared final annotation class SharedAnnotation()
        satisfies OptionalAnnotation<SharedAnnotation,
                FunctionOrValueDeclaration|ClassOrInterfaceDeclaration|ConstructorDeclaration|Package|Import> {}

"Annotation to mark a declaration as shared. A `shared` 
 declaration is visible outside the block of code in which 
 it is declared."
shared annotation SharedAnnotation shared()
        => SharedAnnotation();

"The annotation class for the [[variable]] annotation."
shared final annotation class VariableAnnotation()
        satisfies OptionalAnnotation<VariableAnnotation,
                ValueDeclaration> {}

"Annotation to mark a value as variable. A `variable` value 
 may be assigned multiple times."
shared annotation VariableAnnotation variable()
        => VariableAnnotation();

"The annotation class for the [[abstract]] annotation."
shared final annotation class AbstractAnnotation()
        satisfies OptionalAnnotation<AbstractAnnotation,
                ClassDeclaration> {}

"Annotation to mark a class as abstract. An `abstract` class
 may have `formal` members, but may not be directly 
 instantiated. An enumerated class must be `abstract`."
shared annotation AbstractAnnotation abstract()
        => AbstractAnnotation();

"The annotation class for the [[final]] annotation."
shared final annotation class FinalAnnotation()
        satisfies OptionalAnnotation<FinalAnnotation,
                ClassDeclaration> {}

"Annotation to mark a class as final. A `final` class may 
 not be extended. Marking a class as `final` affects disjoint
 type analysis."
shared annotation FinalAnnotation final()
        => FinalAnnotation();
                
"The annotation class for the [[sealed]] annotation."
shared final annotation class SealedAnnotation()
        satisfies OptionalAnnotation<SealedAnnotation,
                ClassOrInterfaceDeclaration|ConstructorDeclaration> {}
                
"Annotation to mark an interface, class, or constructor as 
 sealed. A `sealed` interface may not be satisfied outside 
 of the module in which it is defined. A `sealed` class may 
 not be extended or instantiated outside of the module in 
 which it is defined. A `sealed` constructor may not be
 invoked outside of the module in which it is defined."
shared annotation SealedAnnotation sealed()
        => SealedAnnotation();

"The annotation class for the [[actual]] annotation."
shared final annotation class ActualAnnotation()
        satisfies OptionalAnnotation<ActualAnnotation,
                FunctionOrValueDeclaration|ClassOrInterfaceDeclaration> {}

"Annotation to mark a member of a type as refining a member 
 of a supertype."
shared annotation ActualAnnotation actual()
        => ActualAnnotation();

"The annotation class for the [[formal]] annotation."
shared final annotation class FormalAnnotation()
        satisfies OptionalAnnotation<FormalAnnotation,
                FunctionOrValueDeclaration|ClassOrInterfaceDeclaration> {}

"Annotation to mark a member whose implementation must be 
 provided by subtypes."
shared annotation FormalAnnotation formal()
        => FormalAnnotation();

"The annotation class for the [[default]] annotation."
shared final annotation class DefaultAnnotation()
        satisfies OptionalAnnotation<DefaultAnnotation,
                FunctionOrValueDeclaration|ClassOrInterfaceDeclaration> {}

"Annotation to mark a member whose implementation may be 
 refined by subtypes. Non-`default` declarations may not be 
 refined."
shared annotation DefaultAnnotation default()
        => DefaultAnnotation();

"The annotation class for the [[late]] annotation."
shared final annotation class LateAnnotation()
        satisfies OptionalAnnotation<LateAnnotation,
                ValueDeclaration> {}

"Annotation to disable definite initialization analysis for 
 a reference."
shared annotation LateAnnotation late()
        => LateAnnotation();

"The annotation class for the [[native]] annotation."
shared final annotation class NativeAnnotation()
        satisfies OptionalAnnotation<NativeAnnotation,Annotated> {}

"Annotation to mark a member whose implementation is defined 
 in platform-native code."
shared annotation NativeAnnotation native()
        => NativeAnnotation();

/*"The annotation class for [[inherited]]."
shared final annotation class InheritedAnnotation()
        satisfies OptionalAnnotation<InheritedAnnotation, 
            ClassDeclaration> {}

"Annotation to mark an annotation class as a *inherited*."
shared annotation InheritedAnnotation inherited() 
        => InheritedAnnotation();*/

"The annotation class for the [[doc]] annotation."
shared final annotation class DocAnnotation(
    "Documentation, in Markdown syntax, about the annotated 
     program element"
    shared String description)
        satisfies OptionalAnnotation<DocAnnotation,Annotated> {}

"Annotation to specify API documentation of a program
 element."
shared annotation DocAnnotation doc(
    "Documentation, in Markdown syntax, about the annotated element"
    String description) => DocAnnotation(description);

"The annotation class for the [[see]] annotation."
shared final annotation class SeeAnnotation(
    "The program elements being referred to."
    shared Declaration* programElements)
        satisfies SequencedAnnotation<SeeAnnotation,Annotated> {}

"Annotation to specify references to other program elements
 related to the annotated API."
shared annotation SeeAnnotation see(
    "The program elements being referred to."
    Declaration* programElements)
        => SeeAnnotation(*programElements);

"The annotation class for the [[by]] annotation."
shared final annotation class AuthorsAnnotation(
    "The authors, in Markdown syntax, of the annotated 
     program element"
    shared String* authors)
        satisfies OptionalAnnotation<AuthorsAnnotation,Annotated> {}

"Annotation to document the authors of an API."
shared annotation AuthorsAnnotation by(
    "The authors, in Markdown syntax, of the annotated 
     program element"
    String* authors)
        => AuthorsAnnotation(*authors);

"The annotation class for the [[throws]] annotation."
shared final annotation class ThrownExceptionAnnotation(
    "The [[Exception]] type that this thrown."
    shared Declaration type,
    "A description, in Markdown syntax, of the circumstances 
     that cause this exception to be thrown."
    shared String when)
        satisfies SequencedAnnotation<ThrownExceptionAnnotation,
                FunctionOrValueDeclaration|ClassDeclaration|ConstructorDeclaration> {}

"Annotation to document the exception types thrown by a 
 function, value, class, or constructor."
shared annotation ThrownExceptionAnnotation throws(
    "The [[Exception]] type that this thrown."
    Declaration type,
    "A description, in Markdown syntax, of the circumstances 
     that cause this exception to be thrown."
    String when = "")
        => ThrownExceptionAnnotation(type, when);

"The annotation class for the [[deprecated]] annotation."
shared final annotation class DeprecationAnnotation(
    "A description, in Markdown syntax, of why the program 
     element is deprecated, and of what alternatives are 
     available."
    shared String description)
        satisfies OptionalAnnotation<DeprecationAnnotation,
                Annotated> {
    "A description, in Markdown syntax, of why the program 
     element is deprecated, and what alternatives are 
     available, or `null`."
    shared String? reason
            => !description.empty then description;
}

"Annotation to mark program elements which should not be 
 used anymore."
shared annotation DeprecationAnnotation deprecated(
    "A description, in Markdown syntax, of why the program 
     element is deprecated, and what alternatives are 
     available."
    String reason = "")
        => DeprecationAnnotation(reason);

"The annotation class for the [[tagged]] annotation."
shared final annotation class TagsAnnotation(
    "The tags, in plain text."
    shared String* tags)
        satisfies OptionalAnnotation<TagsAnnotation,Annotated> {}

"Annotation to categorize an API by tag."
shared annotation TagsAnnotation tagged(
    "The tags, in plain text."
    String* tags)
        => TagsAnnotation(*tags);

"The annotation class for the [[license]] annotation."
shared final annotation class LicenseAnnotation(
    "The name, text, or URL of the license."
    shared String description)
        satisfies OptionalAnnotation<LicenseAnnotation,Module> {}

"Annotation to specify the URL of the license of a module or 
 package."
shared annotation LicenseAnnotation license(
    "The name, text, or URL of the license."
    String description)
        => LicenseAnnotation(description);

"The annotation class for the [[optional]] annotation."
shared final annotation class OptionalImportAnnotation()
        satisfies OptionalAnnotation<OptionalImportAnnotation,
                Import> {}

"Annotation to specify that a module can be executed even if 
 the annotated dependency is not available."
shared annotation OptionalImportAnnotation optional()
        => OptionalImportAnnotation();

"The annotation class for the [[suppressWarnings]] 
 annotation."
shared final annotation class SuppressWarningsAnnotation(
    "The warning types to suppress."
    [String*] warnings)
        satisfies OptionalAnnotation<SuppressWarningsAnnotation, 
            FunctionOrValueDeclaration|ClassOrInterfaceDeclaration|ConstructorDeclaration|Package|Import> {}

"Annotation to suppress compilation warnings of the 
 [[specified types|warnings]] when typechecking the 
 annotated program element."
shared annotation SuppressWarningsAnnotation suppressWarnings(
    "The warning types to suppress.
     
     Allowed warning types are:
     `filenameNonAscii`,
     `filenameCaselessCollision`,
     `deprecation`,
     `compilerAnnotation`,
     `doclink`,
     `expressionTypeNothing`,
     `unusedDeclaration`,
     `unusedImport`,
     `ceylonNamespace`,
     `javaNamespace,` 
     `suppressedAlready`, 
     `suppressesNothing`, 
     `unknownWarning`, 
     `ambiguousAnnotation`."
    String* warnings) 
        => SuppressWarningsAnnotation(warnings);

"The annotation class for the [[serializable]] annotation."
shared final annotation class SerializableAnnotation()
        satisfies OptionalAnnotation<SerializableAnnotation,ClassDeclaration> {
}

"Annotation to specify that a class is serializable.
  
 A serializable class may have instances that cannot be 
 serialized if those instances have reachable references to 
 instances of non-serializable classes."
shared annotation SerializableAnnotation serializable() 
        => SerializableAnnotation();

