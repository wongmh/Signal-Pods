//
//  Copyright (c) 2020 Open Whisper Systems. All rights reserved.
//

import XCTest
@testable import ZKGroup

class ZKGroupTests: XCTestCase {

  let TEST_ARRAY_16: [UInt8]   = [0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f]

  let TEST_ARRAY_32: [UInt8]   = [0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
                                  0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f]

  let TEST_ARRAY_32_1: [UInt8] = [0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x6a, 0x6b, 0x6c, 0x6d, 0x6e, 0x6f, 0x70, 0x71, 0x72, 0x73,
                                  0x74, 0x75, 0x76, 0x77, 0x78, 0x79, 0x7a, 0x7b, 0x7c, 0x7d, 0x7e, 0x7f, 0x80, 0x81, 0x82, 0x83]

  let TEST_ARRAY_32_2: [UInt8] = [0xc8, 0xc9, 0xca, 0xcb, 0xcc, 0xcd, 0xce, 0xcf, 0xd0, 0xd1, 0xd2, 0xd3, 0xd4, 0xd5, 0xd6, 0xd7,
                                  0xd8, 0xd9, 0xda, 0xdb, 0xdc, 0xdd, 0xde, 0xdf, 0xe0, 0xe1, 0xe2, 0xe3, 0xe4, 0xe5, 0xe6, 0xe7]

  let TEST_ARRAY_32_3: [UInt8] = [1, 2, 3, 4, 5, 6, 7, 8, 9,
      10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27,
      28, 29, 30, 31, 32]

  let TEST_ARRAY_32_4: [UInt8] = [
    2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27,
    28, 29, 30, 31, 32, 33]

  let TEST_ARRAY_32_5: [UInt8] = [0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12,
                                  0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f, 0x20, 0x21, 0x22]

