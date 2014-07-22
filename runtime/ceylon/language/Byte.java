package ceylon.language;

import com.redhat.ceylon.compiler.java.Util;
import com.redhat.ceylon.compiler.java.metadata.Ceylon;
import com.redhat.ceylon.compiler.java.metadata.Class;
import com.redhat.ceylon.compiler.java.metadata.Defaulted;
import com.redhat.ceylon.compiler.java.metadata.Ignore;
import com.redhat.ceylon.compiler.java.metadata.Name;
import com.redhat.ceylon.compiler.java.metadata.SatisfiedTypes;
import com.redhat.ceylon.compiler.java.metadata.ValueType;
import com.redhat.ceylon.compiler.java.runtime.model.ReifiedType;
import com.redhat.ceylon.compiler.java.runtime.model.TypeDescriptor;

@Ceylon(major = 7)
@SatisfiedTypes({
    "ceylon.language::Binary<ceylon.language::Byte>",
    "ceylon.language::Invertible<ceylon.language::Byte>"
})
@Class(extendsType="ceylon.language::Object", basic = false, identifiable = false)
@ValueType
public final class Byte implements Binary<Byte>, Invertible<Byte>, ReifiedType {
    
    @Ignore
    public final static TypeDescriptor $TypeDescriptor$ = TypeDescriptor.klass(Byte.class);


    @Override
    public Invertible$impl<Byte> $ceylon$language$Invertible$impl() {
        throw Util.makeUnimplementedMixinAccessException();
    }

    @Override
    public Binary$impl<Byte> $ceylon$language$Binary$impl() {
        throw Util.makeUnimplementedMixinAccessException();
    }

    @Ignore
    final byte value;
    
    public Byte(@Name("congruent") long congruent) {
        value = (byte) congruent;
    }
    
    @Ignore
    public Byte(byte value) {
        this.value = value;
    }
    
    @Ignore
    public static Byte instance(byte value) {
        return new Byte(value);
    }
    
    @Ignore
    public byte byteValue() {
        return value;
    }
    
    @Override
    public TypeDescriptor $getType$() {
        return $TypeDescriptor$;
    }

    @Override
    public Byte getNegated() {
        return new Byte((byte)-value);
    }

    @Override
    public Byte plus(@Name("other") Byte other) {
        return new Byte((byte) (value+other.value));
    }

    @Override
    public Byte minus(@Name("other") Byte other) {
        return new Byte((byte) (value-other.value));
    }

    @Ignore
    public static byte getNegated(byte value) {
        return (byte)-value;
    }

    @Ignore
    public static byte plus(byte value, byte other) {
        return (byte) (value+other);
    }

    @Ignore
    public static byte minus(byte value, byte other) {
        return (byte) (value-other);
    }

    @Override
    public Byte and(@Name("other") Byte other) {
        return new Byte((byte) (value & other.value));
    }

    @Override
    public Byte or(@Name("other") Byte other) {
        return new Byte((byte) (value | other.value));
    }

    @Override
    public Byte xor(@Name("other") Byte other) {
        return new Byte((byte) (value ^ other.value));
    }

    @Override
    public Byte getNot() {
        return new Byte((byte) ~value);
    }
    
    @Ignore
    public static byte and(byte value, byte other) {
        return (byte) (value & other);
    }

    @Ignore
    public static byte or(byte value, byte other) {
        return (byte) (value | other);
    }

    @Ignore
    public static byte xor(byte value, byte other) {
        return (byte) (value ^ other);
    }

    @Ignore
    public static byte getNot(byte value) {
        return (byte) ~value;
    }
    
    @Override
    public Byte leftLogicalShift(@Name("shift") long shift) {
        return new Byte((byte) (value<<shift));
    }

    @Override
    public Byte rightArithmeticShift(@Name("shift") long shift) {
        return new Byte((byte) ((0xff&value)>>shift));
    }

    @Override
    public Byte rightLogicalShift(@Name("shift") long shift) {
        return new Byte((byte) ((0xff&value)>>shift));
    }

    @Ignore
    public static byte leftLogicalShift(byte value, long shift) {
        return (byte) (value<<shift);
    }

    @Ignore
    public static byte rightArithmeticShift(byte value, long shift) {
        return (byte) ((0xff&value)>>shift);
    }

    @Ignore
    public static byte rightLogicalShift(byte value, long shift) {
        return (byte) ((0xff&value)>>shift);
    }

    @Override
    public Byte clear(@Name("index") long index) {
        if (index < 0 || index > 7) {
            return this;
        }
        int mask = 1 << index;
        return new Byte((byte) ((0xff&value) & ~mask));
    }

    @Override
    public Byte flip(@Name("index") long index) {
        if (index < 0 || index > 7) {
            return this;
        }
        int mask = 1 << index;
        return new Byte((byte) ((0xff&value) ^ mask));
    }

    @Override
    @Ignore
    public Byte set(long index) {
        return set(index, true);
    }

    @Override
    public Byte set(@Name("index") long index, 
            @Name("bit") @Defaulted boolean bit) {
        if (index < 0 || index > 7) {
            return this;
        }
        int mask = 1 << index;
        int masked = bit ? 
                (0xff&value) | mask : 
                (0xff&value) & ~mask;
        return new Byte((byte) masked);
    }

    @Override
    @Ignore
    public boolean set$bit(long index) {
        return true;
    }

    @Override
    public boolean get(@Name("index") long index) {
        if (index < 0 || index > 7) {
            return false;
        }
        int mask = 1 << index;
        return ((0xff&value) & mask) != 0;
    }

    @Ignore
    public static byte clear(byte value, long index) {
        if (index < 0 || index > 7) {
            return value;
        }
        int mask = 1 << index;
        return (byte) ((0xff&value) & ~mask);
    }

    @Ignore
    public static byte flip(byte value, long index) {
        if (index < 0 || index > 7) {
            return value;
        }
        int mask = 1 << index;
        return (byte) ((0xff&value) ^ mask);
    }

    @Ignore
    public static byte set(byte value, long index) {
        return set(value, index, true);
    }

    @Ignore
    public static byte set(byte value, long index, boolean bit) {
        if (index < 0 || index > 7) {
            return value;
        }
        int mask = 1 << index;
        int masked = bit ? 
                (0xff&value) | mask : 
                (0xff&value) & ~mask;
        return (byte) masked;
    }

    @Ignore
    public static boolean get(byte value, long index) {
        if (index < 0 || index > 7) {
            return false;
        }
        int mask = 1 << index;
        return ((0xff&value) & mask) != 0;
    }
    
    public long getInteger() {
        return 0xff&value;
    }
    
    @Ignore
    public static long getInteger(byte value) {
        return 0xff&value;
    }
    
    @Override
    public boolean equals(@Name("that") java.lang.Object obj) {
        if (obj instanceof Byte) {
            return value==((Byte) obj).value;
        }
        else {
            return false;
        }
    }
    
    @Override
    public int hashCode() {
        return value;
    }
    
    @Ignore
    public static boolean equals(byte value, java.lang.Object obj) {
        if (obj instanceof Byte) {
            return value==((Byte) obj).value;
        }
        else {
            return false;
        }
    }
    
    @Ignore
    public static int hashCode(byte value) {
        return value;
    }
    
    @Override
    public java.lang.String toString() {
        return Integer.toString(0xff&value);
    }
    
    @Ignore
    public static java.lang.String toString(byte value) {
        return Integer.toString(0xff&value);
    }
    
}
