;Matt Schnider
;CSC322
;Due 10/31/2016
;A program to decode and print out the surprise!

INCLUDE Irvine32.inc


.data

  surprise db 32, 14, 33, 15, 34, 16, 35, 17, 36, 18, 37, 19, 38, 20, 39, 21, 40, 22, 41, 23
db 42, 24, 43, 25, 44, 26, 45, 27, 46, 28, 47, 29, 48, 30, 49, 31, 50, 32, 51, 33
db 52, 34, 53, 35, 54, 36, 55, 37, 56, 38, 57, 39, 58, 40, 59, 41, 60, 42, 61, 43
db 62, 44, 63, 45, 64, 46, 65, 47, 66, 48, 67, 49, 142, 50, 124, 51, 125, 52, 71, 53
db 72, 54, 137, 55, 76, 56, 77, 57, 101, 58, 132, 59, 148, 60, 79, 61, 80, 62, 81, 63
db 82, 64, 83, 65, 84, 66, 85, 67, 86, 68, 87, 69, 88, 70, 89, 71, 90, 72, 91, 73
db 92, 74, 93, 75, 94, 76, 95, 77, 96, 78, 97, 79, 98, 80, 99, 81, 100, 82, 101, 83
db 102, 84, 103, 85, 104, 86, 105, 87, 106, 88, 107, 89, 108, 90, 109, 91, 110, 92, 111, 93
db 32, 14, 33, 15, 34, 16, 35, 17, 36, 18, 37, 19, 38, 20, 39, 21, 40, 22, 41, 23
db 42, 24, 43, 25, 44, 26, 45, 27, 46, 28, 47, 29, 48, 30, 49, 31, 50, 32, 51, 33
db 52, 34, 53, 35, 54, 36, 55, 37, 56, 38, 57, 39, 58, 40, 59, 41, 60, 42, 61, 43
db 62, 44, 63, 45, 64, 46, 65, 47, 66, 48, 67, 49, 131, 50, 72, 51, 125, 52, 126, 53
db 127, 54, 73, 55, 74, 56, 75, 57, 76, 58, 77, 59, 119, 60, 134, 61, 80, 62, 81, 63
db 82, 64, 83, 65, 84, 66, 85, 67, 86, 68, 87, 69, 88, 70, 89, 71, 90, 72, 91, 73
db 92, 74, 93, 75, 94, 76, 95, 77, 96, 78, 97, 79, 98, 80, 99, 81, 100, 82, 101, 83
db 102, 84, 103, 85, 104, 86, 105, 87, 106, 88, 107, 89, 108, 90, 109, 91, 110, 92, 111, 93
db 32, 14, 33, 15, 34, 16, 35, 17, 36, 18, 37, 19, 38, 20, 39, 21, 40, 22, 41, 23
db 42, 24, 43, 25, 44, 26, 45, 27, 46, 28, 47, 29, 48, 30, 49, 31, 50, 32, 51, 33
db 52, 34, 53, 35, 54, 36, 55, 37, 56, 38, 57, 39, 58, 40, 59, 41, 60, 42, 61, 43
db 62, 44, 63, 45, 64, 46, 65, 47, 66, 48, 141, 49, 123, 50, 124, 51, 125, 52, 126, 53
db 127, 54, 73, 55, 74, 56, 75, 57, 76, 58, 77, 59, 119, 60, 134, 61, 80, 62, 81, 63
db 82, 64, 83, 65, 84, 66, 85, 67, 86, 68, 87, 69, 88, 70, 89, 71, 90, 72, 91, 73
db 92, 74, 93, 75, 94, 76, 95, 77, 96, 78, 97, 79, 98, 80, 99, 81, 100, 82, 101, 83
db 102, 84, 103, 85, 104, 86, 105, 87, 106, 88, 107, 89, 108, 90, 109, 91, 110, 92, 111, 93
db 32, 14, 33, 15, 34, 16, 35, 17, 36, 18, 37, 19, 38, 20, 39, 21, 40, 22, 41, 23
db 42, 24, 43, 25, 44, 26, 45, 27, 46, 28, 47, 29, 48, 30, 49, 31, 50, 32, 51, 33
db 52, 34, 53, 35, 54, 36, 55, 37, 56, 38, 57, 39, 58, 40, 122, 41, 123, 42, 73, 43
db 151, 44, 152, 45, 153, 46, 154, 47, 155, 48, 122, 49, 123, 50, 124, 51, 125, 52, 126, 53
db 72, 54, 73, 55, 74, 56, 75, 57, 76, 58, 118, 59, 133, 60, 168, 61, 169, 62, 170, 63
db 171, 64, 146, 65, 147, 66, 148, 67, 86, 68, 87, 69, 88, 70, 89, 71, 90, 72, 91, 73
db 92, 74, 93, 75, 94, 76, 95, 77, 96, 78, 97, 79, 98, 80, 99, 81, 100, 82, 101, 83
db 102, 84, 103, 85, 104, 86, 105, 87, 106, 88, 107, 89, 108, 90, 109, 91, 110, 92, 111, 93
db 32, 14, 33, 15, 34, 16, 35, 17, 36, 18, 37, 19, 38, 20, 39, 21, 40, 22, 41, 23
db 42, 24, 43, 25, 44, 26, 45, 27, 46, 28, 47, 29, 48, 30, 49, 31, 50, 32, 51, 33
db 52, 34, 53, 35, 117, 36, 129, 37, 145, 38, 112, 39, 113, 40, 107, 41, 62, 42, 123, 43
db 126, 44, 127, 45, 66, 46, 129, 47, 80, 48, 102, 49, 70, 50, 94, 51, 80, 52, 83, 53
db 114, 54, 73, 55, 137, 56, 89, 57, 153, 58, 158, 59, 114, 60, 105, 61, 142, 62, 143, 63
db 84, 64, 138, 65, 139, 66, 140, 67, 141, 68, 142, 69, 143, 70, 138, 71, 161, 72, 154, 73
db 155, 74, 93, 75, 94, 76, 95, 77, 96, 78, 97, 79, 98, 80, 99, 81, 100, 82, 101, 83
db 102, 84, 103, 85, 104, 86, 105, 87, 106, 88, 107, 89, 108, 90, 109, 91, 110, 92, 111, 93
db 32, 14, 33, 15, 34, 16, 35, 17, 36, 18, 37, 19, 38, 20, 39, 21, 40, 22, 41, 23
db 42, 24, 43, 25, 44, 26, 45, 27, 46, 28, 47, 29, 48, 30, 49, 31, 50, 32, 51, 33
db 126, 34, 124, 35, 109, 36, 57, 37, 118, 38, 71, 39, 93, 40, 74, 41, 62, 42, 61, 43
db 62, 44, 63, 45, 64, 46, 79, 47, 101, 48, 74, 49, 68, 50, 69, 51, 70, 52, 71, 53
db 72, 54, 114, 55, 74, 56, 75, 57, 76, 58, 77, 59, 142, 60, 115, 61, 94, 62, 81, 63
db 82, 64, 83, 65, 84, 66, 85, 67, 93, 68, 123, 69, 102, 70, 152, 71, 92, 72, 146, 73
db 141, 74, 164, 75, 157, 76, 95, 77, 96, 78, 97, 79, 98, 80, 99, 81, 100, 82, 101, 83
db 102, 84, 103, 85, 104, 86, 105, 87, 106, 88, 107, 89, 108, 90, 109, 91, 110, 92, 111, 93
db 32, 14, 33, 15, 34, 16, 35, 17, 36, 18, 37, 19, 38, 20, 39, 21, 40, 22, 41, 23
db 42, 24, 43, 25, 44, 26, 45, 27, 46, 28, 47, 29, 48, 30, 49, 31, 124, 32, 106, 33
db 100, 34, 117, 35, 54, 36, 69, 37, 91, 38, 59, 39, 58, 40, 59, 41, 60, 42, 61, 43
db 62, 44, 63, 45, 64, 46, 100, 47, 73, 48, 67, 49, 68, 50, 69, 51, 70, 52, 71, 53
db 72, 54, 114, 55, 74, 56, 75, 57, 76, 58, 77, 59, 78, 60, 143, 61, 116, 62, 95, 63
db 145, 64, 83, 65, 84, 66, 85, 67, 86, 68, 87, 69, 152, 70, 125, 71, 104, 72, 154, 73
db 92, 74, 95, 75, 143, 76, 166, 77, 159, 78, 97, 79, 98, 80, 99, 81, 100, 82, 101, 83
db 102, 84, 103, 85, 104, 86, 105, 87, 106, 88, 107, 89, 108, 90, 109, 91, 110, 92, 111, 93
db 32, 14, 33, 15, 34, 16, 35, 17, 36, 18, 37, 19, 38, 20, 39, 21, 40, 22, 41, 23
db 42, 24, 43, 25, 44, 26, 45, 27, 46, 28, 47, 29, 122, 30, 98, 31, 98, 32, 115, 33
db 52, 34, 53, 35, 68, 36, 90, 37, 56, 38, 57, 39, 58, 40, 59, 41, 72, 42, 129, 43
db 124, 44, 125, 45, 130, 46, 79, 47, 129, 48, 67, 49, 68, 50, 69, 51, 70, 52, 71, 53
db 72, 54, 114, 55, 74, 56, 75, 57, 76, 58, 77, 59, 78, 60, 79, 61, 143, 62, 95, 63
db 150, 64, 145, 65, 146, 66, 151, 67, 100, 68, 87, 69, 88, 70, 89, 71, 154, 72, 127, 73
db 106, 74, 156, 75, 94, 76, 97, 77, 145, 78, 168, 79, 98, 80, 99, 81, 100, 82, 101, 83
db 102, 84, 103, 85, 104, 86, 105, 87, 106, 88, 107, 89, 108, 90, 109, 91, 110, 92, 111, 93
db 32, 14, 33, 15, 34, 16, 35, 17, 36, 18, 37, 19, 38, 20, 39, 21, 40, 22, 41, 23
db 42, 24, 43, 25, 44, 26, 45, 27, 46, 28, 121, 29, 97, 30, 111, 31, 50, 32, 51, 33
db 66, 34, 88, 35, 56, 36, 55, 37, 56, 38, 57, 39, 73, 40, 123, 41, 60, 42, 61, 43
db 62, 44, 77, 45, 75, 46, 67, 47, 66, 48, 127, 49, 68, 50, 69, 51, 70, 52, 71, 53
db 72, 54, 114, 55, 74, 56, 75, 57, 76, 58, 77, 59, 78, 60, 94, 61, 80, 62, 83, 63
db 93, 64, 97, 65, 84, 66, 85, 67, 86, 68, 151, 69, 148, 70, 89, 71, 90, 72, 91, 73
db 156, 74, 129, 75, 108, 76, 95, 77, 96, 78, 153, 79, 147, 80, 99, 81, 100, 82, 101, 83
db 102, 84, 103, 85, 104, 86, 105, 87, 106, 88, 107, 89, 108, 90, 109, 91, 110, 92, 111, 93
db 32, 14, 33, 15, 34, 16, 35, 17, 36, 18, 37, 19, 38, 20, 39, 21, 40, 22, 41, 23
db 42, 24, 43, 25, 44, 26, 45, 27, 120, 28, 96, 29, 55, 30, 49, 31, 50, 32, 65, 33
db 87, 34, 60, 35, 54, 36, 55, 37, 56, 38, 149, 39, 122, 40, 59, 41, 60, 42, 75, 43
db 64, 44, 63, 45, 64, 46, 65, 47, 66, 48, 76, 49, 68, 50, 69, 51, 70, 52, 71, 53
db 135, 54, 114, 55, 74, 56, 75, 57, 76, 58, 77, 59, 86, 60, 79, 61, 80, 62, 81, 63
db 82, 64, 83, 65, 86, 66, 99, 67, 86, 68, 87, 69, 180, 70, 89, 71, 90, 72, 91, 73
db 92, 74, 157, 75, 130, 76, 109, 77, 96, 78, 97, 79, 118, 80, 102, 81, 100, 82, 101, 83
db 102, 84, 103, 85, 104, 86, 105, 87, 106, 88, 107, 89, 108, 90, 109, 91, 110, 92, 111, 93
db 32, 14, 33, 15, 34, 16, 35, 17, 36, 18, 37, 19, 38, 20, 39, 21, 40, 22, 41, 23
db 42, 24, 43, 25, 44, 26, 45, 27, 95, 28, 117, 29, 48, 30, 49, 31, 64, 32, 86, 33
db 52, 34, 53, 35, 54, 36, 55, 37, 56, 38, 65, 39, 58, 40, 59, 41, 60, 42, 69, 43
db 62, 44, 63, 45, 64, 46, 65, 47, 81, 48, 67, 49, 68, 50, 69, 51, 70, 52, 86, 53
db 72, 54, 88, 55, 134, 56, 75, 57, 76, 58, 77, 59, 78, 60, 139, 61, 80, 62, 81, 63
db 82, 64, 83, 65, 84, 66, 94, 67, 86, 68, 87, 69, 97, 70, 89, 71, 90, 72, 91, 73
db 92, 74, 93, 75, 158, 76, 131, 77, 110, 78, 97, 79, 98, 80, 148, 81, 171, 82, 101, 83
db 102, 84, 103, 85, 104, 86, 105, 87, 106, 88, 107, 89, 108, 90, 109, 91, 110, 92, 111, 93
db 32, 14, 33, 15, 34, 16, 35, 17, 36, 18, 37, 19, 38, 20, 39, 21, 40, 22, 41, 23
db 42, 24, 43, 25, 44, 26, 119, 27, 101, 28, 47, 29, 48, 30, 49, 31, 85, 32, 58, 33
db 52, 34, 53, 35, 54, 36, 55, 37, 56, 38, 57, 39, 118, 40, 122, 41, 123, 42, 121, 43
db 125, 44, 77, 45, 75, 46, 72, 47, 66, 48, 67, 49, 68, 50, 69, 51, 85, 52, 71, 53
db 87, 54, 73, 55, 74, 56, 135, 57, 76, 58, 77, 59, 78, 60, 79, 61, 144, 62, 92, 63
db 96, 64, 146, 65, 99, 66, 148, 67, 149, 68, 102, 69, 88, 70, 89, 71, 90, 72, 91, 73
db 92, 74, 93, 75, 94, 76, 159, 77, 132, 78, 97, 79, 98, 80, 173, 81, 149, 82, 101, 83
db 102, 84, 103, 85, 104, 86, 105, 87, 106, 88, 107, 89, 108, 90, 109, 91, 110, 92, 111, 93
db 32, 14, 33, 15, 34, 16, 35, 17, 36, 18, 37, 19, 38, 20, 39, 21, 40, 22, 41, 23
db 42, 24, 43, 25, 44, 26, 94, 27, 116, 28, 47, 29, 48, 30, 49, 31, 85, 32, 51, 33
db 52, 34, 53, 35, 54, 36, 55, 37, 56, 38, 57, 39, 58, 40, 59, 41, 95, 42, 61, 43
db 62, 44, 63, 45, 64, 46, 65, 47, 66, 48, 67, 49, 68, 50, 84, 51, 133, 52, 86, 53
db 72, 54, 73, 55, 74, 56, 75, 57, 136, 58, 77, 59, 78, 60, 79, 61, 80, 62, 81, 63
db 82, 64, 83, 65, 84, 66, 85, 67, 122, 68, 87, 69, 88, 70, 89, 71, 90, 72, 91, 73
db 92, 74, 93, 75, 94, 76, 95, 77, 132, 78, 97, 79, 98, 80, 99, 81, 149, 82, 176, 83
db 102, 84, 103, 85, 104, 86, 105, 87, 106, 88, 107, 89, 108, 90, 109, 91, 110, 92, 111, 93
db 32, 14, 33, 15, 34, 16, 35, 17, 36, 18, 37, 19, 38, 20, 39, 21, 40, 22, 41, 23
db 42, 24, 43, 25, 44, 26, 94, 27, 116, 28, 47, 29, 48, 30, 49, 31, 85, 32, 51, 33
db 52, 34, 53, 35, 54, 36, 55, 37, 56, 38, 120, 39, 58, 40, 59, 41, 95, 42, 61, 43
db 62, 44, 63, 45, 64, 46, 65, 47, 66, 48, 67, 49, 68, 50, 129, 51, 133, 52, 131, 53
db 135, 54, 136, 55, 137, 56, 138, 57, 91, 58, 77, 59, 78, 60, 79, 61, 80, 62, 81, 63
db 82, 64, 83, 65, 84, 66, 85, 67, 122, 68, 87, 69, 88, 70, 152, 71, 90, 72, 91, 73
db 92, 74, 93, 75, 94, 76, 95, 77, 132, 78, 97, 79, 98, 80, 99, 81, 149, 82, 139, 83
db 102, 84, 103, 85, 104, 86, 105, 87, 106, 88, 107, 89, 108, 90, 109, 91, 110, 92, 111, 93
db 32, 14, 33, 15, 34, 16, 35, 17, 36, 18, 37, 19, 38, 20, 39, 21, 40, 22, 41, 23
db 42, 24, 43, 25, 44, 26, 94, 27, 90, 28, 47, 29, 48, 30, 49, 31, 85, 32, 51, 33
db 52, 34, 53, 35, 54, 36, 55, 37, 56, 38, 117, 39, 122, 40, 70, 41, 74, 42, 124, 43
db 125, 44, 63, 45, 64, 46, 65, 47, 66, 48, 67, 49, 131, 50, 132, 51, 133, 52, 134, 53
db 135, 54, 136, 55, 137, 56, 75, 57, 76, 58, 77, 59, 78, 60, 79, 61, 143, 62, 144, 63
db 145, 64, 146, 65, 147, 66, 148, 67, 100, 68, 98, 69, 95, 70, 104, 71, 90, 72, 91, 73
db 92, 74, 93, 75, 94, 76, 95, 77, 132, 78, 97, 79, 98, 80, 99, 81, 149, 82, 139, 83
db 102, 84, 103, 85, 104, 86, 105, 87, 106, 88, 107, 89, 108, 90, 109, 91, 110, 92, 111, 93
db 32, 14, 33, 15, 34, 16, 35, 17, 36, 18, 37, 19, 38, 20, 39, 21, 40, 22, 41, 23
db 42, 24, 43, 25, 44, 26, 79, 27, 52, 28, 47, 29, 48, 30, 49, 31, 85, 32, 65, 33
db 52, 34, 53, 35, 54, 36, 55, 37, 56, 38, 57, 39, 118, 40, 59, 41, 60, 42, 61, 43
db 122, 44, 155, 45, 64, 46, 65, 47, 66, 48, 67, 49, 160, 50, 161, 51, 70, 52, 71, 53
db 72, 54, 73, 55, 74, 56, 167, 57, 76, 58, 77, 59, 78, 60, 79, 61, 172, 62, 173, 63
db 82, 64, 83, 65, 84, 66, 85, 67, 86, 68, 87, 69, 103, 70, 89, 71, 90, 72, 91, 73
db 92, 74, 93, 75, 94, 76, 95, 77, 132, 78, 97, 79, 98, 80, 99, 81, 149, 82, 171, 83
db 102, 84, 103, 85, 104, 86, 105, 87, 106, 88, 107, 89, 108, 90, 109, 91, 110, 92, 111, 93
db 32, 14, 33, 15, 34, 16, 35, 17, 36, 18, 37, 19, 38, 20, 39, 21, 40, 22, 41, 23
db 42, 24, 43, 25, 44, 26, 119, 27, 95, 28, 47, 29, 48, 30, 49, 31, 114, 32, 86, 33
db 66, 34, 53, 35, 54, 36, 55, 37, 56, 38, 57, 39, 58, 40, 119, 41, 60, 42, 61, 43
db 62, 44, 155, 45, 127, 46, 128, 47, 129, 48, 130, 49, 160, 50, 84, 51, 70, 52, 71, 53
db 72, 54, 73, 55, 74, 56, 167, 57, 139, 58, 140, 59, 141, 60, 142, 61, 172, 62, 96, 63
db 145, 64, 146, 65, 84, 66, 85, 67, 86, 68, 102, 69, 88, 70, 89, 71, 90, 72, 91, 73
db 92, 74, 93, 75, 108, 76, 131, 77, 103, 78, 97, 79, 98, 80, 99, 81, 174, 82, 156, 83
db 102, 84, 103, 85, 104, 86, 105, 87, 106, 88, 107, 89, 108, 90, 109, 91, 110, 92, 111, 93
db 32, 14, 33, 15, 34, 16, 35, 17, 36, 18, 37, 19, 38, 20, 39, 21, 40, 22, 41, 23
db 42, 24, 43, 25, 44, 26, 45, 27, 98, 28, 96, 29, 48, 30, 49, 31, 50, 32, 115, 33
db 87, 34, 67, 35, 54, 36, 55, 37, 56, 38, 57, 39, 58, 40, 59, 41, 120, 42, 75, 43
db 125, 44, 63, 45, 64, 46, 65, 47, 130, 48, 78, 49, 82, 50, 132, 51, 133, 52, 134, 53
db 135, 54, 136, 55, 137, 56, 138, 57, 139, 58, 140, 59, 141, 60, 94, 61, 143, 62, 144, 63
db 145, 64, 98, 65, 176, 66, 148, 67, 101, 68, 87, 69, 88, 70, 89, 71, 90, 72, 91, 73
db 92, 74, 107, 75, 130, 76, 102, 77, 96, 78, 97, 79, 98, 80, 173, 81, 149, 82, 165, 83
db 102, 84, 103, 85, 104, 86, 105, 87, 106, 88, 107, 89, 108, 90, 109, 91, 110, 92, 111, 93
db 32, 14, 33, 15, 34, 16, 35, 17, 36, 18, 37, 19, 38, 20, 39, 21, 40, 22, 41, 23
db 42, 24, 43, 25, 44, 26, 45, 27, 46, 28, 72, 29, 97, 30, 49, 31, 50, 32, 51, 33
db 116, 34, 88, 35, 68, 36, 55, 37, 56, 38, 57, 39, 58, 40, 59, 41, 60, 42, 96, 43
db 76, 44, 127, 45, 75, 46, 79, 47, 129, 48, 67, 49, 68, 50, 69, 51, 70, 52, 71, 53
db 72, 54, 73, 55, 74, 56, 75, 57, 76, 58, 77, 59, 170, 60, 79, 61, 80, 62, 81, 63
db 174, 64, 98, 65, 98, 66, 121, 67, 93, 68, 87, 69, 88, 70, 89, 71, 90, 72, 91, 73
db 106, 74, 129, 75, 101, 76, 95, 77, 96, 78, 97, 79, 172, 80, 148, 81, 107, 82, 101, 83
db 102, 84, 103, 85, 104, 86, 105, 87, 106, 88, 107, 89, 108, 90, 109, 91, 110, 92, 111, 93
db 32, 14, 33, 15, 34, 16, 35, 17, 36, 18, 37, 19, 38, 20, 39, 21, 40, 22, 41, 23
db 42, 24, 43, 25, 44, 26, 45, 27, 46, 28, 47, 29, 50, 30, 98, 31, 121, 32, 51, 33
db 52, 34, 117, 35, 89, 36, 69, 37, 56, 38, 57, 39, 58, 40, 59, 41, 60, 42, 125, 43
db 97, 44, 77, 45, 64, 46, 65, 47, 66, 48, 131, 49, 70, 50, 80, 51, 83, 52, 84, 53
db 85, 54, 86, 55, 87, 56, 88, 57, 89, 58, 84, 59, 78, 60, 79, 61, 80, 62, 88, 63
db 82, 64, 97, 65, 120, 66, 92, 67, 86, 68, 87, 69, 88, 70, 89, 71, 90, 72, 105, 73
db 128, 74, 100, 75, 94, 76, 95, 77, 96, 78, 177, 79, 153, 80, 163, 81, 100, 82, 101, 83
db 102, 84, 103, 85, 104, 86, 105, 87, 106, 88, 107, 89, 108, 90, 109, 91, 110, 92, 111, 93
db 32, 14, 33, 15, 34, 16, 35, 17, 36, 18, 37, 19, 38, 20, 39, 21, 40, 22, 41, 23
db 42, 24, 43, 25, 44, 26, 45, 27, 46, 28, 47, 29, 48, 30, 111, 31, 105, 32, 100, 33
db 141, 34, 53, 35, 118, 36, 90, 37, 70, 38, 57, 39, 58, 40, 59, 41, 60, 42, 61, 43
db 126, 44, 98, 45, 78, 46, 65, 47, 66, 48, 67, 49, 68, 50, 69, 51, 70, 52, 71, 53
db 72, 54, 114, 55, 74, 56, 75, 57, 76, 58, 77, 59, 78, 60, 79, 61, 80, 62, 81, 63
db 96, 64, 119, 65, 91, 66, 85, 67, 86, 68, 87, 69, 88, 70, 152, 71, 104, 72, 127, 73
db 99, 74, 93, 75, 183, 76, 150, 77, 98, 78, 97, 79, 98, 80, 99, 81, 100, 82, 101, 83
db 102, 84, 103, 85, 104, 86, 105, 87, 106, 88, 107, 89, 108, 90, 109, 91, 110, 92, 111, 93
db 32, 14, 33, 15, 34, 16, 35, 17, 36, 18, 37, 19, 38, 20, 39, 21, 40, 22, 41, 23
db 42, 24, 43, 25, 44, 26, 45, 27, 46, 28, 47, 29, 48, 30, 49, 31, 50, 32, 113, 33
db 77, 34, 102, 35, 143, 36, 118, 37, 120, 38, 92, 39, 72, 40, 59, 41, 60, 42, 61, 43
db 62, 44, 127, 45, 99, 46, 79, 47, 66, 48, 67, 49, 68, 50, 69, 51, 70, 52, 71, 53
db 72, 54, 114, 55, 74, 56, 75, 57, 76, 58, 77, 59, 78, 60, 79, 61, 80, 62, 95, 63
db 118, 64, 90, 65, 84, 66, 85, 67, 86, 68, 150, 69, 102, 70, 125, 71, 90, 72, 165, 73
db 163, 74, 148, 75, 96, 76, 95, 77, 96, 78, 97, 79, 98, 80, 99, 81, 100, 82, 101, 83
db 102, 84, 103, 85, 104, 86, 105, 87, 106, 88, 107, 89, 108, 90, 109, 91, 110, 92, 111, 93
db 32, 14, 33, 15, 34, 16, 35, 17, 36, 18, 37, 19, 38, 20, 39, 21, 40, 22, 41, 23
db 42, 24, 43, 25, 44, 26, 45, 27, 46, 28, 47, 29, 48, 30, 49, 31, 50, 32, 51, 33
db 52, 34, 53, 35, 118, 36, 80, 37, 111, 38, 106, 39, 129, 40, 94, 41, 74, 42, 124, 43
db 125, 44, 63, 45, 128, 46, 100, 47, 80, 48, 67, 49, 68, 50, 69, 51, 70, 52, 71, 53
db 72, 54, 114, 55, 74, 56, 75, 57, 76, 58, 77, 59, 78, 60, 79, 61, 94, 62, 117, 63
db 89, 64, 83, 65, 84, 66, 148, 67, 100, 68, 123, 69, 168, 70, 121, 71, 122, 72, 93, 73
db 156, 74, 93, 75, 94, 76, 95, 77, 96, 78, 97, 79, 98, 80, 99, 81, 100, 82, 101, 83
db 102, 84, 103, 85, 104, 86, 105, 87, 106, 88, 107, 89, 108, 90, 109, 91, 110, 92, 111, 93
db 32, 14, 33, 15, 34, 16, 35, 17, 36, 18, 37, 19, 38, 20, 39, 21, 40, 22, 41, 23
db 42, 24, 43, 25, 44, 26, 45, 27, 46, 28, 47, 29, 48, 30, 49, 31, 50, 32, 51, 33
db 52, 34, 53, 35, 54, 36, 55, 37, 56, 38, 57, 39, 122, 40, 61, 41, 62, 42, 86, 43
db 117, 44, 112, 45, 113, 46, 136, 47, 137, 48, 156, 49, 157, 50, 158, 51, 159, 52, 160, 53
db 161, 54, 144, 55, 163, 56, 164, 57, 165, 58, 166, 59, 167, 60, 128, 61, 151, 62, 152, 63
db 131, 64, 138, 65, 133, 66, 125, 67, 88, 68, 89, 69, 88, 70, 89, 71, 90, 72, 91, 73
db 92, 74, 93, 75, 94, 76, 95, 77, 96, 78, 97, 79, 98, 80, 99, 81, 100, 82, 101, 83
db 102, 84, 103, 85, 104, 86, 105, 87, 106, 88, 107, 89, 108, 90, 109, 91, 110, 92, 111, 93