  let authPresentationResult: [UInt8] = [ 0x00, 0x0c, 0xde, 0x97, 0x97, 0x37,
  0xed, 0x30, 0xbb, 0xeb, 0x16, 0x36, 0x2e, 0x4e, 0x07, 0x69, 0x45, 0xce, 0x02,
  0x06, 0x9f, 0x72, 0x7b, 0x0e, 0xd4, 0xc3, 0xc3, 0x3c, 0x01, 0x1e, 0x82, 0x54,
  0x6e, 0x1c, 0xdf, 0x08, 0x1f, 0xbd, 0xf3, 0x7c, 0x03, 0xa8, 0x51, 0xad, 0x06,
  0x0b, 0xdc, 0xbf, 0x63, 0x78, 0xcb, 0x4c, 0xb1, 0x6d, 0xc3, 0x15, 0x4d, 0x08,
  0xde, 0x54, 0x39, 0xb5, 0x32, 0x32, 0x03, 0x72, 0x9d, 0x18, 0x41, 0xb5, 0x17,
  0x03, 0x3a, 0xf2, 0xfd, 0x17, 0x7d, 0x30, 0x49, 0x1c, 0x13, 0x8a, 0xe7, 0x23,
  0x65, 0x57, 0x34, 0xf6, 0xe5, 0xcc, 0x01, 0xc0, 0x06, 0x96, 0xf4, 0xe9, 0x20,
  0x96, 0xd8, 0xc3, 0x3d, 0xf2, 0x6b, 0xa2, 0xa8, 0x20, 0xd4, 0x2e, 0x97, 0x35,
  0xd3, 0x0f, 0x8e, 0xee, 0xf9, 0x6d, 0x39, 0x90, 0x79, 0x07, 0x3c, 0x09, 0x9f,
  0x70, 0x35, 0x52, 0x3b, 0xfe, 0x71, 0x66, 0x38, 0x65, 0x93, 0x19, 0xd3, 0xc3,
  0x6a, 0xd3, 0x4c, 0x00, 0xef, 0x88, 0x50, 0xf6, 0x63, 0xc4, 0xd9, 0x30, 0x30,
  0x23, 0x50, 0x74, 0x31, 0x2a, 0x88, 0x78, 0xb6, 0xa5, 0xc5, 0xdf, 0x4f, 0xbc,
  0x7d, 0x32, 0x93, 0x52, 0x78, 0xbf, 0xa5, 0x99, 0x6b, 0x44, 0xab, 0x75, 0xd6,
  0xf0, 0x6f, 0x4c, 0x30, 0xb9, 0x86, 0x40, 0xad, 0x5d, 0xe7, 0x47, 0x42, 0x65,
  0x6c, 0x89, 0x77, 0x56, 0x7d, 0xe0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0xfd, 0xe6, 0x9f, 0x82, 0xad, 0x2d, 0xcb, 0x49, 0x09, 0x65, 0x0a, 0xc6, 0xb2,
  0x57, 0x38, 0x41, 0xaf, 0x56, 0x8f, 0xef, 0x82, 0x2b, 0x32, 0xb4, 0x5f, 0x62,
  0x5a, 0x76, 0x46, 0x91, 0xa7, 0x04, 0xd1, 0x1b, 0x6f, 0x38, 0x52, 0x61, 0x46,
  0x81, 0x17, 0xea, 0xd5, 0x7f, 0xa6, 0x23, 0x33, 0x8e, 0x21, 0xc6, 0x6e, 0xd8,
  0x46, 0xab, 0x65, 0x80, 0x9f, 0xca, 0xc1, 0x58, 0x06, 0x6d, 0x8e, 0x0e, 0x44,
  0x40, 0x77, 0xb9, 0x95, 0x40, 0xd8, 0x86, 0xe7, 0xdc, 0x09, 0x55, 0x5d, 0xd6,
  0xfa, 0xea, 0x2c, 0xd3, 0x69, 0x7f, 0x1e, 0x08, 0x9f, 0x82, 0xd5, 0x4e, 0x5d,
  0x0f, 0xe4, 0xa1, 0x85, 0x00, 0x8b, 0x5c, 0xbc, 0x39, 0x79, 0x39, 0x1a, 0xd7,
  0x16, 0x86, 0xbc, 0x03, 0xbe, 0x7b, 0x00, 0xea, 0x7e, 0x42, 0xc0, 0x8d, 0x9f,
  0x1d, 0x75, 0xc3, 0xa5, 0x6c, 0x27, 0xae, 0x24, 0x67, 0xb8, 0x06, 0x36, 0xc0,
  0xb5, 0x34, 0x3e, 0xda, 0x7c, 0xd5, 0x78, 0xba, 0x88, 0xdd, 0xb7, 0xa0, 0x76,
  0x65, 0x68, 0x47, 0x7f, 0xed, 0x63, 0xcf, 0x53, 0x18, 0x62, 0x12, 0x2c, 0x6c,
  0x15, 0xb4, 0xa7, 0x07, 0x97, 0x3d, 0x41, 0x78, 0x2c, 0xfc, 0x0e, 0xf4, 0xfe,
  0x6c, 0x31, 0x15, 0x98, 0x8a, 0x2e, 0x33, 0x90, 0x15, 0x93, 0x8d, 0x2d, 0xf0,
  0xa5, 0xd3, 0x02, 0x37, 0xa2, 0x59, 0x2c, 0xc1, 0x0c, 0x05, 0xa9, 0xe4, 0xef,
  0x6b, 0x69, 0x5b, 0xca, 0x99, 0x73, 0x6b, 0x1a, 0x49, 0xea, 0x39, 0x60, 0x6a,
  0x38, 0x1e, 0xcf, 0xb0, 0x5e, 0xfe, 0x60, 0xd2, 0x8b, 0x54, 0x82, 0x3e, 0xc5,
  0xa3, 0x68, 0x0c, 0x76, 0x5d, 0xe9, 0xdf, 0x4c, 0xfa, 0x54, 0x87, 0xf3, 0x60,
  0xe2, 0x9e, 0x99, 0x34, 0x3e, 0x91, 0x81, 0x1b, 0xae, 0xc3, 0x31, 0xc4, 0x68,
  0x09, 0x85, 0xe6, 0x08, 0xca, 0x5d, 0x40, 0x8e, 0x21, 0x72, 0x5c, 0x6a, 0xa1,
  0xb6, 0x1d, 0x5a, 0x8b, 0x48, 0xd7, 0x5f, 0x4a, 0xaa, 0x9a, 0x3c, 0xbe, 0x88,
  0xd3, 0xe0, 0xf1, 0xa5, 0x43, 0x19, 0x08, 0x1f, 0x77, 0xc7, 0x2c, 0x8f, 0x52,
  0x54, 0x74, 0x40, 0xe2, 0x01, 0x00]

