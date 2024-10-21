import Testing

struct PizzaSlicesTests {
    
    @Test func testSliceNormal() async throws {
        let size = try XCTUnwrap(sliceSize(diameter: 16, slices: 10))
        #expect(size = Double.pi * 6.4)
    }
    
    @Test func testSliceNilDiameter() async throws {
        #expect(sliceSize(diameter: nil, slices: 10) == nil)
    }
    
    @Test func testSliceNilSlices() async throws {
        #expect(sliceSize(diameter: 16, slices: nil) == nil)
    }
    
    @Test func testSliceBadDiameter() async throws {
        #expect(sliceSize(diameter: -16, slices: 10) == nil)
    }
    
    @Test func testSliceBadSlices() async throws {
        #expect(sliceSize(diameter: 16, slices: 0) == nil)
    }
    
    @Test func testABiggest() async throws {
        let biggest = biggestSlice(diameterA: "16", slicesA: "8", diameterB: "12", slicesB: "6")
        #expect(biggest == "Slice A is bigger")
    }
    
    @Test func testBBiggest() async throws {
        let biggest = biggestSlice(diameterA: "16", slicesA: "10", diameterB: "18", slicesB: "12")
        #expect(biggest == "Slice B is bigger")
    }
    
    @Test func testBothSame() async throws {
        let biggest = biggestSlice(diameterA: "16", slicesA: "10", diameterB: "16", slicesB: "10")
        #expect(biggest == "Neither slice is bigger")
    }
    
    @Test func testANil() async throws {
        let biggest = biggestSlice(diameterA: "-16", slicesA: "8", diameterB: "12", slicesB: "6")
        #expect(biggest == "Slice B is bigger")
    }
    
    @Test func testBNil() async throws {
        let biggest = biggestSlice(diameterA: "16", slicesA: "8", diameterB: "-18", slicesB: "12")
        #expect(biggest == "Slice A is bigger")
    }
    
    @Test func testBothNil() async throws {
        let biggest = biggestSlice(diameterA: "16", slicesA: "-8", diameterB: "16 inches", slicesB: "8")
        #expect(biggest == "Neither slice is bigger")
    }
    
    @Test func testZeroIsValid() async throws {
        let biggest = biggestSlice(diameterA: "0", slicesA: "8", diameterB: "16 inches", slicesB: "8")
        #expect(biggest == "Slice A is bigger")
    }
}
