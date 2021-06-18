package kernel

import "unsafe"

//extern main
func main() {
	var tempVideoPtr uintptr = (uintptr)(0xb8000)
	videoPtr := (*uint16)(unsafe.Pointer(tempVideoPtr))
	*(videoPtr) = uint16(0<<8 | 'c')
	for {
	}
}