  let profileKeyPresentationResult: [UInt8] = [ 
    0x00, 0xc4, 0xd1, 0x9b, 0xca, 0x1a, 0xe8, 0x44, 0x58, 0x51, 0x68, 0x86, 0x9d, 0xa4, 0x13, 0x3e,
    0x0e, 0x0b, 0xb5, 0x9f, 0x2c, 0xe1, 0x7b, 0x7a, 0xc6, 0x5b, 0xff, 0x5d, 0xa9, 0x61, 0x0e, 0xca,
    0x10, 0x34, 0x29, 0xd8, 0x02, 0x2a, 0x94, 0xba, 0xe2, 0xb5, 0xb1, 0x05, 0x7b, 0x55, 0x95, 0xb8,
    0xad, 0x70, 0xbf, 0xc2, 0xd0, 0xe1, 0xad, 0x66, 0x2c, 0xb7, 0x5e, 0x6b, 0xae, 0x07, 0x82, 0xbe,
    0x6f, 0x00, 0xe3, 0xdb, 0x79, 0x3b, 0xc2, 0x85, 0x61, 0xf0, 0x19, 0x6c, 0x2e, 0x74, 0xda, 0x6f,
    0x30, 0x3f, 0xa8, 0xbc, 0xb7, 0x0c, 0x94, 0x09, 0x66, 0x71, 0xb7, 0x3f, 0x7b, 0x3a, 0x95, 0xfb,
    0x00, 0x22, 0x00, 0xd5, 0xb9, 0x18, 0x0f, 0xa0, 0xef, 0x7d, 0x30, 0x14, 0xd0, 0x13, 0x44, 0x14,
    0x5b, 0x4d, 0x38, 0x48, 0x0d, 0x72, 0xff, 0x25, 0xc2, 0x42, 0x94, 0xe3, 0x05, 0xe5, 0x70, 0x50,
    0x72, 0xe0, 0xd3, 0x2c, 0xc4, 0xe8, 0x4f, 0x5c, 0xaf, 0x31, 0x48, 0x60, 0x89, 0xa4, 0xb9, 0x34,
    0xc8, 0x0c, 0x92, 0xeb, 0xa4, 0x34, 0x72, 0xff, 0x23, 0xa5, 0xaf, 0x93, 0xc3, 0x97, 0x53, 0x5d,
    0x33, 0x80, 0x1f, 0x0e, 0x6f, 0xc6, 0xeb, 0x2e, 0xe0, 0xd1, 0x17, 0xf0, 0x3b, 0xb4, 0xfd, 0x38,
    0xa8, 0xb9, 0xc8, 0x8d, 0x94, 0x70, 0x81, 0x31, 0xf3, 0x87, 0x42, 0xca, 0x80, 0x4a, 0x3c, 0xfc,
    0x4f, 0x94, 0x76, 0xbc, 0x2d, 0x03, 0xf5, 0x3d, 0x17, 0x00, 0x1c, 0x36, 0x47, 0x8a, 0xfb, 0xe9,
    0xcc, 0x53, 0x5a, 0x22, 0x4b, 0x2d, 0xf6, 0xb2, 0xb0, 0x8b, 0xef, 0x06, 0xcb, 0xc7, 0xd4, 0xdc,
    0x42, 0xcc, 0xfc, 0x34, 0x59, 0xf7, 0xac, 0x5c, 0x44, 0x19, 0xae, 0x9f, 0x3c, 0x8a, 0x16, 0x1d,
    0x55, 0x4d, 0x04, 0x77, 0x78, 0x94, 0x32, 0x16, 0x24, 0x08, 0x58, 0xda, 0x3b, 0x11, 0x01, 0x98,
    0x4c, 0x40, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7a, 0x01, 0xee, 0xa6, 0xb2, 0xad, 0xad,
    0x14, 0xd7, 0x1a, 0xb8, 0xb8, 0xe4, 0x11, 0xbe, 0xf3, 0xc5, 0x96, 0xe9, 0x54, 0xb7, 0x0e, 0x40,
    0x31, 0x57, 0x0c, 0xb1, 0xab, 0xd7, 0xe9, 0x32, 0x08, 0x32, 0x41, 0xf1, 0xca, 0xca, 0x31, 0x16,
    0x70, 0x8f, 0xa4, 0x31, 0x9f, 0xbb, 0xdf, 0xe3, 0x51, 0x37, 0x6c, 0x23, 0x64, 0x4a, 0xe0, 0x9a,
    0x42, 0xf0, 0x15, 0x5d, 0xb4, 0x99, 0x6c, 0x9d, 0x0c, 0x7f, 0xfc, 0x85, 0x21, 0xc1, 0x91, 0x4c,
    0x0e, 0x1a, 0x20, 0xae, 0x51, 0xe6, 0x5d, 0xf6, 0x4d, 0xd5, 0xe6, 0xe5, 0x98, 0x5b, 0x3d, 0x9d,
    0x31, 0x73, 0x20, 0x46, 0xd2, 0xd7, 0x7f, 0x9c, 0x08, 0xaa, 0xcc, 0xf0, 0x56, 0xb8, 0x40, 0x26,
    0x07, 0x39, 0x76, 0xee, 0xc6, 0x16, 0x4c, 0xbd, 0xae, 0xe5, 0xd9, 0xe7, 0x6e, 0x49, 0x7f, 0x0c,
    0x29, 0x0a, 0xf6, 0x81, 0xca, 0xbd, 0x5c, 0x51, 0x01, 0x28, 0x2a, 0xbb, 0x26, 0xc3, 0x68, 0x0d,
    0x60, 0x87, 0xce, 0x05, 0x33, 0x10, 0xfe, 0x8a, 0x94, 0xf5, 0x9d, 0x8a, 0xe2, 0x3c, 0xaa, 0xc5,
    0xfc, 0x0e, 0xd0, 0xc3, 0x79, 0x88, 0x8a, 0xbf, 0x02, 0x8a, 0x6f, 0x29, 0xf8, 0x9d, 0x4f, 0xe2,
    0xac, 0xc1, 0x70, 0x63, 0x41, 0xb2, 0x24, 0x5b, 0xa1, 0x88, 0x5b, 0xca, 0x57, 0xe1, 0xe2, 0x7c,
    0xcf, 0x7e, 0xd7, 0x93, 0x71, 0x50, 0x09, 0x65, 0x00, 0x9f, 0x96, 0x0c, 0x2b, 0xa0, 0x0f, 0xad,
    0x3e, 0x93, 0x38, 0x3b, 0x87, 0xce, 0x11, 0x9c, 0xac, 0x0b, 0x33, 0x60, 0xeb, 0x99, 0x28, 0x4c,
    0xe7, 0x8e, 0x2c, 0xbe, 0xd6, 0x80, 0xf7, 0x96, 0x03, 0x73, 0xe0, 0xab, 0x75, 0xc1, 0x90, 0x25,
    0x41, 0x60, 0xc2, 0x35, 0x36, 0x14, 0x10, 0x94, 0x89, 0xe6, 0x53, 0xc9, 0xb2, 0xe1, 0xc9, 0x3f,
    0x92, 0xc7, 0xc5, 0xad, 0x58, 0x3d, 0x98, 0x7a, 0x04, 0xbd, 0x35, 0x41, 0xb2, 0x44, 0x85, 0xc3,
    0x3e, 0xa4, 0x9b, 0xac, 0x43, 0xc8, 0x7c, 0x4a, 0xb3, 0xef, 0xde, 0x2e, 0x2d, 0x7e, 0xc1, 0x0a,
    0x40, 0xbe, 0x54, 0x41, 0x99, 0xf9, 0x25, 0xb2, 0x0b, 0x2c, 0x55, 0x54, 0x2b, 0xc5, 0x64, 0x10,
    0x57, 0x1e, 0x41, 0xcd, 0x8e, 0x02, 0x86, 0xf6, 0x09, 0xa6, 0x67, 0x68, 0xb5, 0x06, 0x1c, 0xcb,
    0x47, 0x77, 0xaf, 0x32, 0x30, 0x99, 0x28, 0xdd, 0x09, 0x76, 0x5d, 0xe9, 0xdf, 0x4c, 0xfa, 0x54,
    0x87, 0xf3, 0x60, 0xe2, 0x9e, 0x99, 0x34, 0x3e, 0x91, 0x81, 0x1b, 0xae, 0xc3, 0x31, 0xc4, 0x68,
    0x09, 0x85, 0xe6, 0x08, 0xca, 0x5d, 0x40, 0x8e, 0x21, 0x72, 0x5c, 0x6a, 0xa1, 0xb6, 0x1d, 0x5a,
    0x8b, 0x48, 0xd7, 0x5f, 0x4a, 0xaa, 0x9a, 0x3c, 0xbe, 0x88, 0xd3, 0xe0, 0xf1, 0xa5, 0x43, 0x19,
    0x08, 0x1f, 0x77, 0xc7, 0x2c, 0x8f, 0x52, 0x54, 0x74, 0x48, 0xc0, 0x3a, 0xb4, 0xaf, 0xbf, 0x6b,
    0x8f, 0xb0, 0xe1, 0x26, 0xc0, 0x37, 0xa0, 0xad, 0x40, 0x94, 0x60, 0x0d, 0xd0, 0xe0, 0x63, 0x4d,
    0x76, 0xf8, 0x8c, 0x21, 0x08, 0x7f, 0x3c, 0xfb, 0x48, 0x5a, 0x89, 0xbc, 0x1e, 0x3a, 0xbc, 0x4c,
    0x95, 0x04, 0x1d, 0x1d, 0x17, 0x0e, 0xcc, 0xf0, 0x29, 0x33, 0xec, 0x53, 0x93, 0xd4, 0xbe, 0x1d,
    0xc5, 0x73, 0xf8, 0x3c, 0x33, 0xd3, 0xb9, 0xa7, 0x46]