.code
  main PROC 
  mov esi,OFFSET surprise              ; moves the location of the surprise array into the esi.
	mov ecx,24                        ; moves the number of rows into the ecx to set up the outer loop. 
	mov ebx,0                         ; moves 0 into the ebx. This will be used for subtracting the col number from the char/attrib to decode the message.

    	ROW:                              ; Label for the ROW outter loop.
	 push ecx                         ; Stores the row count in the ecx on the stack for use after the inner loop executes.

	      mov ecx, 80                 ; moves the number of cols into the ecx reg to set up the inner loop.
	    COL:                          ; Label for the COL inner loop.
	      movzx eax,BYTE PTR [esi+1]  ; moves the byte attrib, with zeroes extended into the eax reg.
           sub eax,ebx                 ; subtracts the col number from the attrib.
	      call SetTextColor           ; Calls the SetTextColor proc. 
	      mov al, [esi]               ; Moves the byte char that the esi is pointing to into the al reg.
           sub eax,ebx                 ; Subtracts the col number from the char value in the previous instruction.
	      call WriteChar              ; Calls the WriteChar proc to print the ASCII char in the al reg.
	      add esi,2                   ; Adds 2 to the esi to point to the next char/attrib segment in the array.
	      inc ebx                     ; Adds one to the ebx to set things up for the next col.
	    loop COL                      ; loops back to COL if the ecx doesn't equal 0 after being decremented

	 pop ecx                          ; pops the previously stored value of the ecx back into the ecx.

	 mov ebx,0                        ; resets the column count to 0.
	loop ROW                          ; loops back to COL if the ecx doesn't equal 0 ater being decremented.
     exit   

  main ENDP
END main