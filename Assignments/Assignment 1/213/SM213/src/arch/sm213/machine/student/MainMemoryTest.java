package arch.sm213.machine.student;

/**
 * Created by chaneric on 2016-01-11.
 */
import machine.AbstractMainMemory.InvalidAddressException;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;
public class MainMemoryTest {

    private MainMemory mem;
    private static int SIZE = 32;


    @Before
    public void setUp() {
        mem = new MainMemory(SIZE);
    }


    // ** TESTING FOR GET**
    @Test  // Testing for 1 byte set from the beginning of the memory
    public void testSetBeginning() throws InvalidAddressException {
        byte[] bytes = new byte[1];
        bytes[0] = (byte) 0xCC;

        mem.set(0,bytes);

        assertEquals((byte)0xCC, mem.get(0,1)[0]);

    }

    @Test // Testing for max bytes written in the memory (starting from 0)
    public void testMaxSet() throws InvalidAddressException {
        byte[] bytes = new byte[SIZE];
        for(int i = 0; i < SIZE; i++)
            bytes[i] = (byte) 0xCC;
        mem.set(0,bytes);
        assertArrayEquals(bytes, mem.get(0,SIZE));
    }

    @Test // Testing bytes written in the middle of the memory
    public void testMiddleSet() throws InvalidAddressException {
        byte[] bytes = new byte[4];
        for(int i = 0; i < 4; i++)
            bytes[i] = (byte) 0xAB;

        mem.set(4,bytes);
        assertEquals((byte) 0xAB, mem.get(4,1)[0]);
        assertEquals((byte) 0xAB, mem.get(5,1)[0]);
        assertEquals((byte) 0xAB, mem.get(6,1)[0]);
        assertEquals((byte) 0xAB, mem.get(7,1)[0]);
    }

    @Test (expected = InvalidAddressException.class) // Testing for InvalidAddressException
    public void testSetInvalidAddressException() throws InvalidAddressException {
        byte[] bytes = new byte[SIZE+1]; // byte[33]
        for(int i = 0; i < SIZE+1; i++) // initializing 33 bytes into the array
            bytes[i] = (byte) 0x01;

        mem.set(0,bytes); // attempting to set 33 bytes into a 32 byte array (exception should be thrown)
    }

    @Test (expected = InvalidAddressException.class) // Testing for InvalidAddressException
    public void testSetInvalidAddressException2() throws InvalidAddressException {
        byte[] bytes = new byte[SIZE+1]; // byte[33]
        for(int i = 0; i < SIZE+1; i++) // initializing 33 bytes into the array
            bytes[i] = (byte) 0x01;

        mem.set(-1,bytes); // attempting to look up address -1 (addresses start at 0 so exception should be thrown)
    }


    //** END



    //** TESTING FOR GET **

    @Test
    public void testGet4Digits() throws InvalidAddressException {
        byte[] bytes = new byte[4];
        for(int i = 0; i < 4; i++)
            bytes[i] = (byte) 0x05;

        mem.set(0,bytes);

        assertArrayEquals(bytes, mem.get(0,4));
    }

    @Test
    public void testGet1Digit() throws InvalidAddressException {
        byte[] bytes = new byte[1];
        bytes[0] = (byte) 0x0C;

        mem.set(5,bytes);

        assertEquals((byte) 0x0C,mem.get(5,1)[0]);
    }

    @Test (expected = InvalidAddressException.class)
    public void testThrowExceptionGet() throws InvalidAddressException {
        byte[] bytes = new byte[SIZE];
        for(int i = 0; i < SIZE; i++)
            bytes[i] = (byte) 0x05;

        mem.set(0,bytes);

        mem.get(0,SIZE+1); // EXCEPTION THROWN
    }


    // ** END

    // ** TESTING FOR INTEGERTOBYTES**

    @Test // TESTING FOR NEGATIVE NUMBERS
    public void testIntegerToBytesNegative() {
        byte[] bytes = new byte[4];
        bytes[0] = (byte) 0xFF;
        bytes[1] = (byte) 0x30;
        bytes[2] = (byte) 0x20;
        bytes[3] = (byte) 0x10;

        int integer = -13623280;

        assertArrayEquals(bytes,mem.integerToBytes(integer));
    }

    @Test
    public void testIntegerToBytesPositive(){
        byte[] bytes = new byte[4];
        bytes[0] = (byte) 0x20;
        bytes[1] = (byte) 0x30;
        bytes[2] = (byte) 0x40;
        bytes[3] = (byte) 0x50;

        int integer = 540033104;

        assertArrayEquals(bytes,mem.integerToBytes(integer));
    }

    // ** END

    // ** TESTING FOR BYTESTOINTEGERS**

    @Test
    public void testBytesToIntegersNegative(){
        byte[] bytes = new byte[4];
        bytes[0] = (byte) 0xFF;
        bytes[1] = (byte) 0x30;
        bytes[2] = (byte) 0x20;
        bytes[3] = (byte) 0x10;

        int integer = -13623280;

        assertEquals(integer,mem.bytesToInteger(bytes[0],bytes[1],bytes[2],bytes[3]));


    }

    @Test
    public void testBytesToIntegersPositive(){
        byte[] bytes = new byte[4];
        bytes[0] = (byte) 0x20;
        bytes[1] = (byte) 0x30;
        bytes[2] = (byte) 0x40;
        bytes[3] = (byte) 0x50;

        int integer = 540033104;

        assertEquals(integer,mem.bytesToInteger(bytes[0],bytes[1],bytes[2],bytes[3]));

    }


    // ** END //


    @Test
    public void testisAccessAligned(){

        //True Stuff
        assertTrue(mem.isAccessAligned(0,2)); // short
        assertTrue(mem.isAccessAligned(8,4)); // int
        assertTrue(mem.isAccessAligned(32,8)); // long

        //False Stuff
        assertFalse(mem.isAccessAligned(1,2));
        assertFalse(mem.isAccessAligned(7,4));
        assertFalse(mem.isAccessAligned(5,8));

    }
}