  let serverSignatureResult: [UInt8] = [ 0x87, 0xd3, 0x54, 0x56, 0x4d, 0x35,
  0xef, 0x91, 0xed, 0xba, 0x85, 0x1e, 0x08, 0x15, 0x61, 0x2e, 0x86, 0x4c, 0x22,
  0x7a, 0x04, 0x71, 0xd5, 0x0c, 0x27, 0x06, 0x98, 0x60, 0x44, 0x06, 0xd0, 0x03,
  0xa5, 0x54, 0x73, 0xf5, 0x76, 0xcf, 0x24, 0x1f, 0xc6, 0xb4, 0x1c, 0x6b, 0x16,
  0xe5, 0xe6, 0x3b, 0x33, 0x3c, 0x02, 0xfe, 0x4a, 0x33, 0x85, 0x80, 0x22, 0xfd,
  0xd7, 0xa4, 0xab, 0x36, 0x7b, 0x06]

  func testAuthIntegration() throws {

    let uuid: ZKGUuid           = try ZKGUuid(contents: TEST_ARRAY_16)
    let redemptionTime: UInt32 = 123456

    // Generate keys (client's are per-group, server's are not)
    // ---

    // SERVER
    let serverSecretParams = try ServerSecretParams.generate(randomness: TEST_ARRAY_32)
    let serverPublicParams = try serverSecretParams.getPublicParams()
    let serverZkAuth       = ServerZkAuthOperations(serverSecretParams: serverSecretParams)

    // CLIENT
    let masterKey         = try GroupMasterKey(contents: TEST_ARRAY_32_1)
    let groupSecretParams = try GroupSecretParams.deriveFromMasterKey(groupMasterKey: masterKey)

    XCTAssertEqual((try groupSecretParams.getMasterKey()).serialize(), masterKey.serialize())

    let groupPublicParams = try groupSecretParams.getPublicParams()

    // SERVER
    // Issue credential
    let authCredentialResponse = try serverZkAuth.issueAuthCredential(randomness: TEST_ARRAY_32_2, uuid: uuid, redemptionTime: redemptionTime)

    // CLIENT
    // Receive credential
    let clientZkAuthCipher  = ClientZkAuthOperations(serverPublicParams: serverPublicParams)
    let clientZkGroupCipher = ClientZkGroupCipher(groupSecretParams: groupSecretParams )
    let authCredential      = try clientZkAuthCipher.receiveAuthCredential(uuid: uuid, redemptionTime: redemptionTime, authCredentialResponse: authCredentialResponse)

    // Create and decrypt user entry
    let uuidCiphertext = try clientZkGroupCipher.encryptUuid(uuid: uuid)
    let plaintext      = try clientZkGroupCipher.decryptUuid(uuidCiphertext: uuidCiphertext)
    XCTAssertEqual(uuid.serialize(), plaintext.serialize())

    // Create presentation
    let presentation = try clientZkAuthCipher.createAuthCredentialPresentation(randomness: TEST_ARRAY_32_5, groupSecretParams: groupSecretParams, authCredential: authCredential)

    // Verify presentation
    let uuidCiphertextRecv = try presentation.getUuidCiphertext()
    XCTAssertEqual(uuidCiphertext.serialize(), uuidCiphertextRecv.serialize())
    XCTAssertEqual(try presentation.getRedemptionTime(), redemptionTime)
    try serverZkAuth.verifyAuthCredentialPresentation(groupPublicParams: groupPublicParams, authCredentialPresentation: presentation)

    XCTAssertEqual(presentation.serialize(), authPresentationResult)
  }

  func testProfileKeyIntegration() throws {

    let uuid: ZKGUuid           = try ZKGUuid(contents: TEST_ARRAY_16)

    // Generate keys (client's are per-group, server's are not)
    // ---

    // SERVER
    let serverSecretParams = try ServerSecretParams.generate(randomness: TEST_ARRAY_32)
    let serverPublicParams = try serverSecretParams.getPublicParams()
    let serverZkProfile    = ServerZkProfileOperations(serverSecretParams: serverSecretParams)

    // CLIENT
    let masterKey         = try GroupMasterKey(contents: TEST_ARRAY_32_1)
    let groupSecretParams = try GroupSecretParams.deriveFromMasterKey(groupMasterKey: masterKey)

    XCTAssertEqual(try groupSecretParams.getMasterKey().serialize(), masterKey.serialize())

    let groupPublicParams = try groupSecretParams.getPublicParams()
    let clientZkProfileCipher = ClientZkProfileOperations(serverPublicParams: serverPublicParams)

    let profileKey  = try ProfileKey(contents: TEST_ARRAY_32_1)
    let profileKeyCommitment = try profileKey.getCommitment(uuid: uuid)

    // Create context and request
    let context = try clientZkProfileCipher.createProfileKeyCredentialRequestContext(randomness: TEST_ARRAY_32_3, uuid: uuid, profileKey: profileKey)
    let request = try context.getRequest()

    // SERVER 
    let response = try serverZkProfile.issueProfileKeyCredential(randomness: TEST_ARRAY_32_4, profileKeyCredentialRequest: request, uuid: uuid, profileKeyCommitment: profileKeyCommitment)

    // CLIENT
    // Gets stored profile credential
    let clientZkGroupCipher  = ClientZkGroupCipher(groupSecretParams: groupSecretParams)
    let profileKeyCredential = try clientZkProfileCipher.receiveProfileKeyCredential(profileKeyCredentialRequestContext: context, profileKeyCredentialResponse: response)

    // Create encrypted UID and profile key
    let uuidCiphertext = try clientZkGroupCipher.encryptUuid(uuid: uuid)
    let plaintext      = try clientZkGroupCipher.decryptUuid(uuidCiphertext: uuidCiphertext)

    XCTAssertEqual(plaintext.serialize(), uuid.serialize())

    let profileKeyCiphertext   = try clientZkGroupCipher.encryptProfileKey(profileKey: profileKey, uuid: uuid)
    let decryptedProfileKey    = try clientZkGroupCipher.decryptProfileKey(profileKeyCiphertext: profileKeyCiphertext, uuid: uuid)
    XCTAssertEqual(profileKey.serialize(), decryptedProfileKey.serialize())

    let presentation = try clientZkProfileCipher.createProfileKeyCredentialPresentation(randomness: TEST_ARRAY_32_5, groupSecretParams: groupSecretParams, profileKeyCredential: profileKeyCredential)

    XCTAssertEqual(presentation.serialize(), profileKeyPresentationResult)

    // Verify presentation
    try serverZkProfile.verifyProfileKeyCredentialPresentation(groupPublicParams: groupPublicParams, profileKeyCredentialPresentation: presentation)
    let uuidCiphertextRecv = try presentation.getUuidCiphertext()
    XCTAssertEqual(uuidCiphertext.serialize(), uuidCiphertextRecv.serialize())

    let pkvB = try profileKey.getProfileKeyVersion(uuid: uuid)
    let pkvC = try ProfileKeyVersion(contents: pkvB.serialize())
    XCTAssertEqual(pkvB.serialize(), pkvC.serialize())
  }

  func testServerSignatures() throws {
    let serverSecretParams = try ServerSecretParams.generate(randomness: TEST_ARRAY_32)
    let serverPublicParams = try serverSecretParams.getPublicParams()

    let message = TEST_ARRAY_32_1

    let signature = try serverSecretParams.sign(randomness: TEST_ARRAY_32_2, message: message)
    try serverPublicParams.verifySignature(message: message, notarySignature: signature)

    XCTAssertEqual(signature.serialize(), serverSignatureResult)

    var alteredMessage = message
    alteredMessage[0] ^= 1
    do {
        try serverPublicParams.verifySignature(message: alteredMessage, notarySignature: signature)
        XCTAssert(false)
    } catch ZkGroupException.VerificationFailed {
      // good
    }
  }

  func testErrors() throws {
    let ckp: [UInt8] = Array(repeating: 255, count: GroupSecretParams.SIZE)
    do {
        let groupSecretParams = try GroupSecretParams(contents: ckp)
        XCTAssert(false)
    } catch ZkGroupException.IllegalArgument {
        // good
    }
  }

  func testBlobEncryption() throws {
    let groupSecretParams = try GroupSecretParams.generate()
    let clientZkGroupCipher = ClientZkGroupCipher(groupSecretParams: groupSecretParams)

    let plaintext: [UInt8] = [0,1,2,3,4]
    let ciphertext = try clientZkGroupCipher.encryptBlob(plaintext: plaintext)
    let plaintext2 = try clientZkGroupCipher.decryptBlob(blobCiphertext: ciphertext)

    XCTAssertEqual(plaintext, plaintext2)
  }

  func testBlobEncryptionWithRandom() throws {
    let masterKey           = try GroupMasterKey(contents: TEST_ARRAY_32_1)
    let groupSecretParams   = try GroupSecretParams.deriveFromMasterKey(groupMasterKey: masterKey)
    let clientZkGroupCipher = ClientZkGroupCipher(groupSecretParams: groupSecretParams)

    let plaintext: [UInt8]   = [
        0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
        0x18, 0x19]

    let ciphertext: [UInt8] = [ 0xdd, 0x4d, 0x03, 0x2c, 0xa9, 0xbb, 0x75, 0xa4,
    0xa7, 0x85, 0x41, 0xb9, 0x0c, 0xb4, 0xe9, 0x57, 0x43, 0xf3, 0xb0, 0xda,
    0xbf, 0xc7, 0xe1, 0x11, 0x01, 0xb0, 0x98, 0xe3, 0x4f, 0x6c, 0xf6, 0x51,
    0x39, 0x40, 0xa0, 0x4c, 0x1f, 0x20, 0xa3, 0x02, 0x69, 0x2a, 0xfd, 0xc7,
    0x08, 0x7f, 0x10, 0x19, 0x60, 0x00]

    let ciphertext257: [UInt8] = [ 0x5c, 0xb5, 0xb7, 0xbf, 0xf0, 0x6e, 0x85, 0xd9,
    0x29, 0xf3, 0x51, 0x1f, 0xd1, 0x94, 0xe6, 0x38, 0xcf, 0x32, 0xa4, 0x76,
    0x63, 0x86, 0x8b, 0xc8, 0xe6, 0x4d, 0x98, 0xfb, 0x1b, 0xbe, 0x43, 0x5e,
    0xbd, 0x21, 0xc7, 0x63, 0xce, 0x2d, 0x42, 0xe8, 0x5a, 0x1b, 0x2c, 0x16,
    0x9f, 0x12, 0xf9, 0x81, 0x8d, 0xda, 0xdc, 0xf4, 0xb4, 0x91, 0x39, 0x8b,
    0x7c, 0x5d, 0x46, 0xa2, 0x24, 0xe1, 0x58, 0x27, 0x49, 0xf5, 0xe2, 0xa4,
    0xa2, 0x29, 0x4c, 0xaa, 0xaa, 0xab, 0x84, 0x3a, 0x1b, 0x7c, 0xf6, 0x42,
    0x6f, 0xd5, 0x43, 0xd0, 0x9f, 0xf3, 0x2a, 0x4b, 0xa5, 0xf3, 0x19, 0xca,
    0x44, 0x42, 0xb4, 0xda, 0x34, 0xb3, 0xe2, 0xb5, 0xb4, 0xf8, 0xa5, 0x2f,
    0xdc, 0x4b, 0x48, 0x4e, 0xa8, 0x6b, 0x33, 0xdb, 0x3e, 0xbb, 0x75, 0x8d,
    0xbd, 0x96, 0x14, 0x17, 0x8f, 0x0e, 0x4e, 0x1f, 0x9b, 0x2b, 0x91, 0x4f,
    0x1e, 0x78, 0x69, 0x36, 0xb6, 0x2e, 0xd2, 0xb5, 0x8b, 0x7a, 0xe3, 0xcb,
    0x3e, 0x7a, 0xe0, 0x83, 0x5b, 0x95, 0x16, 0x95, 0x98, 0x37, 0x40, 0x66,
    0x62, 0xb8, 0x5e, 0xac, 0x74, 0x0c, 0xef, 0x83, 0xb6, 0x0b, 0x5a, 0xae,
    0xaa, 0xab, 0x95, 0x64, 0x3c, 0x2b, 0xef, 0x8c, 0xe8, 0x73, 0x58, 0xfa,
    0xbf, 0xf9, 0xd6, 0x90, 0x05, 0x2b, 0xeb, 0x9e, 0x52, 0xd0, 0xc9, 0x47,
    0xe7, 0xc9, 0x86, 0xb2, 0xf3, 0xce, 0x3b, 0x71, 0x61, 0xce, 0xc7, 0x2c,
    0x08, 0xe2, 0xc4, 0xad, 0xe3, 0xde, 0xbe, 0x37, 0x92, 0xd7, 0x36, 0xc0,
    0x45, 0x7b, 0xc3, 0x52, 0xaf, 0xb8, 0xb6, 0xca, 0xa4, 0x8a, 0x5b, 0x92,
    0xc1, 0xec, 0x05, 0xba, 0x80, 0x8b, 0xa8, 0xf9, 0x4c, 0x65, 0x72, 0xeb,
    0xbf, 0x29, 0x81, 0x89, 0x12, 0x34, 0x49, 0x87, 0x57, 0x3d, 0xe4, 0x19,
    0xdb, 0xcc, 0x7f, 0x1e, 0xa0, 0xe4, 0xb2, 0xdd, 0x40, 0x77, 0xb7, 0x6b,
    0x38, 0x18, 0x19, 0x74, 0x7a, 0xc3, 0x32, 0xe4, 0x6f, 0xa2, 0x3a, 0xbf,
    0xc3, 0x33, 0x8e, 0x2f, 0x4b, 0x08, 0x1a, 0x8a, 0x53, 0xcb, 0xa0, 0x98,
    0x8e, 0xef, 0x11, 0x67, 0x64, 0xd9, 0x44, 0xf1, 0xce, 0x3f, 0x20, 0xa3,
    0x02, 0x69, 0x2a, 0xfd, 0xc7, 0x08, 0x7f, 0x10, 0x19, 0x60, 0x00 ]

    let ciphertext2 = try clientZkGroupCipher.encryptBlob(randomness: TEST_ARRAY_32_2, plaintext: plaintext)
    let plaintext2 = try clientZkGroupCipher.decryptBlob(blobCiphertext: ciphertext2)

    XCTAssertEqual(plaintext, plaintext2)
    XCTAssertEqual(ciphertext, ciphertext2)

    let plaintext257 = try clientZkGroupCipher.decryptBlob(blobCiphertext: ciphertext257)
    XCTAssertEqual(plaintext, plaintext257)
  }

}